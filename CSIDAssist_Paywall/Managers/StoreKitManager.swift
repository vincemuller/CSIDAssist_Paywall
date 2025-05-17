//
//  StoreKitManager.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/6/25.
//

import Foundation
import StoreKit


class StoreKitManager: ObservableObject {
    var subscriptionID: [String] = ["csidassistplus"]
    var groupID: String = "FA5967D2"
    
    @Published private(set) var subscriptions: [Product] = []
    @Published private(set) var purchasedSubscriptions: [Product] = []
    
    private var updateListenerTask: Task<Void,Error>? = nil
    var subscriptionStatus: Bool {
        purchasedSubscriptions.count > 0 ? true : false
    }
    
    init() {
        
        updateListenerTask = listenForTransactions()
        
        Task {
            await requestSubscriptions()
            await updateCustomerProductStatus()
        }
    }
    
    @MainActor
    func purchase(_ product: Product) async throws -> Transaction? {
        let result = try await product.purchase()
        
        switch result {
        case .success(let verification):
            let transaction = try checkVerified(verification)
            await self.updateCustomerProductStatus()
            await transaction.finish()
            return transaction
        case .userCancelled, .pending:
            return nil
        default:
            return nil
        }
    }
    
    private func listenForTransactions() -> Task<Void,Error> {
        return Task.detached {
            for await result in Transaction.updates {
                do {
                    let transaction = try self.checkVerified(result)
                    
                    await self.updateCustomerProductStatus()
                    
                    await transaction.finish()
                    
                } catch {
                    print("Transaction Failed Verification")
                }
            }
        }
    }
    
    @MainActor
    private func requestSubscriptions() async {
        do {
            let storeSubscriptions = try await Product.products(for: subscriptionID)
            for product in storeSubscriptions {
                switch product.type {
                case .autoRenewable:
                    subscriptions.append(product)
                default:
                    print("Unknown Product")
                }
            }
        } catch {
            print("Failed Product Request")
        }
    }
    
    @MainActor
    private func updateCustomerProductStatus() async {
        var purchasedSubscriptions: [Product] = []
        
        for await result in Transaction.currentEntitlements {
            do {
                let transaction = try checkVerified(result)
                
                switch transaction.productType {
                case .autoRenewable:
                    if let subscription = subscriptions.first(where: {$0.id == transaction.productID}) {
                        purchasedSubscriptions.append(subscription)
                    }
                default:
                    break
                }
            } catch {
                print("Failed To Get Customer Products")
            }
        }
        self.purchasedSubscriptions = purchasedSubscriptions
    }
    
    private func checkVerified<T>(_ result: VerificationResult<T>) throws -> T {
        switch result {
        case .unverified( _, let verificationError):
            throw verificationError
        case .verified(let signedType):
            return signedType
        }
    }
}

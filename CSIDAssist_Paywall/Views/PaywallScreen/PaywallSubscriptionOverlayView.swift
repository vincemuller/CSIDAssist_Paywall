//
//  PaywallSubscriptionOverlayView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/15/25.
//

import SwiftUI

struct PaywallSubscriptionOverlayView: View {
    @EnvironmentObject var storeKit: StoreKitManager
    @Environment(\.presentationMode) var presentationMode
    
    let height: CGFloat
    let width: CGFloat
    
    var body: some View {
        ZStack {
            VStack {
                Text("Get full access for just $4.99/month")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 14))
                Button {
                    Task {
                        if let subscription = storeKit.subscriptions.first {
                            do {
                                if let _ = try await storeKit.purchase(subscription) {
                                    self.presentationMode.wrappedValue.dismiss()
                                }
                            } catch {
                                print("Purchase failed: \(error)")
                            }
                        } else {
                            print("No subscription product available.")
                        }
                    }
                } label: {
                    Text("Subscribe")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: width * 0.746, height: height * 0.057)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.iconTeal)
                        }
                }
                Text("All Plans | Restore | Terms and Conditions | Privacy")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 10))
                    .padding(.top, 5)
            }
            .padding()
        }
        .frame(width: width)
        .background(Color.black)
    }
}

#Preview {
    PaywallSubscriptionOverlayView(height: 863, width: 402)
}

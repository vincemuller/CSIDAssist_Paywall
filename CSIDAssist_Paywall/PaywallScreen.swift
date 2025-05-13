//
//  PaywallScreen.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/8/25.
//

import SwiftUI
import StoreKit

struct PaywallScreen: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var storeKit: StoreKitManager
    
    @State private var firstReviewOffset = 400.0
    @State private var secondReviewOffset = -400.0
    @State private var thirdReviewOffset = 400.0
    
    private var mockData = MockData()

    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        VStack (alignment: .leading) {
            ScrollView {
                PaywallBannerView()
                
                PaywallHeaderView(text: "Upgrade for access to these tools:", width: width, height: height)
                
                FeaturesView(width: width, height: height)
                
                ReviewView(reviewOffset: $firstReviewOffset, review: mockData.reviews[0], width: width, height: height)
                
                ReviewView(reviewOffset: $secondReviewOffset, review: mockData.reviews[1], width: width, height: height)
                
                ReviewView(reviewOffset: $thirdReviewOffset, review: mockData.reviews[2], width: width, height: height)
                
                VStack {
                }
                .frame(height: height * 0.228)
            }
            .onScrollGeometryChange(for: Double.self) { geo in
                geo.contentOffset.y
            } action: { oldValue, newValue in
                
                if newValue > (height * 0.114) {
                    withAnimation (.easeIn) {
                        firstReviewOffset = -(width * 0.062)
                    }
                }
                
                if newValue > (height * 0.251) {
                    withAnimation {
                        secondReviewOffset = (width * 0.062)
                    }
                }
                
                if newValue > (height * 0.423) {
                    withAnimation {
                        thirdReviewOffset = -(width * 0.062)
                    }
                }
            }
        }
        .ignoresSafeArea()
        .background(Color.black)
        .overlay(alignment: .bottom, content: {
            ZStack {
                VStack {
                    Text("Get full access for just $4.99/month")
                        .font(.system(size: 14))
                    Button {
                        Task {
                            if let subscription = storeKit.subscriptions.first {
                                do {
                                    let result = try await storeKit.purchase(subscription)
                                    self.presentationMode.wrappedValue.dismiss()
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
                        .font(.system(size: 10))
                        .padding(.top, 5)
                }
                .padding()
            }
            .frame(width: width)
            .background(Color.black)
        })
    }
}

#Preview {
    PaywallScreen()
}

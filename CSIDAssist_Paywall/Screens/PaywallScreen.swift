//
//  PaywallScreen.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/8/25.
//

import SwiftUI
import StoreKit

struct PaywallScreen: View {
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
                
                PaywallHeaderView(width: width, height: height)
                
                FeaturesView(width: width, height: height)
                
                ReviewView(reviewOffset: $firstReviewOffset, review: mockData.reviews[0], width: width, height: height)
                
                ReviewView(reviewOffset: $secondReviewOffset, review: mockData.reviews[1], width: width, height: height)
                
                ReviewView(reviewOffset: $thirdReviewOffset, review: mockData.reviews[2], width: width, height: height)
                
                Spacer(minLength: height * 0.228)
            }
            .onScrollGeometryChange(for: Double.self) { geo in
                geo.contentOffset.y
            } action: { oldValue, newValue in
                reviewOffSetTrigger(newValue: newValue, width: width, height: height)
            }
        }
        .ignoresSafeArea()
        .background(Color.black)
        .overlay(alignment: .bottom, content: {
            PaywallSubscriptionOverlayView(height: height, width: width)
        })
    }
    
    private func reviewOffSetTrigger(newValue: Double, width: CGFloat, height: CGFloat) {
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

#Preview {
    PaywallScreen()
}

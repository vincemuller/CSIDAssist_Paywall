//
//  PaywallScreen.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/8/25.
//

import SwiftUI

struct PaywallScreen: View {
    @State private var firstReviewOffset = 300.0
    @State private var secondReviewOffset = -300.0
    @State private var thirdReviewOffset = 300.0
    
    @State private var showRows: [Bool] = Array(repeating: false, count: 4)
    
    private let features: [(icon: String, title: String, iconColor: Color)] = [
        ("fork.knife", "Custom Meals", .iconTeal),
        ("pencil.and.list.clipboard", "Meal Logging", .iconOrange),
        ("chart.bar.xaxis", "CSID Threshold Management", .iconRed),
        ("folder", "Saved Lists", .iconBlue)
    ]

    var body: some View {
        
        VStack (alignment: .leading) {
            ScrollView {
                Image(.icon)
                    .resizable()
                    .frame(height: 400)
                    .scaledToFit()
                HStack {
                    Text("More Features, Less Guesswork")
                        .font(.system(size: 24, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.top, 20)
                .padding(.bottom, 5)
                HStack {
                    Text("Helping you feel in control, every step of the way")
                        .font(.system(size: 14, weight: .semibold))
                        .foregroundStyle(Color.white.opacity(0.5))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
                
                ForEach(features.indices, id: \.self) { index in
                    FeatureRow(icon: features[index].icon,
                               title: features[index].title,
                               iconColor: features[index].iconColor)
                        .opacity(showRows[index] ? 1 : 0)
                        .offset(x: showRows[index] ? 0 : -100)
                        .animation(.easeOut(duration: 0.4).delay(Double(index) * 0.25), value: showRows[index])
                }
                
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                        VStack (alignment: .leading) {
                            Text("Jonathan C.")
                                .foregroundStyle(Color.white.opacity(0.5))
                                .font(.system(size: 10))
                            Text("Thank you so much for developing this app!! It is easy to use. The information is clear, easy to read and extremely helpful. This will make my life so much easier. Thank you!!!")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        .padding(10)
                    }
                    .frame(width: 300, height: 120)
                    .offset(x: firstReviewOffset)
                }
                .padding(.top, 30)
                .padding(.bottom, 10)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 300, height: 80)
                            .offset(x: secondReviewOffset)
                    }
                    Spacer()
                }
                .padding(.vertical, 10)
                
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                            .frame(width: 300, height: 120)
                            .offset(x: thirdReviewOffset)
                    }
                }
                .padding(.vertical, 10)
                
                VStack {
                }
                .frame(height: 200)
            }
            .onScrollGeometryChange(for: Double.self) { geo in
                geo.contentOffset.y
            } action: { oldValue, newValue in
                print(newValue)
                if newValue > 100 {
                    withAnimation (.easeIn) {
                        firstReviewOffset = -25
                    }
                }
                
                if newValue > 220 {
                    withAnimation {
                        secondReviewOffset = 25
                    }
                }
                
                if newValue > 370 {
                    withAnimation {
                        thirdReviewOffset = -25
                    }
                }
            }
        }
        .ignoresSafeArea()
        .background {
            LinearGradient(colors: [.backgroundColor1,.backgroundColor2,.backgroundColor1], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
                .opacity(0.5)
        }
        .overlay(alignment: .bottom, content: {
            VStack {
                Text("Get full access for just $4.99/month")
                    .font(.system(size: 14))
                Text("Continue")
                    .foregroundStyle(Color.white)
                    .font(.system(size: 18, weight: .semibold))
                    .frame(width: 300, height: 50)
                    .background {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.iconTeal)
                    }
                Text("All Plans | Restore | Terms and Conditions | Privacy")
                    .font(.system(size: 10))
                    .padding(.top, 5)
            }
            .padding()
        })
        .onAppear {
            for i in showRows.indices {
                DispatchQueue.main.asyncAfter(deadline: .now() + Double(i) * 0.2) {
                    showRows[i] = true
                }
            }
        }
    }
}

#Preview {
    PaywallScreen()
}

struct FeatureRow: View {
    let icon: String
    let title: String
    let iconColor: Color

    var body: some View {
        HStack(alignment: .top, spacing: 15) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(iconColor)
                .frame(width: 15)
                .padding(.horizontal, 10)
                .transition(.slide)
            Text(title)
                    .font(.title3)
                    .foregroundColor(.white)
                    .frame(height: 35)
        }
        .frame(width: 350, height: 35, alignment: .leadingLastTextBaseline)
    }
}

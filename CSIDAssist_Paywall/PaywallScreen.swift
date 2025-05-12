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
    
    @State private var showRows: [Bool] = Array(repeating: false, count: 5)
    
    @Binding var paywallPresenting: Bool
    
    private let features: [(icon: String, title: String, iconColor: Color)] = [
        ("fork.knife", "Custom Meals", .iconTeal),
        ("pencil.and.list.clipboard", "Meal Logging", .iconOrange),
        ("chart.bar.xaxis", "Sugar & Starch Tracking", .iconRed),
        ("folder", "Saved Lists", .iconBlue),
        ("figure.2.and.child.holdinghands", "Family Sharing", .iconOrange)
    ]

    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        VStack (alignment: .leading) {
            ScrollView {
                ZStack (alignment: .topTrailing) {
                    Image(.paywallBanner)
                        .resizable()
                        .scaledToFill()
                    Button {
                        withAnimation(.easeInOut) {
                            paywallPresenting = false
                        }
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 18, weight: .bold))
                            .foregroundStyle(Color.white)
                            .padding(30)
                            .ignoresSafeArea()
                    }
                }
                HStack {
                    Text("More Features, Less Guesswork")
                        .font(.system(size: width * 0.057, weight: .bold))
                    Spacer()
                }
                .padding(.horizontal)
                .padding(.vertical, height * 0.022)
                ForEach(features.indices, id: \.self) { index in
                    FeatureRow(icon: features[index].icon,
                               title: features[index].title,
                               iconColor: features[index].iconColor)
                    .frame(width: width * 0.87, alignment: .leading)
                    .padding(.vertical, 1)
                        .opacity(showRows[index] ? 1 : 0)
                        .offset(x: showRows[index] ? 0 : -(width * 0.2487))
                        .animation(.easeOut(duration: 0.4).delay(Double(index) * 0.25), value: showRows[index])
                }
                
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                        VStack (alignment: .leading) {
                            Text("Stacy L.")
                                .foregroundStyle(Color.white.opacity(0.5))
                                .font(.system(size: 10))
                            HStack (spacing: 1) {
                                ForEach((1...5), id: \.self) {_ in
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 10))
                                        .foregroundStyle(.yellow)
                                }
                            }
                            .padding(.vertical, 1)
                            Text("Thank you so much for developing this app!! It is easy to use. The information is clear, easy to read and extremely helpful. This will make my life so much easier. Thank you!!!")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        .padding(width * 0.0248)
                    }
                    .frame(width: width * 0.746, height: height * 0.15)
                    .offset(x: firstReviewOffset)
                }
                .padding(.vertical, height * 0.01)
                
                HStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                        VStack (alignment: .leading) {
                            Text("Melissa E.")
                                .foregroundStyle(Color.white.opacity(0.5))
                                .font(.system(size: 10))
                            HStack (spacing: 1) {
                                ForEach((1...5), id: \.self) {_ in
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 10))
                                        .foregroundStyle(.yellow)
                                }
                            }
                            .padding(.vertical, 1)
                            Text("CSIDAssist has completely changed how we manage our child’s CSID. The meal tracking feature helps us log everything they eat, and over time we’ve noticed patterns between certain foods and symptoms. It’s like having a food detective in our pocket!")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        .padding(width * 0.0248)
                    }
                    .frame(width: width * 0.746, height: height * 0.18)
                    .offset(x: secondReviewOffset)
                    Spacer()
                }
                .padding(.vertical, height * 0.01)
                
                HStack {
                    Spacer()
                    ZStack {
                        RoundedRectangle(cornerRadius: 12)
                            .fill(Color.white.opacity(0.1))
                        VStack (alignment: .leading) {
                            Text("Jonathan C.")
                                .foregroundStyle(Color.white.opacity(0.5))
                                .font(.system(size: 10))
                            HStack (spacing: 1) {
                                ForEach((1...5), id: \.self) {_ in
                                    Image(systemName: "star.fill")
                                        .font(.system(size: 10))
                                        .foregroundStyle(.yellow)
                                }
                            }
                            .padding(.vertical, 1)
                            Text("I love how intuitive the app is. Logging meals doesn’t feel like a chore, and seeing everything laid out helps me plan better. I’ve also started using it to prep weekly grocery lists based on what’s worked well. The benefits of consistent meal tracking have been more than I expected.")
                                .font(.system(size: 12))
                            Spacer()
                        }
                        .padding(width * 0.0248)
                    }
                    .frame(width: width * 0.746, height: height * 0.18)
                    .offset(x: thirdReviewOffset)
                }
                .padding(.vertical, height * 0.01)
                
                VStack {
                }
                .frame(height: height * 0.228)
            }
            .onScrollGeometryChange(for: Double.self) { geo in
                geo.contentOffset.y
            } action: { oldValue, newValue in
                print(newValue)
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
                    Text("Continue")
                        .foregroundStyle(Color.white)
                        .font(.system(size: 18, weight: .semibold))
                        .frame(width: width * 0.746, height: height * 0.057)
                        .background {
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.iconTeal)
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
    PaywallScreen(paywallPresenting: .constant(true))
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
                .font(.system(size: 16))
                    .foregroundColor(.white)
                    .frame(height: 35)
        }
    }
}

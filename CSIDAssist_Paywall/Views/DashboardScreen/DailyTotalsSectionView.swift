//
//  DashboardSectionView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/3/25.
//

import SwiftUI


let columns: [GridItem] = [GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible()),
                           GridItem(.flexible())]

struct DailyTotalsSectionView: View {
    @EnvironmentObject var storeKit: StoreKitManager
    
    var title: String
    var calendar = Calendar.current
    var dates: [[String]] = [["SUN","04"],["MON","05"],["TUE","06"],["WED","07"],["THU","08"],["FRI","09"],["SAT","10"]]
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 25, weight: .semibold))
                .foregroundStyle(.white.opacity(storeKit.subscriptionStatus ? 1.0 : 0.1))
            Spacer()
        }
        .padding(.horizontal, width * 0.0248)
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.textField)
            VStack {
                HStack {
                    LazyVGrid(columns: columns) {
                        Image(systemName: "chevron.left")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.leading, width * 0.0248)
                        ForEach(dates, id: \.self) { date in
                            ZStack {
                                date[1] != "07" ? nil :
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(.white, lineWidth: 1.5)
                                    .frame(width: 40, height: 45)
                                VStack {
                                    Text(date[1])
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(Color.white)
                                    Text(date[0])
                                        .font(.system(size: 12, weight: .medium))
                                        .foregroundStyle(Color.iconTeal)
                                }
                            }
                        }
                        Image(systemName: "chevron.right")
                            .foregroundStyle(.white)
                            .font(.system(size: 14, weight: .semibold))
                            .padding(.trailing, width * 0.0248)
                    }
                }
                .padding(.vertical, height * 0.01144)
                .padding(.bottom, height * 0.0057)
                HStack {
                    Spacer()
                    VStack (spacing: 15) {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 7)
                                .foregroundStyle(Color.iconRed)
                                .frame(width: width * 0.174)
                            Text("0.0g")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        Text("Sugars")
                            .font(.system(size: 14))
                    }
                    Spacer()
                    VStack (spacing: 15) {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 7)
                                .foregroundStyle(Color.iconBlue)
                                .frame(width: width * 0.174)
                            Text("0.0g")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        Text("Carbs")
                            .font(.system(size: 14))
                    }
                    Spacer()
                    VStack (spacing: 15) {
                        ZStack {
                            Circle()
                                .stroke(lineWidth: 7)
                                .foregroundStyle(Color.iconOrange)
                                .frame(width: width * 0.174)
                            Text("0.0g")
                                .font(.system(size: 16, weight: .semibold))
                        }
                        Text("Starches")
                            .font(.system(size: 14))
                    }
                    Spacer()
                }
                Spacer()
            }
            .frame(height: height * 0.2288)
            .opacity(storeKit.subscriptionStatus ? 1.0 : 0.1)
            .overlay(alignment: .bottom) {
                storeKit.subscriptionStatus ? nil :
                NavigationLink {
                    PaywallScreen()
                        .toolbarRole(.editor)
                } label: {
                    VStack (spacing: 15) {
                        Image(systemName: "lock.fill")
                            .font(.system(size: 40))
                            .foregroundColor(.white)
                        Text("Subscribe to\nCSIDAssist+")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(Color.white)
                    }
                    .offset(y: height * 0.02288)
                }
            }
        }
        .padding(.bottom, height * 0.01144)
    }
}

#Preview {
    DailyTotalsSectionView(title: "Daily Totals", width: 402, height: 874)
        .environmentObject(StoreKitManager())
}

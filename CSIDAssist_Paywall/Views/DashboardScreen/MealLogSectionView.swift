//
//  MealLogSectionView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/3/25.
//

import SwiftUI

struct MealLogSectionView: View {
    @EnvironmentObject var storeKit: StoreKitManager
    
    var title: String
    
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
                .frame(height: height * 0.1144)
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())], content: {
                ForEach(MealType.allCases, id: \.id) { meal in
                    VStack (spacing: 5) {
                        Image(meal.label.lowercased())
                            .resizable()
                            .frame(width: width * 0.1368, height: width * 0.1368)
                            .mask {
                                Circle()
                                    .frame(width: width * 0.1247, height: width * 0.1247)
                            }
                        Text(meal.label)
                            .font(.system(size: 12, weight: .semibold))
                            .foregroundStyle(Color.white)
                    }
                }
            })
            .padding(.horizontal)
            .opacity(storeKit.subscriptionStatus ? 1.0 : 0.1)
        }
        .padding(.bottom, height * 0.01144)
    }
}

#Preview {
    MealLogSectionView(title: "Meal Log", width: 402, height: 874)
        .environmentObject(StoreKitManager())
}

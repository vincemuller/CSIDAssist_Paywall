//
//  MealLogSectionView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/3/25.
//

import SwiftUI

struct MealLogSectionView: View {
    
    var title: String
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 25, weight: .semibold))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal, 10)
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .fill(.textField)
                .frame(height: 100)
            LazyVGrid(columns: [GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible()),GridItem(.flexible())], content: {
                ForEach(MealType.allCases, id: \.id) { meal in
                    VStack (spacing: 5) {
                        Image(meal.label.lowercased())
                            .resizable()
                            .frame(width: 55, height: 55)
                            .mask {
                                Circle()
                                    .frame(width: 50, height: 50)
                            }
                        Text(meal.label)
                            .font(.system(size: 12, weight: .semibold))
                    }
                }
            })
            .padding(.horizontal)
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    MealLogSectionView(title: "Meal Log")
}

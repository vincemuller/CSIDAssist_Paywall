//
//  FeaturesView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/12/25.
//

import SwiftUI

struct FeaturesView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    let features: [(icon: String, title: String, iconColor: Color)] = [
        ("fork.knife", "Custom Meals", .iconTeal),
        ("pencil.and.list.clipboard", "Meal Logging", .iconOrange),
        ("chart.bar.xaxis", "Sugar & Starch Tracking", .iconRed),
        ("folder", "Saved Lists", .iconBlue),
        ("figure.2.and.child.holdinghands", "Family Sharing", .iconOrange)
    ]
    
    @State var showRows: [Bool] = Array(repeating: false, count: 5)
    
    var body: some View {
        ForEach(features.indices, id: \.self) { index in
            FeatureRowView(icon: features[index].icon,
                       title: features[index].title,
                       iconColor: features[index].iconColor)
            .frame(width: width * 0.87, alignment: .leading)
            .padding(.vertical, 1)
                .opacity(showRows[index] ? 1 : 0)
                .offset(x: showRows[index] ? 0 : -(width * 0.2487))
                .animation(.easeOut(duration: 0.4).delay(Double(index) * 0.25), value: showRows[index])
        }
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
    FeaturesView(width: 402, height: 874)
}

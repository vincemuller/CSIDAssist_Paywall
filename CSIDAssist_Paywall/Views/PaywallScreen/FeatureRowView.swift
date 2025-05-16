//
//  FeatureRow.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/12/25.
//

import SwiftUI

struct FeatureRowView: View {
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
                .font(.system(size: 16, weight: .semibold))
                    .foregroundColor(.white)
                    .frame(height: 35)
        }
    }
}

#Preview {
    FeatureRowView(icon: "pencil", title: "Custom Meals", iconColor: .iconTeal)
}

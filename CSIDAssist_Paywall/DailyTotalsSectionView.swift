//
//  DashboardSectionView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/3/25.
//

import SwiftUI

struct DailyTotalsSectionView: View {
    
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
                .frame(height: 150)
        }
        .padding(.bottom, 10)
    }
}

#Preview {
    DailyTotalsSectionView(title: "Daily Totals")
}

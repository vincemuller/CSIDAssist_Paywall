//
//  PaywallHeaderView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/12/25.
//

import SwiftUI

struct PaywallHeaderView: View {
    
    let text: String = "Upgrade for access to these tools:"
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack {
            Text(text)
                .font(.system(size: width * 0.057, weight: .bold))
                .foregroundStyle(Color.white)
            Spacer()
        }
        .padding(.horizontal)
        .padding(.vertical, height * 0.022)
    }
}

#Preview {
    PaywallHeaderView(width: 402, height: 864)
}

//
//  PaywallHeaderView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/12/25.
//

import SwiftUI

struct PaywallHeaderView: View {
    
    let text: String
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
    PaywallHeaderView(text: "Upgrade for access to these tools:", width: 402, height: 864)
}

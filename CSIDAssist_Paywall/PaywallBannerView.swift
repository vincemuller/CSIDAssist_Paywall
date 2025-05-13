//
//  PaywallBannerView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/12/25.
//

import SwiftUI

struct PaywallBannerView: View {
    var body: some View {
        Image(.paywallBanner)
            .resizable()
            .scaledToFill()
    }
}

#Preview {
    PaywallBannerView()
}

//
//  LogoView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/15/25.
//

import SwiftUI

struct LogoView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack {
            VStack (alignment: .leading, spacing: 0) {
                Image("csidAssistLogo")
                    .resizable()
                    .frame(width: width * 0.174, height: width * 0.174)
                    .padding(.top)
                HStack (spacing: 0) {
                    Text("CSID")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.white)
                    Text("Assist")
                        .font(.system(size: 30, weight: .bold))
                        .foregroundStyle(.iconTeal)
                    Spacer()
                }
                .offset(x: width * 0.0248)
            }
            .padding()
            Spacer()
        }
    }
}

#Preview {
    LogoView(width: 402, height: 874)
}

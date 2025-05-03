//
//  ContentView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/2/25.
//

import SwiftUI

struct DashboardScreen: View {
    var body: some View {
        ZStack {
            LinearGradient(colors: [.backgroundColor1,.backgroundColor2,.backgroundColor1], startPoint: .topLeading, endPoint: .bottomTrailing)
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: -10) {
                        Image("csidAssistLogo")
                            .resizable()
                            .frame(width: 70, height: 70)
                        Text("CSIDAssist")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundStyle(.white)
                            .offset(x: 10)
                    }
                    .padding()
                    Spacer()
                }
                Spacer()
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    DashboardScreen()
}

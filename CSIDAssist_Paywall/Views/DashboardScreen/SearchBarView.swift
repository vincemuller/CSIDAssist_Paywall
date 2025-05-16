//
//  SearchBarView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/15/25.
//

import SwiftUI

struct SearchBarView: View {
    
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        HStack (spacing: 10) {
            ZStack (alignment: .leading) {
                RoundedRectangle(cornerRadius: 10)
                    .fill(Color.textField)
                    .frame(height: height * 0.0457)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white.opacity(0.6))
                    ZStack (alignment: .leading) {
                        SearchCarouselView()
                    }
                    .frame(height: height * 0.04)
                }.padding(.leading)
            }
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .fill(.textField)
                    .frame(width: width * 0.0995, height: width * 0.0995)
                Image(systemName: "arrow.up.and.down.text.horizontal")
                    .foregroundColor(.white)
            }
        }
        .padding(.horizontal)
        .padding(.bottom)
    }
}

#Preview {
    SearchBarView(width: 402, height: 874)
}

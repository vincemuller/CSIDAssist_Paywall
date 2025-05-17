//
//  ReviewView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/12/25.
//

import SwiftUI

struct ReviewView: View {
    
    @Binding var reviewOffset: Double
    
    let review: Review
    let width: CGFloat
    let height: CGFloat
    
    var body: some View {
        
        let initialOffset = reviewOffset
        
        HStack {
            initialOffset > 0 ? nil : Spacer()
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.white.opacity(0.1))
                VStack (alignment: .leading) {
                    Text(review.name)
                        .foregroundStyle(Color.white.opacity(0.5))
                        .font(.system(size: 10))
                    HStack (spacing: 1) {
                        ForEach((1...5), id: \.self) {_ in
                            Image(systemName: "star.fill")
                                .font(.system(size: 10))
                                .foregroundStyle(.yellow)
                        }
                    }
                    .padding(.vertical, 1)
                    Text(review.comment)
                        .foregroundStyle(Color.white)
                        .font(.system(size: 12))
                    Spacer()
                }
                .padding(width * 0.0248)
            }
            .frame(width: width * 0.746, height: height * 0.15)
            .offset(x: reviewOffset)
            initialOffset < 0 ? nil : Spacer()
        }
        .padding(.vertical, height * 0.01)
    }
}

#Preview {
    ReviewView(reviewOffset: .constant(300), review: Review(id: UUID(), name: "Vince M.", comment: "CSIDAssist absolutely changed the way I manage my symptoms and diet.  Thank you!"), width: 402, height: 874)
}

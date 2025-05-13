//
//  SavedListsSectionView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/4/25.
//

import SwiftUI
import Foundation

struct SavedListsSectionView: View {
    
    let savedLists: [String] = ["Favorite Safe Foods"]
    let title: String
    
    
    var body: some View {
        HStack {
            Text(title)
                .font(.system(size: 25, weight: .semibold))
                .foregroundStyle(.white)
            Spacer()
        }
        .padding(.horizontal, 10)
        ZStack (alignment: .top) {
            RoundedRectangle(cornerRadius: 15)
                .fill(.textField)
                .frame(height: 160)
            ScrollView {
                VStack (alignment: .leading, spacing: 10) {
                    ForEach(savedLists, id: \.self) { list in
                        if savedLists.firstIndex(of: list) == 0 {
                            Button {

                            } label: {
                                HStack {
                                    Group {
                                        Image(systemName: "plus")
                                            .foregroundStyle(.iconTeal)
                                    }
                                    Text("Create New List")
                                        .font(.system(size: 16))
                                        .foregroundStyle(Color.iconTeal)
                                }
                            }
                            
                            Divider()
                                .padding(.leading, 25)
                        }
                        HStack {
                            Image(systemName: "bookmark")
                                .foregroundStyle(.white)
                            Text(list)
                                .font(.system(size: 16))
                                .foregroundStyle(Color.white)
                            Spacer()
                            Text(Int.random(in: 5...25).description)
                                .font(.system(size: 16))
                                .foregroundStyle(Color.white)
                        }
                        Divider()
                            .padding(.leading, 25)
                    }
                }
                .padding()
            }
        }
    }
}

#Preview {
    SavedListsSectionView(title: "Lists")
}

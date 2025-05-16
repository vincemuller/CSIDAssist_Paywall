//
//  ContentView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/2/25.
//

import SwiftUI
import StoreKit


struct DashboardScreen: View {
    @EnvironmentObject var storeKit: StoreKitManager
    
    @State var subscriptionStatus: Bool = false
    
    var body: some View {
        let width = UIScreen.main.bounds.width
        let height = UIScreen.main.bounds.height
        
        NavigationStack {
            VStack {
                LogoView(width: width, height: height)
                
                SearchBarView(width: width, height: height)
                
                VStack (spacing: 7) {
                    ForEach(HomeScreenSections.allCases) { section in
                        sectionView(for: section, width: width, height: height)
                            .padding(.horizontal)
                    }
                }
            }
            .ignoresSafeArea()
            .background {
                LinearGradient(colors: [.backgroundColor1,.backgroundColor2,.backgroundColor1], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
        }
    }
    
    @ViewBuilder
    func sectionView(for section: HomeScreenSections, width: CGFloat, height: CGFloat) -> some View {
        switch section {
        case .mealData:
            DailyTotalsSectionView(title: section.label, width: width, height: height)
        case .meals:
            MealLogSectionView(title: section.label, width: width, height: height)
        case .lists:
            SavedListsSectionView(title: section.label, width: width, height: height)
        }
    }
    
}

#Preview {
    NavigationStack {
        DashboardScreen()
            .environmentObject(StoreKitManager())
    }
}

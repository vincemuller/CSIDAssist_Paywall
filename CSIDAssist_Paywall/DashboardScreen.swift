//
//  ContentView.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/2/25.
//

import SwiftUI
import StoreKit

struct HeroColor: Identifiable {
    var id = UUID()
    var color: Color
}

struct DashboardScreen: View {
    
    @StateObject private var storeKit = StoreKitManager()
    
    @State var subscriptionStatus: Bool = false
    @State var searchText: String = ""
    @State var paywallPresenting: Bool = false
    
    
    var body: some View {
        NavigationStack {
            VStack {
                HStack {
                    VStack (alignment: .leading, spacing: 0) {
                        Image("csidAssistLogo")
                            .resizable()
                            .frame(width: 70, height: 70)
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
                        .offset(x: 10)
                    }
                    .padding()
                    Spacer()
                }
                HStack (spacing: 10) {
                    ZStack (alignment: .leading) {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.textField)
                            .frame(height: 40)
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundStyle(.white.opacity(0.6))
                            ZStack (alignment: .leading) {
                                searchText.count > 0 ? nil : SearchCarouselView()
                                TextField("", text: $searchText)
                                    .foregroundColor(.white)
                                    .onSubmit {
                                    }
                            }
                            .frame(height: 35)
                        }.padding(.leading)
                    }
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.textField)
                            .frame(width: 40, height: 40)
                        Image(systemName: "arrow.up.and.down.text.horizontal")
                            .foregroundColor(.white)
                    }
                }
                .padding(.horizontal)
                .padding(.bottom)
                VStack (spacing: 7) {
                    ForEach(HomeScreenSections.allCases) { section in
                        sectionView(for: section)
                            .padding(.horizontal)
                    }
                }
            }
            .ignoresSafeArea()
            .background {
                LinearGradient(colors: [.backgroundColor1,.backgroundColor2,.backgroundColor1], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .ignoresSafeArea()
            }
            .fullScreenCover(isPresented: $paywallPresenting) {
                PaywallScreen(paywallPresenting: $paywallPresenting)
            }
        }
    }
    
    @ViewBuilder
    func sectionView(for section: HomeScreenSections) -> some View {
        switch section {
        case .mealData:
            DailyTotalsSectionView(title: "Daily Totals", paywallPresenting: $paywallPresenting)
        case .meals:
            MealLogSectionView(title: section.label)
        case .lists:
            SavedListsSectionView(title: section.label, paywallPresenting: $paywallPresenting)
        }
    }
    
}

#Preview {
    NavigationStack {
        DashboardScreen()
    }
}

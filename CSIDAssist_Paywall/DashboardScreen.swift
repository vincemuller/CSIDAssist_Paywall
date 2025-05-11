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
    
    let colors = HeroColor(color: Color.iconTeal)
    @State var subscriptionStatus: Bool = false
    @State var searchText: String = ""
    @State var paywallPresenting: Bool = false
    
    @Namespace var namespace
    
    var body: some View {
        NavigationStack {
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
                VStack {
                    ForEach(HomeScreenSections.allCases) { section in
                        sectionView(for: section)
                            .padding(.horizontal)
                            .padding(.bottom, section == .mealData ? 10: 0)
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
    func sectionView(for section: HomeScreenSections) -> some View {
        switch section {
        case .mealData:
            if subscriptionStatus {
                DailyTotalsSectionView(title: section.label, paywallPresenting: $paywallPresenting)
            } else {
                ZStack {
                    VStack (spacing: 0) {
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.textField)
                    }
                }
                .frame(height: 350)
                .overlay(alignment: .bottom) {
                    NavigationLink {
                        PaywallScreen()
                            .navigationTransition(.zoom(sourceID: colors.id, in: namespace))
                    } label: {
                        Text("Subscribe")
                            .foregroundStyle(Color.white)
                            .font(.system(size: 18, weight: .semibold))
                            .frame(width: 300, height: 50)
                            .background {
                                RoundedRectangle(cornerRadius: 12)
                                    .fill(Color.iconTeal)
                            }
                            .matchedTransitionSource(id: colors.id, in: namespace)
                            .padding()
                    }
                }
            }
        case .meals:
            !subscriptionStatus ? nil :
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

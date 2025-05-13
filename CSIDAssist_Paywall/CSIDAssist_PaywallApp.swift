//
//  CSIDAssist_PaywallApp.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/2/25.
//

import SwiftUI

@main
struct CSIDAssist_PaywallApp: App {
    
    @StateObject var storeKit = StoreKitManager()
    
    var body: some Scene {
        WindowGroup {
            DashboardScreen()
                .environmentObject(storeKit)
        }
    }
}

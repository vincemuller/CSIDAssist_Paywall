//
//  EnumsAndExtensions.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/3/25.
//

import Foundation
import SwiftUI

enum HomeScreenSections: Identifiable, CaseIterable {
    case mealData, meals, lists
    var id: Self { self }
    var label: String {
        switch self {
        case .mealData:
            return "Daily Totals"
        case .meals:
            return "Meal Log"
        case .lists:
            return "Lists"
        }
    }
}

enum MealType: Identifiable, CaseIterable {
    case breakfast, lunch, dinner, snack
    var id: Self { self }
    var label: String {
        switch self {
        case .breakfast:
            return "Breakfast"
        case .lunch:
            return "Lunch"
        case .dinner:
            return "Dinner"
        case .snack:
            return "Snack"
        }
    }
}

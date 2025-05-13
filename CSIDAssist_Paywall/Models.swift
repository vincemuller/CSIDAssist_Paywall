//
//  Models.swift
//  CSIDAssist_Paywall
//
//  Created by Vince Muller on 5/12/25.
//

import Foundation


struct Review: Identifiable {
    var id = UUID()
    var name: String
    var comment: String
}

struct MockData {
    var reviews: [Review] = [Review(name: "Stacy L.", comment: "Thank you so much for developing this app!! It is easy to use. The information is clear, easy to read and extremely helpful. This will make my life so much easier. Thank you!!!"),
                             Review(name: "Melissa E.", comment: "CSIDAssist has completely changed how we manage our child’s CSID. The meal tracking feature helps us log everything they eat, and over time we’ve noticed patterns between certain foods and symptoms. It’s like having a food detective in our pocket!"),
                             Review(name: "Jonathan C.", comment: "I love how intuitive the app is. Logging meals doesn’t feel like a chore, and seeing everything laid out helps me plan better. I’ve also started using it to prep weekly grocery lists based on what’s worked well. The benefits of consistent meal tracking have been more than I expected.")]
}

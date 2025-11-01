//
//  GroupingTypes.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 28.10.2025.
//

import Foundation

enum GroupingType: String, CaseIterable, Identifiable {
    case day
    case month
    case year
    
    var id: Self { self }
    
    var localizedTitle: String {
        switch self {
        case .day:
            return L10n.day
        case .month:
            return L10n.month
        case .year:
            return L10n.year
        }
    }
}


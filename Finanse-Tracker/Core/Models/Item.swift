//
//  Item.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 25.10.2025.
//

import Foundation
import SwiftData

@Model
final class FinanceItem {
    @Attribute(.unique) var id: UUID
    var amount: Double
    var category: String
    @Attribute var typeRaw: String
    var date: Date
    var note: String?

    var type: FinanceType {
        get { FinanceType(rawValue: typeRaw) ?? .expense }
        set { typeRaw = newValue.rawValue }
    }

    init(amount: Double, category: String, type: FinanceType, date: Date = .now, note: String? = nil) {
        self.id = UUID()
        self.amount = amount
        self.category = category
        self.typeRaw = type.rawValue
        self.date = date
        self.note = note
    }
}


enum FinanceType: String {
    case income, expense
}

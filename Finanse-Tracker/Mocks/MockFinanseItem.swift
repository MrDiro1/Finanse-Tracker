//
//  MockFinanseItem.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 25.10.2025.
//

import Foundation

#if DEBUG
struct MockFinanceItem: Identifiable {
    let id = UUID()
    let amount: Double
    let category: String
    let type: FinanceType
    let date: Date
    let note: String?
}



let sampleFinanceData: [MockFinanceItem] = [
    MockFinanceItem(amount: 2000, category: "Зарплата", type: .income, date: Date().addingTimeInterval(-86400 * 6), note: "Октябрь"),
    MockFinanceItem(amount: 150, category: "Еда", type: .expense, date: Date().addingTimeInterval(-86400 * 6), note: "Обед в кафе"),
    
    MockFinanceItem(amount: 50, category: "Транспорт", type: .expense, date: Date().addingTimeInterval(-86400 * 5), note: nil),
    MockFinanceItem(amount: 500, category: "Фриланс", type: .income, date: Date().addingTimeInterval(-86400 * 5), note: "Upwork"),
    
    MockFinanceItem(amount: 100, category: "Развлечения", type: .expense, date: Date().addingTimeInterval(-86400 * 4), note: "Кино"),
    MockFinanceItem(amount: 300, category: "Подарки", type: .expense, date: Date().addingTimeInterval(-86400 * 3), note: "День рождения друга"),
    MockFinanceItem(amount: 1200, category: "Продажа вещей", type: .income, date: Date().addingTimeInterval(-86400 * 2), note: nil)
]
#endif



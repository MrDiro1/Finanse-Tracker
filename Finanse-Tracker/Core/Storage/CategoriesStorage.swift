
import Foundation
import SwiftUI
import Combine

final class CategoriesStorage: ObservableObject {
    static let shared = CategoriesStorage()
    
    @Published var categoriesExpense: [String] {
        didSet { Self.save(categoriesExpense, forKey: "categoriesExpenseData") }
    }
    
    @Published var categoriesIncome: [String] {
        didSet { Self.save(categoriesIncome, forKey: "categoriesIncomeData") }
    }
    
    private let defaultExpense = [
        L10n.food, L10n.transport, L10n.entertainment,
        L10n.gifts, L10n.water, L10n.cafe, L10n.restaurant,
        L10n.pharmacy, L10n.significantOther, L10n.onlineShopping, L10n.rent,
        L10n.gift, L10n.birthday, L10n.fun, L10n.cinema, L10n.transfers
    ]
    
    private let defaultIncome = [
        L10n.salary, L10n.freelance, L10n.sellingItems
    ]
    
    private init() {
        categoriesExpense = Self.load(forKey: "categoriesExpenseData") ?? defaultExpense
        categoriesIncome = Self.load(forKey: "categoriesIncomeData") ?? defaultIncome
    }
    
    private static func save(_ array: [String], forKey key: String) {
        if let data = try? JSONEncoder().encode(array) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
    
    private static func load(forKey key: String) -> [String]? {
        guard let data = UserDefaults.standard.data(forKey: key),
              let array = try? JSONDecoder().decode([String].self, from: data)
        else { return nil }
        return array
    }
}

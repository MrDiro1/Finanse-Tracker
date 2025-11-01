
import Foundation
import Observation
import SwiftUI

extension CategoriesView {
    @Observable
    final class ViewModel {
        var type: FinanceType = .expense
        var newCategory = ""
        var isAddingCategory = false
        
        var storage = CategoriesStorage.shared
        
        var currentCategories: [String] {
            type == .income ? storage.categoriesIncome : storage.categoriesExpense
        }
        
        func toggleAddMode() {
            isAddingCategory.toggle()
        }
        
        func addCategory() {
            let trimmed = newCategory.trimmingCharacters(in: .whitespacesAndNewlines)
            guard !trimmed.isEmpty else { return }
            
            if type == .income {
                storage.categoriesIncome.append(trimmed)
            } else {
                storage.categoriesExpense.append(trimmed)
            }
            
            newCategory = ""
            withAnimation {
                isAddingCategory = false
            }
        }
        
        func deleteCategory(at offsets: IndexSet) {
            if type == .income {
                storage.categoriesIncome.remove(atOffsets: offsets)
            } else {
                storage.categoriesExpense.remove(atOffsets: offsets)
            }
        }
    }
}


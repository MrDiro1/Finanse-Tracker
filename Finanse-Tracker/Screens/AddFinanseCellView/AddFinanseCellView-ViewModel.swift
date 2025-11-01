//
//  AddFinanseCellView-ViewModel.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 27.10.2025.
//

import SwiftData
import Foundation
import Observation

extension AddFinanseCellView {
    @Observable
    class ViewModel {
        let service: FinanceService
        let onSave: () -> Void
        
        var amount: String = ""
        var category: String = ""
        var type: FinanceType = .expense
        var date: Date = Date()
        var note: String = ""
        var alertItem: AlertItem?
        var itemToEdit: FinanceItem? = nil
        
        var canSave: Bool {
            !amount.isEmpty && Double(amount) != nil && !category.isEmpty
        }
        
        init(service: FinanceService, onSave: @escaping () -> Void, amount: String, category: String, type: FinanceType, date: Date, note: String) {
            self.service = service
            self.onSave = onSave
            self.amount = amount
            self.category = category
            self.type = type
            self.date = date
            self.note = note
        }
        
        
        func saveFinanceItem() {
            guard let amountValue = Double(amount), !category.isEmpty else { return }
            
            if let item = itemToEdit {
                
                item.amount = amountValue
                item.category = category
                item.type = type
                item.date = date
                item.note = note.isEmpty ? nil : note
                
                do {
                    try service.add(item)
                    onSave()
                } catch {
                    alertItem = FinanceError.saveFailed.alertItem
                }
                
            } else {
                let newItem = FinanceItem(amount: amountValue,
                                          category: category,
                                          type: type,
                                          date: date,
                                          note: note.isEmpty ? nil : note)
                
                do {
                    try service.add(newItem)
                    onSave()
                } catch {
                    alertItem = FinanceError.saveFailed.alertItem
                }
            }
            
            itemToEdit = nil
        }

    }
}

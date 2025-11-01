//
//  FinansesListView-ViewModel.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 26.10.2025.
//

import Foundation
import SwiftData
import Observation


extension FinansesListView {
    @Observable final class ViewModel {
        let service: FinanceService
        var items = [FinanceItem]()
        var searchText = ""
        var showingEditSheet = false
        var alertItem: AlertItem?
        var groupingType: GroupingType = .month
        var itemToEdit: FinanceItem? = nil
        
        
         var filteredItems: [FinanceItem] {
            if searchText.isEmpty {
                return items
            } else {
                return items.filter { $0.category.localizedCaseInsensitiveContains(searchText) }
            }
        }
        
        var groupedItems: [(key: String, items: [FinanceItem])] {
            DateGrouping.groupedItems(from: filteredItems, groupingType: groupingType)
        }
        
        init(service: FinanceService) {
            self.service = service
            fetchData()
        }
        
        func fetchData() {
            do {
                items = try service.fetchAll()
            } catch {
                alertItem = FinanceError.fetchFailed.alertItem
            }
        }
        
        func deleteItem(at offsets: IndexSet, in section: [FinanceItem]) {
            for offset in offsets {
                let item = section[offset]
                do {
                    try service.delete(item)
                    fetchData()
                } catch {
                    alertItem = FinanceError.deleteFailed.alertItem
                }
            }
        }
    }
}


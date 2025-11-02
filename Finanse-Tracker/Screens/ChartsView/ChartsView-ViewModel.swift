
import Foundation
import SwiftData
import Observation
import SwiftUI

extension ChartsView {
    @Observable
    final class ViewModel {
        let service: FinanceServiceProtocol
        var items = [FinanceItem]()
        var groupingType: GroupingType = .month
        var alertItem: AlertItem?

        init(service: FinanceServiceProtocol) {
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
        
        func shadowColor(baseColor: Color, colorScheme: ColorScheme) -> Color {
            colorScheme == .dark ? baseColor.opacity(0.3) : Color.gray.opacity(0.3)
        }

        private var groupedItems: [(key: String, items: [FinanceItem])] {
            DateGrouping.groupedItems(from: items, groupingType: groupingType)
        }

        private var currentGroupItems: [FinanceItem] {
            groupedItems.first?.items ?? []
        }

        var incomes: [FinanceItem] {
            currentGroupItems.filter { $0.type == .income }
        }

        var expenses: [FinanceItem] {
            currentGroupItems.filter { $0.type == .expense }
        }
    }
}



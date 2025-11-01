
import Foundation

struct FinanceStatsModel {
    let items: [FinanceItem]

    var totalAmount: Double {
        items.reduce(0) { $0 + $1.amount }
    }

    var averageAmount: Double {
        guard !items.isEmpty else { return 0 }
        return totalAmount / Double(items.count)
    }

    var maxAmount: Double {
        items.map { $0.amount }.max() ?? 0
    }
}

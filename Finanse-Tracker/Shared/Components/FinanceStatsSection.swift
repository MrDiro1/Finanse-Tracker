
import SwiftUI

struct FinanceStatsSection: View {
    let title: String
    let stats: FinanceStatsModel
    
    @State private var isExpanded = false
    
    var body: some View {
        DisclosureGroup(isExpanded: $isExpanded) {
            HStack(spacing: 20) {
                VStack(alignment: .leading, spacing: 5) {
                    Text("\(L10n.total): \(stats.totalAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    Divider()
                    Text("\(L10n.average): \(stats.averageAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    Divider()
                    Text("\(L10n.max): \(stats.maxAmount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                }
                Spacer()
            }
            .padding(.vertical, 5)
        } label: {
            Text(title)
                .font(.headline)
        }
        .padding()
        .background(Color(.secondarySystemBackground))
        .cornerRadius(10)
        .animation(.easeInOut, value: isExpanded)
    }
}


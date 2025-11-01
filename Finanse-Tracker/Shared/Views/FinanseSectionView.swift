
import SwiftUI

struct FinanceSectionView: View {
    let section: (key: String, items: [FinanceItem])
    let colorScheme: ColorScheme
    let onDelete: (IndexSet) -> Void
    let onChange: (FinanceItem) -> Void
    
    var body: some View {
        Section(header: Text(section.key).font(.headline)) {
            ForEach(section.items) { data in
                FinanceRowView(item: data, colorScheme: colorScheme)
                    .swipeActions(edge: .trailing) {
                        Button(role: .destructive) {
                            if let index = section.items.firstIndex(where: { $0.id == data.id }) {
                                onDelete(IndexSet(integer: index))
                            }
                        } label: {
                            Label(L10n.delete, systemImage: "trash")
                        }
                        
                        Button {
                            onChange(data)
                        } label: {
                            Label(L10n.change, systemImage: "pencil")
                        }
                        .tint(.blue)
                    }
            }
        }
    }
}



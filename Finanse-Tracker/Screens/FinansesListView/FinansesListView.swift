
import SwiftData
import SwiftUI

struct FinansesListView: View {
    @Environment(\.colorScheme) private var colorScheme
    @State private var viewModel: ViewModel
    let modelContext: ModelContext
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(viewModel.groupedItems, id: \.key) { section in
                    FinanceSectionView(
                        section: section,
                        colorScheme: colorScheme,
                        onDelete: { offsets in
                            viewModel.deleteItem(at: offsets, in: section.items)
                        }, onChange: { item in
                            viewModel.itemToEdit = item
                            viewModel.showingEditSheet = true
                        }
                    )
                }
            }
            .navigationTitle(L10n.finances)
            .searchable(text: $viewModel.searchText, placement: .navigationBarDrawer(displayMode: .always), prompt: L10n.searchByCategory)
            .overlay {
                if viewModel.items.isEmpty {
                    EmptyStateView(content: .nodata)
                } else if viewModel.filteredItems.isEmpty  {
                    EmptyStateView(content: .search)
                }
            }
            .toolbar {
                ToolbarItem(placement: .automatic) {
                    PickerSortView(groupingType: $viewModel.groupingType)
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        viewModel.showingEditSheet = true
                        viewModel.itemToEdit = nil
                    } label: {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                            .opacity(0.5)
                    }
                }
            }
        }
        .sheet(isPresented: $viewModel.showingEditSheet) {
            AddFinanseCellView(modelContext: modelContext, itemToEdit: viewModel.itemToEdit) {
                viewModel.fetchData()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(title: alert.title, message: alert.message, dismissButton: .default(Text(L10n.ok)))
        }
        .onAppear {
            viewModel.fetchData()
        }
    }
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
        let service = FinanceService(modelContext: modelContext)
        let viewModel = ViewModel(service: service)
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FinanceItem.self, configurations: config)
    
    let ctx = container.mainContext
    
    let calendar = Calendar.current
    
    ctx.insert(FinanceItem(amount: 1200, category: "Salary", type: .income, date: Date(), note: "October"))
    ctx.insert(FinanceItem(amount: 25.5, category: "Food", type: .expense, date: Date(), note: "Lunch"))
    ctx.insert(FinanceItem(amount: 60, category: "Transport", type: .expense, date: calendar.date(byAdding: .day, value: -2, to: Date())!))
    ctx.insert(FinanceItem(amount: 150, category: "Entertainment", type: .expense, date: calendar.date(byAdding: .month, value: -1, to: Date())!))
    ctx.insert(FinanceItem(amount: 500, category: "Freelance", type: .income, date: calendar.date(byAdding: .month, value: -2, to: Date())!))
    
    return FinansesListView(modelContext: ctx)
        .modelContainer(container)
        .preferredColorScheme(.dark)
}

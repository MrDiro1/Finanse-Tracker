
import SwiftData
import SwiftUI
import Charts

struct ChartsView: View {
    @State private var viewModel: ViewModel
    let modelContext: ModelContext
    @Environment(\.colorScheme) private var colorScheme
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                PickerSortView(groupingType: $viewModel.groupingType)
                    .padding(.horizontal)

                ScrollView {
                    VStack(spacing: 15) {
                        FinanceStatsSection(
                            title: L10n.income,
                            stats: FinanceStatsModel(items: viewModel.incomes)
                        )
                        .foregroundStyle(.green.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: viewModel.shadowColor(baseColor: .green, colorScheme: colorScheme), radius: 5, x: 0, y: 3)
                        
                        FinanceStatsSection(
                            title: L10n.expense,
                            stats: FinanceStatsModel(items: viewModel.expenses)
                        )
                        .foregroundStyle(.red.opacity(0.9))
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .shadow(color: viewModel.shadowColor(baseColor: .red, colorScheme: colorScheme), radius: 5, x: 0, y: 3)
                    }
                    .padding(.horizontal)
                }

            }
            .navigationTitle(L10n.statistics)
            .onAppear {
                viewModel.fetchData()
            }
        }
        .alert(item: $viewModel.alertItem) { alert in
            Alert(
                title: alert.title,
                message: alert.message,
                dismissButton: .default(Text(L10n.ok))
            )
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
    
    return ChartsView(modelContext: ctx)
        .modelContainer(container)
        .preferredColorScheme(.dark)
}

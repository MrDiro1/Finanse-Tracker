
import SwiftUI
import SwiftData



struct FinanseTabView: View {
    let modelContext: ModelContext
    
    var body: some View {
        TabView {
            FinansesListView(modelContext: modelContext)
                .tabItem {
                    Label(L10n.financeTab, systemImage: "banknote")
                }
            ChartsView(modelContext: modelContext)
                .tabItem {
                    Label(L10n.chartsTab, systemImage: "chart.line.uptrend.xyaxis")
                }
            SettingsView()
                .tabItem {
                    Label(L10n.settingsTab, systemImage: "gearshape.fill")
                }
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FinanceItem.self, configurations: config)

    let ctx = container.mainContext
    ctx.insert(FinanceItem(amount: 1200, category: "Salary", type: .income, note: "October"))
    ctx.insert(FinanceItem(amount: 25.5, category: "Food", type: .expense, note: "Lunch"))
    ctx.insert(FinanceItem(amount: 60, category: "Transport", type: .expense))
    ctx.insert(FinanceItem(amount: 150, category: "Shopping", type: .expense, note: "Clothes"))
    ctx.insert(FinanceItem(amount: 500, category: "Freelance", type: .income, note: "Project"))

    return FinanseTabView(modelContext: ctx)
        .modelContainer(container)
        .preferredColorScheme(.dark)
}



import SwiftUI
import SwiftData

struct AddFinanseCellView: View {
    @State private var viewModel: ViewModel
    @Environment(\.dismiss) var dismiss
    @StateObject private var storage = CategoriesStorage.shared
    
    var body: some View {
        NavigationStack {
            Form {
                Picker(L10n.type, selection: $viewModel.type) {
                    Text(L10n.income).tag(FinanceType.income)
                    Text(L10n.expense).tag(FinanceType.expense)
                }
                .pickerStyle(SegmentedPickerStyle())
                
                HStack {
                    Text(L10n.amount)
                    if viewModel.amount.isEmpty {
                        Text("*").foregroundColor(.red)
                    }
                    Spacer()
                    TextField(L10n.enterAmount, text: $viewModel.amount)
                        .keyboardType(.decimalPad)
                        .multilineTextAlignment(.trailing)
                }
                
                HStack {
                    Text(L10n.category)
                    if viewModel.category.isEmpty {
                        Text("*").foregroundColor(.red)
                    }
                    Spacer()
                    Picker("", selection: $viewModel.category) {
                        ForEach(viewModel.type == .expense ? storage.categoriesExpense : storage.categoriesIncome, id: \.self) { cat in
                            Text(cat)
                        }
                    }
                    .pickerStyle(MenuPickerStyle())
                }
                
                DatePicker(L10n.date, selection: $viewModel.date, displayedComponents: .date)
                
                TextField(L10n.smallNote, text: $viewModel.note)
                    .onChange(of: viewModel.note) { _, newValue in
                        if newValue.count > 24 {
                            viewModel.note = String(newValue.prefix(24))
                        }
                    }
            }
            .navigationTitle(L10n.createEntry)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(L10n.save) {
                        viewModel.saveFinanceItem()
                        dismiss()
                    }
                    .disabled(!viewModel.canSave)
                }
            }
            .alert(item: $viewModel.alertItem) { alert in
                Alert(title: alert.title, message: alert.message, dismissButton: .default(Text(L10n.ok)))
            }
        }
    }
    
    init(modelContext: ModelContext, itemToEdit: FinanceItem? = nil, onSave: @escaping () -> Void) {
        let service = FinanceService(modelContext: modelContext)
        let viewModel = ViewModel(
            service: service,
            onSave: onSave,
            amount: itemToEdit != nil ? String(itemToEdit!.amount) : "",
            category: itemToEdit?.category ?? "",
            type: itemToEdit?.type ?? .expense,
            date: itemToEdit?.date ?? .now,
            note: itemToEdit?.note ?? ""
        )
        viewModel.itemToEdit = itemToEdit
        _viewModel = State(initialValue: viewModel)
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: FinanceItem.self, configurations: config)

    let ctx = container.mainContext
    
    return AddFinanseCellView(modelContext: ctx, onSave: {  })
        .modelContainer(container)
        .preferredColorScheme(.dark)
}

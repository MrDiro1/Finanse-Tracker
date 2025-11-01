//
//  CategoriesView.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 31.10.2025.
//


import SwiftUI

struct CategoriesView: View {
    @State private var vm = ViewModel()
    
    var body: some View {
        NavigationStack {
            Form {
                Picker(L10n.type, selection: $vm.type) {
                    Text(L10n.income).tag(FinanceType.income)
                    Text(L10n.expense).tag(FinanceType.expense)
                }
                .pickerStyle(.segmented)
                
                Section {
                    Button {
                        withAnimation {
                            vm.toggleAddMode()
                        }
                    } label: {
                        HStack {
                            Image(systemName: vm.isAddingCategory ? "minus.circle" : "plus.circle")
                            Text(vm.isAddingCategory ? L10n.cancel : L10n.addCategory)
                        }
                    }
                    
                    if vm.isAddingCategory {
                        HStack {
                            TextField(L10n.enterCategory, text: $vm.newCategory)
                            Button(L10n.add) {
                                vm.addCategory()
                            }
                            .disabled(vm.newCategory.isEmpty)
                        }
                    }
                }
                
                Section {
                    ForEach(vm.currentCategories, id: \.self) { cat in
                        Text(cat)
                    }
                    .onDelete(perform: vm.deleteCategory)
                }
            }
            .navigationTitle(L10n.categories)
            .toolbar { EditButton() }
        }
    }
}

#Preview {
    CategoriesView()
}


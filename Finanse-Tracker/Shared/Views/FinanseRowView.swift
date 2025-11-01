//
//  FinanseRowView.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 28.10.2025.
//

import SwiftUI

struct FinanceRowView: View {
    let item: FinanceItem
    let colorScheme: ColorScheme
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.category)
                    .font(.body)
                if let note = item.note {
                    Text(note)
                        .font(.caption)
                        .foregroundStyle(colorScheme == .dark ? .secondary : .primary)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                Text("\(item.type == .income ? "+" : "-")\(item.amount, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))")
                    .foregroundStyle(item.type == .income ? .green : .red)
                    .font(.body.weight(.semibold))
                Text(item.date.formatted(date: .abbreviated, time: .omitted))
                    .font(.caption2)
                    .foregroundStyle(.secondary)
            }
        }
        .listRowBackground(colorScheme == .dark ? Color(.systemGray5) : Color(.systemGray6))
    }
}

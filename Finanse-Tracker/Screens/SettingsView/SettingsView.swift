//
//  SettingsView.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 26.10.2025.
//

import SwiftUI

struct SettingsView: View {
    @AppStorage("isDarkThemeEnabled") private var isDarkThemeEnabled = true
    
    var body: some View {
        NavigationStack {
            Form {
                Toggle(L10n.darkTheme, isOn: $isDarkThemeEnabled)
                Button {
                    if let url = URL(string: UIApplication.openSettingsURLString),
                       UIApplication.shared.canOpenURL(url) {
                        UIApplication.shared.open(url)
                    }
                } label: {
                    HStack {
                        Text(L10n.changeLanguage)
                            .foregroundStyle(.primary)
                        Spacer()
                        Image(systemName: "chevron.right")
                            .foregroundColor(.gray)
                    }
                }
                .buttonStyle(.plain)
                NavigationLink(destination: CategoriesView()) {
                    HStack {
                        Text(L10n.categories)
                            .foregroundStyle(.primary)
                    }
                }
                .buttonStyle(.plain)
            }
            .navigationTitle(L10n.settingsTab)
        }
    }
}

#Preview {
    SettingsView()
}

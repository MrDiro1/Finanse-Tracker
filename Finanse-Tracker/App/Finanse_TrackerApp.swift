//
//  Finanse_TrackerApp.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 25.10.2025.
//

import SwiftUI
import SwiftData

@main
struct Finanse_TrackerApp: App {
    let modelContainer: ModelContainer
    @AppStorage("isDarkThemeEnabled") private var isDarkThemeEnabled = true
    
    init() {
        do {
            modelContainer = try ModelContainer(for: FinanceItem.self)
        } catch {
            fatalError("Could not initialize ModelContainer")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            FinanseTabView(modelContext: modelContainer.mainContext)
                .preferredColorScheme(isDarkThemeEnabled ? .dark : .light)
        }
    }
}

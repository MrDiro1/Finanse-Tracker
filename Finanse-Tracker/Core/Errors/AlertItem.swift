//
//  AlertItem.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 27.10.2025.
//

import SwiftUI
import Foundation

struct AlertItem: Identifiable {
    let id = UUID()
    let title: Text
    let message: Text
}

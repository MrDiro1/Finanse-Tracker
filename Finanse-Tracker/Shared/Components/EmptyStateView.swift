//
//  EmptyStateView.swift
//  Finanse-Tracker
//
//  Created by Володимир Гончарук on 30.10.2025.
//

import SwiftUI

struct EmptyStateView: View {
    enum WhichData {
        case search
        case nodata
    }
    
    var content: WhichData
    
    var body: some View {
        VStack(spacing: 5) {
            Image(content == .nodata ? "noData" : "search")
                .resizable()
                .scaledToFit()
                .frame(width: 128, height: 128)
            
            Text(content == .nodata
                 ? L10n.emptyNoDataTitle
                 : L10n.emptyNoResultsTitle)
                .font(.title)
            
            Text(content == .nodata
                 ? L10n.emptyNoDataSubtitle
                 : L10n.emptyNoResultsSubtitle)
                .foregroundStyle(.secondary)
        }
        .multilineTextAlignment(.center)
    }
}


#Preview {
    EmptyStateView(content: .nodata)
        .preferredColorScheme(.dark)
}

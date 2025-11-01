

import SwiftUI
import Foundation

enum FinanceError: LocalizedError {
    case fetchFailed
    case saveFailed
    case deleteFailed
    case unknown(Error)
    
    var alertItem: AlertItem {
        switch self {
        case .fetchFailed:
            return AlertItem(
                title: Text(L10n.fetchErrorTitle),
                message: Text(L10n.fetchErrorMessage)
            )
            
        case .saveFailed:
            return AlertItem(
                title: Text(L10n.saveErrorTitle),
                message: Text(L10n.saveErrorMessage)
            )
            
        case .deleteFailed:
            return AlertItem(
                title: Text(L10n.deleteErrorTitle),
                message: Text(L10n.deleteErrorMessage)
            )
            
        case .unknown(let error):
            return AlertItem(
                title: Text(L10n.unknownErrorTitle),
                message: Text("\(L10n.unknownErrorMessage) \(error.localizedDescription)")
            )
        }
    }
}


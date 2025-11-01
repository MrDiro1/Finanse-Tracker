
import SwiftData
import Foundation

class FinanceService {
    let modelContext: ModelContext
    
    init(modelContext: ModelContext) {
        self.modelContext = modelContext
    }
    
    
    func fetchAll() throws -> [FinanceItem] {
        let descriptor = FetchDescriptor<FinanceItem>(sortBy: [SortDescriptor(\.date, order: .reverse)])
        return try modelContext.fetch(descriptor)
    }
    
    func add(_ item: FinanceItem) throws {
        modelContext.insert(item)
        try modelContext.save()
    }
    
    func delete(_ item: FinanceItem) throws {
        modelContext.delete(item)
        try modelContext.save()
    }
}

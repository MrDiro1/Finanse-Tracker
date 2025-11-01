
import Foundation

struct DateGrouping {
    private static func startOfPeriod(for date: Date, groupingType: GroupingType, calendar: Calendar = .current) -> Date {
        switch groupingType {
        case .day:
            return calendar.startOfDay(for: date)
        case .month:
            let comps = calendar.dateComponents([.year, .month], from: date)
            return calendar.date(from: comps) ?? date
        case .year:
            let comps = calendar.dateComponents([.year], from: date)
            return calendar.date(from: comps) ?? date
        }
    }
    
    private static var dayFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateStyle = .medium
        f.timeStyle = .none
        f.locale = .current
        return f
    }()
    
    private static var monthFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "LLLL yyyy"
        f.locale = .current
        return f
    }()
    
    private static var yearFormatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyy"
        f.locale = .current
        return f
    }()
    
    private static func string(from date: Date, groupingType: GroupingType) -> String {
        switch groupingType {
        case .day:
            return dayFormatter.string(from: date)
        case .month:
            return monthFormatter.string(from: date)
        case .year:
            return yearFormatter.string(from: date)
        }
    }
    
    static func groupedItems(from items: [FinanceItem], groupingType: GroupingType, calendar: Calendar = .current) -> [(key: String, items: [FinanceItem])] {

        let groupedByDate = Dictionary(grouping: items) { (item) -> Date in
            startOfPeriod(for: item.date, groupingType: groupingType, calendar: calendar)
        }
        
        let sortedKeys = groupedByDate.keys.sorted(by: { $0 > $1 })
        
        return sortedKeys.map { dateKey in
            let keyString = string(from: dateKey, groupingType: groupingType)
            let items = groupedByDate[dateKey] ?? []
            return (key: keyString, items: items)
        }
    }
}



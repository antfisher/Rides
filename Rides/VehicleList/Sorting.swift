//
//  Sorting.swift
//  Rides
//
//  Created by Anton Rybaiev on 2024-09-22.
//

import Foundation

enum SortingOrder: Hashable, CaseIterable {
    case ascending
    case descending
    
    var isAscending: Bool {
        switch self {
        case .ascending: return true
        case .descending: return false
        }
    }
    
    var comparison: ComparisonResult {
        switch self {
        case .ascending: return .orderedAscending
        case .descending: return .orderedDescending
        }
    }
}

enum SortingParameter: String, CaseIterable {
    case vin = "VIN"
    case carType = "Type"
    
    var title: String {
        return String(localized: "\(rawValue)")
    }
}

struct Sorting: Equatable {
    var order: SortingOrder
    var parameter: SortingParameter
}

extension Sorting {
    static let `default`: Sorting = Sorting(order: .ascending, parameter: .vin)
}

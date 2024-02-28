import Foundation

/// Replacement for Apple proprietary SortDescriptor which is only availbale for iOS >= 15
public struct SortingDescriptor<Value> {
    var comparator: (Value, Value) -> ComparisonResult
    var order: SortingOrder
}

// MARK: - keyPath initialization

public extension SortingDescriptor {
    static func keyPath<T: Comparable>(_ keyPath: KeyPath<Value, T>, order: SortingOrder) -> Self {
        Self(
            comparator: { rootA, rootB in
                let valueA = rootA[keyPath: keyPath]
                let valueB = rootB[keyPath: keyPath]

                guard valueA != valueB else {
                    return .orderedSame
                }

                return valueA < valueB ? .orderedAscending : .orderedDescending
            },
            order: order
        )
    }
    
    static func keyPath(_ keyPath: KeyPath<Value, Bool>, order: SortingOrder) -> Self {
        Self(
            comparator: { rootA, rootB in
                let valueA = rootA[keyPath: keyPath]
                let valueB = rootB[keyPath: keyPath]
            
                guard valueA != valueB else {
                    return .orderedSame
                }
            
                return valueA ? .orderedDescending : .orderedAscending
            },
            order: order
        )
    }
    
    static func keyPath<T: Comparable>(_ keyPath: KeyPath<Value, T?>, order: SortingOrder) -> Self {
        Self(
            comparator: { rootA, rootB in
                let valueA = rootA[keyPath: keyPath]
                let valueB = rootB[keyPath: keyPath]
            
                switch (valueA, valueB) {
                case (.none, .none):
                    return .orderedSame
                case let (.some(valA), .some(valB)):
                    return valA < valB ? .orderedAscending : .orderedDescending
                case (.some, .none):
                    return .orderedDescending
                case (.none, .some):
                    return .orderedAscending
                
                }
            },
            order: order
        )
    }
}

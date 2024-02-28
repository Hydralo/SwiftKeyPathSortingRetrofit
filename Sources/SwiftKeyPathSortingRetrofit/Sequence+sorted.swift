import Foundation

public extension Sequence {
    func sorted(using descriptors: [SortingDescriptor<Element>]) -> [Element] {
        sorted { valueA, valueB in
            for descriptor in descriptors {
                let result = descriptor.comparator(valueA, valueB)

                switch result {
                case .orderedSame:
                    // Keep iterating if the two elements are equal,
                    // since that'll let the next descriptor determine
                    // the sort order:
                    break
                case .orderedAscending:
                    return descriptor.order == .ascending
                case .orderedDescending:
                    return descriptor.order == .descending
                }
            }

            // If no descriptor was able to determine the sort
            // order, we'll default to false (similar to when
            // using the '<' operator with the built-in API):
            return false
        }
    }
    
    func sorted(using descriptors: SortingDescriptor<Element>...) -> [Element] {
        sorted(using: descriptors)
    }
}

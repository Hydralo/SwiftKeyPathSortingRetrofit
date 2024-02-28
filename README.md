import Foundation

# Swift KeyPath Sorting Retrofit

A convenient extension for Sequence protocol that allows to sort [Element] in Swift-like manner. Is inspirited by SortDescriptor implementation for iOS >= 15 and [Swift by Sundell article](https://www.swiftbysundell.com/articles/sorting-swift-collections/).
If your minimal project target OS version is iOS >= 15 you should use Apple proprietary SortDescriptor.

[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)


## Example

```swift
struct SomeSortableStructure {
    let id: Int
    let isSelected: Bool
    let title: String
    let description: String?
}

struct SorterGuy {
    func sort(_ items: [SomeSortableStructure]) -> [SomeSortableStructure] {
        items.sorted(using: [
            .keyPath(\.title, order: .ascending),
            .keyPath(\.isSelected, order: .descending),
            .keyPath(\.description, order: .ascending),
            .keyPath(\.id, order: .ascending)
        ])
    }
}
```

## Installation
     
The implementation is quite compact so in most cases it can be just copied to the target project.

### Swift Package Manager

```swift
dependencies: [
    .package(url: "https://github.com/Hydralo/SwiftKeyPathSortingRetrofit.git")
]
```

## Requirements

* iOS 10+

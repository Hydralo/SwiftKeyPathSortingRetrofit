import Foundation

# Swift KeyPath Sorting Retrofit

A convenient extension to the Sequence protocol that allows you to sort elements in a Swift-like way. It is inspired by the SortDescriptor implementation in iOS >= 15, and the [Swift by Sundell article](https://www.swiftbysundell.com/articles/sorting-swift-collections/) on sorting Swift collections. If your minimum project target operating system version is iOS >= 15, you should use the Apple-proprietary SortDescriptor.

[![License: MIT](https://img.shields.io/badge/License-MIT-black.svg)](https://opensource.org/licenses/MIT)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FHydralo%2FSwiftKeyPathSortingRetrofit%2Fbadge%3Ftype%3Dswift-versions)](https://swiftpackageindex.com/Hydralo/SwiftKeyPathSortingRetrofit)
[![](https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2FHydralo%2FSwiftKeyPathSortingRetrofit%2Fbadge%3Ftype%3Dplatforms)](https://swiftpackageindex.com/Hydralo/SwiftKeyPathSortingRetrofit)

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

//
//  Array.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import Foundation

public extension Array {
    static func +=( lhs: inout Array, rhs: Element) {
        lhs.append(rhs)
    }
}

public extension Collection {
    func grouped<T>(by keyPath: KeyPath<Element, T>) -> [T: [Element]] {
        var groups = [T: [Element]]()
        forEach {
            let key = $0[keyPath: keyPath]
            if groups[key] == nil {
                groups[key] = [$0]
            } else {
                groups[key]?.append($0)
            }
        }
        return groups
    }
}


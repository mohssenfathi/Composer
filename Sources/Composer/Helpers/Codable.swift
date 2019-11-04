//
//  File.swift
//  
//
//  Created by Mohssen Fathi on 9/29/19.
//

import Foundation

public extension Encodable {
    func dictionaryValue() throws -> [String: Any] {
        let data = try JSONEncoder().encode(self)
        guard let dictionary = try JSONSerialization.jsonObject(with: data, options: .allowFragments) as? [String: Any] else {
          throw NSError()
        }
        return dictionary
    }
}


//
//  File.swift
//  
//
//  Created by Mohssen Fathi on 9/29/19.
//

import Foundation

public extension DateFormatter {
    
    static var mediumDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        formatter.locale = Locale(identifier: "en_US")
        return formatter
    }
}

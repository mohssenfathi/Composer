//
//  File.swift
//  
//
//  Created by Mohssen Fathi on 9/10/19.
//

import Foundation
import UIKit

open class StackViewModel: ViewModel {
    public var sections: [Section] = []
    
    public init(sections: [Section]) {
        self.sections = sections
    }
}

open class StackSection: Section {
    public var title: String?
    public var items: [Item]
    public var backgroundColor: UIColor = .clear
    
    public init(title: String? = nil, items: [Item], backgroundColor: UIColor = .clear) {
        self.title = title
        self.items = items
        self.backgroundColor = backgroundColor
    }
}

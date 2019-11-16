//
//  TableViewModel.swift
//  
//
//  Created by Mohssen Fathi on 10/22/19.
//

import UIKit

open class TableViewSection: Section {
    public var title: String?
    public var header: String?
    public var footer: String?
    public var items: [Item]
    public var backgroundColor: UIColor = .clear
    
    public init(title: String? = nil, header: String? = nil, footer: String? = nil, items: [Item], backgroundColor: UIColor = .clear) {
        self.title = title
        self.header = header
        self.footer = footer
        self.items = items
        self.backgroundColor = backgroundColor
    }
}

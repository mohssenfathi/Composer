//
//  CardItem.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import UIKit

public struct CardItem: Item {
    public let item: Item
    public let backgroundColor: UIColor
    public let isHighlightEnabled: Bool
    public let selectionHandler: (() -> ())?
    
    public init(item: Item, backgroundColor: UIColor = .white, isHighlightEnabled: Bool = false, selectionHandler: (() -> ())? = nil) {
        self.item = item
        self.backgroundColor = backgroundColor
        self.isHighlightEnabled = isHighlightEnabled
        self.selectionHandler = selectionHandler
    }
}

//
//  StaticViewItem.swift
//  
//
//  Created by Mohssen Fathi on 9/10/19.
//

import UIKit

public struct StaticViewItem: Item {
    public let view: UIView
    
    public init(view: UIView) {
        self.view = view
    }
}

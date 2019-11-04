//
//  DividerItem.swift
//  
//
//  Created by Mohssen Fathi on 9/27/19.
//

import UIKit

public struct DividerItem: Item {
    let dividerColor: UIColor
    public init(dividerColor: UIColor = UIColor.lightGray.withAlphaComponent(0.5)) {
        self.dividerColor = dividerColor
    }
}


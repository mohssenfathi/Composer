//
//  HorizontalScrollingItem.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import Foundation
import UIKit

public struct HorizontalScrollingItem: Item {
    public let items: [Item]
    public let isPageControlHidden: Bool
    public let isBounceEnabled: Bool
    public let isPagingEnabled: Bool
    public let isArrowNavigationEnabled: Bool
    public let pageSize: CGSize?
    public let pageLimit: Int?
    public let seeAllHandler: (() -> ())?
    
    public init(items: [Item], isPageControlHidden: Bool = false, isPagingEnabled: Bool = false, isBounceEnabled: Bool = true, isArrowNavigationEnabled: Bool = false, pageSize: CGSize? = nil, pageLimit: Int? = nil, seeAllHandler: (() -> ())? = nil) {
        self.items = items
        self.isPageControlHidden = isPageControlHidden
        self.isBounceEnabled = isBounceEnabled
        self.isPagingEnabled = isPagingEnabled
        self.isArrowNavigationEnabled = isArrowNavigationEnabled
        self.pageSize = pageSize
        self.pageLimit = pageLimit
        self.seeAllHandler = seeAllHandler
    }
}

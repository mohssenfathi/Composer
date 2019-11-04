//
//  WebViewItem.swift
//  
//
//  Created by Mohssen Fathi on 9/11/19.
//

import UIKit

public struct WebViewItem: Item {
    public let htmlString: String
    public let insets: UIEdgeInsets

    public init(htmlString: String, insets: UIEdgeInsets = .zero) {
        self.htmlString = htmlString
        self.insets = insets
    }
}



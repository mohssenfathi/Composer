//
//  AttributedTextItem.swift
//  
//
//  Created by Mohssen Fathi on 9/11/19.
//

import UIKit

public struct AttributedTextItem: Item {
    public let attributedText: NSAttributedString
    public let linkTextAttributes: [NSAttributedString.Key: Any]
    public let insets: UIEdgeInsets

    public init(attributedText: NSAttributedString, insets: UIEdgeInsets = .zero, linkTextAttributes: [NSAttributedString.Key: Any] = [:]) {
        self.attributedText = attributedText
        self.linkTextAttributes = linkTextAttributes
        self.insets = insets
    }
}


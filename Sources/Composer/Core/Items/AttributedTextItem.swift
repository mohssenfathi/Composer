//
//  AttributedTextItem.swift
//  
//
//  Created by Mohssen Fathi on 9/11/19.
//

import UIKit

public struct AttributedTextItem: Item {
    public let attributedText: NSAttributedString
    public let insets: UIEdgeInsets

    public init(attributedText: NSAttributedString, insets: UIEdgeInsets = .zero) {
        self.attributedText = attributedText
        self.insets = insets
    }
}


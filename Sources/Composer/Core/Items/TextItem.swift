//
//  TextItem.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import UIKit

public struct TextItem: Item {
    public let text: String
    public let style: ComposerStyle
    public let insets: UIEdgeInsets

    public init(text: String, style: ComposerStyle, insets: UIEdgeInsets = .zero) {
        self.text = text
        self.style = style
        self.insets = insets
    }
}

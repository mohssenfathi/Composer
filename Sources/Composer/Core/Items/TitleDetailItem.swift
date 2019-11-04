//
//  TitleDetailItem.swift
//  
//
//  Created by Mohssen Fathi on 9/10/19.
//

import UIKit

public struct TitleDetailItem: Item {
    public let title: String
    public let detail: String
    public let titleStyle: ComposerStyle
    public let detailStyle: ComposerStyle
    public let insets: UIEdgeInsets

    public init(title: String,
                detail: String,
                titleStyle: ComposerStyle,
                detailStyle: ComposerStyle,
                insets: UIEdgeInsets = .zero) {
        self.title = title
        self.detail = detail
        self.titleStyle = titleStyle
        self.detailStyle = detailStyle
        self.insets = insets
    }
}

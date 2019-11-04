//
//  File.swift
//  
//
//  Created by Mohssen Fathi on 9/20/19.
//

import UIKit

public struct StackViewItem: Item {
    public let items: [Item]
    public let spacing: CGFloat
    public let axis: NSLayoutConstraint.Axis
    public let distribution: UIStackView.Distribution
    public let insets: UIEdgeInsets
    
    public init(items: [Item],
                spacing: CGFloat = 0.0,
                axis: NSLayoutConstraint.Axis = .vertical,
                distribution: UIStackView.Distribution = .fill,
                insets: UIEdgeInsets = .zero) {
        self.items = items
        self.spacing = spacing
        self.axis = axis
        self.distribution = distribution
        self.insets = insets
    }
}

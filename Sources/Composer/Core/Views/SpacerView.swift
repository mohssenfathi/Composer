//
//  SpacerView.swift
//  BabyPlayHacks
//
//  Created by Mohssen Fathi on 8/19/19.
//

import UIKit

public class SpacerView: BaseView, ItemConfigurableView {
    public func configure(with item: SpacerItem) -> Self {
        backgroundColor = .clear
        heightAnchor.constraint(equalToConstant: item.height).isActive = true
        return self
    }
}

public struct SpacerItem: Item {
    public let height: CGFloat
    public init(height: CGFloat) {
        self.height = height
    }
}

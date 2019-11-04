//
//  TitleView.swift
//  BabyPlayHacks
//
//  Created by Mohssen Fathi on 8/15/19.
//

import UIKit

public class TextView: BaseView, ItemConfigurableView {
    private let titleLabel = UILabel()
    private var insets: UIEdgeInsets = .zero
    private var titleLabelConstraints: ConstraintSet?

    override public func layoutConstraints() {
        super.layoutConstraints()
        titleLabelConstraints = titleLabel.embed(in: self, insets: insets)
    }
    
    public func configure(with item: TextItem) -> Self {
        insets = item.insets
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        
        titleLabel.attributedText = NSAttributedString(
            string: item.text,
            style: item.style
        )
        
        titleLabelConstraints?.top.constant = insets.top
        titleLabelConstraints?.left.constant = insets.left
        titleLabelConstraints?.right.constant = -insets.right
        titleLabelConstraints?.bottom.constant = -insets.bottom
        
        return self
    }
}

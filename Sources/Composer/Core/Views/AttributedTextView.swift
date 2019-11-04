//
//  AttributedTextView.swift
//  
//
//  Created by Mohssen Fathi on 9/11/19.
//

import UIKit

class AttributedTextView: BaseView, ItemConfigurableView {
    private let titleLabel = UILabel()
    private var insets: UIEdgeInsets = .zero
    private var titleLabelConstraints: ConstraintSet?

    override func layoutConstraints() {
        super.layoutConstraints()
        titleLabelConstraints = titleLabel.embed(in: self, insets: insets)
    }
    
    func configure(with item: AttributedTextItem) -> Self {
        insets = item.insets
        
        titleLabel.numberOfLines = 0
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.attributedText = item.attributedText
        
        titleLabelConstraints?.top.constant = insets.top
        titleLabelConstraints?.left.constant = insets.left
        titleLabelConstraints?.right.constant = -insets.right
        titleLabelConstraints?.bottom.constant = -insets.bottom
        
        return self
    }
}

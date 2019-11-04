//
//  StackView.swift
//  
//
//  Created by Mohssen Fathi on 9/20/19.
//

import UIKit

class StackView: BaseView, ItemConfigurableView {
    private let stackView = UIStackView()
    private var insets: UIEdgeInsets = .zero
    private var stackViewConstraints: ConstraintSet?

    override func layoutConstraints() {
        super.layoutConstraints()
        stackViewConstraints = stackView.embed(in: self, insets: insets)
    }
    
    func configure(with item: StackViewItem) -> Self {
        return configure(with: item, views: [])
    }
    
    @discardableResult
    func configure(with item: StackViewItem, views: [UIView]) -> Self {
        insets = item.insets
        
        stackView.distribution = item.distribution
        stackView.axis = item.axis
        stackView.spacing = item.spacing
        
        stackView.removeAll()
        views.forEach { stackView.addArrangedSubview($0) }
        
        stackViewConstraints?.top.constant = insets.top
        stackViewConstraints?.left.constant = insets.left
        stackViewConstraints?.right.constant = -insets.right
        stackViewConstraints?.bottom.constant = -insets.bottom
        
        return self
    }
}

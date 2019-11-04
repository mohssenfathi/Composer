//
//  DividerView.swift
//  
//
//  Created by Mohssen Fathi on 9/27/19.
//

import UIKit

public class DividerView: BaseView, ItemConfigurableView {
    private let divider = Divider()
    private var insets: UIEdgeInsets = .zero
    private var dividerConstraints: ConstraintSet?

    override public func layoutConstraints() {
        super.layoutConstraints()
        dividerConstraints = divider.embed(in: self, insets: insets)
    }
    
    public func configure(with item: DividerItem) -> Self {
        divider.backgroundColor = item.dividerColor
        
        dividerConstraints?.top.constant = insets.top
        dividerConstraints?.left.constant = insets.left
        dividerConstraints?.right.constant = -insets.right
        dividerConstraints?.bottom.constant = -insets.bottom
        
        return self
    }
}

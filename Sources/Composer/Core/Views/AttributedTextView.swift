//
//  AttributedTextView.swift
//  
//
//  Created by Mohssen Fathi on 9/11/19.
//

import UIKit

class AttributedTextView: BaseView, ItemConfigurableView {
    private let textView = UITextView()
    private var insets: UIEdgeInsets = .zero
    private var textViewConstraints: ConstraintSet?

    override func layoutConstraints() {
        super.layoutConstraints()
        textViewConstraints = textView.embed(in: self, insets: insets)
    }
    
    func configure(with item: AttributedTextItem) -> Self {
        insets = item.insets
        
        textView.backgroundColor = .clear
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.textContainerInset = .zero
        textView.textContainer.lineFragmentPadding = 0.0
        textView.attributedText = item.attributedText
        textView.linkTextAttributes = item.linkTextAttributes
        
        textViewConstraints?.top.constant = insets.top
        textViewConstraints?.left.constant = insets.left
        textViewConstraints?.right.constant = -insets.right
        textViewConstraints?.bottom.constant = -insets.bottom
        
        return self
    }
}

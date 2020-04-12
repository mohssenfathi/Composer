//
//  ImageView.swift
//  
//
//  Created by Mohammad Fathi on 4/12/20.
//

import UIKit

public class ImageView: BaseView, ItemConfigurableView {
    private let imageView = UIImageView()
    private var insets: UIEdgeInsets = .zero
    private var imageViewInsets: ConstraintSet?

    override public func layoutConstraints() {
        super.layoutConstraints()
        imageViewInsets = imageView.embed(in: self, insets: insets)
    }
    
    public func configure(with item: ImageItem) -> Self {
        imageView.image = item.image
        imageView.contentMode = item.contentMode
        
        imageViewInsets?.top.constant = insets.top
        imageViewInsets?.left.constant = insets.left
        imageViewInsets?.right.constant = -insets.right
        imageViewInsets?.bottom.constant = -insets.bottom
        
        return self
    }
}

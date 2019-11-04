//
//  TitleDetailView.swift
//  
//
//  Created by Mohssen Fathi on 9/10/19.
//

import UIKit

class TitleDetailView: BaseView, ItemConfigurableView {
    typealias Item = TitleDetailItem
    
    private let titleLabel = UILabel()
    private let detailLabel = UILabel()
    private let stackView = UIStackView()
    private var insets: UIEdgeInsets = .zero
    private var stackViewConstraints: ConstraintSet?
    
    override func setup() {
        super.setup()
        
        stackView.axis = .horizontal
        stackView.spacing = 8.0
        stackViewConstraints = stackView.embed(in: self, insets: insets)
        
        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(detailLabel)
        
        [titleLabel, detailLabel].forEach {
            $0.numberOfLines = 0
            $0.lineBreakMode = .byWordWrapping
        }
    }

    
    func configure(with item: TitleDetailItem) -> Self {
        insets = item.insets
    
        titleLabel.attributedText = NSAttributedString(
            string: item.title,
            style: item.titleStyle
        )
        
        detailLabel.attributedText = NSAttributedString(
            string: item.detail,
            style: item.detailStyle
        )
        
        stackViewConstraints?.top.constant = insets.top
        stackViewConstraints?.left.constant = insets.left
        stackViewConstraints?.right.constant = -insets.right
        stackViewConstraints?.bottom.constant = -insets.bottom
        
        return self
    }
}


//
//  CollectionViewCell.swift
//  BabyPlayHacks
//
//  Created by Mohssen Fathi on 10/7/19.
//  Copyright © 2019 Mohssen Fathi. All rights reserved.
//

import UIKit

public class CollectionViewCell<V: UIView & ItemConfigurableView>: UICollectionViewCell, ItemConfigurableView {
    
    static var identifier: String {
        return "\(V.identifier)Cell"
    }
    
    override public var reuseIdentifier: String? {
        return "\(V.identifier)Cell"
    }
    
    public var view: V { return v }
    
    private let v = V()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    public override func didAddSubview(_ subview: UIView) {
        super.didAddSubview(subview)
    }
    
    func setup() {
        v.embed(in: contentView)
        v.setNeedsLayout()
        v.layoutIfNeeded()
    }
    
    @discardableResult
    public func configure(with item: V.Item) -> Self {
        v.configure(with: item)
        return self
    }
}

public class CardCollectionViewCell<V: UIView & ItemConfigurableView>: UICollectionViewCell, ItemConfigurableView {
    
    let v = V()
    let cardView = CardContainerView()
    
    static var identifier: String {
        return "\(V.identifier)CardCell"
    }
    
    override public var reuseIdentifier: String? {
        return "\(V.identifier)CardCell"
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        v.translatesAutoresizingMaskIntoConstraints = false
        cardView.translatesAutoresizingMaskIntoConstraints = false
        cardView.embed(in: contentView, insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    public func configure(with item: Item) -> Self {
        if let it = item as? V.Item {
            v.configure(with: it)
        }
        cardView.configure(with: CardItem(item: item), subview: v)
        return self
    }
}



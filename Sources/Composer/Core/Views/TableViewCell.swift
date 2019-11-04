//
//  TableViewCell.swift
//  
//
//  Created by Mohssen Fathi on 10/11/19.
//

import UIKit

public class TableViewCell<V: UIView & ItemConfigurableView>: UITableViewCell, ItemConfigurableView {
    
    static var identifier: String {
        return "\(V.identifier)Cell"
    }
    
    override public var reuseIdentifier: String? {
        return "\(V.identifier)Cell"
    }
    
    public var view: V { return v }
    
    private let v = V()
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setup()
    }
    
    func setup() {
        v.embed(in: self, safeArea: true)
    }
    
    @discardableResult
    public func configure(with item: V.Item) -> Self {
        v.configure(with: item)
        return self
    }
}

public class CardTableViewCell<V: UIView & ItemConfigurableView>: UITableViewCell, ItemConfigurableView {
    
    let v = V()
    let cardView = CardContainerView()
    
    static var identifier: String {
        return "\(V.identifier)CardCell"
    }
    
    override public var reuseIdentifier: String? {
        return "\(V.identifier)CardCell"
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        cardView.embed(in: self, insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    @discardableResult
    public func configure(with item: Item) -> Self {
        if let it = item as? V.Item {
            v.configure(with: it)
        }
        cardView.configure(with: CardItem(item: item), subview: v)
        return self
    }
}


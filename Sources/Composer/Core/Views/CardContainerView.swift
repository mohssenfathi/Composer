//
//  CardContainerView.swift
//  
//
//  Created by Mohssen Fathi on 9/10/19.
//

import UIKit

public class CardContainerView: BaseView, ItemConfigurableView {
    
    var isHighlightEnabled: Bool = true
    private var selectionHandler: (() -> ())?
    private let shadowView = UIView()
    private let cardView = UIView()

    deinit {
        selectionHandler = nil
    }
    
    override public func setup() {
        super.setup()
    
        clipsToBounds = false
        layer.masksToBounds = false
        
        cardView.layer.masksToBounds = true
        cardView.layer.cornerRadius = 8.0
        cardView.layer.borderWidth = 0.25
        cardView.layer.borderColor = UIColor.lightGray.withAlphaComponent(0.25).cgColor
        
        shadowView.backgroundColor = UIColor.white
        shadowView.clipsToBounds = false
        shadowView.layer.masksToBounds = false
        shadowView.layer.shadowRadius = 6.0
        shadowView.layer.shadowOffset = CGSize(width: 0, height: 4.0)
        shadowView.layer.shadowOpacity = 0.16
        shadowView.layer.shadowColor = UIColor.black.cgColor
        shadowView.layer.shouldRasterize = true
        shadowView.layer.rasterizationScale = UIScreen.main.scale
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        shadowView.layer.shadowPath = UIBezierPath(rect: shadowView.bounds).cgPath
    }
    
    override public func layoutConstraints() {
        super.layoutConstraints()
        
        shadowView.embed(in: self, insets: UIEdgeInsets(top: 20, left: 20, bottom: 20, right: 20))
        cardView.embed(in: self, insets: UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16))
    }
    
    @discardableResult
    public func configure(with item: CardItem) -> Self {
        return configure(with: item, subview: UIView())
    }
    
    @discardableResult
    func configure(with item: CardItem, subview: UIView) -> Self {
        self.selectionHandler = item.selectionHandler
        self.isHighlightEnabled = item.isHighlightEnabled
        cardView.backgroundColor = item.backgroundColor
        cardView.subviews.forEach { $0.removeFromSuperview() }
        subview.embed(in: cardView)
        return self
    }
    
    func setHighlighted(_ isHighlighted: Bool, animated: Bool = true, completion: ((Bool) -> ())? = nil) {
        UIView.animate(withDuration: 0.5, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 0.7, options: [], animations: { [weak self] in
            self?.transform = isHighlighted ? CGAffineTransform(scaleX: 0.97, y: 0.97) : .identity
        }, completion: completion)
    }
}

extension CardContainerView {
    
    override public func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        guard isHighlightEnabled else { return }
        setHighlighted(true)
    }
    
    override public func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesCancelled(touches, with: event)
        guard isHighlightEnabled else { return }
        setHighlighted(false)
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        guard isHighlightEnabled else { return }
        setHighlighted(false)
        selectionHandler?()
    }
    
}

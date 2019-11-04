//
//  ButtonView.swift
//  
//
//  Created by Mohssen Fathi on 9/16/19.
//

import UIKit

public class ButtonView<Button: UIButton>: BaseView, ItemConfigurableView {
    public var button: Button?
    private var selectionHandler: ((Button) -> ())?

    deinit {
        selectionHandler = nil
    }
    
//    public override func layoutConstraints() {
//        super.layoutConstraints()
//        button.center(in: self)
//        button.topAnchor.constraint(equalTo: topAnchor, constant: 12.0).isActive = true
//        button.addTarget(self, action: #selector(buttonSelected(_:)), for: .touchUpInside)
//    }
    
    @discardableResult
    public func configure(with button: Button, item: ButtonItem<Button>) -> Self {
        self.button?.removeFromSuperview()
        self.button = button
        button.center(in: self)
        button.topAnchor.constraint(equalTo: topAnchor, constant: 12.0).isActive = true
        button.addTarget(self, action: #selector(buttonSelected(_:)), for: .touchUpInside)
        
        return configure(with: item)
    }
    
    public func configure(with item: ButtonItem<Button>) -> Self {
        item.configurationHandler(button ?? Button())
        selectionHandler = item.selectionHandler
        
        return self
    }
    
    @objc func buttonSelected(_ sender: UIButton) {
        guard let button = sender as? Button else { return }
        selectionHandler?(button)
    }
}

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
        
    @discardableResult
    public func configure(with button: Button, item: ButtonItem<Button>) -> Self {
        self.button?.removeFromSuperview()
        self.button = button

        button.embed(in: self)
        button.addTarget(self, action: #selector(buttonSelected(_:)), for: .touchUpInside)
        
        return configure(with: item)
    }
    
    public func configure(with item: ButtonItem<Button>) -> Self {
        let button = self.button ?? Button()
        
        item.configurationHandler(button)
        selectionHandler = item.selectionHandler
        
        button.embed(in: self)
        button.addTarget(self, action: #selector(buttonSelected(_:)), for: .touchUpInside)
        
        return self
    }
    
    @objc func buttonSelected(_ sender: UIButton) {
        guard let button = sender as? Button else { return }
        selectionHandler?(button)
    }
}

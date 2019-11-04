//
//  ButtonItem.swift
//  
//
//  Created by Mohssen Fathi on 9/16/19.
//

import Foundation
import UIKit

public class ButtonItem<Button: UIButton>: Item {
    public let configurationHandler: ((Button) -> ())
    public let selectionHandler: ((Button) -> ())
    
    public init(configurationHandler: @escaping ((Button) -> ()),
                selectionHandler: @escaping ((Button) -> ())) {
        self.configurationHandler = configurationHandler
        self.selectionHandler = selectionHandler
    }
}

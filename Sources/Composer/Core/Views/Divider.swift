//
//  Divider.swift
//  BabyPlayHacks
//
//  Created by Mohssen Fathi on 8/15/19.
//

import UIKit

public class Divider: BaseView {
    let width: CGFloat
    
    public init(width: CGFloat = 0.5) {
        self.width = width
        super.init(frame: .zero)
    }
    
    public required init?(coder aDecoder: NSCoder) {
        self.width = 0.5
        super.init(coder: aDecoder)
    }
    
    override public func setup() {
        super.setup()
        backgroundColor = UIColor.lightGray.withAlphaComponent(0.5)
    }
    
    override public func layoutConstraints() {
        super.layoutConstraints()
        heightAnchor.constraint(equalToConstant: width).isActive = true
    }
}

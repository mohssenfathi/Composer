//
//  BaseView.swift
//  BabyPlayHacks
//
//  Created by Mohssen Fathi on 8/12/19.
//

import UIKit

open class BaseView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        layoutConstraints()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        layoutConstraints()
    }
    
    open func setup() { }
    open func layoutConstraints() { }
}

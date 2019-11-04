//
//  UIStackView.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import UIKit

public extension UIStackView {
    func removeAll() {
        arrangedSubviews.forEach {
            removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
    }
}


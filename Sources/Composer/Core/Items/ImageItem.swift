//
//  ImageItem.swift
//  
//
//  Created by Mohammad Fathi on 4/12/20.
//

import UIKit

public struct ImageItem: Item {
    let image: UIImage
    let contentMode: UIView.ContentMode
    let insets: UIEdgeInsets
    
    public init(image: UIImage, contentMode: UIView.ContentMode = .center, insets: UIEdgeInsets = .zero) {
        self.image = image
        self.contentMode = contentMode
        self.insets = insets
    }
}



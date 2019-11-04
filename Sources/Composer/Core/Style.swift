//
//  Style.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import UIKit

public enum ComposerStyle {
    
    case font(weight: UIFont.Weight, size: CGFloat, color: UIColor)
    case detailedFont(weight: UIFont.Weight, size: CGFloat, color: UIColor, alignment: NSTextAlignment, lineHeight: CGFloat, kern: CGFloat)
    case customFont(font: UIFont, color: UIColor, alignment: NSTextAlignment, lineHeight: CGFloat, kern: CGFloat)
    
    public var attributes: [NSAttributedString.Key: Any] {
        switch self {
            
        case .font(let weight, let size, let color):
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: size, weight: weight),
                .foregroundColor: color,
            ]
            return textAttributes
            
        case .detailedFont(let weight, let size, let color, let alignment, let lineHeight, let kern):
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
            paragraphStyle.alignment = alignment
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: UIFont.systemFont(ofSize: size, weight: weight),
                .kern: kern,
                .foregroundColor: color,
                .paragraphStyle: paragraphStyle
                ]
            return textAttributes
            
        case .customFont(let font, let color, let alignment, let lineHeight, let kern):
            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.minimumLineHeight = lineHeight
            paragraphStyle.maximumLineHeight = lineHeight
            paragraphStyle.alignment = alignment
            let textAttributes: [NSAttributedString.Key: Any] = [
                .font: font,
                .kern: kern,
                .foregroundColor: color,
                .paragraphStyle: paragraphStyle
                ]
            return textAttributes
        }
    }
}

extension ComposerStyle {
    public static let `default`: ComposerStyle = .font(weight: .regular, size: 12.0, color: .black)
}

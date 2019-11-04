//
//  NSAttributedString.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import Foundation

extension NSAttributedString {
    public convenience init(string: String, style: ComposerStyle) {
        self.init(string: string, attributes: style.attributes)
    }
    
    public convenience init?(htmlString: String, style: ComposerStyle) {
        self.init(htmlString: htmlString, attributes: style.attributes)
    }
    
    public convenience init?(htmlString: String, attributes: [NSAttributedString.Key: Any] = [:]) {
        
        guard let str = try? NSMutableAttributedString(data: Data(htmlString.utf8), options: [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ], documentAttributes: nil) else {
            return nil
        }
        
        str.addAttributes(attributes, range: NSRange(location: 0, length: str.length))
        
        self.init(attributedString: str)
    }
}

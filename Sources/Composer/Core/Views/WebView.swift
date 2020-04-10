//
//  File.swift
//  
//
//  Created by Mohssen Fathi on 9/11/19.
//

import UIKit
#if !targetEnvironment(macCatalyst)
import WebKit
#endif

class WebView: BaseView, ItemConfigurableView {
    private let webView = WKWebView()
    private var insets: UIEdgeInsets = .zero
    private var webViewConstraints: ConstraintSet?

    override func layoutConstraints() {
        super.layoutConstraints()
        webViewConstraints = webView.embed(in: self, insets: insets)
    }
    
    func configure(with item: WebViewItem) -> Self {
        insets = item.insets
        
        webView.loadHTMLString(item.htmlString, baseURL: nil)
        
        webViewConstraints?.top.constant = insets.top
        webViewConstraints?.left.constant = insets.left
        webViewConstraints?.right.constant = -insets.right
        webViewConstraints?.bottom.constant = -insets.bottom
        
        return self
    }
}

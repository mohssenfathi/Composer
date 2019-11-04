//
//  DataSource.swift
//  
//
//  Created by Mohssen Fathi on 9/10/19.
//

import Foundation
import UIKit

public protocol DataSource {
    associatedtype ViewModel
    var viewModel: ViewModel { get }
    
    func view(for item: Item) -> UIView?
}

open class BaseDataSource<VM>: NSObject, DataSource {
    public var viewModel: VM
    
    public init(viewModel: VM) {
        self.viewModel = viewModel
    }
    
    /// Provides default corresponding views for each item in the view model
    /// Subclasses may override to handle additional rows
    ///
    /// - Parameter item: A item contained in the view model
    /// - Returns: Any UIView corresponging to the provided item
    open func view(for item: Item) -> UIView? {
        
        switch item {
            
        case let item as AttributedTextItem:
            return AttributedTextView().configure(with: item)
            
        case let item as ButtonItem<UIButton>:
            return ButtonView().configure(with: UIButton(type: .system), item: item)
            
        // Recursively calls view(for:) with the nested item
        case let item as CardItem:
            guard let subview = view(for: item.item) else { return nil }
            return CardContainerView().configure(with: item, subview: subview)
            
        case let item as DividerItem:
            return DividerView().configure(with: item)
            
        case let item as HorizontalScrollingItem:
            let pages = item.items.compactMap { view(for: $0) }
            return HorizontalScrollingView().configure(with: item, pages: pages)
            
        case let item as TextItem:
            return TextView().configure(with: item)
            
        case let item as TitleDetailItem:
            return TitleDetailView().configure(with: item)
            
        case let item as SpacerItem:
            return SpacerView().configure(with: item)
            
        case let item as StackViewItem:
            let views = item.items.compactMap { view(for: $0) }
            return StackView().configure(with: item, views: views)
            
        case let item as StaticViewItem:
            return item.view
            
        case let item as WebViewItem:
            return WebView().configure(with: item)
            
        default:
            return nil
        }
    }
    
    open func itemConfigurableView<V: UIView & ItemConfigurableView>(for item: Item) -> V? {
        return view(for: item) as? V
    }
}

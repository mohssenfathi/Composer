//
//  StackViewDataSource.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import UIKit

open class StackViewDataSource: BaseDataSource<ViewModel> {
    
    public func configure(stackView: UIStackView) {
        stackSubviews().forEach {
            stackView.addArrangedSubview($0)
        }
    }
    
    open func stackSubviews() -> [UIView] {
        
        var views: [UIView] = []
        
        for section in viewModel.sections {
            let subStack = UIStackView()
            subStack.axis = .vertical
            subStack.spacing = 0.0
            
            let backgroundColor = (section as? StackSection)?.backgroundColor ?? .clear
            
            section.items.compactMap({ view(for: $0) }).forEach {
                $0.backgroundColor = backgroundColor
                subStack.addArrangedSubview($0)
            }
            
            views.append(subStack)
        }
        
        return views
    }
    
}

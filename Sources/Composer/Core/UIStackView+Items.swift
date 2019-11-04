//
//  UIStackView.swift
//  
//
//  Created by Mohssen Fathi on 10/12/19.
//

import UIKit

public extension UIStackView {
    func configure(with items: [Item]) {
        let viewModel = StackViewModel(sections: [StackSection(items: items)])
        let dataSource = StackViewDataSource(viewModel: viewModel)
        dataSource.configure(stackView: self)
    }
}

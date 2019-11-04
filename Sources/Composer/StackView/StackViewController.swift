//
//  StackViewController.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import UIKit

open class StackViewController: UIViewController {
    
    public let scrollView = UIScrollView()
    public let stackView = UIStackView()
    private var dataSource: Any?

    override open func viewDidLoad() {
        super.viewDidLoad()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.spacing = 0
        
        view.backgroundColor = UIColor.white
        view.addSubview(scrollView)
                
        setupConstraints()
    }
    
    open func setupConstraints() {
        var constraints: [NSLayoutConstraint] = []
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        constraints += scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor)
        constraints += scrollView.leftAnchor.constraint(equalTo: view.leftAnchor)
        constraints += scrollView.rightAnchor.constraint(equalTo: view.rightAnchor)
        constraints += scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        
        stackView.embed(in: scrollView)
        constraints += stackView.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        
        NSLayoutConstraint.activate(constraints)
    }

    @discardableResult
    open func configure(with viewModel: ViewModel) -> Self {
        let dataSource = StackViewDataSource(viewModel: viewModel)
        self.dataSource = dataSource
        
        stackView.removeAll()
        dataSource.configure(stackView: stackView)
        
        return self
    }

    
    @discardableResult
    open func configure(with dataSource: StackViewDataSource) -> Self {
        self.dataSource = dataSource
        
        stackView.arrangedSubviews.forEach {
            stackView.removeArrangedSubview($0)
            $0.removeFromSuperview()
        }
        
        dataSource.configure(stackView: stackView)
        
        return self
    }
}

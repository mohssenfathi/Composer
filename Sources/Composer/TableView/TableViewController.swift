//
//  TableViewController.swift
//  
//
//  Created by Mohssen Fathi on 10/19/19.
//

import UIKit

open class TableViewController: UITableViewController {
    
    private var dataSource: Any?
    
    @discardableResult
    open func configure(with viewModel: ViewModel) -> Self {
        let dataSource = TableViewDataSource(viewModel: viewModel)
        self.dataSource = dataSource
        
        dataSource.configure(tableView: tableView)
        
        return self
    }

    
    @discardableResult
    open func configure(with dataSource: TableViewDataSource) -> Self {
        self.dataSource = dataSource

        dataSource.configure(tableView: tableView)
        
        return self
    }
}

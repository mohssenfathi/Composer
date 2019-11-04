//
//  TableViewDataSource.swift
//  
//
//  Created by Mohssen Fathi on 10/19/19.
//

import Foundation
import UIKit

open class TableViewDataSource: BaseDataSource<ViewModel>, UITableViewDataSource, UITableViewDelegate {
    
    public func configure(tableView: UITableView) {
        tableView.dataSource = self
        tableView.delegate = self
        
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        
        registerCells(tableView: tableView)
    }
    
    open func registerCells(tableView: UITableView) {
        tableView.registerClasses([
            TableViewCell<AttributedTextView>.self,
            TableViewCell<ButtonView>.self,
            TableViewCell<CardContainerView>.self,
            TableViewCell<DividerView>.self,
            TableViewCell<DividerView>.self,
            TableViewCell<HorizontalScrollingView>.self,
            TableViewCell<TextView>.self,
            TableViewCell<TitleDetailView>.self,
            TableViewCell<SpacerView>.self,
            TableViewCell<StackView>.self,
            TableViewCell<WebView>.self
        ])
    }
    
    // MARK: - UITableViewDataSource
    open func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.sections.count
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.sections[section].items.count
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = viewModel.sections[indexPath.section]
        let item = section.items[indexPath.item]
        let c = cell(for: item, in: tableView, at: indexPath)
        
        if let tableViewSection = section as? TableViewSection {
            c.backgroundColor = tableViewSection.backgroundColor
        }
        
        return c
    }
    
    open func cell(for item: Item, in tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        switch item {
        case let item as AttributedTextItem:
            let cell: TableViewCell<AttributedTextView> = tableView.getCell(indexPath: indexPath)
            return cell.configure(with: item)
            
        case let item as ButtonItem<UIButton>:
            let cell: TableViewCell<ButtonView> = tableView.getCell(indexPath: indexPath)
            cell.view.configure(with: UIButton(type: .system), item: item)
            return cell
            
        // Recursively calls view(for:) with the nested item
        case let item as CardItem:
            let cell: TableViewCell<CardContainerView> = tableView.getCell(indexPath: indexPath)
            guard let subview = view(for: item.item) else { return UITableViewCell() }
            cell.view.configure(with: item, subview: subview)
            return cell
            
        case let item as DividerItem:
            let cell: TableViewCell<DividerView> = tableView.getCell(indexPath: indexPath)
            return cell.configure(with: item)
            
        case let item as HorizontalScrollingItem:
            let cell: TableViewCell<HorizontalScrollingView> = tableView.getCell(indexPath: indexPath)
            let pages = item.items.compactMap { view(for: $0) }
            cell.view.configure(with: item, pages: pages)
            return cell
            
        case let item as TextItem:
            let cell: TableViewCell<TextView> = tableView.getCell(indexPath: indexPath)
            return cell.configure(with: item)
            
        case let item as TitleDetailItem:
            let cell: TableViewCell<TitleDetailView> = tableView.getCell(indexPath: indexPath)
            return cell.configure(with: item)
            
        case let item as SpacerItem:
            let cell: TableViewCell<SpacerView> = tableView.getCell(indexPath: indexPath)
            return cell.configure(with: item)
            
        case let item as StackViewItem:
            let cell: TableViewCell<StackView> = tableView.getCell(indexPath: indexPath)
            let views = item.items.compactMap { view(for: $0) }
            cell.view.configure(with: item, views: views)
            return cell
            
        case let item as StaticViewItem:
            let cell = UITableViewCell()
            item.view.embed(in: cell.contentView)
            return cell
            
        case let item as WebViewItem:
            let cell: TableViewCell<WebView> = tableView.getCell(indexPath: indexPath)
            return cell.configure(with: item)
            
        default:
            return UITableViewCell()
        }
    }
}

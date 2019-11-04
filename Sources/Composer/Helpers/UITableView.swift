//
//  UITableView.swift
//  
//
//  Created by Mohssen Fathi on 10/11/19.
//

import UIKit

extension UITableView {
    
    public func registerNibs(_ types: [UITableViewCell.Type]) {
        types.forEach { type in
            register(UINib(nibName: type.identifier, bundle: nil), forCellReuseIdentifier: type.identifier)
        }
    }
    
    public func registerClasses(_ types: [UITableViewCell.Type]) {
        types.forEach { type in
            register(type.self, forCellReuseIdentifier: type.identifier)
        }
    }
    
    public func getCell<C: UITableViewCell>(indexPath: IndexPath) -> C {
        return dequeueReusableCell(withIdentifier: C.identifier, for: indexPath) as? C ?? C()
    }
}

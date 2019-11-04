//
//  UICollectionView.swift
//  
//
//  Created by Mohssen Fathi on 9/23/19.
//

import UIKit

extension CustomStringConvertible {
    static public var identifier: String { return String(describing: self) }
}

extension UICollectionView {
    
    public func registerNibs(_ types: [UICollectionViewCell.Type]) {
        types.forEach { type in
            register(UINib(nibName: type.identifier, bundle: nil), forCellWithReuseIdentifier: type.identifier)
        }
    }
    
    public func registerClasses(_ types: [UICollectionViewCell.Type]) {
        types.forEach { type in
            register(type.self, forCellWithReuseIdentifier: type.identifier)
        }
    }
    
    public func registerHeaders(_ types: [UICollectionReusableView.Type]) {
        types.forEach { type in
            register(type, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: type.identifier)
        }
    }
    
    public func getCell<C: UICollectionViewCell>(indexPath: IndexPath) -> C {
        return dequeueReusableCell(withReuseIdentifier: C.identifier, for: indexPath) as? C ?? C()
    }
    
    public func getReusableSupplementaryView<C: UICollectionReusableView>(ofKind kind: String, indexPath: IndexPath) -> C {
        return dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: C.identifier, for: indexPath) as? C ?? C()
    }
}


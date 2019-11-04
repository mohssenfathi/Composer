//
//  UIView.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

import UIKit

extension UIView {
    
    public typealias ConstraintPriorities = (top: UILayoutPriority, right: UILayoutPriority, bottom: UILayoutPriority, left: UILayoutPriority)
    public typealias ConstraintSet = (top: NSLayoutConstraint, right: NSLayoutConstraint, bottom: NSLayoutConstraint, left: NSLayoutConstraint)
    
    @discardableResult
    public func loadFromNib<T : UIView>(nibName: String? = nil) -> T? {
        guard let contentView = Bundle.main.loadNibNamed(nibName ?? String(describing: type(of: self)), owner: self, options: nil)?.first as? T else {
            return nil
        }
        
        contentView.embed(in: self)
        contentView.backgroundColor = .clear
        
        return contentView
    }
    
    public func center(in view: UIView, offset: CGPoint = .zero) {
        view.addSubview(self)
        
        translatesAutoresizingMaskIntoConstraints = false
        let x = centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: offset.x)
        let y = centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: offset.y)
        NSLayoutConstraint.activate([x, y])
    }
    
    @discardableResult
    public func embed(
        in view: UIView,
        insets: UIEdgeInsets = .zero,
        priorities: ConstraintPriorities = (.required, .required, .required, .required),
        safeArea: Bool = false,
        index: Int? = nil) -> ConstraintSet {
        
        if let index = index {
            view.insertSubview(self, at: index)
        } else {
            view.addSubview(self)
        }
        
        translatesAutoresizingMaskIntoConstraints = false
        
        let top: NSLayoutConstraint
        let left: NSLayoutConstraint
        let right: NSLayoutConstraint
        let bottom: NSLayoutConstraint
        
        if safeArea {
            top = topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: insets.top)
            left = leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: insets.left)
            right = rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -insets.right)
            bottom = bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -insets.bottom)
        } else {
            top = topAnchor.constraint(equalTo: view.topAnchor, constant: insets.top)
            left = leftAnchor.constraint(equalTo: view.leftAnchor, constant: insets.left)
            right = rightAnchor.constraint(equalTo: view.rightAnchor, constant: -insets.right)
            bottom = bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -insets.bottom)
        }
        
        top.priority = priorities.top
        left.priority = priorities.left
        right.priority = priorities.right
        bottom.priority = priorities.bottom
        
        NSLayoutConstraint.activate([top, left, right, bottom])
        
        return (top, right, bottom, left)
    }
    
    public func animate(constraint: NSLayoutConstraint, to value: CGFloat, duration: Double = 0.3, completion: ((Bool) -> ())? = nil) {
        constraint.constant = value
        setNeedsLayout()
        UIView.animate(withDuration: duration, delay: 0.0, options: .beginFromCurrentState, animations: { [weak self] in
            self?.layoutIfNeeded()
        }, completion: completion)
    }
        
}

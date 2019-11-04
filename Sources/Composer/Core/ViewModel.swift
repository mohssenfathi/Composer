//
//  ViewModel.swift
//  
//
//  Created by Mohssen Fathi on 9/9/19.
//

public protocol Item {
    
}

public protocol Section {
    var title: String? { get }
    var items: [Item] { get set }
}

public protocol ViewModel {
    var sections: [Section] { get }
}

public struct AnySection: Section {
    public var title: String?
    public var items: [Item]
    
    public init(title: String? = nil, items: [Item]) {
        self.title = title
        self.items = items
    }
}


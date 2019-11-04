//
//  Date.swift
//  
//
//  Created by Mohssen Fathi on 10/8/19.
//

import Foundation

public extension Date {
    
    func component(for component: Calendar.Component) -> Int {
        return Calendar.current.component(component, from: self)
    }
 
    func fromComponents(_ components: Set<Calendar.Component>) -> Date {
        let comps = Calendar.current.dateComponents(components, from: self)
        return Calendar.current.date(from: comps) ?? self
    }
    
    func droppingTime() -> Date {
        return self.fromComponents([.year, .month, .day])
    }
    
    func minus(_ value: Int, component: Calendar.Component) -> Date? {
        return plus(-(value), component: component)
    }
    
    func plus(_ value: Int, component: Calendar.Component) -> Date? {
        return Calendar.current.date(byAdding: component, value: value, to: self)
    }

}

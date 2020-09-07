//
//  NotificationCenter.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-18.
//

import Foundation

public extension NotificationCenter {
    func post(_ input: Any) {
        DispatchQueue.main.async {
            self.post(name: .init("\(type(of: input))"), object: input)
        }
    }
    
    func addObserver(_ observer: Any, selector aSelector: Selector, publisher: AnyClass) {
        self.addObserver(observer, selector: aSelector, name: .init("\(publisher)"), object: nil)
    }
}

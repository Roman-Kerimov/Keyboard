//
//  CombineBackwardCompatibility.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import Foundation

protocol BindableObject {}
class PassthroughSubject<Output, Failure> where Failure : Error {
    func send(_ input: Output) {
        NotificationCenter.default.post(input)
    }
}

extension NotificationCenter {
    func post(_ input: Any) {
        self.post(name: .init("\(type(of: input))"), object: input)
    }
    
    func addObserver(_ observer: Any, selector aSelector: Selector, publisher: AnyClass) {
        self.addObserver(observer, selector: aSelector, name: .init("\(publisher)"), object: nil)
    }
}

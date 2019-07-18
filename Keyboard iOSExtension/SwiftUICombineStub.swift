//
//  SwiftUICombineStub.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import Foundation

protocol BindableObject {}
class PassthroughSubject<Output, Failure> where Failure : Error {
    func send(_ input: Output) {}
}

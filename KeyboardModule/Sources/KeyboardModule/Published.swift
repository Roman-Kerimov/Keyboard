//
//  Published.swift
//  
//
//  Created by Roman Kerimov on 2022-05-06.
//

import Foundation
import Combine

private var cancellables = [String: AnyCancellable]()

extension Published {
    init(
        wrappedValue defaultValue: Value,
        _ key: String,
        storage: UserDefaults = .standard
    ) where Value: RawRepresentable {
        let rawValue = storage.object(forKey: key) as? Value.RawValue ?? defaultValue.rawValue
        let value = Value(rawValue: rawValue) ?? defaultValue
        self.init(initialValue: value)
        
        cancellables[key] = projectedValue.sink { value in
            storage.setValue(value.rawValue, forKey: key)
            storage.synchronize()
        }
    }
}

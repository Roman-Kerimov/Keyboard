//
//  CaseIterable.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-05-27.
//

protocol CaseIterable: Hashable {}

extension CaseIterable {
    
    static var allCases: [Self] {
        var iterateEnum: AnyIterator<Self> {
            var index = 0
            
            return AnyIterator {
                let next = withUnsafeBytes(of: &index) {
                    $0.load(as: Self.self)
                }
                
                if next.hashValue != index {
                    return nil
                }
                
                index += 1
                
                return next
            }
        }
        
        var values: [Self] = []
        
        for value in iterateEnum {
            guard value != values.first else {
                break
            }
            
            values.append(value)
        }
        
        return values
    }
}

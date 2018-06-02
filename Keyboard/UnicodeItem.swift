//
//  UnicodeItem.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-06-01.
//

import Foundation

class UnicodeItem: NSObject, NSCoding, Comparable {
    
    static func < (lhs: UnicodeItem, rhs: UnicodeItem) -> Bool {
        return lhs.order < rhs.order
    }
    
    private enum Key: Int {
        case codePoints, isFullyQualified, name, order
        
        var string: String {
            return rawValue.description
        }
    }
    
    let codePoints: String
    let isFullyQualified: Bool
    let name: String
    private let order: Int
    
    private static var count: Int = 0
    
    init(codePoints: String, name: String, isFullyQualified: Bool) {
        
        self.codePoints = codePoints
        self.isFullyQualified = isFullyQualified
        self.name = name
        self.order = UnicodeItem.count
        
        UnicodeItem.count += 1
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(codePoints, forKey: Key.codePoints.string)
        aCoder.encode(isFullyQualified, forKey: Key.isFullyQualified.string)
        aCoder.encode(name, forKey: Key.name.string)
        aCoder.encode(order, forKey: Key.order.string)
    }
    
    required init?(coder aDecoder: NSCoder) {
        
        guard let codePoints = aDecoder.decodeObject(forKey: Key.codePoints.string) as? String,
            let isFullyQualified = aDecoder.decodeObject(forKey: Key.isFullyQualified.string) as? Bool,
            let name = aDecoder.decodeObject(forKey: Key.name.string) as? String,
            let order = aDecoder.decodeObject(forKey: Key.order.string) as? Int else {
                
            return nil
        }
        
        self.codePoints = codePoints
        self.isFullyQualified = isFullyQualified
        self.name = name
        self.order = order
    }
}

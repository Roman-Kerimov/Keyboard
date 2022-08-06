//
//  UIReturnKeyType.swift
//  
//
//  Created by Roman Kerimov on 2022-07-16.
//

import UIKit
import KeyboardModule

extension UIReturnKeyType {
    var localizedString: String {
        switch self {
        case .default:
            return Key.enter.label
            
        case .go:
            return GO.string
            
        case .join:
            return JOIN.string
            
        case .next:
            return NEXT.string
            
        case .route:
            return ROUTE.string
            
        case .search, .google, .yahoo:
            return SEARCH.string
            
        case .send:
            return SEND.string
            
        case .done:
            return DONE.string
            
        case .emergencyCall:
            return EMERGENCY_CALL.string
            
        case .continue:
            return CONTINUE.string
            
        @unknown default:
            return Key.enter.label
        }
    }
}

//
//  Internationalization.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-01-14.
//
//

import UIKit

extension Language {
    #if TARGET_INTERFACE_BUILDER
    static var current: Language = .en
    
    #else
    private static let currentKey = "rrvfFT9eUMTqwVCEW4cbDo3c4TJsa1O"
    static var current: Language {
        get {
            return Language(rawValue: UserDefaults.standard.string(forKey: currentKey) ?? "") ?? preferredList.first ?? .en
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: currentKey)
            
            NotificationCenter.default.post(name: .LocalizationDidChange, object: nil)
        }
    }
    #endif
    
    static var preferredList: [Language] {
        let languageCodes: [String]
        #if TARGET_INTERFACE_BUILDER
            languageCodes = .init()
        #else
            languageCodes = UserDefaults.standard.array(forKey: "AppleLanguages") as! [String]
        #endif

        var languages: [Language] = []
        
        for languageCode in languageCodes {
            if let language = Language(rawValue: languageCode) {
                languages.append(language)
            }
            else if let language = Language(rawValue: languageCode.components(separatedBy: "-").dropLast().joined(separator: "-")) {
                languages.append(language)
            }
        }
        
        return languages
    }
    
    static var list: [Language] {
        struct Stored {
            static let list = values(of: Language.self)
        }
        return Stored.list
    }
}

internal func values<Enum: Hashable>(of: Enum.Type) -> [Enum] {
    var iterateEnum: AnyIterator<Enum> {
        var index = 0
        
        return AnyIterator {
            let next = withUnsafeBytes(of: &index) {
                $0.load(as: Enum.self)
            }
            
            if next.hashValue != index {
                return nil
            }
            
            index += 1
            
            return next
        }
    }
    
    var values: [Enum] = []
    
    for value in iterateEnum {
        guard value != values.first else {
            break
        }
        
        values.append(value)
    }
    
    return values
}

extension UIView {
    
    @objc func proxy_didMoveToWindow() {
        updateLocalizedStrings()
        NotificationCenter.default.addObserver(self, selector: #selector(updateLocalizedStrings), name: .LocalizationDidChange, object: nil)
    }
    
    @objc func proxy_willMove(toWindow newWindow: UIWindow?) {
        if newWindow == nil {
            NotificationCenter.default.removeObserver(self)
        }
    }
    
    @objc func updateLocalizedStrings() {
        
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        updateLocalizedStrings()
    }
}

struct Localization {
    private static var swapped: Bool = false
    
    static func initialize() {
        
        if swapped {
            return
        }
        
        swapMethods(UIView.self, #selector(UIView.didMoveToWindow), #selector(UIView.proxy_didMoveToWindow))
        swapMethods(UIView.self, #selector(UIView.willMove(toWindow:)), #selector(UIView.proxy_willMove(toWindow:)))
        
        swapped = true
    }
    
    private static func swapMethods(_ anyClass: AnyClass, _ originalSelector: Selector, _ newSelector: Selector) {
        
        let originalMethod = class_getInstanceMethod(anyClass, originalSelector)!
        let newMethod = class_getInstanceMethod(anyClass, newSelector)!
        
        let didAddMethod = class_addMethod(anyClass, originalSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))
        
        if didAddMethod {
            class_replaceMethod(anyClass, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        }
        else {
            method_exchangeImplementations(originalMethod, newMethod)
        }
    }
}

extension NSNotification.Name {
    static let LocalizationDidChange: NSNotification.Name = .init("eGuHC6YhIb9XAe2gDBjQPM8PHuojH5A")
}

//
//  Internationalization.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 14.01.17.
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
            return Language(rawValue: UserDefaults.standard.string(forKey: currentKey) ?? "") ?? preffered
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: currentKey)
        }
    }
    #endif
    
    private static var preffered: Language {
        let languages = UserDefaults.standard.array(forKey: "AppleLanguages") as! [String]
        
        for languageCode in languages {
            if let language = Language(rawValue: languageCode) {
                return language
            }
            else if let language = Language(rawValue: languageCode.components(separatedBy: "-").first ?? "") {
                return language
            }
        }
        
        return .en
    }
}

extension UIViewController {
    open override class func initialize() {
        guard self == UIViewController.self else {
            return
        }
        
        swapMethods(self, #selector(viewWillAppear(_:)), #selector(newViewWillAppear(_:)))
    }
    
    func newViewWillAppear(_ animated: Bool) {
        updateLocalizedStrings()
    }
    
    func updateLocalizedStrings() {
        view.updateLocalizedStrings()
    }
}

extension UIView {
    func updateLocalizedStrings() {
        for view in subviews {
            view.updateLocalizedStrings()
        }
    }
    
    open override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        
        updateLocalizedStrings()
    }
}

internal func swapMethods(_ self: AnyClass, _ originalSelector: Selector, _ newSelector: Selector) {
    
    let originalMethod = class_getInstanceMethod(self, originalSelector)
    let newMethod = class_getInstanceMethod(self, newSelector)
    
    let didAddMethod = class_addMethod(self, originalSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))
    
    if didAddMethod {
        class_replaceMethod(self, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
    }
    else {
        method_exchangeImplementations(originalMethod, newMethod)
    }
}

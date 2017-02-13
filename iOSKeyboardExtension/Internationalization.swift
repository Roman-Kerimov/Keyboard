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
    
    func newViewWillAppear(_ animated: Bool) {
        updateLocalizedStrings()
    }
    
    func updateLocalizedStrings() {
        
    }
}

extension UIView {
    
    func newDidMoveToWindow() {
        updateLocalizedStrings()
    }
    
    func updateLocalizedStrings() {
        #if TARGET_INTERFACE_BUILDER
            for view in subviews {
                view.updateLocalizedStrings()
            }
        #endif
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
        
        swapMethods(UIViewController.self, #selector(UIViewController.viewWillAppear(_:)), #selector(UIViewController.newViewWillAppear(_:)))
        swapMethods(UIView.self, #selector(UIView.didMoveToWindow), #selector(UIView.newDidMoveToWindow))
        
        swapped = true
    }
    
    private static func swapMethods(_ anyClass: AnyClass, _ originalSelector: Selector, _ newSelector: Selector) {
        
        let originalMethod = class_getInstanceMethod(anyClass, originalSelector)
        let newMethod = class_getInstanceMethod(anyClass, newSelector)
        
        let didAddMethod = class_addMethod(anyClass, originalSelector, method_getImplementation(newMethod), method_getTypeEncoding(newMethod))
        
        if didAddMethod {
            class_replaceMethod(anyClass, newSelector, method_getImplementation(originalMethod), method_getTypeEncoding(originalMethod))
        }
        else {
            method_exchangeImplementations(originalMethod, newMethod)
        }
    }
}

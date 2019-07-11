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
            return Language(rawValue: UserDefaults.standard.string(forKey: currentKey) ?? "") ?? preferredList.first ?? .en
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: currentKey)
            
            for viewController in loadedViewControllers {
                viewController.updateLocalizedStrings()
            }
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

private var loadedViewControllers: [UIViewController] = []

extension UIViewController {
    
    @objc func proxy_viewDidLoad() {
        loadedViewControllers.append(self)
    }
    
    @objc func proxy_viewWillAppear(_ animated: Bool) {
        updateLocalizedStrings()
    }
    
    @objc func proxy_viewWillDisappear(_ animated: Bool) {
        if self == KeyboardViewController.shared {
            loadedViewControllers.removeAll()
        }
    }
    
    func updateLocalizedStrings() {
        view.updateLocalizedStrings()
    }
}

extension UIView {
    
    @objc func proxy_didMoveToWindow() {
        updateLocalizedStrings()
    }
    
    @objc func updateLocalizedStrings() {
        for view in subviews {
            view.updateLocalizedStrings()
        }
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
        
        swapMethods(UIViewController.self, #selector(UIViewController.viewDidLoad), #selector(UIViewController.proxy_viewDidLoad) )
        swapMethods(UIViewController.self, #selector(UIViewController.viewWillAppear(_:)), #selector(UIViewController.proxy_viewWillAppear(_:)) )
        swapMethods(UIViewController.self, #selector(UIViewController.viewWillDisappear(_:)), #selector(UIViewController.proxy_viewWillDisappear(_:)) )
        
        swapMethods(UIView.self, #selector(UIView.didMoveToWindow), #selector(UIView.proxy_didMoveToWindow))
        
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

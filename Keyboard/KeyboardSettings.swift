//
//  KeyboardSettings.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-12-18.
//
//

import UIKit

class KeyboardSettings: NSObject {
    
    static let shared: KeyboardSettings = .init()
    
    internal func down(key: Key) {
        if key == .delete {
            startAutorepeat()
        }
        
        if currentKeys.isEmpty {
            character = key.label
        }
        
        currentKeys.append(key)
    }
    
    internal func up(key: Key) {
        if key == .delete {
            stopAutorepeat()
        }
        else {
            input()
        }
        
        if let keyIndex = currentKeys.index(of: key) {
            currentKeys.remove(at: keyIndex)
        }
    }
    
    private var autorepeatStartTimer: Timer?
    private var repeatTimer: Timer?
    
    private func startAutorepeat() {
        input()
        
        autorepeatStartTimer = .scheduledTimer(withTimeInterval: 0.5, repeats: false) {_ in
            self.repeatTimer = .scheduledTimer(withTimeInterval: 0.1, repeats: true) {_ in
                DispatchQueue.main.async {
                    self.input()
                }
            }
        }
    }
    
    private func stopAutorepeat() {
        autorepeatStartTimer?.invalidate()
        repeatTimer?.invalidate()
    }
    
    private var shouldDeletePreviousCharacter: Bool = false
    
    private func input() {
        guard let key = currentKeys.first else {
            return
        }
        
        if key == .return {
            KeyboardViewController.shared.keyAction(label: key.label)
        }
        else {
            
            if shouldDeletePreviousCharacter {
                shouldDeletePreviousCharacter = false
                
                guard KeyboardViewController.shared.textDocumentProxy.characterBeforeInput?.description != character else {
                    return
                }
                
                KeyboardViewController.shared.textDocumentProxy.deleteBackward()
            }
            
            KeyboardViewController.shared.keyAction(label: character)
        }
        
        KeyboardViewController.shared.updateDocumentContext()
    }
    
    internal var currentKeys: [Key] = []
    
    private var characterComponents: [CharacterComponent] {
        get {
            return character.characterComponents
        }
        
        set {
            if newValue.character.isEmpty == false {
                character = newValue.character
            }
        }
    }
    
    internal var character: String = .init() {
        didSet {
            NotificationCenter.default.post(name: .KeyboardStateDidChange, object: nil)
        }
    }
    
    internal func shift(direction: ShiftDirection) {
        guard let key = currentKeys.first else {
            return
        }
        
        switch direction {
            
        case .up:
            if character == key.label && key.shiftUpLabel.isEmpty == false {
                character = key.shiftUpLabel
            }
            else {
                characterComponents += [.capital]
                
                if characterComponents.count == 1 {
                    if let shiftUpCharacterComponent = KeyboardLayout.shiftUpDictionary[characterComponents.first!] {
                        characterComponents = [shiftUpCharacterComponent]
                    }
                }
            }
            
        case .down:
            if character == key.label && key.shiftDownLabel.isEmpty == false {
                character = key.shiftDownLabel.first?.description ?? .init()
            }
            else if characterComponents.extraArray.count > 1
                && characterComponents == characterComponents.extraArray[0] {
                
                characterComponents = characterComponents.extraArray[1]
            }
            else {
                characterComponents = .init(characterComponents.split(separator: .capital, maxSplits: 1, omittingEmptySubsequences: false).joined(separator: [.smallCapital]))
            }
            
        case .left:
            if character == key.label && key.shiftLeftLabel.isEmpty == false {
                character = key.shiftLeftLabel
            }
            else if characterComponents.extraArray.count > 2
                && characterComponents == characterComponents.extraArray[1] {
                
                characterComponents = characterComponents.extraArray[2]
            }
            else if key.label.count == 1 {
                fallthrough
            }
            
        case .upLeft, .downLeft:
            
            guard key.label.count == 1 else {
                break
            }
            
            guard let previousCharacter = KeyboardViewController.shared.textDocumentProxy.characterBeforeInput else {
                character = .init()
                break
            }
            
            shouldDeletePreviousCharacter = true
            
            let mixingComponents = characterComponents.map {CharacterComponent.letterToMixingComponentDictionary[$0] ?? $0}
            let combiningComponents = characterComponents.map {CharacterComponent.letterToCombiningComponentDictionary[$0] ?? $0}
            
            let combiningSuffix: [CharacterComponent] = [direction == .left ? .combining : (direction == .upLeft ? .above : .below)]
            
            var combiningCharacter: String = (characterComponents + combiningSuffix).character
            combiningCharacter = (combiningComponents + combiningSuffix).character
            
            guard combiningCharacter.isEmpty else {
                character = (previousCharacter.description + combiningCharacter).precomposedStringWithCanonicalMapping
                break
            }
            
            let ligatureCharacter = (previousCharacter.characterComponents + characterComponents).character
            let combinedCharacter = (previousCharacter.characterComponents + mixingComponents).character
            
            if ligatureCharacter != combinedCharacter && ligatureCharacter.isEmpty == false && combinedCharacter.isEmpty == false {
                Array<CharacterComponent>.extraArrayExtension = [ligatureCharacter.characterComponents]
            }
            
            if previousCharacter.characterComponents.isEmpty || (combinedCharacter.isEmpty && ligatureCharacter.isEmpty) {
                character = previousCharacter.description
            }
            else {
                characterComponents = ligatureCharacter.characterComponents
                characterComponents = combinedCharacter.characterComponents
            }
            
        case .right:
            if character == key.label && key.shiftRightLabel.isEmpty == false {
                character = key.shiftRightLabel
            }
            else if characterComponents.extraArray.isEmpty == false
                && characterComponents.extraArray.contains(where: {$0.normalized == characterComponents.normalized}) == false {
                
                characterComponents = characterComponents.extraArray[0]
            }
            else if characterComponents.count == 1 {
                if let extraRightComponent = KeyboardLayout.shiftRightDictionary[characterComponents.first!] {
                    characterComponents = [extraRightComponent]
                }
            }
            
        case .upRight:
            characterComponents += [.superscript]
            
        case .downRight:
            characterComponents += [.subscript]
        }
    }
    
    internal enum ShiftDirection {
        case downLeft
        case down
        case downRight
        case right
        case upRight
        case up
        case upLeft
        case left
    }

    enum KeyboardLayoutMode: String {
        case horizontal = "horizontal"
        case vertical = "vertical"
        
        case `default` = "default"
    }
    
    private override init() {
        super.init()
    }
    
    private let layoutKey = "LBPQsNPr8gJHi8Ds05etypaTVEiq8X1"
    var layout: KeyboardLayout {
        get {
            return KeyboardLayout.list.filter { $0.name == (UserDefaults.standard.string(forKey: layoutKey) ?? "")}.first ?? .qwerty
        }
        
        set {
            UserDefaults.standard.set(newValue.name, forKey: layoutKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private let layoutModeKey = "PPlmVhk2uT98JemxOJdtAS88aRi3qv9"
    var layoutMode: KeyboardLayoutMode {
        get {
            return KeyboardLayoutMode(rawValue: UserDefaults.standard.string(forKey: layoutModeKey) ?? "") ?? .default
        }
        
        set {
            UserDefaults.standard.set(newValue.rawValue, forKey: layoutModeKey)
            UserDefaults.standard.synchronize()
        }
    }
    
    private let frequentlyUsedCharactersKey = "LBg6QhTolnUzmtHXeo960LT1ZNd3i07"
    var frequentlyUsedCharacters: [Character] {
        get {
            let characterStrings = UserDefaults.standard.object(forKey: frequentlyUsedCharactersKey) as? [String] ?? .init()
            return characterStrings.map {Character.init($0)}
        }
        
        set {
            UserDefaults.standard.set(newValue.map {$0.description}, forKey: frequentlyUsedCharactersKey)
            UserDefaults.standard.synchronize()
        }
    }
}

extension NSNotification.Name {
    static let KeyboardStateDidChange: NSNotification.Name = .init("gw93Wf66S7t3GARlTiRirWIBvd4QiSM")
}

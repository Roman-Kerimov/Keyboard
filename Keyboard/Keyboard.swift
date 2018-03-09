//
//  Keyboard.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-12-18.
//
//

import Foundation

class Keyboard: NSObject {
    
    static let `default`: Keyboard = .init()
    var delegate: KeyboardDelegate?
    
    var version: String {
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        return "\(VERSION.string) \(versionNumber) (\(buildNumber))"
    }
    
    internal var shiftFlag: Bool = false {
        didSet {
            if shiftFlag == false {
                currentKeys = []
                Array<CharacterComponent>.extraArrayExtension = .init()
            }
        }
    }
    
    internal var shiftUpFlag: Bool = false
    internal var shiftDownFlag: Bool = false
    
    internal func down(key: Key) {
        
        if !shiftFlag {
            currentLabel = key.label
            currentKeys.append(key)
            input()
        }
        else {
            let layout = Keyboard.default.layout
            switch key {
                
            case layout.rows[0][1], layout.rows[0][6]:
                shift(direction: .upLeft)
                
            case layout.rows[0][2], layout.rows[0][7]:
                shift(direction: .up)
                
            case layout.rows[0][3], layout.rows[0][8]:
                shift(direction: .upRight)
                
                
            case layout.rows[1][1], layout.rows[1][6]:
                shift(direction: .left)
                
            case layout.rows[1][3], layout.rows[1][8]:
                shift(direction: .right)
                
                
            case layout.rows[2][1], layout.rows[2][6]:
                shift(direction: .downLeft)
                
            case layout.rows[2][2], layout.rows[2][7]:
                shift(direction: .down)
                
            case layout.rows[2][3], layout.rows[2][8]:
                shift(direction: .downRight)
                
            default:
                break
            }
        }
        
        if key == .delete {
            startAutorepeat()
        }
    }
    
    internal func up(key: Key) {
        if key == .delete {
            stopAutorepeat()
        }
        
        guard let keyIndex = currentKeys.index(of: key) else {
            return
        }
        
        if !shiftFlag {
            currentKeys.remove(at: keyIndex)
        }
    }
    
    private var autorepeatStartTimer: Timer?
    private var repeatTimer: Timer?
    
    private func startAutorepeat() {
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
        guard let currentKey = currentKeys.first else {
            return
        }
        
        if shiftUpFlag {
            shiftUp(key: currentKey)
        }
        
        if shiftDownFlag {
            shiftDown(key: currentKey)
        }
        
        if shouldDeletePreviousCharacter {
            shouldDeletePreviousCharacter = false
            
            delegate?.delete()
        }
        
        switch currentKey {
            
        case .delete:
            delegate?.delete()
            
        case .return:
            delegate?.insert(text: .return)
            
        case .tab:
            delegate?.insert(text: .tab)
            
        case .settings:
            delegate?.settings()
            
        case .nextKeyboard, .dismissKeyboard:
            break
            
        default:
            delegate?.insert(text: currentLabel)
        }
        
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
    
    internal var currentKeys: [Key] = []
    
    private var characterComponents: [CharacterComponent] {
        get {
            return currentLabel.characterComponents
        }
        
        set {
            if newValue.character.isEmpty == false {
                currentLabel = newValue.character
            }
        }
    }
    
    internal var currentLabel: String = .init() {
        didSet {
            NotificationCenter.default.post(name: .KeyboardStateDidChange, object: nil)
        }
    }
    
    private func shiftUp(key: Key) {
        if currentLabel == key.label && key.shiftUpLabel.isEmpty == false {
            currentLabel = key.shiftUpLabel
        }
        else {
            characterComponents += [.capital]
            
            if characterComponents.count == 1 {
                if let shiftUpCharacterComponent = KeyboardLayout.shiftUpDictionary[characterComponents.first!] {
                    characterComponents = [shiftUpCharacterComponent]
                }
            }
        }
    }
    
    private func shiftDown(key: Key) {
        if currentLabel == key.label && key.shiftDownLabel.isEmpty == false {
            currentLabel = key.shiftDownLabel.first?.description ?? .init()
        }
        else if characterComponents.extraArray.count > 1
            && characterComponents == characterComponents.extraArray[0] {
            
            characterComponents = characterComponents.extraArray[1]
        }
        else {
            characterComponents = .init(characterComponents.split(separator: .capital, maxSplits: 1, omittingEmptySubsequences: false).joined(separator: [.smallCapital]))
        }
    }
    
    internal func shift(direction: ShiftDirection) {
        guard let key = currentKeys.first else {
            return
        }
        
        switch direction {
            
        case .up:
            shiftUp(key: key)
            
        case .down:
            shiftDown(key: key)
            
        case .left:
            if currentLabel == key.label && key.shiftLeftLabel.isEmpty == false {
                currentLabel = key.shiftLeftLabel
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
            
            guard let previousCharacter = delegate?.documentContext.beforeInput.dropLast().last else {
                currentLabel = .init()
                break
            }
            
            shouldDeletePreviousCharacter = true
            
            let mixingComponents = characterComponents.map {CharacterComponent.letterToMixingComponentDictionary[$0] ?? $0}
            let combiningComponents = characterComponents.map {CharacterComponent.letterToCombiningComponentDictionary[$0] ?? $0}
            
            let combiningSuffix: [CharacterComponent] = [direction == .left ? .combining : (direction == .upLeft ? .above : .below)]
            
            var combiningCharacter: String = (characterComponents + combiningSuffix).character
            combiningCharacter = (combiningComponents + combiningSuffix).character
            
            guard combiningCharacter.isEmpty else {
                currentLabel = (previousCharacter.description + combiningCharacter).precomposedStringWithCanonicalMapping
                break
            }
            
            let ligatureCharacter = (previousCharacter.characterComponents + characterComponents).character
            let combinedCharacter = (previousCharacter.characterComponents + mixingComponents).character
            
            if ligatureCharacter != combinedCharacter && ligatureCharacter.isEmpty == false && combinedCharacter.isEmpty == false {
                Array<CharacterComponent>.extraArrayExtension = [ligatureCharacter.characterComponents]
            }
            
            if previousCharacter.characterComponents.isEmpty || (combinedCharacter.isEmpty && ligatureCharacter.isEmpty) {
                currentLabel = .init()
                shouldDeletePreviousCharacter = false
            }
            else {
                characterComponents = ligatureCharacter.characterComponents
                characterComponents = combinedCharacter.characterComponents
            }
            
        case .right:
            if currentLabel == key.label && key.shiftRightLabel.isEmpty == false {
                currentLabel = key.shiftRightLabel
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
        
        delegate?.delete()
        input()
        
        if currentLabel.isEmpty {
            shiftFlag = false
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
            
            NotificationCenter.default.post(name: .LayoutDidChange, object: nil)
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
    
    static let DocumentContextDidChange: NSNotification.Name = .init("oDap18soqXQONnkeMJsCZSGmkexar2g")
    
    static let LayoutDidChange: NSNotification.Name = .init("DjG5zBrx84Y5CwuF858vXxznGIFNnQ5")
}
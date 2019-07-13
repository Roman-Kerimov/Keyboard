//
//  Keyboard.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2016-12-18.
//
//

import SwiftUI
import Combine
import Calculator

final class Keyboard: BindableObject {
    var didChange: PassthroughSubject<Keyboard, Never> = .init()
    
    static let `default`: Keyboard = .init()
    var delegate: KeyboardDelegate?
    
    private var shiftDirections: [ShiftDirection] = .init()
    
    internal var shiftFlag: Bool = false {
        didSet {
            if shiftFlag == false {
                currentKey = nil
                shiftDirections = .init()
                Array<CharacterComponent>.extraArrayExtension = .init()
            }
        }
    }
    
    internal var shiftUpFlag: Bool = false {
        didSet {
            setFlag(direction: .up, value: shiftUpFlag, oldValue: oldValue)
        }
    }
    
    internal var shiftDownFlag: Bool = false {
        didSet {
            setFlag(direction: .down, value: shiftDownFlag, oldValue: oldValue)
        }
    }
    
    private var shiftFlagDirections: [ShiftDirection] = []
    
    private func setFlag(direction: ShiftDirection, value: Bool, oldValue: Bool) {
        guard value != oldValue else {
            return
        }
        
        if value {
            shiftFlagDirections.append(direction)
        }
        else if shiftUpFlag == shiftDownFlag {
            shiftFlagDirections = []
        }
    }
    
    internal func down(key: Key) {
        
        if !shiftFlag {
            currentLabel = key.label
            currentKey = key
            input()
        }
        else {
            let direction: ShiftDirection
            
            switch key {
                
            case .w, .u:
                direction = .upLeft
                
            case .e, .i:
                direction = .up
                
            case .r, .o:
                direction = .upRight
                
                
            case .s, .j:
                direction = .left
                
            case .f, .l:
                direction = .right
                
                
            case .x, .m:
                direction = .downLeft
                
            case .c, .comma:
                direction = .down
                
            case .v, .fullStop:
                direction = .downRight
                
            default:
                return
            }
            
            if shiftDirections.last == direction {
                input()
            }
            else {
                shift(direction: direction)
                shiftDirections.append(direction)
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
        
        if !shiftFlag && currentKey == key {
            currentKey = nil
            Array<CharacterComponent>.extraArrayExtension = .init()
        }
        
        currentCombiningCharacter = nil
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
    
    private var previousDocumentContextBeforeInput: String = .init()
    
    private func input() {
        guard let currentKey = currentKey else {
            return
        }
        
        previousDocumentContextBeforeInput = delegate?.documentContext.beforeInput ?? .init()
        
        for shiftFlagDirection in shiftFlagDirections {
            switch shiftFlagDirection {
                
            case .up:
                shiftUp(key: currentKey)
                
            case .down:
                shiftDown(key: currentKey)
                
            default:
                break
            }
        }
        
        if shouldDeletePreviousCharacter {
            shouldDeletePreviousCharacter = false
            
            delegate?.delete()
        }
        
        switch currentKey {
            
        case .delete:
            delegate?.delete()
            
        case .enter:
            delegate?.enter()
            
        case .settings:
            delegate?.settings()
            
        case .nextKeyboard, .dismissKeyboard:
            break
            
        default:
            delegate?.insert(text: currentLabel)
        }
        
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
    
    internal var currentKey: Key? = nil
    
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
    
    var previousLabel: String = .init()
    
    internal var currentLabel: String = .init() {
        didSet {
            NotificationCenter.default.post(name: .KeyboardStateDidChange, object: nil)
        }
    }
    
    var currentCombiningCharacter: String? = nil
    
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
            && characterComponents.normalized == characterComponents.extraArray[0].normalized {
            
            characterComponents = characterComponents.extraArray[1]
        }
        else {
            characterComponents = .init(characterComponents.split(separator: .capital, maxSplits: 1, omittingEmptySubsequences: false).joined(separator: [.smallCapital]))
        }
    }
    
    internal func shift(direction: ShiftDirection) {
        previousLabel = currentLabel
        
        guard let key = currentKey else {
            return
        }
        
        SwitchDirection: switch direction {
            
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
            
            let extraCharacterComponents: [CharacterComponent]
            
            switch direction {
            case .upLeft:
                extraCharacterComponents = characterComponents + [.extraUpLeft]
                
            case .left:
                extraCharacterComponents = characterComponents + [.extraLeft]
                
            case .downLeft:
                extraCharacterComponents = characterComponents + [.extraDownLeft]
                
            default:
                extraCharacterComponents = []
            }
            
            guard extraCharacterComponents.character.isEmpty else {
                characterComponents = extraCharacterComponents
                break
            }
            
            let previousCharacterOrNil = delegate?.documentContext.beforeInput?.dropLast().last
            
            shouldDeletePreviousCharacter = true
            
            let modifierCharacterComponents = characterComponents.removing(characterComponents: CharacterComponent.scripts)
            
            let mixingComponents = modifierCharacterComponents.map {CharacterComponent.letterToMixingComponentDictionary[$0] ?? $0}
            let combiningComponents = modifierCharacterComponents.map {CharacterComponent.letterToCombiningComponentDictionary[$0] ?? $0}
            
            let combiningSuffix: [CharacterComponent] = [direction == .left ? .combining : (direction == .upLeft ? .above : .below)]
            
            var combiningCharacter: String = (modifierCharacterComponents + combiningSuffix).character
            combiningCharacter = (combiningComponents + combiningSuffix).character
            
            guard combiningCharacter.isEmpty else {
                currentLabel = ((previousCharacterOrNil?.description ?? .init()) + combiningCharacter).precomposedStringWithCanonicalMapping
                
                currentCombiningCharacter = combiningCharacter
                break
            }
            
            guard let previousCharacter = previousCharacterOrNil else {
                currentLabel = .init()
                break
            }
            
            let previousCharacterUnicodeScalars = previousCharacter.description.decomposedStringWithCanonicalMapping.unicodeScalars
            
            for (index, unicodeScalar) in previousCharacterUnicodeScalars.enumerated().reversed() {
                
                guard unicodeScalar.properties.isGraphemeExtend else {
                    continue
                }
                
                guard let newUnicodeScalar = (unicodeScalar.description.characterComponents + combiningComponents).character.unicodeScalars.first else {
                    
                    continue
                }
                
                var unicodeScalarStrings = previousCharacterUnicodeScalars.map {$0.description}
                unicodeScalarStrings[index] = newUnicodeScalar.description
                currentLabel = unicodeScalarStrings.joined()
                
                break SwitchDirection
            }
            
            let combinedCharacter = (previousCharacter.characterComponents + combiningComponents).character
            let ligatureCharacter = (previousCharacter.characterComponents + modifierCharacterComponents).character
            let mixiedCharacter = (previousCharacter.characterComponents + mixingComponents).character
            
            if ligatureCharacter != mixiedCharacter && ligatureCharacter.isEmpty == false && mixiedCharacter.isEmpty == false {
                Array<CharacterComponent>.extraArrayExtension = [ligatureCharacter.characterComponents]
            }
            
            if previousCharacter.characterComponents.isEmpty || (mixiedCharacter.isEmpty && ligatureCharacter.isEmpty && combinedCharacter.isEmpty) {
                currentLabel = .init()
                shouldDeletePreviousCharacter = false
            }
            else {
                characterComponents = combinedCharacter.characterComponents
                characterComponents = ligatureCharacter.characterComponents
                characterComponents = mixiedCharacter.characterComponents
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
            
            characterComponents += [.extraRight]
            
        case .upRight, .downRight:
            if direction == .upRight {
                characterComponents += [.superscript]
                characterComponents += [.extraUpRight]
            }
            else {
                characterComponents += [.subscript]
                characterComponents += [.extraDownRight]
            }
            
            
            if let combiningCharacter = currentCombiningCharacter {
                
                var unicodeScalars = currentLabel.decomposedStringWithCanonicalMapping.unicodeScalars
                
                let combiningCharacterIndex = unicodeScalars.lastIndex(of: combiningCharacter.unicodeScalars.first!)
                
                let modifierLetterComponents = combiningCharacter.characterComponents.removing(characterComponents: [direction == .upRight ? .above : .below]) + [direction == .upRight ? .superscript : .subscript]
                
                unicodeScalars.remove(at: combiningCharacterIndex!)
                
                currentLabel = .init(unicodeScalars) + modifierLetterComponents.character
                
                currentCombiningCharacter = nil
            }
        }
        
        if delegate?.documentContext.beforeInput?.last?.description == previousLabel {
            delegate?.delete()
        }
        
        input()
        
        if currentLabel.isEmpty {
            shiftFlag = false
        }
    }
    
    internal enum ShiftDirection: Character {
        case downLeft = "↙︎"
        case down = "↓"
        case downRight = "↘︎"
        case right = "→"
        case upRight = "↗︎"
        case up = "↑"
        case upLeft = "↖︎"
        case left = "←"
    }

    enum KeyboardLayoutMode: String {
        case horizontal
        case vertical

        case `default`
    }
    
    private init() {
        
        UserDefaults.standard.register(defaults: [layoutKey : KeyboardLayout.qwerty.name])
        
        NotificationCenter.default.addObserver(self, selector: #selector(documentContextDidChange), name: .DocumentContextDidChange, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(search), name: .UnicodeDataFilesDidLoad, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(search), name: .DocumentContextDidChange, object: nil)
    }
    
    let characterSequence: CharacterSequence = .init()
    
    @objc private func documentContextDidChange() {
        let documentContextBeforeInput: String = delegate?.documentContext.beforeInput ?? .init()
        
        characterSequence.characters = .init()
        
        var spaceCount = 0
        
        var isNonspaceSequence: Bool = false
        
        cycle: for character in documentContextBeforeInput.reversed() {
            
            switch character {
            case Character.space:
                spaceCount += 1
                
            case Character.return, Character.tab:
                break cycle
                
            default:
                isNonspaceSequence = true
                spaceCount = 0
            }
            
            if spaceCount == 2 {
                break
            }
            
            characterSequence.characters = [character] + characterSequence.characters
            
            if spaceCount == 1 && isNonspaceSequence {
                break
            }
        }
        
        if let scriptTransformation = documentContextBeforeInput.transformationByTargetScriptCode() {
            
            characterSequence.autocompleteDeleteCount = scriptTransformation.sourceString.count
            
            characterSequence.autocompleteText = scriptTransformation.targetString
            
            let labelLength = 10
            characterSequence.autocompleteLabel = (characterSequence.autocompleteText.count > labelLength ? "..." : "") + characterSequence.autocompleteText.suffix(labelLength)
        }
        else if let calculation = Calculator.default.evaluate(expressionFromString: documentContextBeforeInput) {
            
            characterSequence.characters = calculation.expression.map {$0}
            
            if calculation.expression.trimmingCharacters(in: .whitespaces) == calculation.result.trimmingCharacters(in: .whitespaces) {
                characterSequence.autocompleteText = .init()
                characterSequence.autocompleteLabel = .init()
                characterSequence.autocompleteDeleteCount = 0
            }
            else if calculation.expression.contains("=") {
                characterSequence.autocompleteText = calculation.result
                characterSequence.autocompleteLabel = calculation.result
                characterSequence.autocompleteDeleteCount = 0
            }
            else {
                characterSequence.autocompleteText = calculation.result
                characterSequence.autocompleteLabel =  " = " + calculation.result
                characterSequence.autocompleteDeleteCount = calculation.expression.count
            }
            
        }
        else {
            characterSequence.autocompleteText = .init()
            characterSequence.autocompleteLabel = .init()
            characterSequence.autocompleteDeleteCount = 0
        }
    }
    
    let characterSearch: CharacterSearch = .init()
    
    @objc private func search() {
        
        let documentContextBeforeInput = Keyboard.default.delegate?.documentContext.beforeInput ?? .init()
        
        var textForSearch: String = .init(
            documentContextBeforeInput
                .components(separatedBy: .whitespacesAndNewlines).last?
                .split {$0.belongsTo(.symbols)} .last ?? .init()
        )
        
        if textForSearch.contains(.reverseSolidus) {
            textForSearch = .reverseSolidus + ( textForSearch.components(separatedBy: String.reverseSolidus).last ?? .init() )
        }
        
        characterSearch.search(textForSearch.replacingOccurrences(of: String.reverseSolidus, with: ""))
    }
    
    
    private let layoutKey = "LBPQsNPr8gJHi8Ds05etypaTVEiq8X1"
    var layout: KeyboardLayout {
        get {
            return KeyboardLayout.list.filter { $0.name == (UserDefaults.standard.string(forKey: layoutKey) ?? "")}.first ?? .system
        }
        
        set {
            UserDefaults.standard.set(newValue.name, forKey: layoutKey)
            UserDefaults.standard.synchronize()
            
            didChange.send(self)
            Key.keys.forEach {$0.didChange.send($0)}
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
            
            didChange.send(self)
        }
    }

    private let cacheVersionKey = "rBNkEMNHcuYIU3bttg2lYblKGlClU7z"
    var cacheVersion: String {
        get {
            return UserDefaults.standard.object(forKey: cacheVersionKey) as? String ?? .init()
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: cacheVersionKey)
            UserDefaults.standard.synchronize()
        }
    }
}

extension NSNotification.Name {
    
    static let KeyboardStateDidChange: NSNotification.Name = .init("gw93Wf66S7t3GARlTiRirWIBvd4QiSM")
    
    static let DocumentContextDidChange: NSNotification.Name = .init("oDap18soqXQONnkeMJsCZSGmkexar2g")
}

//
//  CharacterSearch.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-06-29.
//

import Foundation
import Combine

@available(iOS 13.0, *)
extension CharacterSearch: ObservableObject {

    var objectWillChange: ObservableObjectPublisher {
        if _objectWillChange == nil {
            _objectWillChange = ObservableObjectPublisher.init()
        }

        return _objectWillChange as! ObservableObjectPublisher
    }
}

class CharacterSearch {
    private var _objectWillChange: Any? = nil
    
    convenience init(query: String) {
        self.init()
        
        search(query)
    }
    
    let searchOperationQueue: OperationQueue = .init()
    
    var text: String = "" {
        didSet {
            
            if oldValue == "" && text == "" {
                return
            }
            
            currentFrequentlyUsedCharacters = frequentlyUsedCharacters
        }
    }
    
    lazy var currentFrequentlyUsedCharacters = frequentlyUsedCharacters
    
    public func search(_ text: String) {
        self.text = text
        searchOperationQueue.cancelAllOperations()
        searchOperationQueue.addOperation( SearchUnicodeScalars.init(characterSearch: self, text: text) )
    }
    
    var foundCharacters: [Character] = [] {
        willSet {
            if #available(iOS 13.0, *) {
                objectWillChange.send()
            }
        }
        
        didSet {
            NotificationCenter.default.post(self)
        }
    }
    
    internal var scriptCodeLength: Int = 0
    
    func insert(item: Int) {
        guard item < foundCharacters.count else {
            return
        }
        
        let isScriptCodeItem: Bool = scriptCodeLength > 0 && item == 0
        
        let deleteCount = isScriptCodeItem ? scriptCodeLength + 1 : text.count
        
        for _ in 0..<deleteCount {
            Keyboard.default.delegate?.delete()
        }
        
        let character = foundCharacters[item]
        
        if !isScriptCodeItem {
            
            if let index = frequentlyUsedCharacters.firstIndex(of: character) {
                frequentlyUsedCharacters.remove(at: index)
            }
            
            frequentlyUsedCharacters = .init( ([character] + frequentlyUsedCharacters).prefix(100) )
        }
        
        Keyboard.default.delegate?.insert(text: character.description)
        NotificationCenter.default.post(.init(name: .DocumentContextDidChange))
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

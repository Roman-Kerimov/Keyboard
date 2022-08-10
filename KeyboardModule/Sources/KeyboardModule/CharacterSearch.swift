//
//  CharacterSearch.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-06-29.
//

import Foundation
import UnicodeData

public class CharacterSearch: NSObject, ObservableObject {
    
    public override func updateLocalizedStrings() {
        lastUsedUnicodeItemsCache = [:]
        search(textBeforeInput: text)
    }
    
    override init() {
        super.init()
        
        searchOperationQueue.maxConcurrentOperationCount = 1
        
        NotificationCenter.default.addLocaleObserver(self)
    }
    
    convenience init(query: String) {
        self.init()
        
        search(textBeforeInput: query)
    }
    
    let searchOperationQueue = OperationQueue()
    
    var text: String = "" {
        didSet {
            
            guard lastUsedCharactersDidChange else {
                return
            }
            
            if oldValue == "" && text == "" {
                return
            }
            
            currentLastUsedCharacters = lastUsedCharacters
            lastUsedCharactersDidChange = false
        }
    }
    
    lazy var currentLastUsedCharacters = lastUsedCharacters
    
    public func search(textBeforeInput: String, queue: DispatchQueue = .main) {
        
        var textForSearch = String(
            textBeforeInput
                .split(whereSeparator: {$0.unicodeScalars.first!.properties.isIdeographic}).last?
                .components(separatedBy: .whitespacesAndNewlines).last?
                .split {$0.belongsTo(.symbols)} .last ?? ""
        )
        
        if textForSearch.contains(.reverseSolidus) {
            textForSearch = .reverseSolidus + (textForSearch.components(separatedBy: String.reverseSolidus).last ?? "")
        }
        
        text = textForSearch.replacingOccurrences(of: String.reverseSolidus, with: "")
        searchOperationQueue.cancelAllOperations()
        searchOperationQueue.addOperation(SearchUnicodeItems(characterSearch: self, text: text, queue: queue))
    }
    
    @Published public var isSearching: Bool = false
    @Published public var foundUnicodeItems: [UnicodeItem] = []
    
    internal var scriptCodeLength: Int = 0
    
    public func insert(item: Int) {
        guard item < foundUnicodeItems.count else {
            return
        }
        
        let isScriptCodeItem: Bool = scriptCodeLength > 0 && item == 0
        
        let deleteCount = isScriptCodeItem ? scriptCodeLength + 1 : text.count
        
        for _ in 0..<deleteCount {
            Keyboard.default.delegate?.delete()
        }
        
        let unicodeItem = foundUnicodeItems[item]
        
        if !isScriptCodeItem {
            
            if let index = lastUsedCharacters.firstIndex(of: unicodeItem.codePoints) {
                lastUsedCharacters.remove(at: index)
            }
            
            lastUsedCharacters = [unicodeItem.codePoints] + lastUsedCharacters
            
            if lastUsedCharacters.count > 100 {
                lastUsedUnicodeItemsCache[lastUsedCharacters.removeLast()] = nil
            }
        }
        
        Keyboard.default.delegate?.insert(text: unicodeItem.codePoints)
        
        lastUsedCharactersDidChange = true
        
        UserDefaults.standard.set(lastUsedCharacters, forKey: lastUsedCharactersKey)
        UserDefaults.standard.synchronize()
        
        NotificationCenter.default.post(name: .documentContextDidChange, object: nil)
    }
    
    private let lastUsedCharactersKey = "LBg6QhTolnUzmtHXeo960LT1ZNd3i07"
    private lazy var lastUsedCharacters = UserDefaults.standard.stringArray(forKey: lastUsedCharactersKey) ?? []
    
    private var lastUsedCharactersDidChange = true
    
    var lastUsedUnicodeItemsCache: [String: UnicodeItem] = [:]
}

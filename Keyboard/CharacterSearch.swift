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
            
            guard frequentlyUsedUnicodeItemsDidChange else {
                return
            }
            
            if oldValue == "" && text == "" {
                return
            }
            
            currentFrequentlyUsedUnicodeItems = frequentlyUsedUnicodeItems
            frequentlyUsedUnicodeItemsDidChange = false
        }
    }
    
    lazy var currentFrequentlyUsedUnicodeItems = frequentlyUsedUnicodeItems
    
    public func search(_ text: String) {
        self.text = text
        searchOperationQueue.cancelAllOperations()
        searchOperationQueue.addOperation( SearchUnicodeScalars.init(characterSearch: self, text: text) )
    }
    
    var foundUnicodeItems: [UnicodeItem] = [] {
        willSet {
            if #available(iOS 13.0, *) {
                DispatchQueue.main.async {
                    self.objectWillChange.send()
                }
            }
        }
        
        didSet {
            NotificationCenter.default.post(self)
        }
    }
    
    internal var scriptCodeLength: Int = 0
    
    func insert(item: Int) {
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
            
            if let index = frequentlyUsedUnicodeItems.firstIndex(of: unicodeItem) {
                frequentlyUsedUnicodeItems.remove(at: index)
            }
            
            frequentlyUsedUnicodeItems = .init( ([unicodeItem] + frequentlyUsedUnicodeItems).prefix(100) )
        }
        
        Keyboard.default.delegate?.insert(text: unicodeItem.codePoints)
        NotificationCenter.default.post(.init(name: .DocumentContextDidChange))
        
        frequentlyUsedUnicodeItemsDidChange = true
        
        UserDefaults.standard.set(frequentlyUsedUnicodeItems.map {$0.codePoints}, forKey: frequentlyUsedUnicodeItemsKey)
        UserDefaults.standard.synchronize()
    }
    
    private let frequentlyUsedUnicodeItemsKey = "LBg6QhTolnUzmtHXeo960LT1ZNd3i07"
    private lazy var frequentlyUsedUnicodeItems: [UnicodeItem] = UserDefaults.standard.stringArray(forKey: frequentlyUsedUnicodeItemsKey)?.compactMap {UnicodeData.default.item(byCodePoints: $0)} ?? []
    
    private var frequentlyUsedUnicodeItemsDidChange = true
}

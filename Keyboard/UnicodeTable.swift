//
//  UnicodeTable.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import Foundation

class UnicodeTable: NSObject {
    
    public static let `default`: UnicodeTable = .init()
    
    internal var codePointNames: [UInt32: String] = .init()
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    private override init() {
        super.init()
        
        backgroudOperationQueue.addOperation( LoadUnicodeDataFiles.init() )
    }

    internal var textForSearch: String = .init() {
        didSet {
            
            if oldValue == "" && textForSearch == "" {
                return
            }
            
            frequentlyUsedCharacters = Keyboard.default.frequentlyUsedCharacters
        }
    }
    
    internal var frequentlyUsedCharacters: [Character] = Keyboard.default.frequentlyUsedCharacters
    
    public func searchScalars(byName text: String, for characterCollectionView: CharacterCollectionView) {
        if let searchUnicodeScalarsOperation = backgroudOperationQueue.operations.last as? SearchUnicodeScalars {
            searchUnicodeScalarsOperation.cancel()
        }
        
        textForSearch = text.uppercased()
        
        backgroudOperationQueue.addOperation( SearchUnicodeScalars.init(for: characterCollectionView) )
    }
}

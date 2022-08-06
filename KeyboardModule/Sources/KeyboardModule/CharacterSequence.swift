//
//  CharacterSequence.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2019-07-01.
//

import Foundation

public final class CharacterSequence: ObservableObject {
    
    func set(characters: [Character]) {
        documentContextItems = characters.map {Item(character: $0)}
        items = documentContextItems
    }
    
    public final class Item: ObservableObject, Identifiable, Hashable {
        public static func == (lhs: CharacterSequence.Item, rhs: CharacterSequence.Item) -> Bool {
            lhs.id == rhs.id
        }
        
        public func hash(into hasher: inout Hasher) {
            hasher.combine(id)
        }
        
        public let id = UUID()
        var offset = 0
        @Published var character: String
        
        init(character: Character) {
            self.character = character.description
        }
        
        func uppercase() {
            character = character.uppercased()
        }
        
        func lowercase() {
            character = character.lowercased()
        }
    }
    
    private var documentContextItems: [Item] = []
    
    @Published public var items: [Item] = [] {
        didSet {
            items.indices.forEach { index in
                items[index].offset = index
            }
        }
    }
    
    @Published public var contentWidth: Double = 0
    
    public func performCharacterSequenceUpdates() {
        
        documentContextItems.forEach { (_) in
            Keyboard.default.delegate?.delete()
        }
        
        let shouldRemoveFirstSpace = items.first?.character != .space
        
        removeDoubleSpace()
        
        let text: String
        
        if items.first?.character == .space && shouldRemoveFirstSpace {
            text = items.map(\.character).dropFirst().joined()
        } else {
            text = items.map(\.character).joined()
        }
        
        Keyboard.default.delegate?.insert(text: text)
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
    
    private func removeDoubleSpace() {
        for item in items {
            if item.character == .space && item.offset > 0 && items[item.offset - 1].character == .space {
                items.remove(at: item.offset)
                break
            }
        }
    }
    
    @Published public var autocompleteText = ""
    @Published public var autocompleteLabel = ""
    @Published var autocompleteDeleteCount = 0
    
    @objc public func autocomplete() {
        for _ in 0..<autocompleteDeleteCount {
            Keyboard.default.delegate?.delete()
        }
        
        autocompleteDeleteCount = 0
        
        Keyboard.default.delegate?.insert(text: autocompleteText)
        
        autocompleteText = .init()
        autocompleteLabel = .init()
        
        NotificationCenter.default.post(name: .DocumentContextDidChange, object: nil)
    }
}

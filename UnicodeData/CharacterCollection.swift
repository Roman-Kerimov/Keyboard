//
//  CharacterCollection.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2020-02-03.
//

import Foundation

struct CharacterCollection: Identifiable, Equatable {
    var id: String {language}
    
    private let managed: ManagedCharacterCollection
    
    init(managed: ManagedCharacterCollection) {
        self.managed = managed
    }
    
    private var language: String {managed.language!}
    
    var locale: Foundation.Locale {.init(identifier: language)}
    
    func localizedLanguage(locale: Locale) -> String {
        locale.localizedString(forIdentifier: language) ?? language
    }
    
    var main: [String]? {managed.main}
    var keyboardIntersection: [String]? {managed.keyboardIntersection}
    
    var characters: [String] {
        return (main ?? keyboardIntersection ?? []).filter({$0.count != 1 || !Character($0).isASCII})
    }
}
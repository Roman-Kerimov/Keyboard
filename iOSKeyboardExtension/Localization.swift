//
//  Localization.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 22.01.17.
//
//

enum Language: String {
    case cs = "cs"
    case de = "de"
    case en = "en"
    case es = "es"
    case fr = "fr"
    case it = "it"
    case nl = "nl"
    case pl = "pl"
    case pt = "pt"
    case ru = "ru"
    case sv = "sv"
}

protocol LocalizableString {
    static var cs: String {get}
    static var de: String {get}
    static var en: String {get}
    static var es: String {get}
    static var fr: String {get}
    static var it: String {get}
    static var nl: String {get}
    static var pl: String {get}
    static var pt: String {get}
    static var ru: String {get}
    static var sv: String {get}
}

extension LocalizableString {
    static var string: String {
        switch Internationalize.language {
            case .cs: return cs
            case .de: return de
            case .en: return en
            case .es: return es
            case .fr: return fr
            case .it: return it
            case .nl: return nl
            case .pl: return pl
            case .pt: return pt
            case .ru: return ru
            case .sv: return sv
        }
    }
}

//
//  Languages.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-01-22.
//
//

import LinguisticKit

enum Language: String, CaseIterable {
    //case az
    //case az_Cyrl
    case ca
    case cs
    case da
    case de
    case el
    case en
    case eo
    case es
    case es_MX
    case fi
    case fr
    case hr
    case hu
    case id
    case it
    case ms
    case nb
    case nl
    case pl
    case pt_PT
    case pt_BR
    case ro
    case ru_Cyrl
    case ru_Latn
    case sk
    case sv
    case tr
    case uk
    case vi
}

protocol LocalizedString {
    //static var az: String {get}
    //static var az_Cyrl: String {get}
    static var ca: String {get}
    static var cs: String {get}
    static var da: String {get}
    static var de: String {get}
    static var el: String {get}
    static var en: String {get}
    static var eo: String {get}
    static var es: String {get}
    static var es_MX: String {get}
    static var fi: String {get}
    static var fr: String {get}
    static var hr: String {get}
    static var hu: String {get}
    static var id: String {get}
    static var it: String {get}
    static var ms: String {get}
    static var nb: String {get}
    static var nl: String {get}
    static var pl: String {get}
    static var pt_PT: String {get}
    static var pt_BR: String {get}
    static var ro: String {get}
    static var ru: String {get}
    static var sk: String {get}
    static var sv: String {get}
    static var tr: String {get}
    static var uk: String {get}
    static var vi: String {get}
}

extension LocalizedString {
    static var string: String {
        switch Settings.current.language {
            //case .az: return az
            //case .az_Cyrl: return az_Cyrl
            case .ca: return ca
            case .cs: return cs
            case .da: return da
            case .de: return de
            case .el: return el
            case .en: return en
            case .eo: return eo
            case .es: return es
            case .es_MX: return es_MX
            case .fi: return fi
            case .fr: return fr
            case .hr: return hr
            case .hu: return hu
            case .id: return id
            case .it: return it
            case .ms: return ms
            case .nb: return nb
            case .nl: return nl
            case .pl: return pl
            case .pt_PT: return pt_PT
            case .pt_BR: return pt_BR
            case .ro: return ro
            case .ru_Cyrl: return ru
            case .ru_Latn: return ru.applyingTransform(from: .Cyrl, to: .Latn, withTable: .ru)!
            case .sk: return sk
            case .sv: return sv
            case .tr: return tr
            case .uk: return uk
            case .vi: return vi
        }
    }
}

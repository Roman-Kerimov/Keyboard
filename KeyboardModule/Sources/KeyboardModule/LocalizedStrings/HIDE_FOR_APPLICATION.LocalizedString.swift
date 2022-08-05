//
//  HIDE_FOR_APPLICATION.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-06-15.
//

#if canImport(AppKit)
import AppKit

public struct HIDE_FOR_APPLICATION: LocalizedString {}

public extension HIDE_FOR_APPLICATION {
    static let az        = ""
    static let az_Cyrl   = ""
    static let ca        = ""
    static let cs        = ""
    static let da        = ""
    static let de        = ""
    static let el        = ""
    static let en        = "Hide for \(NSWorkspace.shared.frontmostApplicationName)"
    static let eo        = ""
    static let es        = ""
    static let es_MX     = ""
    static let fi        = ""
    static let fr        = ""
    static let hr        = ""
    static let hu        = ""
    static let id        = ""
    static let it        = ""
    static let ms        = ""
    static let nb        = ""
    static let nl        = ""
    static let pl        = ""
    static let pt_PT     = ""
    static let pt_BR     = ""
    static let ro        = ""
    static let ru        = "Скрыть для \(NSWorkspace.shared.frontmostApplicationName)"
    static let sk        = ""
    static let sv        = ""
    static let tr        = ""
    static let uk        = ""
    static let vi        = ""
}
#endif
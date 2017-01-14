//
//  InternationalizedStrings.swift
//  iOSKeyboard
//
//  Created by Roman Kerimov on 14.01.17.
//
//

struct NonConversionModeTitle: InternationalizedString {
    static var de: String {return "ss"}
    static var en: String {return "ae"}
    static var es: String {return "nn"}
    static var fr: String {return ""}
    static var it: String {return ""}
    static var pt: String {return ""}
    static var ru: String {return "ya"}
    static var sv: String {return ""}
}

struct ConversionModeTitle: InternationalizedString {
    static var de: String {return "ß"}
    static var en: String {return "æ"}
    static var es: String {return "ñ"}
    static var fr: String {return ""} // Ç ç
    static var it: String {return ""}
    static var pt: String {return ""}
    static var ru: String {return "я"}
    static var sv: String {return ""} // Å å
}

struct KeyboardLayoutSectionTitle: InternationalizedString {
    static var de: String {return "Tastaturbelegung"}
    static var en: String {return "Keyboard Layout"}
    static var es: String {return "Distribución del teclado"}
    static var fr: String {return "Disposition du clavier"} //| Clavier | Disposition des touches d'un clavier de saisie
    static var it: String {return "Layout della tastiera"}
    static var pt: String {return "Layout de teclado"}
    static var ru: String {return "Раскладка клавиатуры"}
    static var sv: String {return "Tangentbordslayout"}
}

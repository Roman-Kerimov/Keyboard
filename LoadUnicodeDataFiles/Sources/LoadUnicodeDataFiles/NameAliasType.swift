//
//  NameAliasType.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2019-12-31.
//

// UCD/NameAliases.txt

enum NameAliasType: String {
    case correction
        // Corrections for serious problems in the character names
    
    case control
        // ISO 6429 names for C0 and C1 control functions, and other
        // commonly occurring names for control codes
    
    case alternate
        // A few widely used alternate names for format characters
    
    case figment
        // Several documented labels for C1 control code points which
        // were never actually approved in any standard
    
    case abbreviation
        // Commonly occurring abbreviations (or acronyms) for control codes,
        // format characters, spaces, and variation selectors
}

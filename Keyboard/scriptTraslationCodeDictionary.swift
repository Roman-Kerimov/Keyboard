//
//  scriptTraslationCodeDictionary.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2018-12-03.
//

import LinguisticKit

let scriptTraslationCodeDictionary: [String: (table: ScriptTable, source: Script, target: Script)] = [
    "ru": (.ru, .Latn, .Cyrl),
    "rul": (.ru, .Cyrl, .Latn),
]

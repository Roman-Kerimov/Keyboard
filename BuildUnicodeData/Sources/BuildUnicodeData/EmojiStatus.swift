//
//  EmojiStatus.swift
//  BuildUnicodeData
//
//  Created by Roman Kerimov on 2019-12-31.
//

// Emoji/emoji-test.txt

enum EmojiStatus: String {
    case component = "component"
        // — an Emoji_Component,
        //   excluding Regional_Indicators, ASCII, and non-Emoji.
    
    case fullyQualified = "fully-qualified"
        // — a fully-qualified emoji (see ED-18 in UTS #51),
        //   excluding Emoji_Component
    
    case minimallyQualified = "minimally-qualified"
        // — a minimally-qualified emoji (see ED-18a in UTS #51)
    
    case unqualified = "unqualified"
        // — a unqualified emoji (See ED-19 in UTS #51)
}

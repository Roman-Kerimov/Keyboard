//
//  CharacterComponent.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

import Foundation

enum CharacterComponent {
    private static let commutative: Set<CharacterComponent> = .init([.capital, .smallCapital, .superscript, .subscript] + extraComponents + letterToModifierComponentDictionary.values.filter {$0 != .extraH})
    
    public var isCommutative: Bool {
        return CharacterComponent.commutative.contains(self)
    }
    
    internal static let extraComponents: [CharacterComponent] = [.extra0, .letterScript, .turned, .reversed, .inverted, .sideways, .extra1, .extra2]
    
    internal var isExtraComponent: Bool {
        return CharacterComponent.extraComponents.contains(self)
    }
    
    case fractionSlash
    
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    case space, exclamationMark, quotationMark, numberSign, dollarSign, percentSign, ampersand, apostrophe, parenthesis, asterisk, plusSign, comma, fullStop, solidus, colon, semicolon, lessThanSign, equalsSign, greaterThanSign, questionMark, commercialAt, squareBracket, caret, lowLine, curlyBracket, verticalLine, tilde
    
    case tildeOperator
    
    case short
    
    case hyphen, quotation
    case nonBreaking
    
    case commaQuotationMark, angleQuotationMark
    
    case minusSign
    case multiplicationSign
    case divisionSign
    
    case notSign
    case egyptologialAlef, egyptologicalAin
    case glottalStop, ain, saltillo, sinologicalDot
    case interrobang
    
    case capital, smallCapital
    case extra0, turned, reversed, inverted, sideways, extra1, extra2
    case extraLeft
    case superscript, `subscript`, middle, raised
    
    case highStroke, topbar
    case stroke, shortStroke, longStroke, lightCentralizationStroke, obliqueStroke
    case lowStroke
    case diagonalStroke, shortDiagonalStroke, longDiagonalStroke
    case longLeg
    case hook, retroflexHook, palatalHook
    case tone
    case extraH
    case closed
    case horn
    case curl, belt, crossedTail, loop
    case tail, notch, flourish
    case descender
    case um
    case sBottom
    case not, notLow
    case lazyS
    case zDigraph
    
    internal static let letterToModifierComponentDictionary: [CharacterComponent: CharacterComponent] = [
        //.highStroke
        //.topbar
        .hyphen: .stroke,
        //.shortStroke
        //.longStroke
        //.lightCentralizationStroke
        //.obliqueStroke
        //.lowStroke
        .solidus: .diagonalStroke,
        .l: .longLeg,
        .f: .hook,
        .t: .retroflexHook,
        .j: .palatalHook,
        //.tone
        .h: .extraH,
        .o: .closed,
        //.horn
        .c: .curl,
        .b: .belt,
        //.crossedTail, .loop
        .v: .tail, //.notch
        //.flourish
        .q: .descender,
        //.um
        //.sBottom
        //.not, .notLow
        //.lazyS
        .z: .zDigraph
    ]
    
    case letterScript
    case insular
    case middleWelsh
    case visigothic
    case volapuk
    case broken
    case archaic
    case vend
    
    case greek, final, symbol, lunate
    
    case doubleStruck
    case script
    case fraktur
    case sansSerif
    case monospace
    
    case blackletter, lenis, stirrup, withoutHandle, baseline, shortRightLeg, serif
    
    case bold, italic
    
    case cedilla
    case ogonek
    case diaeresis
    case dot
    case macron
    case breve
    case invertedBreve
    case caron
    case ring, ringBottom
    case acute
    case grave
    case circumflex
    case cross
    case line
    case bridge
    case invertedBridge
    case square
    case verticalTilde
    case zigzag
    case snake
    
    case doubled
    case double
    
    case above, aboveLeft, aboveRight
    case combining
    case below, belowLeft, belowRight
    
    case click
    case long, halfLong
    case rhoticHook
    case modifierPlus
    case modifierMinus
    case unaspirated, modifierEqualsSign
    case modifierPrime
    case modifierColon
    case shelf
    
    case tack, modifierTack
    case arrowhead
    case angle
    
    case up
    case left
    case right
    case down
    
    case topHalf
    case leftHalf
    case rightHalf
    case bottomHalf

    case extraHighTone
    case highTone
    case midTone
    case lowTone
    case extraLowTone
    
    case beginHighTone, endHighTone
    case beginLowTone, endLowTone
}

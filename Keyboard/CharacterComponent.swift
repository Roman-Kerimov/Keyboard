//
//  CharacterComponent.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

import Foundation

enum CharacterComponent {
    private static let commutative: Set<CharacterComponent> = Set.init([.capital, .smallCapital, .superscript, .subscript] + extraComponents + letterToMixingComponentDictionary.values.filter {$0 != .extraH && $0 != .tilde}).union(scripts)
    
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
    
    case minusSign
    case multiplicationSign
    case divisionSign
    
    case egyptologialAlef, egyptologicalAin
    case glottalStop, ain, saltillo, sinologicalDot
    case interrobang
    
    case capital, smallCapital
    case extra0, turned, reversed, inverted, sideways, extra1, extra2
    case extraLeft, extraUpLeft, extraDownLeft, extraRight, extraUpRight, extraDownRight
    case superscript, `subscript`, middle, raised
    
    case highStroke, topbar
    case stroke, lightCentralizationStroke, obliqueStroke
    case lowStroke
    case diagonalStroke
    case longLeg
    case hook, retroflexHook, palatalHook
    case tone
    case extraH
    case closed
    case curl, belt
    case tail, notch, flourish
    case descender
    case um
    case sBottom
    case not, notLow
    case lazyS
    case zDigraph
    
    internal static let letterToMixingComponentDictionary: [CharacterComponent: CharacterComponent] = [
        //.highStroke
        //.topbar
        .hyphen: .stroke, //.diagonalStroke
        //.lightCentralizationStroke
        //.obliqueStroke
        //.lowStroke
        .l: .longLeg,
        .f: .hook,
        .t: .retroflexHook,
        .j: .palatalHook,
        //.tone
        .h: .extraH,
        .o: .closed, //.ring, .ringBottom
        .c: .curl,
        .b: .belt,
        .v: .tail, //.notch
        //.flourish
        .q: .descender,
        //.um
        //.sBottom
        //.not, .notLow
        //.lazyS
        .z: .zDigraph,
        .n: .tilde,
        
        // block tilde diacritic from tilde
        .tilde: .space,
    ]
    
    case letterScript
    case insular
    case middleWelsh
    case visigothic
    case volapuk
    case broken
    case archaic
    case vend
    
    static let scripts: Set<CharacterComponent> = [.greek]
    
    case greek, final, symbol, lunate
    
    case doubleStruck
    case script
    case fraktur
    case sansSerif
    case monospace
    
    case blackletter, lenis, stirrup, withoutHandle, baseline, shortRightLeg, serif
    
    case bold, italic
    
    case horn
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
    case shortStroke, longStroke
    case shortDiagonalStroke, longDiagonalStroke
    case tildeOverlay
    case ringOverlay
    case verticalLineOverlay
    
    internal static let letterToCombiningComponentDictionary: [CharacterComponent: CharacterComponent] = [
        // .horn
        .e: .diaeresis,
        .c: .ogonek,
        .fullStop: .dot,
        .hyphen: .macron, // .line
        .u: .breve, // .invertedBreve
        .v: .caron,
        .o: .ring,
        .a: .acute,
        .g: .grave,
        .l: .verticalLine,
        .h: .circumflex,
        .x: .cross,
        .d: .bridge, // .invertedBridge
        .q: .square,
        .n: .tilde,
        .s: .cedilla, // .snake .verticalTilde
        .z: .zigzag,
        .f: .hook,
        .j: .palatalHook,
        .t: .retroflexHook,
        .lowLine: .shortStroke, // .longStroke
        .solidus: .shortDiagonalStroke, // .longDiagonalStroke
        .tilde: .tildeOverlay,
        // .ringOverlay
        .verticalLine: .verticalLineOverlay
    ]
    
    case doubled
    case tripled
    
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

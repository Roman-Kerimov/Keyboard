//
//  CharacterComponent.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

import Foundation

enum CharacterComponent: String, CaseIterable {
    private static let commutative: Set<CharacterComponent> = Set.init([.capital, .smallCapital, .superscript, .subscript, .above, .below, .extraUpLeft, .extraLeft, .extraDownLeft, .extraUpRight, .extraRight, .extraDownRight, .extraDown] + extraComponents + letterToMixingComponentDictionary.values.filter {![.extraH, .tilde, .ring].contains($0)}).union(scripts)
    
    public var isCommutative: Bool {
        return CharacterComponent.commutative.contains(self)
    }
    
    internal static let extraComponents: [CharacterComponent] = [.extra0, .dotless, .letterScript, .turned, .reversed, .inverted, .sideways, .extra1, .extra2]
    
    internal var isExtraComponent: Bool {
        return CharacterComponent.extraComponents.contains(self)
    }
    
    case fractionSlash
    
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    case space, exclamationMark, quotationMark, numberSign, dollarSign, percentSign, ampersand, apostrophe, leftParenthesis, rightParenthesis, asterisk, plusSign, comma, fullStop, solidus, colon, semicolon, lessThanSign, equalsSign, greaterThanSign, questionMark, commercialAt, squareBracket, caret, lowLine, curlyBracket, verticalLine, tilde
    
    case tildeOperator
    
    case short
    
    case hyphen, quotation
    case nonBreaking
    
    case minusSign
    case multiplicationSign
    case divisionSign
    
    case degree
    case prime
    case egyptologialAlef, egyptologicalAin
    case glottalStop, ain, saltillo, sinologicalDot
    case interrobang
    
    case smallCapital
    case capital
    case extraLeft, extraUpLeft, extraDownLeft, extraRight, extraUpRight, extraDownRight, extraDown
    case extra0, turned, reversed, inverted, sideways, extra1, extra2
    case superscript, `subscript`, middle, raised
    
    case dotless
    case highStroke, topbar
    case stroke, lightCentralizationStroke, obliqueStroke, verticalStroke
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
    case ejective
    case middleStem
    
    static let baseComponents = mergeDictionaries(
        Dictionary.init(uniqueKeysWithValues: letterToMixingComponentDictionary.map {($1, $0)}),
        Dictionary.init(uniqueKeysWithValues: letterToCombiningComponentDictionary.map {($1, $0)})
    )
    
    static func mergeDictionaries(_ lhs: Dictionary<CharacterComponent, CharacterComponent>, _ rhs: Dictionary<CharacterComponent, CharacterComponent>) -> Dictionary<CharacterComponent, CharacterComponent> {
        var result = lhs
        
        for (key, value) in rhs {
            if let lhsValue = lhs[key] {
                if lhsValue != value {
                    fatalError()
                }
            }
            
            result[key] = value
        }
        
        return result
    }
    
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
        .o: .ring, // (.closed)
        //.ringBottom
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
        .comma: .ejective,
        .fullStop: .dot,
        
        // block tilde diacritic from tilde
        .tilde: .space,
    ]
    
    static let replaces: [CharacterComponent: [CharacterComponent]] = [
        .closed: [.ring],
        .interrobang: [.exclamationMark, .extraDown],
    ]
    
    case letterScript
    case insular
    case middleWelsh
    case visigothic
    case volapuk
    case broken
    case archaic
    case vend
    case anglicana
    
    static let scripts: Set<CharacterComponent> = [.cyrillic, .greek, .latin]
    
    case cyrillic, titlo, palatalization, pokrytie
    case greek, final, symbol, lunate, dasia, psili
    case latin
    
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
    case open
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
    case parentheses
    
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
        .verticalLine: .verticalLineOverlay,
        .leftParenthesis: .parentheses,
    ]
    
    case doubled
    case tripled
    case quadrupled
    
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
    
    // Service components
    case combined
    case none
}

private let ordinalNumbers: [CharacterComponent: Int] = .init(uniqueKeysWithValues: CharacterComponent.allCases.enumerated().map {($1, $0)} )

extension CharacterComponent: Comparable {
    static func < (lhs: CharacterComponent, rhs: CharacterComponent) -> Bool {
        return ordinalNumbers[lhs]! < ordinalNumbers[rhs]!
    }
}

extension CharacterComponent: CustomStringConvertible {
    var description: String {
        return ".\(rawValue)"
    }
}

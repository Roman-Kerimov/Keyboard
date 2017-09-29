//
//  CharacterComponent.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

import Foundation

enum CharacterComponent {
    
    case joiner
    
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    case space, exclamationMark, quotationMark, numberSign, dollarSign, percentSign, ampersand, apostrophe, parenthesis, asterisk, plusSign, comma, hyphenMinus, fullStop, solidus, colon, semicolon, lessThanSign, equalsSign, greaterThanSign, questionMark, commercialAt, squareBracket, reverseSolidus, caret, lowLine, graveAccent, curlyBracket, verticalLine, tilde
    
    case minusSign
    
    case capital, smallCapital
    case turned, reversed, inverted, ramsHorn
    case superscript, `subscript`
    
    case stroke, shortStroke, longStroke
    case diagonalStroke, shortDiagonalStroke, longDiagonalStroke
    case longLeg
    case L
    case hook, retroflexHook, palatalHook
    case topbar
    case tone
    case open, closed
    case horn
    case curl, belt
    case tail
    case dTop
    case sBottom
    case uTop
    case wTop
    
    case script
    
    case cedilla
    case ogonek
    case diaeresis
    case dot
    case macron
    case breve
    case invertedBreve
    case caron
    case ring
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
    
    case doubled
    case double
    
    case above, aboveRight
    case combining
    case below
    
    case click
    case long, halfLong
    case rhoticHook
    case modifierPlus
    case modifierMinus
    case unaspirated
    case modifierPrime
    case shelf
    
    case tack, modifierTack
    case arrowhead
    case arrow
    case angle
    
    case up
    case left
    case right
    case down
    
    case topHalf
    case leftHalf
    case rightHalf
    case bottomHalf

    case extraHightTone
    case hightTone
    case midTone
    case lowTone
    case extraLowTone
}

//
//  CharacterComponent.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

import Foundation

enum CharacterComponent {
    
    case joiner
    case fractionSlash
    
    case a, b, c, d, e, f, g, h, i, j, k, l, m, n, o, p, q, r, s, t, u, v, w, x, y, z
    
    case zero, one, two, three, four, five, six, seven, eight, nine
    
    case space, exclamationMark, quotationMark, numberSign, dollarSign, percentSign, ampersand, apostrophe, parenthesis, asterisk, plusSign, comma, hyphenMinus, fullStop, solidus, colon, semicolon, lessThanSign, equalsSign, greaterThanSign, questionMark, commercialAt, squareBracket, caret, lowLine, graveAccent, curlyBracket, verticalLine, tilde
    
    case short
    
    case hyphen, quotation
    case nonBreaking
    
    case commaQuotationMark, angleQuotationMark
    
    case minusSign
    case multiplicationSign
    case divisionSign
    
    case notSign
    case schwa
    
    case capital, smallCapital
    case extra0, turned, reversed, inverted, ramsHorn, sideways, extra1, extra2
    case extraLeft
    case superscript, `subscript`
    
    case stroke, shortStroke, longStroke, lightCentralizationStroke
    case diagonalStroke, shortDiagonalStroke, longDiagonalStroke
    case longLeg
    case L
    case hook, retroflexHook, palatalHook
    case topbar
    case tone
    case open, closed
    case horn
    case curl, belt, crossedTail, loop
    case tail, notch
    case descender
    case dTop
    case sBottom
    case uTop
    case wTop
    case not
    
    case letterScript
    case insular
    case middleWelsh
    
    case greek, final, symbol, lunate
    
    case doubleStruck
    case script
    case fraktur
    case sansSerif
    
    case italic
    
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
    case unaspirated
    case modifierPrime
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

    case extraHightTone
    case hightTone
    case midTone
    case lowTone
    case extraLowTone
}

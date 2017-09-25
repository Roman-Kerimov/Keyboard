//
//  CharacterToComponentsDictionary.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

import Foundation

let characterToComponentsDictionary: [Character: [CharacterComponent]] = [
    
    // MARK: - 0000..007F; Basic Latin
    
    //0020          ; SPACE
    " ":            [.space],
    
    //0021          ; EXCLAMATION MARK
    "!":            [.exclamationMark],
    
    //0022          ; QUOTATION MARK
    "\"":           [.quotationMark],
    
    //0023          ; NUMBER SIGN
    "#":            [.numberSign],
    
    //0024          ; DOLLAR SIGN
    "$":            [.dollarSign],
    
    //0025          ; PERCENT SIGN
    "%":            [.percentSign],
    
    //0026          ; AMPERSAND
    "&":            [.ampersand],
    
    //0027          ; APOSTROPHE
    "'":            [.apostrophe],
    
    //0028          ; LEFT PARENTHESIS
    "(":            [.parenthesis],
    
    //0029          ; RIGHT PARENTHESIS
    ")":            [.parenthesis, .turned],
    
    //002A          ; ASTERISK
    "*":            [.asterisk],
    
    //002B          ; PLUS SIGN
    "+":            [.plusSign],
    
    //002C          ; COMMA
    ",":            [.comma],
    
    //002D          ; HYPHEN-MINUS
    "-":            [.hyphenMinus],
    
    //002E          ; FULL STOP
    ".":            [.fullStop],
    
    //002F          ; SOLIDUS
    "/":            [.solidus],
    
    //0030          ; DIGIT ZERO
    "0":            [.zero],
    
    //0031          ; DIGIT ONE
    "1":            [.one],
    
    //0032          ; DIGIT TWO
    "2":            [.two],
    
    //0033          ; DIGIT THREE
    "3":            [.three],
    
    //0034          ; DIGIT FOUR
    "4":            [.four],
    
    //0035          ; DIGIT FIVE
    "5":            [.five],
    
    //0036          ; DIGIT SIX
    "6":            [.six],
    
    //0037          ; DIGIT SEVEN
    "7":            [.seven],
    
    //0038          ; DIGIT EIGHT
    "8":            [.eight],
    
    //0039          ; DIGIT NINE
    "9":            [.nine],
    
    //003A          ; COLON
    ":":            [.colon],

    //003B          ; SEMICOLON
    ";":            [.semicolon],

    //003C          ; LESS-THAN SIGN
    "<":            [.lessThanSign],

    //003D          ; EQUALS SIGN
    "=":            [.equalsSign],

    //003E          ; GREATER-THAN SIGN
    ">":            [.greaterThanSign],

    //003F          ; QUESTION MARK
    "?":            [.questionMark],

    //0040          ; COMMERCIAL AT
    "@":            [.commercialAt],

    //0041          ; LATIN CAPITAL LETTER A
    "a":            [.a, .capital],

    //0042          ; LATIN CAPITAL LETTER B
    "b":            [.b, .capital],

    //0043          ; LATIN CAPITAL LETTER C
    "c":            [.c, .capital],

    //0044          ; LATIN CAPITAL LETTER D
    "d":            [.d, .capital],

    //0045          ; LATIN CAPITAL LETTER E
    "e":            [.e, .capital],

    //0046          ; LATIN CAPITAL LETTER F
    "f":            [.f, .capital],

    //0047          ; LATIN CAPITAL LETTER G
    "g":            [.g, .capital],

    //0048          ; LATIN CAPITAL LETTER H
    "h":            [.h, .capital],

    //0049          ; LATIN CAPITAL LETTER I
    "i":            [.i, .capital],

    //004A          ; LATIN CAPITAL LETTER J
    "j":            [.j, .capital],

    //004B          ; LATIN CAPITAL LETTER K
    "k":            [.k, .capital],

    //004C          ; LATIN CAPITAL LETTER L
    "l":            [.l, .capital],

    //004D          ; LATIN CAPITAL LETTER M
    "m":            [.m, .capital],

    //004E          ; LATIN CAPITAL LETTER N
    "n":            [.n, .capital],

    //004F          ; LATIN CAPITAL LETTER O
    "o":            [.o, .capital],

    //0050          ; LATIN CAPITAL LETTER P
    "p":            [.p, .capital],

    //0051          ; LATIN CAPITAL LETTER Q
    "q":            [.q, .capital],

    //0052          ; LATIN CAPITAL LETTER R
    "r":            [.r, .capital],

    //0053          ; LATIN CAPITAL LETTER S
    "s":            [.s, .capital],

    //0054          ; LATIN CAPITAL LETTER T
    "t":            [.t, .capital],

    //0055          ; LATIN CAPITAL LETTER U
    "u":            [.u, .capital],

    //0056          ; LATIN CAPITAL LETTER V
    "v":            [.v, .capital],

    //0057          ; LATIN CAPITAL LETTER W
    "w":            [.w, .capital],

    //0058          ; LATIN CAPITAL LETTER X
    "x":            [.x, .capital],

    //0059          ; LATIN CAPITAL LETTER Y
    "y":            [.y, .capital],

    //005A          ; LATIN CAPITAL LETTER Z
    "z":            [.z, .capital],

    //005B          ; LEFT SQUARE BRACKET
    "[":            [.squareBracket],

    //005C          ; REVERSE SOLIDUS
    "\\":           [.reverseSolidus],

    //005D          ; RIGHT SQUARE BRACKET
    "]":            [.squareBracket, .turned],

    //005E          ; CIRCUMFLEX ACCENT
    "^":            [.caret],

    //005F          ; LOW LINE
    "_":            [.lowLine],

    //0060          ; GRAVE ACCENT
    "`":            [.graveAccent],

    //0061          ; LATIN SMALL LETTER A
    "a":            [.a],

    //0062          ; LATIN SMALL LETTER B
    "b":            [.b],

    //0063          ; LATIN SMALL LETTER C
    "c":            [.c],

    //0064          ; LATIN SMALL LETTER D
    "d":            [.d],

    //0065          ; LATIN SMALL LETTER E
    "e":            [.e],

    //0066          ; LATIN SMALL LETTER F
    "f":            [.f],

    //0067          ; LATIN SMALL LETTER G
    "g":            [.g],

    //0068          ; LATIN SMALL LETTER H
    "h":            [.h],

    //0069          ; LATIN SMALL LETTER I
    "i":            [.i],

    //006A          ; LATIN SMALL LETTER J
    "j":            [.j],

    //006B          ; LATIN SMALL LETTER K
    "k":            [.k],

    //006C          ; LATIN SMALL LETTER L
    "l":            [.l],

    //006D          ; LATIN SMALL LETTER M
    "m":            [.m],

    //006E          ; LATIN SMALL LETTER N
    "n":            [.n],

    //006F          ; LATIN SMALL LETTER O
    "o":            [.o],

    //0070          ; LATIN SMALL LETTER P
    "p":            [.p],

    //0071          ; LATIN SMALL LETTER Q
    "q":            [.q],

    //0072          ; LATIN SMALL LETTER R
    "r":            [.r],

    //0073          ; LATIN SMALL LETTER S
    "s":            [.s],

    //0074          ; LATIN SMALL LETTER T
    "t":            [.t],

    //0075          ; LATIN SMALL LETTER U
    "u":            [.u],

    //0076          ; LATIN SMALL LETTER V
    "v":            [.v],

    //0077          ; LATIN SMALL LETTER W
    "w":            [.w],

    //0078          ; LATIN SMALL LETTER X
    "x":            [.x],

    //0079          ; LATIN SMALL LETTER Y
    "y":            [.y],

    //007A          ; LATIN SMALL LETTER Z
    "z":            [.z],

    //007B          ; LEFT CURLY BRACKET
    "{":            [.curlyBracket],

    //007C          ; VERTICAL LINE
    "|":            [.verticalLine],

    //007D          ; RIGHT CURLY BRACKET
    "}":            [.curlyBracket, .turned],

    //007E          ; TILDE
    "~":            [.tilde],

]

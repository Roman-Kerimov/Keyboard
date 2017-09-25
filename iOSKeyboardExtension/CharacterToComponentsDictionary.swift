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

    
    // MARK: - 0080..00FF; Latin-1 Supplement
    
    //00A0          ; NO-BREAK SPACE
    " ":            [],

    //00A1          ; INVERTED EXCLAMATION MARK
    "¡":            [.exclamationMark, .turned],

    //00A2          ; CENT SIGN
    "¢":            [],

    //00A3          ; POUND SIGN
    "£":            [],

    //00A4          ; CURRENCY SIGN
    "¤":            [],

    //00A5          ; YEN SIGN
    "¥":            [],

    //00A6          ; BROKEN BAR
    "¦":            [],

    //00A7          ; SECTION SIGN
    "§":            [],

    //00A8          ; DIAERESIS
    "¨":            [],

    //00A9          ; COPYRIGHT SIGN
    "©":            [],

    //00AA          ; FEMININE ORDINAL INDICATOR
    "ª":            [],

    //00AB          ; LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
    "«":            [],

    //00AC          ; NOT SIGN
    "¬":            [],

    //00AD          ; SOFT HYPHEN
    "­":            [],

    //00AE          ; REGISTERED SIGN
    "®":            [],

    //00AF          ; MACRON
    "¯":            [],

    //00B0          ; DEGREE SIGN
    "°":            [],

    //00B1          ; PLUS-MINUS SIGN
    "±":            [.plusSign, .hyphenMinus],

    //00B2          ; SUPERSCRIPT TWO
    "²":            [.two, .superscript],

    //00B3          ; SUPERSCRIPT THREE
    "³":            [.three, .superscript],

    //00B4          ; ACUTE ACCENT
    "´":            [],

    //00B5          ; MICRO SIGN
    "µ":            [],

    //00B6          ; PILCROW SIGN
    "¶":            [],

    //00B7          ; MIDDLE DOT
    "·":            [],

    //00B8          ; CEDILLA
    "¸":            [],

    //00B9          ; SUPERSCRIPT ONE
    "¹":            [.one, .superscript],

    //00BA          ; MASCULINE ORDINAL INDICATOR
    "º":            [],

    //00BB          ; RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
    "»":            [],

    //00BC          ; VULGAR FRACTION ONE QUARTER
    "¼":            [.one, .four],

    //00BD          ; VULGAR FRACTION ONE HALF
    "½":            [.one, .two],

    //00BE          ; VULGAR FRACTION THREE QUARTERS
    "¾":            [.three, .four],

    //00BF          ; INVERTED QUESTION MARK
    "¿":            [.questionMark, .turned],

    //00C0          ; LATIN CAPITAL LETTER A WITH GRAVE
    "À":            [.a, .graveAbove, .capital],

    //00C1          ; LATIN CAPITAL LETTER A WITH ACUTE
    "Á":            [.a, .acuteAbove, .capital],

    //00C2          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX
    "Â":            [.a, .circumflexAbove, .capital],

    //00C3          ; LATIN CAPITAL LETTER A WITH TILDE
    "Ã":            [.a, .tildeAbove, .capital],

    //00C4          ; LATIN CAPITAL LETTER A WITH DIAERESIS
    "Ä":            [.a, .diaeresisAbove, .capital],

    //00C5          ; LATIN CAPITAL LETTER A WITH RING ABOVE
    "Å":            [.a, .ringAbove, .capital],

    //00C6          ; LATIN CAPITAL LETTER AE
    "Æ":            [.a, .e, .capital],

    //00C7          ; LATIN CAPITAL LETTER C WITH CEDILLA
    "Ç":            [.c, .cedilla, .capital],

    //00C8          ; LATIN CAPITAL LETTER E WITH GRAVE
    "È":            [.e, .graveAbove, .capital],

    //00C9          ; LATIN CAPITAL LETTER E WITH ACUTE
    "É":            [.e, .acuteAbove, .capital],

    //00CA          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX
    "Ê":            [.e, .circumflexAbove, .capital],

    //00CB          ; LATIN CAPITAL LETTER E WITH DIAERESIS
    "Ë":            [.e, .diaeresisAbove, .capital],

    //00CC          ; LATIN CAPITAL LETTER I WITH GRAVE
    "Ì":            [.i, .graveAbove, .capital],

    //00CD          ; LATIN CAPITAL LETTER I WITH ACUTE
    "Í":            [.i, .acuteAbove, .capital],

    //00CE          ; LATIN CAPITAL LETTER I WITH CIRCUMFLEX
    "Î":            [.i, .circumflexAbove, .capital],

    //00CF          ; LATIN CAPITAL LETTER I WITH DIAERESIS
    "Ï":            [.i, .diaeresisAbove, .capital],

    //00D0          ; LATIN CAPITAL LETTER ETH
    "Ð":            [.d, .h, .capital],

    //00D1          ; LATIN CAPITAL LETTER N WITH TILDE
    "Ñ":            [.n, .tildeAbove, .capital],

    //00D2          ; LATIN CAPITAL LETTER O WITH GRAVE
    "Ò":            [.o, .graveAbove, .capital],

    //00D3          ; LATIN CAPITAL LETTER O WITH ACUTE
    "Ó":            [.o, .acuteAbove, .capital],

    //00D4          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX
    "Ô":            [.o, .circumflexAbove, .capital],

    //00D5          ; LATIN CAPITAL LETTER O WITH TILDE
    "Õ":            [.o, .tildeAbove, .capital],

    //00D6          ; LATIN CAPITAL LETTER O WITH DIAERESIS
    "Ö":            [.o, .diaeresisAbove, .capital],

    //00D7          ; MULTIPLICATION SIGN
    "×":            [],

    //00D8          ; LATIN CAPITAL LETTER O WITH STROKE
    "Ø":            [.o, .diagonalStroke, .capital],

    //00D9          ; LATIN CAPITAL LETTER U WITH GRAVE
    "Ù":            [.u, .graveAbove, .capital],

    //00DA          ; LATIN CAPITAL LETTER U WITH ACUTE
    "Ú":            [.u, .acuteAbove, .capital],

    //00DB          ; LATIN CAPITAL LETTER U WITH CIRCUMFLEX
    "Û":            [.u, .circumflexAbove, .capital],

    //00DC          ; LATIN CAPITAL LETTER U WITH DIAERESIS
    "Ü":            [.u, .diaeresisAbove, .capital],

    //00DD          ; LATIN CAPITAL LETTER Y WITH ACUTE
    "Ý":            [.y, .acuteAbove, .capital],

    //00DE          ; LATIN CAPITAL LETTER THORN
    "Þ":            [.b, .p, .capital],

    //00DF          ; LATIN SMALL LETTER SHARP S
    "ß":            [.s, .s],

    //00E0          ; LATIN SMALL LETTER A WITH GRAVE
    "à":            [.a, .graveAbove],

    //00E1          ; LATIN SMALL LETTER A WITH ACUTE
    "á":            [.a, .acuteAbove],

    //00E2          ; LATIN SMALL LETTER A WITH CIRCUMFLEX
    "â":            [.a, .circumflexAbove],

    //00E3          ; LATIN SMALL LETTER A WITH TILDE
    "ã":            [.a, .tildeAbove],

    //00E4          ; LATIN SMALL LETTER A WITH DIAERESIS
    "ä":            [.a, .diaeresisAbove],

    //00E5          ; LATIN SMALL LETTER A WITH RING ABOVE
    "å":            [.a, .ringAbove],

    //00E6          ; LATIN SMALL LETTER AE
    "æ":            [.a, .e],

    //00E7          ; LATIN SMALL LETTER C WITH CEDILLA
    "ç":            [.c, .cedilla],

    //00E8          ; LATIN SMALL LETTER E WITH GRAVE
    "è":            [.e, .graveAbove],

    //00E9          ; LATIN SMALL LETTER E WITH ACUTE
    "é":            [.e, .acuteAbove],

    //00EA          ; LATIN SMALL LETTER E WITH CIRCUMFLEX
    "ê":            [.e, .circumflexAbove],

    //00EB          ; LATIN SMALL LETTER E WITH DIAERESIS
    "ë":            [.e, .diaeresisAbove],

    //00EC          ; LATIN SMALL LETTER I WITH GRAVE
    "ì":            [.i, .graveAbove],

    //00ED          ; LATIN SMALL LETTER I WITH ACUTE
    "í":            [.i, .acuteAbove],

    //00EE          ; LATIN SMALL LETTER I WITH CIRCUMFLEX
    "î":            [.i, .circumflexAbove],

    //00EF          ; LATIN SMALL LETTER I WITH DIAERESIS
    "ï":            [.i, .diaeresisAbove],

    //00F0          ; LATIN SMALL LETTER ETH
    "ð":            [.d, .h],

    //00F1          ; LATIN SMALL LETTER N WITH TILDE
    "ñ":            [.n, .tildeAbove],

    //00F2          ; LATIN SMALL LETTER O WITH GRAVE
    "ò":            [.o, .graveAbove],

    //00F3          ; LATIN SMALL LETTER O WITH ACUTE
    "ó":            [.o, .acuteAbove],

    //00F4          ; LATIN SMALL LETTER O WITH CIRCUMFLEX
    "ô":            [.o, .circumflexAbove],

    //00F5          ; LATIN SMALL LETTER O WITH TILDE
    "õ":            [.o, .tildeAbove],

    //00F6          ; LATIN SMALL LETTER O WITH DIAERESIS
    "ö":            [.o, .diaeresisAbove],

    //00F7          ; DIVISION SIGN
    "÷":            [],

    //00F8          ; LATIN SMALL LETTER O WITH STROKE
    "ø":            [.o, .diagonalStroke],

    //00F9          ; LATIN SMALL LETTER U WITH GRAVE
    "ù":            [.u, .graveAbove],

    //00FA          ; LATIN SMALL LETTER U WITH ACUTE
    "ú":            [.u, .acuteAbove],

    //00FB          ; LATIN SMALL LETTER U WITH CIRCUMFLEX
    "û":            [.u, .circumflexAbove],

    //00FC          ; LATIN SMALL LETTER U WITH DIAERESIS
    "ü":            [.u, .diaeresisAbove],

    //00FD          ; LATIN SMALL LETTER Y WITH ACUTE
    "ý":            [.y, .acuteAbove],

    //00FE          ; LATIN SMALL LETTER THORN
    "þ":            [.b, .p],

    //00FF          ; LATIN SMALL LETTER Y WITH DIAERESIS
    "ÿ":            [.y, .diaeresisAbove],

]

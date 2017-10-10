//
//  CharacterToComponentsDictionary.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

import Foundation

let characterToComponentsDictionary: [String: [CharacterComponent]] = [
    
    // MARK: - 0000..007F; Basic Latin
    
    //0020          ; SPACE
    " ": [.space],
    
    //0021          ; EXCLAMATION MARK
    "!": [.exclamationMark],
    
    //0022          ; QUOTATION MARK
    "\"": [.quotationMark],
    
    //0023          ; NUMBER SIGN
    "#": [.numberSign],
    
    //0024          ; DOLLAR SIGN
    "$": [.dollarSign],
    
    //0025          ; PERCENT SIGN
    "%": [.percentSign],
    
    //0026          ; AMPERSAND
    "&": [.ampersand],
    
    //0027          ; APOSTROPHE
    "'": [.apostrophe],
    
    //0028          ; LEFT PARENTHESIS
    "(": [.parenthesis],
    
    //0029          ; RIGHT PARENTHESIS
    ")": [.parenthesis, .turned],
    
    //002A          ; ASTERISK
    "*": [.asterisk],
    
    //002B          ; PLUS SIGN
    "+": [.plusSign],
    
    //002C          ; COMMA
    ",": [.comma],
    
    //002D          ; HYPHEN-MINUS
    "-": [.hyphenMinus],
    
    //002E          ; FULL STOP
    ".": [.fullStop],
    
    //002F          ; SOLIDUS
    "/": [.solidus],
    
    //0030          ; DIGIT ZERO
    "0": [.zero],
    
    //0031          ; DIGIT ONE
    "1": [.one],
    
    //0032          ; DIGIT TWO
    "2": [.two],
    
    //0033          ; DIGIT THREE
    "3": [.three],
    
    //0034          ; DIGIT FOUR
    "4": [.four],
    
    //0035          ; DIGIT FIVE
    "5": [.five],
    
    //0036          ; DIGIT SIX
    "6": [.six],
    
    //0037          ; DIGIT SEVEN
    "7": [.seven],
    
    //0038          ; DIGIT EIGHT
    "8": [.eight],
    
    //0039          ; DIGIT NINE
    "9": [.nine],
    
    //003A          ; COLON
    ":": [.colon],

    //003B          ; SEMICOLON
    ";": [.semicolon],

    //003C          ; LESS-THAN SIGN
    "<": [.lessThanSign],

    //003D          ; EQUALS SIGN
    "=": [.equalsSign],

    //003E          ; GREATER-THAN SIGN
    ">": [.greaterThanSign],

    //003F          ; QUESTION MARK
    "?": [.questionMark],

    //0040          ; COMMERCIAL AT
    "@": [.commercialAt],

    //0041          ; LATIN CAPITAL LETTER A
    "A": [.a, .capital],

    //0042          ; LATIN CAPITAL LETTER B
    "B": [.b, .capital],

    //0043          ; LATIN CAPITAL LETTER C
    "C": [.c, .capital],

    //0044          ; LATIN CAPITAL LETTER D
    "D": [.d, .capital],

    //0045          ; LATIN CAPITAL LETTER E
    "E": [.e, .capital],

    //0046          ; LATIN CAPITAL LETTER F
    "F": [.f, .capital],

    //0047          ; LATIN CAPITAL LETTER G
    "G": [.g, .capital],

    //0048          ; LATIN CAPITAL LETTER H
    "H": [.h, .capital],

    //0049          ; LATIN CAPITAL LETTER I
    "I": [.i, .capital],

    //004A          ; LATIN CAPITAL LETTER J
    "J": [.j, .capital],

    //004B          ; LATIN CAPITAL LETTER K
    "K": [.k, .capital],

    //004C          ; LATIN CAPITAL LETTER L
    "L": [.l, .capital],

    //004D          ; LATIN CAPITAL LETTER M
    "M": [.m, .capital],

    //004E          ; LATIN CAPITAL LETTER N
    "N": [.n, .capital],

    //004F          ; LATIN CAPITAL LETTER O
    "O": [.o, .capital],

    //0050          ; LATIN CAPITAL LETTER P
    "P": [.p, .capital],

    //0051          ; LATIN CAPITAL LETTER Q
    "Q": [.q, .capital],

    //0052          ; LATIN CAPITAL LETTER R
    "R": [.r, .capital],

    //0053          ; LATIN CAPITAL LETTER S
    "S": [.s, .capital],

    //0054          ; LATIN CAPITAL LETTER T
    "T": [.t, .capital],

    //0055          ; LATIN CAPITAL LETTER U
    "U": [.u, .capital],

    //0056          ; LATIN CAPITAL LETTER V
    "V": [.v, .capital],

    //0057          ; LATIN CAPITAL LETTER W
    "W": [.w, .capital],

    //0058          ; LATIN CAPITAL LETTER X
    "X": [.x, .capital],

    //0059          ; LATIN CAPITAL LETTER Y
    "Y": [.y, .capital],

    //005A          ; LATIN CAPITAL LETTER Z
    "Z": [.z, .capital],

    //005B          ; LEFT SQUARE BRACKET
    "[": [.squareBracket],

    //005C          ; REVERSE SOLIDUS
    "\\": [.solidus, .reversed],

    //005D          ; RIGHT SQUARE BRACKET
    "]": [.squareBracket, .turned],

    //005E          ; CIRCUMFLEX ACCENT
    "^": [.caret],

    //005F          ; LOW LINE
    "_": [.lowLine],

    //0060          ; GRAVE ACCENT
    "`": [.graveAccent],

    //0061          ; LATIN SMALL LETTER A
    "a": [.a],

    //0062          ; LATIN SMALL LETTER B
    "b": [.b],

    //0063          ; LATIN SMALL LETTER C
    "c": [.c],

    //0064          ; LATIN SMALL LETTER D
    "d": [.d],

    //0065          ; LATIN SMALL LETTER E
    "e": [.e],

    //0066          ; LATIN SMALL LETTER F
    "f": [.f],

    //0067          ; LATIN SMALL LETTER G
    "g": [.g],

    //0068          ; LATIN SMALL LETTER H
    "h": [.h],

    //0069          ; LATIN SMALL LETTER I
    "i": [.i],

    //006A          ; LATIN SMALL LETTER J
    "j": [.j],

    //006B          ; LATIN SMALL LETTER K
    "k": [.k],

    //006C          ; LATIN SMALL LETTER L
    "l": [.l],

    //006D          ; LATIN SMALL LETTER M
    "m": [.m],

    //006E          ; LATIN SMALL LETTER N
    "n": [.n],

    //006F          ; LATIN SMALL LETTER O
    "o": [.o],

    //0070          ; LATIN SMALL LETTER P
    "p": [.p],

    //0071          ; LATIN SMALL LETTER Q
    "q": [.q],

    //0072          ; LATIN SMALL LETTER R
    "r": [.r],

    //0073          ; LATIN SMALL LETTER S
    "s": [.s],

    //0074          ; LATIN SMALL LETTER T
    "t": [.t],

    //0075          ; LATIN SMALL LETTER U
    "u": [.u],

    //0076          ; LATIN SMALL LETTER V
    "v": [.v],

    //0077          ; LATIN SMALL LETTER W
    "w": [.w],

    //0078          ; LATIN SMALL LETTER X
    "x": [.x],

    //0079          ; LATIN SMALL LETTER Y
    "y": [.y],

    //007A          ; LATIN SMALL LETTER Z
    "z": [.z],

    //007B          ; LEFT CURLY BRACKET
    "{": [.curlyBracket],

    //007C          ; VERTICAL LINE
    "|": [.verticalLine],

    //007D          ; RIGHT CURLY BRACKET
    "}": [.curlyBracket, .turned],

    //007E          ; TILDE
    "~": [.tilde],

    
    // MARK: - 0080..00FF; Latin-1 Supplement
    
    //00A0          ; NO-BREAK SPACE
    " ": [.space, .nonBreaking],

    //00A1          ; INVERTED EXCLAMATION MARK
    "¡": [.exclamationMark, .turned],

    //00A2          ; CENT SIGN
    "¢": [],

    //00A3          ; POUND SIGN
    "£": [],

    //00A4          ; CURRENCY SIGN
    "¤": [],

    //00A5          ; YEN SIGN
    "¥": [],

    //00A6          ; BROKEN BAR
    "¦": [],

    //00A7          ; SECTION SIGN
    "§": [],

    //00A8          ; DIAERESIS
    "¨": [.diaeresis, .superscript],

    //00A9          ; COPYRIGHT SIGN
    "©": [],

    //00AA          ; FEMININE ORDINAL INDICATOR
    "ª": [],

    //00AB          ; LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
    "«": [],

    //00AC          ; NOT SIGN
    "¬": [.notSign],

    //00AD          ; SOFT HYPHEN
    "­": [],

    //00AE          ; REGISTERED SIGN
    "®": [],

    //00AF          ; MACRON
    "¯": [],

    //00B0          ; DEGREE SIGN
    "°": [],

    //00B1          ; PLUS-MINUS SIGN
    "±": [.plusSign, .minusSign],

    //00B2          ; SUPERSCRIPT TWO
    "²": [.two, .superscript],

    //00B3          ; SUPERSCRIPT THREE
    "³": [.three, .superscript],

    //00B4          ; ACUTE ACCENT
    "´": [],

    //00B5          ; MICRO SIGN
    "µ": [],

    //00B6          ; PILCROW SIGN
    "¶": [],

    //00B7          ; MIDDLE DOT
    "·": [.dot],

    //00B8          ; CEDILLA
    "¸": [.cedilla],

    //00B9          ; SUPERSCRIPT ONE
    "¹": [.one, .superscript],

    //00BA          ; MASCULINE ORDINAL INDICATOR
    "º": [],

    //00BB          ; RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
    "»": [],

    //00BC          ; VULGAR FRACTION ONE QUARTER
    "¼": [.one, .fractionSlash, .four],

    //00BD          ; VULGAR FRACTION ONE HALF
    "½": [.one, .fractionSlash, .two],

    //00BE          ; VULGAR FRACTION THREE QUARTERS
    "¾": [.three, .fractionSlash, .four],

    //00BF          ; INVERTED QUESTION MARK
    "¿": [.questionMark, .turned],

    //00C0          ; LATIN CAPITAL LETTER A WITH GRAVE
    "À": [.a, .grave, .above, .capital],

    //00C1          ; LATIN CAPITAL LETTER A WITH ACUTE
    "Á": [.a, .acute, .above, .capital],

    //00C2          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX
    "Â": [.a, .circumflex, .above, .capital],

    //00C3          ; LATIN CAPITAL LETTER A WITH TILDE
    "Ã": [.a, .tilde, .above, .capital],

    //00C4          ; LATIN CAPITAL LETTER A WITH DIAERESIS
    "Ä": [.a, .diaeresis, .above, .capital],

    //00C5          ; LATIN CAPITAL LETTER A WITH RING ABOVE
    "Å": [.a, .ring, .above, .capital],

    //00C6          ; LATIN CAPITAL LETTER AE
    "Æ": [.a, .e, .capital],

    //00C7          ; LATIN CAPITAL LETTER C WITH CEDILLA
    "Ç": [.c, .cedilla, .capital],

    //00C8          ; LATIN CAPITAL LETTER E WITH GRAVE
    "È": [.e, .grave, .above, .capital],

    //00C9          ; LATIN CAPITAL LETTER E WITH ACUTE
    "É": [.e, .acute, .above, .capital],

    //00CA          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX
    "Ê": [.e, .circumflex, .above, .capital],

    //00CB          ; LATIN CAPITAL LETTER E WITH DIAERESIS
    "Ë": [.e, .diaeresis, .above, .capital],

    //00CC          ; LATIN CAPITAL LETTER I WITH GRAVE
    "Ì": [.i, .grave, .above, .capital],

    //00CD          ; LATIN CAPITAL LETTER I WITH ACUTE
    "Í": [.i, .acute, .above, .capital],

    //00CE          ; LATIN CAPITAL LETTER I WITH CIRCUMFLEX
    "Î": [.i, .circumflex, .above, .capital],

    //00CF          ; LATIN CAPITAL LETTER I WITH DIAERESIS
    "Ï": [.i, .diaeresis, .above, .capital],

    //00D0          ; LATIN CAPITAL LETTER ETH
    "Ð": [.d, .h, .capital],

    //00D1          ; LATIN CAPITAL LETTER N WITH TILDE
    "Ñ": [.n, .tilde, .above, .capital],

    //00D2          ; LATIN CAPITAL LETTER O WITH GRAVE
    "Ò": [.o, .grave, .above, .capital],

    //00D3          ; LATIN CAPITAL LETTER O WITH ACUTE
    "Ó": [.o, .acute, .above, .capital],

    //00D4          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX
    "Ô": [.o, .circumflex, .above, .capital],

    //00D5          ; LATIN CAPITAL LETTER O WITH TILDE
    "Õ": [.o, .tilde, .above, .capital],

    //00D6          ; LATIN CAPITAL LETTER O WITH DIAERESIS
    "Ö": [.o, .diaeresis, .above, .capital],

    //00D7          ; MULTIPLICATION SIGN
    "×": [.multiplicationSign],

    //00D8          ; LATIN CAPITAL LETTER O WITH STROKE
    "Ø": [.o, .diagonalStroke, .capital],

    //00D9          ; LATIN CAPITAL LETTER U WITH GRAVE
    "Ù": [.u, .grave, .above, .capital],

    //00DA          ; LATIN CAPITAL LETTER U WITH ACUTE
    "Ú": [.u, .acute, .above, .capital],

    //00DB          ; LATIN CAPITAL LETTER U WITH CIRCUMFLEX
    "Û": [.u, .circumflex, .above, .capital],

    //00DC          ; LATIN CAPITAL LETTER U WITH DIAERESIS
    "Ü": [.u, .diaeresis, .above, .capital],

    //00DD          ; LATIN CAPITAL LETTER Y WITH ACUTE
    "Ý": [.y, .acute, .above, .capital],

    //00DE          ; LATIN CAPITAL LETTER THORN
    "Þ": [.t, .h, .capital],

    //00DF          ; LATIN SMALL LETTER SHARP S
    "ß": [.s, .s],

    //00E0          ; LATIN SMALL LETTER A WITH GRAVE
    "à": [.a, .grave, .above],

    //00E1          ; LATIN SMALL LETTER A WITH ACUTE
    "á": [.a, .acute, .above],

    //00E2          ; LATIN SMALL LETTER A WITH CIRCUMFLEX
    "â": [.a, .circumflex, .above],

    //00E3          ; LATIN SMALL LETTER A WITH TILDE
    "ã": [.a, .tilde, .above],

    //00E4          ; LATIN SMALL LETTER A WITH DIAERESIS
    "ä": [.a, .diaeresis, .above],

    //00E5          ; LATIN SMALL LETTER A WITH RING ABOVE
    "å": [.a, .ring, .above],

    //00E6          ; LATIN SMALL LETTER AE
    "æ": [.a, .e],

    //00E7          ; LATIN SMALL LETTER C WITH CEDILLA
    "ç": [.c, .cedilla],

    //00E8          ; LATIN SMALL LETTER E WITH GRAVE
    "è": [.e, .grave, .above],

    //00E9          ; LATIN SMALL LETTER E WITH ACUTE
    "é": [.e, .acute, .above],

    //00EA          ; LATIN SMALL LETTER E WITH CIRCUMFLEX
    "ê": [.e, .circumflex, .above],

    //00EB          ; LATIN SMALL LETTER E WITH DIAERESIS
    "ë": [.e, .diaeresis, .above],

    //00EC          ; LATIN SMALL LETTER I WITH GRAVE
    "ì": [.i, .grave, .above],

    //00ED          ; LATIN SMALL LETTER I WITH ACUTE
    "í": [.i, .acute, .above],

    //00EE          ; LATIN SMALL LETTER I WITH CIRCUMFLEX
    "î": [.i, .circumflex, .above],

    //00EF          ; LATIN SMALL LETTER I WITH DIAERESIS
    "ï": [.i, .diaeresis, .above],

    //00F0          ; LATIN SMALL LETTER ETH
    "ð": [.d, .h],

    //00F1          ; LATIN SMALL LETTER N WITH TILDE
    "ñ": [.n, .tilde, .above],

    //00F2          ; LATIN SMALL LETTER O WITH GRAVE
    "ò": [.o, .grave, .above],

    //00F3          ; LATIN SMALL LETTER O WITH ACUTE
    "ó": [.o, .acute, .above],

    //00F4          ; LATIN SMALL LETTER O WITH CIRCUMFLEX
    "ô": [.o, .circumflex, .above],

    //00F5          ; LATIN SMALL LETTER O WITH TILDE
    "õ": [.o, .tilde, .above],

    //00F6          ; LATIN SMALL LETTER O WITH DIAERESIS
    "ö": [.o, .diaeresis, .above],

    //00F7          ; DIVISION SIGN
    "÷": [.divisionSign],

    //00F8          ; LATIN SMALL LETTER O WITH STROKE
    "ø": [.o, .diagonalStroke],

    //00F9          ; LATIN SMALL LETTER U WITH GRAVE
    "ù": [.u, .grave, .above],

    //00FA          ; LATIN SMALL LETTER U WITH ACUTE
    "ú": [.u, .acute, .above],

    //00FB          ; LATIN SMALL LETTER U WITH CIRCUMFLEX
    "û": [.u, .circumflex, .above],

    //00FC          ; LATIN SMALL LETTER U WITH DIAERESIS
    "ü": [.u, .diaeresis, .above],

    //00FD          ; LATIN SMALL LETTER Y WITH ACUTE
    "ý": [.y, .acute, .above],

    //00FE          ; LATIN SMALL LETTER THORN
    "þ": [.t, .h],

    //00FF          ; LATIN SMALL LETTER Y WITH DIAERESIS
    "ÿ": [.y, .diaeresis, .above],

    
    // MARK: - 0100..017F; Latin Extended-A
    
    //0100          ; LATIN CAPITAL LETTER A WITH MACRON
    "Ā": [.a, .macron, .above, .capital],

    //0101          ; LATIN SMALL LETTER A WITH MACRON
    "ā": [.a, .macron, .above],

    //0102          ; LATIN CAPITAL LETTER A WITH BREVE
    "Ă": [.a, .breve, .above, .capital],

    //0103          ; LATIN SMALL LETTER A WITH BREVE
    "ă": [.a, .breve, .above],

    //0104          ; LATIN CAPITAL LETTER A WITH OGONEK
    "Ą": [.a, .ogonek, .below, .capital],

    //0105          ; LATIN SMALL LETTER A WITH OGONEK
    "ą": [.a, .ogonek, .below],

    //0106          ; LATIN CAPITAL LETTER C WITH ACUTE
    "Ć": [.c, .acute, .above, .capital],

    //0107          ; LATIN SMALL LETTER C WITH ACUTE
    "ć": [.c, .acute, .above],

    //0108          ; LATIN CAPITAL LETTER C WITH CIRCUMFLEX
    "Ĉ": [.c, .circumflex, .above, .capital],

    //0109          ; LATIN SMALL LETTER C WITH CIRCUMFLEX
    "ĉ": [.c, .circumflex, .above],

    //010A          ; LATIN CAPITAL LETTER C WITH DOT ABOVE
    "Ċ": [.c, .dot, .above, .capital],

    //010B          ; LATIN SMALL LETTER C WITH DOT ABOVE
    "ċ": [.c, .dot, .above],

    //010C          ; LATIN CAPITAL LETTER C WITH CARON
    "Č": [.c, .caron, .above, .capital],

    //010D          ; LATIN SMALL LETTER C WITH CARON
    "č": [.c, .caron, .above],

    //010E          ; LATIN CAPITAL LETTER D WITH CARON
    "Ď": [.d, .caron, .above, .capital],
    
    //010F          ; LATIN SMALL LETTER D WITH CARON
    "ď": [.d, .caron, .above],

    //0110          ; LATIN CAPITAL LETTER D WITH STROKE
    "Đ": [.d, .stroke, .capital],

    //0111          ; LATIN SMALL LETTER D WITH STROKE
    "đ": [.d, .stroke],

    //0112          ; LATIN CAPITAL LETTER E WITH MACRON
    "Ē": [.e, .macron, .above, .capital],

    //0113          ; LATIN SMALL LETTER E WITH MACRON
    "ē": [.e, .macron, .above],

    //0114          ; LATIN CAPITAL LETTER E WITH BREVE
    "Ĕ": [.e, .breve, .above, .capital],

    //0115          ; LATIN SMALL LETTER E WITH BREVE
    "ĕ": [.e, .breve, .above],

    //0116          ; LATIN CAPITAL LETTER E WITH DOT ABOVE
    "Ė": [.e, .dot, .above, .capital],

    //0117          ; LATIN SMALL LETTER E WITH DOT ABOVE
    "ė": [.e, .dot, .above],

    //0118          ; LATIN CAPITAL LETTER E WITH OGONEK
    "Ę": [.e, .ogonek, .below, .capital],

    //0119          ; LATIN SMALL LETTER E WITH OGONEK
    "ę": [.e, .ogonek, .below],

    //011A          ; LATIN CAPITAL LETTER E WITH CARON
    "Ě": [.e, .caron, .above, .capital],

    //011B          ; LATIN SMALL LETTER E WITH CARON
    "ě": [.e, .caron, .above],

    //011C          ; LATIN CAPITAL LETTER G WITH CIRCUMFLEX
    "Ĝ": [.g, .circumflex, .above, .capital],

    //011D          ; LATIN SMALL LETTER G WITH CIRCUMFLEX
    "ĝ": [.g, .circumflex, .above],

    //011E          ; LATIN CAPITAL LETTER G WITH BREVE
    "Ğ": [.g, .breve, .above, .capital],

    //011F          ; LATIN SMALL LETTER G WITH BREVE
    "ğ": [.g, .breve, .above],

    //0120          ; LATIN CAPITAL LETTER G WITH DOT ABOVE
    "Ġ": [.g, .dot, .above, .capital],

    //0121          ; LATIN SMALL LETTER G WITH DOT ABOVE
    "ġ": [.g, .dot, .above],

    //0122          ; LATIN CAPITAL LETTER G WITH CEDILLA
    "Ģ": [.g, .cedilla, .capital],

    //0123          ; LATIN SMALL LETTER G WITH CEDILLA
    "ģ": [.g, .cedilla],

    //0124          ; LATIN CAPITAL LETTER H WITH CIRCUMFLEX
    "Ĥ": [.h, .circumflex, .above, .capital],

    //0125          ; LATIN SMALL LETTER H WITH CIRCUMFLEX
    "ĥ": [.h, .circumflex, .above],

    //0126          ; LATIN CAPITAL LETTER H WITH STROKE
    "Ħ": [.h, .stroke, .capital],

    //0127          ; LATIN SMALL LETTER H WITH STROKE
    "ħ": [.h, .stroke],

    //0128          ; LATIN CAPITAL LETTER I WITH TILDE
    "Ĩ": [.i, .tilde, .above, .capital],

    //0129          ; LATIN SMALL LETTER I WITH TILDE
    "ĩ": [.i, .tilde, .above],

    //012A          ; LATIN CAPITAL LETTER I WITH MACRON
    "Ī": [.i, .macron, .above, .capital],

    //012B          ; LATIN SMALL LETTER I WITH MACRON
    "ī": [.i, .macron, .above],

    //012C          ; LATIN CAPITAL LETTER I WITH BREVE
    "Ĭ": [.i, .breve, .above, .capital],

    //012D          ; LATIN SMALL LETTER I WITH BREVE
    "ĭ": [.i, .breve, .above],

    //012E          ; LATIN CAPITAL LETTER I WITH OGONEK
    "Į": [.i, .ogonek, .above, .capital],

    //012F          ; LATIN SMALL LETTER I WITH OGONEK
    "į": [.i, .ogonek, .above],

    //0130          ; LATIN CAPITAL LETTER I WITH DOT ABOVE
    "İ": [.i, .dot, .above, .capital],

    //0131          ; LATIN SMALL LETTER DOTLESS I
    "ı": [.i, .dot, .above],

    //0132          ; LATIN CAPITAL LIGATURE IJ
    "Ĳ": [.i, .j, .capital],

    //0133          ; LATIN SMALL LIGATURE IJ
    "ĳ": [.i, .j],

    //0134          ; LATIN CAPITAL LETTER J WITH CIRCUMFLEX
    "Ĵ": [.j, .circumflex, .above, .capital],

    //0135          ; LATIN SMALL LETTER J WITH CIRCUMFLEX
    "ĵ": [.j, .circumflex, .above],

    //0136          ; LATIN CAPITAL LETTER K WITH CEDILLA
    "Ķ": [.k, .cedilla, .capital],

    //0137          ; LATIN SMALL LETTER K WITH CEDILLA
    "ķ": [.k, .cedilla],

    //0138          ; LATIN SMALL LETTER KRA
    "ĸ": [.k, .longLeg],

    //0139          ; LATIN CAPITAL LETTER L WITH ACUTE
    "Ĺ": [.l, .acute, .above, .capital],

    //013A          ; LATIN SMALL LETTER L WITH ACUTE
    "ĺ": [.l, .acute, .above],

    //013B          ; LATIN CAPITAL LETTER L WITH CEDILLA
    "Ļ": [.l, .cedilla, .capital],

    //013C          ; LATIN SMALL LETTER L WITH CEDILLA
    "ļ": [.l, .cedilla],

    //013D          ; LATIN CAPITAL LETTER L WITH CARON
    "Ľ": [.l, .caron, .above, .capital],

    //013E          ; LATIN SMALL LETTER L WITH CARON
    "ľ": [.l, .caron, .above],

    //013F          ; LATIN CAPITAL LETTER L WITH MIDDLE DOT
    "ĿL": [.l, .L, .capital],
    "Ŀl": [.l, .l, .capital],

    //0140          ; LATIN SMALL LETTER L WITH MIDDLE DOT
    "ŀl": [.l, .l],
    
    //0141          ; LATIN CAPITAL LETTER L WITH STROKE
    "Ł": [.l, .diagonalStroke, .capital],

    //0142          ; LATIN SMALL LETTER L WITH STROKE
    "ł": [.l, .diagonalStroke],

    //0143          ; LATIN CAPITAL LETTER N WITH ACUTE
    "Ń": [.n, .acute, .above, .capital],

    //0144          ; LATIN SMALL LETTER N WITH ACUTE
    "ń": [.n, .acute, .above],

    //0145          ; LATIN CAPITAL LETTER N WITH CEDILLA
    "Ņ": [.n, .cedilla, .capital],

    //0146          ; LATIN SMALL LETTER N WITH CEDILLA
    "ņ": [.n, .cedilla],

    //0147          ; LATIN CAPITAL LETTER N WITH CARON
    "Ň": [.n, .caron, .above, .capital],

    //0148          ; LATIN SMALL LETTER N WITH CARON
    "ň": [.n, .caron, .above],

    //0149          ; LATIN SMALL LETTER N PRECEDED BY APOSTROPHE
    "ŉ": [],

    //014A          ; LATIN CAPITAL LETTER ENG
    "Ŋ": [.n, .g, .capital],

    //014B          ; LATIN SMALL LETTER ENG
    "ŋ": [.n, .g],

    //014C          ; LATIN CAPITAL LETTER O WITH MACRON
    "Ō": [.o, .macron, .above, .capital],

    //014D          ; LATIN SMALL LETTER O WITH MACRON
    "ō": [.o, .macron, .above],

    //014E          ; LATIN CAPITAL LETTER O WITH BREVE
    "Ŏ": [.o, .breve, .above, .capital],

    //014F          ; LATIN SMALL LETTER O WITH BREVE
    "ŏ": [.o, .breve, .above],

    //0150          ; LATIN CAPITAL LETTER O WITH DOUBLE ACUTE
    "Ő": [.o, .acute, .doubled, .above, .capital],

    //0151          ; LATIN SMALL LETTER O WITH DOUBLE ACUTE
    "ő": [.o, .acute, .doubled, .above],

    //0152          ; LATIN CAPITAL LIGATURE OE
    "Œ": [.o, .e, .capital],
    
    //0153          ; LATIN SMALL LIGATURE OE
    "œ": [.e, .e],

    //0154          ; LATIN CAPITAL LETTER R WITH ACUTE
    "Ŕ": [.r, .acute, .above, .capital],

    //0155          ; LATIN SMALL LETTER R WITH ACUTE
    "ŕ": [.r, .acute, .above],

    //0156          ; LATIN CAPITAL LETTER R WITH CEDILLA
    "Ŗ": [.r, .cedilla, .capital],

    //0157          ; LATIN SMALL LETTER R WITH CEDILLA
    "ŗ": [.r, .cedilla],

    //0158          ; LATIN CAPITAL LETTER R WITH CARON
    "Ř": [.r, .caron, .above, .capital],

    //0159          ; LATIN SMALL LETTER R WITH CARON
    "ř": [.r, .caron, .above],

    //015A          ; LATIN CAPITAL LETTER S WITH ACUTE
    "Ś": [.s, .acute, .above, .capital],

    //015B          ; LATIN SMALL LETTER S WITH ACUTE
    "ś": [.s, .acute, .above],

    //015C          ; LATIN CAPITAL LETTER S WITH CIRCUMFLEX
    "Ŝ": [.s, .circumflex, .above, .capital],

    //015D          ; LATIN SMALL LETTER S WITH CIRCUMFLEX
    "ŝ": [.s, .circumflex, .above],

    //015E          ; LATIN CAPITAL LETTER S WITH CEDILLA
    "Ş": [.s, .cedilla, .capital],

    //015F          ; LATIN SMALL LETTER S WITH CEDILLA
    "ş": [.s, .cedilla],

    //0160          ; LATIN CAPITAL LETTER S WITH CARON
    "Š": [.s, .caron, .above, .capital],

    //0161          ; LATIN SMALL LETTER S WITH CARON
    "š": [.s, .caron, .above],

    //0162          ; LATIN CAPITAL LETTER T WITH CEDILLA
    "Ţ": [.t, .cedilla, .capital],

    //0163          ; LATIN SMALL LETTER T WITH CEDILLA
    "ţ": [.t, .cedilla],

    //0164          ; LATIN CAPITAL LETTER T WITH CARON
    "Ť": [.t, .caron, .above, .capital],

    //0165          ; LATIN SMALL LETTER T WITH CARON
    "ť": [.t, .caron, .above],

    //0166          ; LATIN CAPITAL LETTER T WITH STROKE
    "Ŧ": [.t, .stroke, .capital],

    //0167          ; LATIN SMALL LETTER T WITH STROKE
    "ŧ": [.t, .stroke],

    //0168          ; LATIN CAPITAL LETTER U WITH TILDE
    "Ũ": [.u, .tilde, .above, .capital],

    //0169          ; LATIN SMALL LETTER U WITH TILDE
    "ũ": [.u, .tilde, .above],

    //016A          ; LATIN CAPITAL LETTER U WITH MACRON
    "Ū": [.u, .macron, .above, .capital],

    //016B          ; LATIN SMALL LETTER U WITH MACRON
    "ū": [.u, .macron, .above],

    //016C          ; LATIN CAPITAL LETTER U WITH BREVE
    "Ŭ": [.u, .breve, .above, .capital],

    //016D          ; LATIN SMALL LETTER U WITH BREVE
    "ŭ": [.u, .breve, .above],

    //016E          ; LATIN CAPITAL LETTER U WITH RING ABOVE
    "Ů": [.u, .ring, .above, .capital],

    //016F          ; LATIN SMALL LETTER U WITH RING ABOVE
    "ů": [.u, .ring, .above],

    //0170          ; LATIN CAPITAL LETTER U WITH DOUBLE ACUTE
    "Ű": [.u, .acute, .doubled, .above, .capital],

    //0171          ; LATIN SMALL LETTER U WITH DOUBLE ACUTE
    "ű": [.u, .acute, .doubled, .above],

    //0172          ; LATIN CAPITAL LETTER U WITH OGONEK
    "Ų": [.u, .ogonek, .below, .capital],

    //0173          ; LATIN SMALL LETTER U WITH OGONEK
    "ų": [.u, .ogonek, .below],

    //0174          ; LATIN CAPITAL LETTER W WITH CIRCUMFLEX
    "Ŵ": [.w, .circumflex, .above, .capital],

    //0175          ; LATIN SMALL LETTER W WITH CIRCUMFLEX
    "ŵ": [.w, .circumflex, .above],

    //0176          ; LATIN CAPITAL LETTER Y WITH CIRCUMFLEX
    "Ŷ": [.y, .circumflex, .above, .capital],

    //0177          ; LATIN SMALL LETTER Y WITH CIRCUMFLEX
    "ŷ": [.y, .circumflex, .above],

    //0178          ; LATIN CAPITAL LETTER Y WITH DIAERESIS
    "Ÿ": [.y, .diaeresis, .above, .capital],

    //0179          ; LATIN CAPITAL LETTER Z WITH ACUTE
    "Ź": [.z, .acute, .above, .capital],

    //017A          ; LATIN SMALL LETTER Z WITH ACUTE
    "ź": [.z, .acute, .above],

    //017B          ; LATIN CAPITAL LETTER Z WITH DOT ABOVE
    "Ż": [.z, .dot, .above, .capital],

    //017C          ; LATIN SMALL LETTER Z WITH DOT ABOVE
    "ż": [.z, .dot, .above],

    //017D          ; LATIN CAPITAL LETTER Z WITH CARON
    "Ž": [.z, .caron, .above, .capital],

    //017E          ; LATIN SMALL LETTER Z WITH CARON
    "ž": [.z, .caron, .above],

    //017F          ; LATIN SMALL LETTER LONG S
    "ſ": [.s, .l],

    
    // MARK: - 0180..024F; Latin Extended-B
    
    //0180          ; LATIN SMALL LETTER B WITH STROKE
    "ƀ": [.b, .stroke],

    //0181          ; LATIN CAPITAL LETTER B WITH HOOK
    "Ɓ": [.b, .hook, .capital],

    //0182          ; LATIN CAPITAL LETTER B WITH TOPBAR
    "Ƃ": [.b, .topbar, .capital],

    //0183          ; LATIN SMALL LETTER B WITH TOPBAR
    "ƃ": [.b, .topbar],

    //0184          ; LATIN CAPITAL LETTER TONE SIX
    "Ƅ": [.six, .tone, .capital],

    //0185          ; LATIN SMALL LETTER TONE SIX
    "ƅ": [.six, .tone],

    //0186          ; LATIN CAPITAL LETTER OPEN O
    "Ɔ": [.o, .open, .capital],

    //0187          ; LATIN CAPITAL LETTER C WITH HOOK
    "Ƈ": [.c, .hook, .capital],

    //0188          ; LATIN SMALL LETTER C WITH HOOK
    "ƈ": [.c, .hook],

    //0189          ; LATIN CAPITAL LETTER AFRICAN D
    "Ɖ": [.d, .retroflexHook, .capital],

    //018A          ; LATIN CAPITAL LETTER D WITH HOOK
    "Ɗ": [.d, .hook, .capital],

    //018B          ; LATIN CAPITAL LETTER D WITH TOPBAR
    "Ƌ": [.d, .topbar, .capital],

    //018C          ; LATIN SMALL LETTER D WITH TOPBAR
    "ƌ": [.d, .topbar],

    //018D          ; LATIN SMALL LETTER TURNED DELTA
    "ƍ": [.d, .h, .extra1, .turned],

    //018E          ; LATIN CAPITAL LETTER REVERSED E
    "Ǝ": [.e, .turned, .capital],

    //018F          ; LATIN CAPITAL LETTER SCHWA
    "Ə": [.schwa, .capital],

    //0190          ; LATIN CAPITAL LETTER OPEN E
    "Ɛ": [.e, .open, .capital],

    //0191          ; LATIN CAPITAL LETTER F WITH HOOK
    "Ƒ": [.f, .hook, .capital],

    //0192          ; LATIN SMALL LETTER F WITH HOOK
    "ƒ": [.f, .hook],

    //0193          ; LATIN CAPITAL LETTER G WITH HOOK
    "Ɠ": [.g, .hook, .capital],

    //0194          ; LATIN CAPITAL LETTER GAMMA
    "Ɣ": [.g, .h, .capital],

    //0195          ; LATIN SMALL LETTER HV
    "ƕ": [.h, .v],

    //0196          ; LATIN CAPITAL LETTER IOTA
    "Ɩ": [.i, .h, .capital],

    //0197          ; LATIN CAPITAL LETTER I WITH STROKE
    "Ɨ": [.i, .stroke],

    //0198          ; LATIN CAPITAL LETTER K WITH HOOK
    "Ƙ": [.k, .hook, .capital],

    //0199          ; LATIN SMALL LETTER K WITH HOOK
    "ƙ": [.k, .hook],

    //019A          ; LATIN SMALL LETTER L WITH BAR
    "ƚ": [.l, .stroke],

    //019B          ; LATIN SMALL LETTER LAMBDA WITH STROKE
    "ƛ": [.l, .h],

    //019C          ; LATIN CAPITAL LETTER TURNED M
    "Ɯ": [.m, .turned, .capital],

    //019D          ; LATIN CAPITAL LETTER N WITH LEFT HOOK
    "Ɲ": [.n, .hook, .capital],

    //019E          ; LATIN SMALL LETTER N WITH LONG RIGHT LEG
    "ƞ": [.n, .longLeg],

    //019F          ; LATIN CAPITAL LETTER O WITH MIDDLE TILDE
    "Ɵ": [.o, .stroke, .capital],

    //01A0          ; LATIN CAPITAL LETTER O WITH HORN
    "Ơ": [.o, .horn, .capital],

    //01A1          ; LATIN SMALL LETTER O WITH HORN
    "ơ": [.o, .horn],

    //01A2          ; LATIN CAPITAL LETTER OI
    "Ƣ": [.o, .i, .capital],

    //01A3          ; LATIN SMALL LETTER OI
    "ƣ": [.o, .i],

    //01A4          ; LATIN CAPITAL LETTER P WITH HOOK
    "Ƥ": [.p, .hook, .capital],

    //01A5          ; LATIN SMALL LETTER P WITH HOOK
    "ƥ": [.p, .hook],

    //01A6          ; LATIN LETTER YR
    "Ʀ": [.r, .smallCapital, .capital],

    //01A7          ; LATIN CAPITAL LETTER TONE TWO
    "Ƨ": [.two, .tone, .capital],

    //01A8          ; LATIN SMALL LETTER TONE TWO
    "ƨ": [.two, .tone],

    //01A9          ; LATIN CAPITAL LETTER ESH
    "Ʃ": [.s, .h, .capital],

    //01AA          ; LATIN LETTER REVERSED ESH LOOP
    "ƪ": [.s, .h, .curl, .inverted],

    //01AB          ; LATIN SMALL LETTER T WITH PALATAL HOOK
    "ƫ": [.t, .palatalHook],

    //01AC          ; LATIN CAPITAL LETTER T WITH HOOK
    "Ƭ": [.t, .hook, .capital],

    //01AD          ; LATIN SMALL LETTER T WITH HOOK
    "ƭ": [.t, .hook],

    //01AE          ; LATIN CAPITAL LETTER T WITH RETROFLEX HOOK
    "Ʈ": [.t, .retroflexHook, .capital],

    //01AF          ; LATIN CAPITAL LETTER U WITH HORN
    "Ư": [.u, .horn, .capital],

    //01B0          ; LATIN SMALL LETTER U WITH HORN
    "ư": [.u, .horn],

    //01B1          ; LATIN CAPITAL LETTER UPSILON
    "Ʊ": [.u, .h, .capital],

    //01B2          ; LATIN CAPITAL LETTER V WITH HOOK
    "Ʋ": [.v, .h, .capital],

    //01B3          ; LATIN CAPITAL LETTER Y WITH HOOK
    "Ƴ": [.y, .hook, .capital],

    //01B4          ; LATIN SMALL LETTER Y WITH HOOK
    "ƴ": [.y, .hook],

    //01B5          ; LATIN CAPITAL LETTER Z WITH STROKE
    "Ƶ": [.z, .stroke, .capital],

    //01B6          ; LATIN SMALL LETTER Z WITH STROKE
    "ƶ": [.z, .stroke],

    //01B7          ; LATIN CAPITAL LETTER EZH
    "Ʒ": [.z, .h, .capital],

    //01B8          ; LATIN CAPITAL LETTER EZH REVERSED
    "Ƹ": [.z, .h, .reversed, .capital],

    //01B9          ; LATIN SMALL LETTER EZH REVERSED
    "ƹ": [.z, .h, .reversed],

    //01BA          ; LATIN SMALL LETTER EZH WITH TAIL
    "ƺ": [.z, .h, .tail],

    //01BB          ; LATIN LETTER TWO WITH STROKE
    "ƻ": [.two, .stroke],

    //01BC          ; LATIN CAPITAL LETTER TONE FIVE
    "Ƽ": [.five, .tone, .capital],

    //01BD          ; LATIN SMALL LETTER TONE FIVE
    "ƽ": [.five, .tone],

    //01BE          ; LATIN LETTER INVERTED GLOTTAL STOP WITH STROKE
    "ƾ": [.t, .sBottom],

    //01BF          ; LATIN LETTER WYNN
    "ƿ": [.w, .h],

    //01C0          ; LATIN LETTER DENTAL CLICK
    "ǀ": [.d, .click],

    //01C1          ; LATIN LETTER LATERAL CLICK
    "ǁ": [.l, .click],

    //01C2          ; LATIN LETTER ALVEOLAR CLICK
    "ǂ": [.j, .click],

    //01C3          ; LATIN LETTER RETROFLEX CLICK
    "ǃ": [.t, .click],

    //01C4          ; LATIN CAPITAL LETTER DZ WITH CARON
    "Ǆ": [.d, .capital, .joiner, .z, .caron, .above, .capital],

    //01C5          ; LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON
    "ǅ": [.d, .capital, .joiner, .z, .caron, .above],
    
    //01C6          ; LATIN SMALL LETTER DZ WITH CARON
    "ǆ": [.d, .joiner, .z, .caron, .above],

    //01C7          ; LATIN CAPITAL LETTER LJ
    "Ǉ": [.l, .capital, .joiner, .j, .capital],

    //01C8          ; LATIN CAPITAL LETTER L WITH SMALL LETTER J
    "ǈ": [.l, .capital, .joiner, .j],

    //01C9          ; LATIN SMALL LETTER LJ
    "ǉ": [.l, .joiner, .j],

    //01CA          ; LATIN CAPITAL LETTER NJ
    "Ǌ": [.n, .capital, .joiner, .j, .capital],

    //01CB          ; LATIN CAPITAL LETTER N WITH SMALL LETTER J
    "ǋ": [.n, .capital, .joiner, .j],

    //01CC          ; LATIN SMALL LETTER NJ
    "ǌ": [.n, .joiner, .j],

    //01CD          ; LATIN CAPITAL LETTER A WITH CARON
    "Ǎ": [.a, .caron, .above, .capital],

    //01CE          ; LATIN SMALL LETTER A WITH CARON
    "ǎ": [.a, .caron, .above],

    //01CF          ; LATIN CAPITAL LETTER I WITH CARON
    "Ǐ": [.i, .caron, .above, .capital],

    //01D0          ; LATIN SMALL LETTER I WITH CARON
    "ǐ": [.i, .caron, .above],

    //01D1          ; LATIN CAPITAL LETTER O WITH CARON
    "Ǒ": [.o, .caron, .above, .capital],

    //01D2          ; LATIN SMALL LETTER O WITH CARON
    "ǒ": [.o, .caron, .above],

    //01D3          ; LATIN CAPITAL LETTER U WITH CARON
    "Ǔ": [.u, .caron, .above, .capital],

    //01D4          ; LATIN SMALL LETTER U WITH CARON
    "ǔ": [.u, .caron, .above],

    //01D5          ; LATIN CAPITAL LETTER U WITH DIAERESIS AND MACRON
    "Ǖ": [.u, .diaeresis, .above, .macron, .above, .capital],

    //01D6          ; LATIN SMALL LETTER U WITH DIAERESIS AND MACRON
    "ǖ": [.u, .diaeresis, .above, .macron, .above],

    //01D7          ; LATIN CAPITAL LETTER U WITH DIAERESIS AND ACUTE
    "Ǘ": [.u, .diaeresis, .above, .acute, .above, .capital],

    //01D8          ; LATIN SMALL LETTER U WITH DIAERESIS AND ACUTE
    "ǘ": [.u, .diaeresis, .above, .acute, .above],

    //01D9          ; LATIN CAPITAL LETTER U WITH DIAERESIS AND CARON
    "Ǚ": [.u, .diaeresis, .above, .caron, .above, .capital],

    //01DA          ; LATIN SMALL LETTER U WITH DIAERESIS AND CARON
    "ǚ": [.u, .diaeresis, .above, .caron, .above],

    //01DB          ; LATIN CAPITAL LETTER U WITH DIAERESIS AND GRAVE
    "Ǜ": [.u, .diaeresis, .above, .grave, .above, .capital],

    //01DC          ; LATIN SMALL LETTER U WITH DIAERESIS AND GRAVE
    "ǜ": [.u, .diaeresis, .above, .grave, .above],

    //01DD          ; LATIN SMALL LETTER TURNED E
    "ǝ": [.e, .turned],

    //01DE          ; LATIN CAPITAL LETTER A WITH DIAERESIS AND MACRON
    "Ǟ": [.a, .diaeresis, .above, .macron, .above, .capital],

    //01DF          ; LATIN SMALL LETTER A WITH DIAERESIS AND MACRON
    "ǟ": [.a, .diaeresis, .above, .macron, .above],

    //01E0          ; LATIN CAPITAL LETTER A WITH DOT ABOVE AND MACRON
    "Ǡ": [.a, .dot, .above, .macron, .above, .capital],

    //01E1          ; LATIN SMALL LETTER A WITH DOT ABOVE AND MACRON
    "ǡ": [.a, .dot, .above, .macron, .above],

    //01E2          ; LATIN CAPITAL LETTER AE WITH MACRON
    "Ǣ": [.a, .e, .macron, .above, .capital],

    //01E3          ; LATIN SMALL LETTER AE WITH MACRON
    "ǣ": [.a, .e, .macron, .above],

    //01E4          ; LATIN CAPITAL LETTER G WITH STROKE
    "Ǥ": [.g, .stroke, .capital],

    //01E5          ; LATIN SMALL LETTER G WITH STROKE
    "ǥ": [.g, .stroke],

    //01E6          ; LATIN CAPITAL LETTER G WITH CARON
    "Ǧ": [.g, .caron, .above, .capital],

    //01E7          ; LATIN SMALL LETTER G WITH CARON
    "ǧ": [.g, .caron, .above],

    //01E8          ; LATIN CAPITAL LETTER K WITH CARON
    "Ǩ": [.k, .caron, .above, .capital],

    //01E9          ; LATIN SMALL LETTER K WITH CARON
    "ǩ": [.k, .caron, .above],

    //01EA          ; LATIN CAPITAL LETTER O WITH OGONEK
    "Ǫ": [.o, .ogonek, .below, .capital],

    //01EB          ; LATIN SMALL LETTER O WITH OGONEK
    "ǫ": [.o, .ogonek, .below],

    //01EC          ; LATIN CAPITAL LETTER O WITH OGONEK AND MACRON
    "Ǭ": [.o, .ogonek, .below, .macron, .above, .capital],

    //01ED          ; LATIN SMALL LETTER O WITH OGONEK AND MACRON
    "ǭ": [.o, .ogonek, .below, .macron, .above],

    //01EE          ; LATIN CAPITAL LETTER EZH WITH CARON
    "Ǯ": [.z, .h, .caron, .above, .capital],

    //01EF          ; LATIN SMALL LETTER EZH WITH CARON
    "ǯ": [.z, .h, .caron, .above],

    //01F0          ; LATIN SMALL LETTER J WITH CARON
    "ǰ": [.j, .caron, .above],

    //01F1          ; LATIN CAPITAL LETTER DZ
    "Ǳ": [.d, .capital, .joiner, .z, .capital],

    //01F2          ; LATIN CAPITAL LETTER D WITH SMALL LETTER Z
    "ǲ": [.d, .capital, .joiner, .z],

    //01F3          ; LATIN SMALL LETTER DZ
    "ǳ": [.d, .joiner, .z],

    //01F4          ; LATIN CAPITAL LETTER G WITH ACUTE
    "Ǵ": [.g, .acute, .above, .capital],

    //01F5          ; LATIN SMALL LETTER G WITH ACUTE
    "ǵ": [.g, .acute, .above],

    //01F6          ; LATIN CAPITAL LETTER HWAIR
    "Ƕ": [.h, .v, .capital],

    //01F7          ; LATIN CAPITAL LETTER WYNN
    "Ƿ": [.w, .h, .capital],

    //01F8          ; LATIN CAPITAL LETTER N WITH GRAVE
    "Ǹ": [.n, .grave, .above, .capital],

    //01F9          ; LATIN SMALL LETTER N WITH GRAVE
    "ǹ": [.n, .grave, .above],

    //01FA          ; LATIN CAPITAL LETTER A WITH RING ABOVE AND ACUTE
    "Ǻ": [.a, .ring, .above, .acute, .above, .capital],

    //01FB          ; LATIN SMALL LETTER A WITH RING ABOVE AND ACUTE
    "ǻ": [.a, .ring, .above, .acute, .above],

    //01FC          ; LATIN CAPITAL LETTER AE WITH ACUTE
    "Ǽ": [.a, .e, .acute, .above, .capital],

    //01FD          ; LATIN SMALL LETTER AE WITH ACUTE
    "ǽ": [.a, .e, .acute, .above],

    //01FE          ; LATIN CAPITAL LETTER O WITH STROKE AND ACUTE
    "Ǿ": [.o, .diagonalStroke, .acute, .above, .capital],

    //01FF          ; LATIN SMALL LETTER O WITH STROKE AND ACUTE
    "ǿ": [.o, .diagonalStroke, .acute, .above],

    //0200          ; LATIN CAPITAL LETTER A WITH DOUBLE GRAVE
    "Ȁ": [.a, .grave, .doubled, .above, .capital],

    //0201          ; LATIN SMALL LETTER A WITH DOUBLE GRAVE
    "ȁ": [.a, .grave, .doubled, .above],

    //0202          ; LATIN CAPITAL LETTER A WITH INVERTED BREVE
    "Ȃ": [.a, .invertedBreve, .above, .capital],

    //0203          ; LATIN SMALL LETTER A WITH INVERTED BREVE
    "ȃ": [.a, .invertedBreve, .above],

    //0204          ; LATIN CAPITAL LETTER E WITH DOUBLE GRAVE
    "Ȅ": [.e, .grave, .doubled, .above, .capital],

    //0205          ; LATIN SMALL LETTER E WITH DOUBLE GRAVE
    "ȅ": [.e, .grave, .doubled, .above],

    //0206          ; LATIN CAPITAL LETTER E WITH INVERTED BREVE
    "Ȇ": [.e, .invertedBreve, .above, .capital],

    //0207          ; LATIN SMALL LETTER E WITH INVERTED BREVE
    "ȇ": [.e, .invertedBreve, .above],

    //0208          ; LATIN CAPITAL LETTER I WITH DOUBLE GRAVE
    "Ȉ": [.i, .grave, .doubled, .above, .capital],

    //0209          ; LATIN SMALL LETTER I WITH DOUBLE GRAVE
    "ȉ": [.i, .grave, .doubled, .above],

    //020A          ; LATIN CAPITAL LETTER I WITH INVERTED BREVE
    "Ȋ": [.i, .invertedBreve, .above, .capital],

    //020B          ; LATIN SMALL LETTER I WITH INVERTED BREVE
    "ȋ": [.i, .invertedBreve, .above],

    //020C          ; LATIN CAPITAL LETTER O WITH DOUBLE GRAVE
    "Ȍ": [.o, .grave, .doubled, .above, .capital],

    //020D          ; LATIN SMALL LETTER O WITH DOUBLE GRAVE
    "ȍ": [.o, .grave, .doubled, .above],

    //020E          ; LATIN CAPITAL LETTER O WITH INVERTED BREVE
    "Ȏ": [.o, .invertedBreve, .above, .capital],

    //020F          ; LATIN SMALL LETTER O WITH INVERTED BREVE
    "ȏ": [.o, .invertedBreve, .above],

    //0210          ; LATIN CAPITAL LETTER R WITH DOUBLE GRAVE
    "Ȑ": [.r, .grave, .doubled, .above, .capital],

    //0211          ; LATIN SMALL LETTER R WITH DOUBLE GRAVE
    "ȑ": [.r, .grave, .doubled, .above],

    //0212          ; LATIN CAPITAL LETTER R WITH INVERTED BREVE
    "Ȓ": [.r, .invertedBreve, .above, .capital],

    //0213          ; LATIN SMALL LETTER R WITH INVERTED BREVE
    "ȓ": [.r, .invertedBreve, .above],

    //0214          ; LATIN CAPITAL LETTER U WITH DOUBLE GRAVE
    "Ȕ": [.u, .grave, .doubled, .above, .capital],

    //0215          ; LATIN SMALL LETTER U WITH DOUBLE GRAVE
    "ȕ": [.u, .grave, .doubled, .above],

    //0216          ; LATIN CAPITAL LETTER U WITH INVERTED BREVE
    "Ȗ": [.u, .invertedBreve, .above, .capital],

    //0217          ; LATIN SMALL LETTER U WITH INVERTED BREVE
    "ȗ": [.u, .invertedBreve, .above],

    //0218          ; LATIN CAPITAL LETTER S WITH COMMA BELOW
    "Ș": [.s, .comma, .below, .capital],

    //0219          ; LATIN SMALL LETTER S WITH COMMA BELOW
    "ș": [.s, .comma, .below],

    //021A          ; LATIN CAPITAL LETTER T WITH COMMA BELOW
    "Ț": [.t, .comma, .below, .capital],

    //021B          ; LATIN SMALL LETTER T WITH COMMA BELOW
    "ț": [.t, .comma, .below],

    //021C          ; LATIN CAPITAL LETTER YOGH
    "Ȝ": [.y, .h, .capital],

    //021D          ; LATIN SMALL LETTER YOGH
    "ȝ": [.y, .h],

    //021E          ; LATIN CAPITAL LETTER H WITH CARON
    "Ȟ": [.h, .caron, .above, .capital],

    //021F          ; LATIN SMALL LETTER H WITH CARON
    "ȟ": [.h, .caron, .above],

    //0220          ; LATIN CAPITAL LETTER N WITH LONG RIGHT LEG
    "Ƞ": [.n, .longLeg, .capital],

    //0221          ; LATIN SMALL LETTER D WITH CURL
    "ȡ": [.d, .curl],

    //0222          ; LATIN CAPITAL LETTER OU
    "Ȣ": [.o, .uTop, .capital],

    //0223          ; LATIN SMALL LETTER OU
    "ȣ": [.o, .uTop],

    //0224          ; LATIN CAPITAL LETTER Z WITH HOOK
    "Ȥ": [.z, .hook, .capital],

    //0225          ; LATIN SMALL LETTER Z WITH HOOK
    "ȥ": [.z, .hook],

    //0226          ; LATIN CAPITAL LETTER A WITH DOT ABOVE
    "Ȧ": [.a, .dot, .above, .capital],

    //0227          ; LATIN SMALL LETTER A WITH DOT ABOVE
    "ȧ": [.a, .dot, .above],

    //0228          ; LATIN CAPITAL LETTER E WITH CEDILLA
    "Ȩ": [.e, .cedilla, .capital],

    //0229          ; LATIN SMALL LETTER E WITH CEDILLA
    "ȩ": [.e, .cedilla],

    //022A          ; LATIN CAPITAL LETTER O WITH DIAERESIS AND MACRON
    "Ȫ": [.o, .diaeresis, .above, .macron, .above, .capital],

    //022B          ; LATIN SMALL LETTER O WITH DIAERESIS AND MACRON
    "ȫ": [.o, .diaeresis, .above, .macron, .above],

    //022C          ; LATIN CAPITAL LETTER O WITH TILDE AND MACRON
    "Ȭ": [.o, .tilde, .above, .macron, .above, .capital],

    //022D          ; LATIN SMALL LETTER O WITH TILDE AND MACRON
    "ȭ": [.o, .tilde, .above, .macron, .above],

    //022E          ; LATIN CAPITAL LETTER O WITH DOT ABOVE
    "Ȯ": [.o, .dot, .above, .capital],

    //022F          ; LATIN SMALL LETTER O WITH DOT ABOVE
    "ȯ": [.o, .dot, .above],

    //0230          ; LATIN CAPITAL LETTER O WITH DOT ABOVE AND MACRON
    "Ȱ": [.o, .dot, .above, .macron, .above, .capital],

    //0231          ; LATIN SMALL LETTER O WITH DOT ABOVE AND MACRON
    "ȱ": [.o, .dot, .above, .macron, .above],

    //0232          ; LATIN CAPITAL LETTER Y WITH MACRON
    "Ȳ": [.y, .macron, .above, .capital],

    //0233          ; LATIN SMALL LETTER Y WITH MACRON
    "ȳ": [.y, .macron, .above],

    //0234          ; LATIN SMALL LETTER L WITH CURL
    "ȴ": [.l, .curl],

    //0235          ; LATIN SMALL LETTER N WITH CURL
    "ȵ": [.n, .curl],

    //0236          ; LATIN SMALL LETTER T WITH CURL
    "ȶ": [.t, .curl],

    //0237          ; LATIN SMALL LETTER DOTLESS J
    "ȷ": [.j, .dot, .above],

    //0238          ; LATIN SMALL LETTER DB DIGRAPH
    "ȸ": [.d, .b],

    //0239          ; LATIN SMALL LETTER QP DIGRAPH
    "ȹ": [.q, .p],

    //023A          ; LATIN CAPITAL LETTER A WITH STROKE
    "Ⱥ": [.a, .diagonalStroke, .capital],

    //023B          ; LATIN CAPITAL LETTER C WITH STROKE
    "Ȼ": [.c, .diagonalStroke, .capital],

    //023C          ; LATIN SMALL LETTER C WITH STROKE
    "ȼ": [.c, .diagonalStroke],

    //023D          ; LATIN CAPITAL LETTER L WITH BAR
    "Ƚ": [.l, .stroke, .capital],

    //023E          ; LATIN CAPITAL LETTER T WITH DIAGONAL STROKE
    "Ⱦ": [.t, .diagonalStroke, .capital],

    //023F          ; LATIN SMALL LETTER S WITH SWASH TAIL
    "ȿ": [.s, .tail],

    //0240          ; LATIN SMALL LETTER Z WITH SWASH TAIL
    "ɀ": [.z, .tail],

    //0241          ; LATIN CAPITAL LETTER GLOTTAL STOP
    "Ɂ": [.h, .h, .capital],

    //0242          ; LATIN SMALL LETTER GLOTTAL STOP
    "ɂ": [.h, .h],

    //0243          ; LATIN CAPITAL LETTER B WITH STROKE
    "Ƀ": [.b, .stroke, .capital],

    //0244          ; LATIN CAPITAL LETTER U BAR
    "Ʉ": [.u, .stroke, .capital],

    //0245          ; LATIN CAPITAL LETTER TURNED V
    "Ʌ": [.v, .turned, .capital],

    //0246          ; LATIN CAPITAL LETTER E WITH STROKE
    "Ɇ": [.e, .diagonalStroke, .capital],

    //0247          ; LATIN SMALL LETTER E WITH STROKE
    "ɇ": [.e, .diagonalStroke],

    //0248          ; LATIN CAPITAL LETTER J WITH STROKE
    "Ɉ": [.j, .stroke, .capital],

    //0249          ; LATIN SMALL LETTER J WITH STROKE
    "ɉ": [.j, .stroke],

    //024A          ; LATIN CAPITAL LETTER SMALL Q WITH HOOK TAIL
    "Ɋ": [.q, .retroflexHook, .capital], //?!

    //024B          ; LATIN SMALL LETTER Q WITH HOOK TAIL
    "ɋ": [.q, .retroflexHook],

    //024C          ; LATIN CAPITAL LETTER R WITH STROKE
    "Ɍ": [.r, .stroke, .capital],

    //024D          ; LATIN SMALL LETTER R WITH STROKE
    "ɍ": [.r, .stroke],

    //024E          ; LATIN CAPITAL LETTER Y WITH STROKE
    "Ɏ": [.y, .stroke, .capital],

    //024F          ; LATIN SMALL LETTER Y WITH STROKE
    "ɏ": [.y, .stroke],

    
    // MARK: - 0250..02AF; IPA Extensions
    
    //0250          ; LATIN SMALL LETTER TURNED A
    "ɐ": [.a, .turned],

    //0251          ; LATIN SMALL LETTER ALPHA
    "ɑ": [.a, .h],

    //0252          ; LATIN SMALL LETTER TURNED ALPHA
    "ɒ": [.a, .h, .turned],

    //0253          ; LATIN SMALL LETTER B WITH HOOK
    "ɓ": [.b, .hook],

    //0254          ; LATIN SMALL LETTER OPEN O
    "ɔ": [.o, .open],

    //0255          ; LATIN SMALL LETTER C WITH CURL
    "ɕ": [.s, .curl],

    //0256          ; LATIN SMALL LETTER D WITH TAIL
    "ɖ": [.d, .retroflexHook],

    //0257          ; LATIN SMALL LETTER D WITH HOOK
    "ɗ": [.d, .hook],

    //0258          ; LATIN SMALL LETTER REVERSED E
    "ɘ": [.e, .reversed],

    //0259          ; LATIN SMALL LETTER SCHWA
    "ə": [.schwa],

    //025A          ; LATIN SMALL LETTER SCHWA WITH HOOK
    "ɚ": [.schwa, .rhoticHook],

    //025B          ; LATIN SMALL LETTER OPEN E
    "ɛ": [.e, .open],

    //025C          ; LATIN SMALL LETTER REVERSED OPEN E
    "ɜ": [.e, .open, .reversed],

    //025D          ; LATIN SMALL LETTER REVERSED OPEN E WITH HOOK
    "ɝ": [.e, .open, .reversed, .rhoticHook],

    //025E          ; LATIN SMALL LETTER CLOSED REVERSED OPEN E
    "ɞ": [.e, .open, .closed, .reversed],

    //025F          ; LATIN SMALL LETTER DOTLESS J WITH STROKE
    "ɟ": [.j, .stroke, .dot, .above],

    //0260          ; LATIN SMALL LETTER G WITH HOOK
    "ɠ": [.g, .hook],

    //0261          ; LATIN SMALL LETTER SCRIPT G
    "ɡ": [.g, .letterScript],

    //0262          ; LATIN LETTER SMALL CAPITAL G
    "ɢ": [.g, .smallCapital],

    //0263          ; LATIN SMALL LETTER GAMMA
    "ɣ": [.g, .h],

    //0264          ; LATIN SMALL LETTER RAMS HORN
    "ɤ": [.o, .ramsHorn],

    //0265          ; LATIN SMALL LETTER TURNED H
    "ɥ": [.h, .turned],

    //0266          ; LATIN SMALL LETTER H WITH HOOK
    "ɦ": [.h, .hook],

    //0267          ; LATIN SMALL LETTER HENG WITH HOOK
    "ɧ": [.h, .g, .hook],

    //0268          ; LATIN SMALL LETTER I WITH STROKE
    "ɨ": [.i, .stroke],

    //0269          ; LATIN SMALL LETTER IOTA
    "ɩ": [.i, .h],

    //026A          ; LATIN LETTER SMALL CAPITAL I
    "ɪ": [.i, .smallCapital],

    //026B          ; LATIN SMALL LETTER L WITH MIDDLE TILDE
    "ɫ": [.l, .tilde],

    //026C          ; LATIN SMALL LETTER L WITH BELT
    "ɬ": [.l, .belt],

    //026D          ; LATIN SMALL LETTER L WITH RETROFLEX HOOK
    "ɭ": [.l, .retroflexHook],

    //026E          ; LATIN SMALL LETTER LEZH
    "ɮ": [.l, .z, .h],

    //026F          ; LATIN SMALL LETTER TURNED M
    "ɯ": [.m, .turned],

    //0270          ; LATIN SMALL LETTER TURNED M WITH LONG LEG
    "ɰ": [.m, .l, .turned], //?!

    //0271          ; LATIN SMALL LETTER M WITH HOOK
    "ɱ": [.m, .hook],

    //0272          ; LATIN SMALL LETTER N WITH LEFT HOOK
    "ɲ": [.n, .hook],

    //0273          ; LATIN SMALL LETTER N WITH RETROFLEX HOOK
    "ɳ": [.n, .retroflexHook],

    //0274          ; LATIN LETTER SMALL CAPITAL N
    "ɴ": [.n, .smallCapital],

    //0275          ; LATIN SMALL LETTER BARRED O
    "ɵ": [.o, .stroke],

    //0276          ; LATIN LETTER SMALL CAPITAL OE
    "ɶ": [.o, .e, .smallCapital],

    //0277          ; LATIN SMALL LETTER CLOSED OMEGA
    "ɷ": [.o, .o, .h, .closed],

    //0278          ; LATIN SMALL LETTER PHI
    "ɸ": [.p, .h],

    //0279          ; LATIN SMALL LETTER TURNED R
    "ɹ": [.r, .turned],

    //027A          ; LATIN SMALL LETTER TURNED R WITH LONG LEG
    "ɺ": [.r, .longLeg, .turned],

    //027B          ; LATIN SMALL LETTER TURNED R WITH HOOK
    "ɻ": [.r, .retroflexHook, .turned],

    //027C          ; LATIN SMALL LETTER R WITH LONG LEG
    "ɼ": [.r, .longLeg],

    //027D          ; LATIN SMALL LETTER R WITH TAIL
    "ɽ": [.r, .retroflexHook],

    //027E          ; LATIN SMALL LETTER R WITH FISHHOOK
    "ɾ": [.r, .hook],

    //027F          ; LATIN SMALL LETTER REVERSED R WITH FISHHOOK
    "ɿ": [.r, .hook, .reversed],

    //0280          ; LATIN LETTER SMALL CAPITAL R
    "ʀ": [.r, .smallCapital],

    //0281          ; LATIN LETTER SMALL CAPITAL INVERTED R
    "ʁ": [.r, .smallCapital, .inverted],

    //0282          ; LATIN SMALL LETTER S WITH HOOK
    "ʂ": [.s, .retroflexHook],

    //0283          ; LATIN SMALL LETTER ESH
    "ʃ": [.s, .h],

    //0284          ; LATIN SMALL LETTER DOTLESS J WITH STROKE AND HOOK
    "ʄ": [.j, .stroke, .hook],

    //0285          ; LATIN SMALL LETTER SQUAT REVERSED ESH
    "ʅ": [.r, .retroflexHook, .hook, .reversed],

    //0286          ; LATIN SMALL LETTER ESH WITH CURL
    "ʆ": [.s, .h, .curl],

    //0287          ; LATIN SMALL LETTER TURNED T
    "ʇ": [.t, .turned],

    //0288          ; LATIN SMALL LETTER T WITH RETROFLEX HOOK
    "ʈ": [.t, .retroflexHook],

    //0289          ; LATIN SMALL LETTER U BAR
    "ʉ": [.u, .stroke],

    //028A          ; LATIN SMALL LETTER UPSILON
    "ʊ": [.u, .h],

    //028B          ; LATIN SMALL LETTER V WITH HOOK
    "ʋ": [.v, .h],

    //028C          ; LATIN SMALL LETTER TURNED V
    "ʌ": [.v, .turned],

    //028D          ; LATIN SMALL LETTER TURNED W
    "ʍ": [.w, .turned],

    //028E          ; LATIN SMALL LETTER TURNED Y
    "ʎ": [.y, .turned],

    //028F          ; LATIN LETTER SMALL CAPITAL Y
    "ʏ": [.y, .smallCapital],

    //0290          ; LATIN SMALL LETTER Z WITH RETROFLEX HOOK
    "ʐ": [.z, .retroflexHook],

    //0291          ; LATIN SMALL LETTER Z WITH CURL
    "ʑ": [.z, .curl],

    //0292          ; LATIN SMALL LETTER EZH
    "ʒ": [.z, .h],

    //0293          ; LATIN SMALL LETTER EZH WITH CURL
    "ʓ": [.z, .h, .curl],

    //0294          ; LATIN LETTER GLOTTAL STOP
    "ʔ": [.apostrophe, .h],

    //0295          ; LATIN LETTER PHARYNGEAL VOICED FRICATIVE
    "ʕ": [.apostrophe, .h, .reversed],

    //0296          ; LATIN LETTER INVERTED GLOTTAL STOP
    "ʖ": [.apostrophe, .h, .inverted],

    //0297          ; LATIN LETTER STRETCHED C
    "ʗ": [.c, .h],

    //0298          ; LATIN LETTER BILABIAL CLICK
    "ʘ": [.o, .click],

    //0299          ; LATIN LETTER SMALL CAPITAL B
    "ʙ": [.b, .smallCapital],

    //029A          ; LATIN SMALL LETTER CLOSED OPEN E
    "ʚ": [.e, .open, .closed],

    //029B          ; LATIN LETTER SMALL CAPITAL G WITH HOOK
    "ʛ": [.g, .hook, .smallCapital],

    //029C          ; LATIN LETTER SMALL CAPITAL H
    "ʜ": [.h, .smallCapital],

    //029D          ; LATIN SMALL LETTER J WITH CROSSED-TAIL
    "ʝ": [.j, .crossedTail],

    //029E          ; LATIN SMALL LETTER TURNED K
    "ʞ": [.k, .turned],

    //029F          ; LATIN LETTER SMALL CAPITAL L
    "ʟ": [.l, .smallCapital],

    //02A0          ; LATIN SMALL LETTER Q WITH HOOK
    "ʠ": [.q, .hook],

    //02A1          ; LATIN LETTER GLOTTAL STOP WITH STROKE
    "ʡ": [.apostrophe, .h, .stroke],

    //02A2          ; LATIN LETTER REVERSED GLOTTAL STOP WITH STROKE
    "ʢ": [.apostrophe, .h, .stroke, .reversed],

    //02A3          ; LATIN SMALL LETTER DZ DIGRAPH
    "ʣ": [.d, .z],

    //02A4          ; LATIN SMALL LETTER DEZH DIGRAPH
    "ʤ": [.d, .z, .h],

    //02A5          ; LATIN SMALL LETTER DZ DIGRAPH WITH CURL
    "ʥ": [.d, .z, .curl],

    //02A6          ; LATIN SMALL LETTER TS DIGRAPH
    "ʦ": [.t, .s],

    //02A7          ; LATIN SMALL LETTER TESH DIGRAPH
    "ʧ": [.t, .s, .h],

    //02A8          ; LATIN SMALL LETTER TC DIGRAPH WITH CURL
    "ʨ": [.t, .s, .curl],

    //02A9          ; LATIN SMALL LETTER FENG DIGRAPH
    "ʩ": [.f, .n, .g],

    //02AA          ; LATIN SMALL LETTER LS DIGRAPH
    "ʪ": [.l, .s],

    //02AB          ; LATIN SMALL LETTER LZ DIGRAPH
    "ʫ": [.l, .z],

    //02AC          ; LATIN LETTER BILABIAL PERCUSSIVE
    "ʬ": [.w, .wTop],

    //02AD          ; LATIN LETTER BIDENTAL PERCUSSIVE
    "ʭ": [.d, .dTop],

    //02AE          ; LATIN SMALL LETTER TURNED H WITH FISHHOOK
    "ʮ": [.h, .hook, .turned],

    //02AF          ; LATIN SMALL LETTER TURNED H WITH FISHHOOK AND TAIL
    "ʯ": [.h, .retroflexHook, .hook, .turned],

    
    // MARK: - 02B0..02FF; Spacing Modifier Letters
    
    //02B0          ; MODIFIER LETTER SMALL H
    "ʰ": [.h, .superscript],

    //02B1          ; MODIFIER LETTER SMALL H WITH HOOK
    "ʱ": [.h, .hook, .superscript],

    //02B2          ; MODIFIER LETTER SMALL J
    "ʲ": [.j, .superscript],

    //02B3          ; MODIFIER LETTER SMALL R
    "ʳ": [.r, .superscript],

    //02B4          ; MODIFIER LETTER SMALL TURNED R
    "ʴ": [.r, .turned, .superscript],

    //02B5          ; MODIFIER LETTER SMALL TURNED R WITH HOOK
    "ʵ": [.r, .turned, .retroflexHook, .superscript],

    //02B6          ; MODIFIER LETTER SMALL CAPITAL INVERTED R
    "ʶ": [.r, .smallCapital, .inverted, .superscript],

    //02B7          ; MODIFIER LETTER SMALL W
    "ʷ": [.w, .superscript],

    //02B8          ; MODIFIER LETTER SMALL Y
    "ʸ": [.y, .superscript],

    //02B9          ; MODIFIER LETTER PRIME
    "ʹ": [.modifierPrime],

    //02BA          ; MODIFIER LETTER DOUBLE PRIME
    "ʺ": [.modifierPrime, .doubled],

    //02BB          ; MODIFIER LETTER TURNED COMMA
    "ʻ": [.comma, .turned, .superscript],

    //02BC          ; MODIFIER LETTER APOSTROPHE
    "ʼ": [.comma, .superscript],

    //02BD          ; MODIFIER LETTER REVERSED COMMA
    "ʽ": [.comma, .reversed, .superscript],

    //02BE          ; MODIFIER LETTER RIGHT HALF RING
    "ʾ": [.ring, .rightHalf, .superscript],

    //02BF          ; MODIFIER LETTER LEFT HALF RING
    "ʿ": [.ring, .leftHalf, .superscript],

    //02C0          ; MODIFIER LETTER GLOTTAL STOP
    "ˀ": [.apostrophe, .h, .superscript],

    //02C1          ; MODIFIER LETTER REVERSED GLOTTAL STOP
    "ˁ": [.apostrophe, .h, .reversed, .superscript],

    //02C2          ; MODIFIER LETTER LEFT ARROWHEAD
    "˂": [.arrowhead, .left, .superscript],

    //02C3          ; MODIFIER LETTER RIGHT ARROWHEAD
    "˃": [.arrowhead, .left, .superscript],

    //02C4          ; MODIFIER LETTER UP ARROWHEAD
    "˄": [.arrowhead, .up, .superscript],

    //02C5          ; MODIFIER LETTER DOWN ARROWHEAD
    "˅": [.arrowhead, .down, .superscript],

    //02C6          ; MODIFIER LETTER CIRCUMFLEX ACCENT
    "ˆ": [.circumflex, .superscript],

    //02C7          ; CARON
    "ˇ": [.caron, .superscript],

    //02C8          ; MODIFIER LETTER VERTICAL LINE
    "ˈ": [.verticalLine, .superscript],

    //02C9          ; MODIFIER LETTER MACRON
    "ˉ": [.macron, .superscript],

    //02CA          ; MODIFIER LETTER ACUTE ACCENT
    "ˊ": [.acute, .superscript],

    //02CB          ; MODIFIER LETTER GRAVE ACCENT
    "ˋ": [.grave, .superscript],

    //02CC          ; MODIFIER LETTER LOW VERTICAL LINE
    "ˌ": [.verticalLine, .subscript],

    //02CD          ; MODIFIER LETTER LOW MACRON
    "ˍ": [.macron, .subscript],

    //02CE          ; MODIFIER LETTER LOW GRAVE ACCENT
    "ˎ": [.grave, .subscript],

    //02CF          ; MODIFIER LETTER LOW ACUTE ACCENT
    "ˏ": [.acute, .subscript],

    //02D0          ; MODIFIER LETTER TRIANGULAR COLON
    "ː": [.long],

    //02D1          ; MODIFIER LETTER HALF TRIANGULAR COLON
    "ˑ": [.halfLong],

    //02D2          ; MODIFIER LETTER CENTRED RIGHT HALF RING
    "˒": [.ring, .rightHalf, .subscript],

    //02D3          ; MODIFIER LETTER CENTRED LEFT HALF RING
    "˓": [.ring, .leftHalf, .subscript],

    //02D4          ; MODIFIER LETTER UP TACK
    "˔": [.modifierTack, .up],

    //02D5          ; MODIFIER LETTER DOWN TACK
    "˕": [.modifierTack, .down],

    //02D6          ; MODIFIER LETTER PLUS SIGN
    "˖": [.modifierPlus],

    //02D7          ; MODIFIER LETTER MINUS SIGN
    "˗": [.modifierMinus],

    //02D8          ; BREVE
    "˘": [.breve, .superscript],

    //02D9          ; DOT ABOVE
    "˙": [.dot, .superscript],

    //02DA          ; RING ABOVE
    "˚": [.ring, .superscript],

    //02DB          ; OGONEK
    "˛": [.ogonek, .subscript],

    //02DC          ; SMALL TILDE
    "˜": [.tilde, .superscript],

    //02DD          ; DOUBLE ACUTE ACCENT
    "˝": [.acute, .doubled, .superscript],

    //02DE          ; MODIFIER LETTER RHOTIC HOOK
    "˞": [.rhoticHook],

    //02DF          ; MODIFIER LETTER CROSS ACCENT
    "˟": [.cross, .superscript],

    //02E0          ; MODIFIER LETTER SMALL GAMMA
    "ˠ": [.g, .h, .superscript],

    //02E1          ; MODIFIER LETTER SMALL L
    "ˡ": [.l, .superscript],

    //02E2          ; MODIFIER LETTER SMALL S
    "ˢ": [.s, .superscript],

    //02E3          ; MODIFIER LETTER SMALL X
    "ˣ": [.x, .superscript],

    //02E4          ; MODIFIER LETTER SMALL REVERSED GLOTTAL STOP
    "ˤ": [],

    //02E5          ; MODIFIER LETTER EXTRA-HIGH TONE BAR
    "˥": [.extraHightTone],

    //02E6          ; MODIFIER LETTER HIGH TONE BAR
    "˦": [.hightTone],

    //02E7          ; MODIFIER LETTER MID TONE BAR
    "˧": [.midTone],

    //02E8          ; MODIFIER LETTER LOW TONE BAR
    "˨": [.lowTone],

    //02E9          ; MODIFIER LETTER EXTRA-LOW TONE BAR
    "˩": [.extraLowTone],

    //02EA          ; MODIFIER LETTER YIN DEPARTING TONE MARK
    "˪": [],

    //02EB          ; MODIFIER LETTER YANG DEPARTING TONE MARK
    "˫": [],

    //02EC          ; MODIFIER LETTER VOICING
    "ˬ": [.caron, .subscript],

    //02ED          ; MODIFIER LETTER UNASPIRATED
    "˭": [.unaspirated, .superscript],

    //02EE          ; MODIFIER LETTER DOUBLE APOSTROPHE
    "ˮ": [.comma, .doubled, .superscript],

    //02EF          ; MODIFIER LETTER LOW DOWN ARROWHEAD
    "˯": [.arrowhead, .down, .subscript],

    //02F0          ; MODIFIER LETTER LOW UP ARROWHEAD
    "˰": [.arrowhead, .down, .subscript],

    //02F1          ; MODIFIER LETTER LOW LEFT ARROWHEAD
    "˱": [.arrowhead, .left, .subscript],

    //02F2          ; MODIFIER LETTER LOW RIGHT ARROWHEAD
    "˲": [.arrowhead, .right, .subscript],

    //02F3          ; MODIFIER LETTER LOW RING
    "˳": [.ring, .subscript],

    //02F4          ; MODIFIER LETTER MIDDLE GRAVE ACCENT
    "˴": [.grave],

    //02F5          ; MODIFIER LETTER MIDDLE DOUBLE GRAVE ACCENT
    "˵": [.grave, .doubled],

    //02F6          ; MODIFIER LETTER MIDDLE DOUBLE ACUTE ACCENT
    "˶": [.acute, .doubled],

    //02F7          ; MODIFIER LETTER LOW TILDE
    "˷": [.tilde, .subscript],

    //02F8          ; MODIFIER LETTER RAISED COLON
    "˸": [.colon, .superscript],

    //02F9          ; MODIFIER LETTER BEGIN HIGH TONE
    "˹": [.squareBracket, .topHalf],

    //02FA          ; MODIFIER LETTER END HIGH TONE
    "˺": [.squareBracket, .turned, .topHalf],

    //02FB          ; MODIFIER LETTER BEGIN LOW TONE
    "˻": [.squareBracket, .bottomHalf],

    //02FC          ; MODIFIER LETTER END LOW TONE
    "˼": [.squareBracket, .turned, .bottomHalf],

    //02FD          ; MODIFIER LETTER SHELF
    "˽": [.shelf],

    //02FE          ; MODIFIER LETTER OPEN SHELF
    "˾": [.shelf, .open],

    //02FF          ; MODIFIER LETTER LOW LEFT ARROW
    "˿": [.macron, .subscript, .lessThanSign],

    
    // MARK: - 0300..036F; Combining Diacritical Marks
    
    //0300          ; COMBINING GRAVE ACCENT
    "̀": [.grave, .above],

    //0301          ; COMBINING ACUTE ACCENT
    "́": [.acute, .above],

    //0302          ; COMBINING CIRCUMFLEX ACCENT
    "̂": [.circumflex, .above],

    //0303          ; COMBINING TILDE
    "̃": [.tilde, .above],

    //0304          ; COMBINING MACRON
    "̄": [.macron, .above],

    //0305          ; COMBINING OVERLINE
    "̅": [.line, .above],

    //0306          ; COMBINING BREVE
    "̆": [.breve, .above],

    //0307          ; COMBINING DOT ABOVE
    "̇": [.dot, .above],

    //0308          ; COMBINING DIAERESIS
    "̈": [.diaeresis, .above],

    //0309          ; COMBINING HOOK ABOVE
    "̉": [.hook, .above],

    //030A          ; COMBINING RING ABOVE
    "̊": [.ring, .above],

    //030B          ; COMBINING DOUBLE ACUTE ACCENT
    "̋": [.acute, .doubled, .above],

    //030C          ; COMBINING CARON
    "̌": [.caron, .above],

    //030D          ; COMBINING VERTICAL LINE ABOVE
    "̍": [.verticalLine, .above],

    //030E          ; COMBINING DOUBLE VERTICAL LINE ABOVE
    "̎": [.verticalLine, .doubled, .above],

    //030F          ; COMBINING DOUBLE GRAVE ACCENT
    "̏": [.grave, .doubled, .above],

    //0310          ; COMBINING CANDRABINDU
    "̐": [.breve, .above, .dot],

    //0311          ; COMBINING INVERTED BREVE
    "̑": [.invertedBreve, .above],

    //0312          ; COMBINING TURNED COMMA ABOVE
    "̒": [.comma, .turned, .above],

    //0313          ; COMBINING COMMA ABOVE
    "̓": [.comma, .above],

    //0314          ; COMBINING REVERSED COMMA ABOVE
    "̔": [.comma, .reversed, .above],

    //0315          ; COMBINING COMMA ABOVE RIGHT
    "̕": [.comma, .aboveRight],

    //0316          ; COMBINING GRAVE ACCENT BELOW
    "̖": [.grave, .below],

    //0317          ; COMBINING ACUTE ACCENT BELOW
    "̗": [.acute, .below],

    //0318          ; COMBINING LEFT TACK BELOW
    "̘": [.tack, .left, .below],

    //0319          ; COMBINING RIGHT TACK BELOW
    "̙": [.tack, .right, .below],

    //031A          ; COMBINING LEFT ANGLE ABOVE
    "̚": [.angle, .left, .above],

    //031B          ; COMBINING HORN
    "̛": [.horn],

    //031C          ; COMBINING LEFT HALF RING BELOW
    "̜": [.ring, .leftHalf, .below],

    //031D          ; COMBINING UP TACK BELOW
    "̝": [.tack, .up, .below],

    //031E          ; COMBINING DOWN TACK BELOW
    "̞": [.tack, .down, .below],

    //031F          ; COMBINING PLUS SIGN BELOW
    "̟": [.plusSign, .below],

    //0320          ; COMBINING MINUS SIGN BELOW
    "̠": [.minusSign, .below],

    //0321          ; COMBINING PALATALIZED HOOK BELOW
    "̡": [.palatalHook, .below],

    //0322          ; COMBINING RETROFLEX HOOK BELOW
    "̢": [.retroflexHook, .below],

    //0323          ; COMBINING DOT BELOW
    "̣": [.dot, .below],

    //0324          ; COMBINING DIAERESIS BELOW
    "̤": [.diaeresis, .below],

    //0325          ; COMBINING RING BELOW
    "̥": [.ring, .below],

    //0326          ; COMBINING COMMA BELOW
    "̦": [.comma, .below],

    //0327          ; COMBINING CEDILLA
    "̧": [.cedilla, .combining],

    //0328          ; COMBINING OGONEK
    "̨": [.ogonek, .below],

    //0329          ; COMBINING VERTICAL LINE BELOW
    "̩": [.verticalLine, .below],

    //032A          ; COMBINING BRIDGE BELOW
    "̪": [.bridge, .below],

    //032B          ; COMBINING INVERTED DOUBLE ARCH BELOW
    "̫": [.breve, .doubled, .below],

    //032C          ; COMBINING CARON BELOW
    "̬": [.caron, .below],

    //032D          ; COMBINING CIRCUMFLEX ACCENT BELOW
    "̭": [.circumflex, .below],

    //032E          ; COMBINING BREVE BELOW
    "̮": [.breve, .below],

    //032F          ; COMBINING INVERTED BREVE BELOW
    "̯": [.invertedBreve, .below],

    //0330          ; COMBINING TILDE BELOW
    "̰": [.tilde, .below],

    //0331          ; COMBINING MACRON BELOW
    "̱": [.macron, .below],

    //0332          ; COMBINING LOW LINE
    "̲": [.line, .below],

    //0333          ; COMBINING DOUBLE LOW LINE
    "̳": [.line, .doubled, .below],

    //0334          ; COMBINING TILDE OVERLAY
    "̴": [.tilde, .combining],

    //0335          ; COMBINING SHORT STROKE OVERLAY
    "̵": [.shortStroke],

    //0336          ; COMBINING LONG STROKE OVERLAY
    "̶": [.longStroke],

    //0337          ; COMBINING SHORT SOLIDUS OVERLAY
    "̷": [.shortDiagonalStroke],

    //0338          ; COMBINING LONG SOLIDUS OVERLAY
    "̸": [.longDiagonalStroke],

    //0339          ; COMBINING RIGHT HALF RING BELOW
    "̹": [.ring, .rightHalf, .below],

    //033A          ; COMBINING INVERTED BRIDGE BELOW
    "̺": [.invertedBridge, .below],

    //033B          ; COMBINING SQUARE BELOW
    "̻": [.square, .below],

    //033C          ; COMBINING SEAGULL BELOW
    "̼": [.invertedBreve, .doubled, .below],

    //033D          ; COMBINING X ABOVE
    "̽": [.cross, .above],

    //033E          ; COMBINING VERTICAL TILDE
    "̾": [.verticalTilde, .above],

    //033F          ; COMBINING DOUBLE OVERLINE
    "̿": [.line, .doubled, .above],

    //0340          ; COMBINING GRAVE TONE MARK
    //0341          ; COMBINING ACUTE TONE MARK

    //0342          ; COMBINING GREEK PERISPOMENI
    "͂": [],

    //0343          ; COMBINING GREEK KORONIS
    
    //0344          ; COMBINING GREEK DIALYTIKA TONOS
    "̈́": [],

    //0345          ; COMBINING GREEK YPOGEGRAMMENI
    "ͅ": [],

    //0346          ; COMBINING BRIDGE ABOVE
    "͆": [.bridge, .above],

    //0347          ; COMBINING EQUALS SIGN BELOW
    "͇": [.equalsSign, .below],

    //0348          ; COMBINING DOUBLE VERTICAL LINE BELOW
    "͈": [.verticalLine, .doubled, .below],

    //0349          ; COMBINING LEFT ANGLE BELOW
    "͉": [.angle, .left, .below],

    //034A          ; COMBINING NOT TILDE ABOVE
    "͊": [.tilde, .not, .above],

    //034B          ; COMBINING HOMOTHETIC ABOVE
    "͋": [.tilde, .colon, .above],

    //034C          ; COMBINING ALMOST EQUAL TO ABOVE
    "͌": [.tilde, .doubled, .above],

    //034D          ; COMBINING LEFT RIGHT ARROW BELOW
    "͍": [.macron, .below, .lessThanSign, .greaterThanSign],

    //034E          ; COMBINING UPWARDS ARROW BELOW
    "͎": [.verticalLine, .below, .greaterThanSign],

    //034F          ; COMBINING GRAPHEME JOINER
    "͏": [],

    //0350          ; COMBINING RIGHT ARROWHEAD ABOVE
    "͐": [.arrowhead, .right, .above],

    //0351          ; COMBINING LEFT HALF RING ABOVE
    "͑": [.ring, .leftHalf, .above],

    //0352          ; COMBINING FERMATA
    "͒": [.invertedBreve, .above, .dot],

    //0353          ; COMBINING X BELOW
    "͓": [.cross, .below],

    //0354          ; COMBINING LEFT ARROWHEAD BELOW
    "͔": [.arrowhead, .left, .below],

    //0355          ; COMBINING RIGHT ARROWHEAD BELOW
    "͕": [.arrowhead, .right, .below],

    //0356          ; COMBINING RIGHT ARROWHEAD AND UP ARROWHEAD BELOW
    "͖": [.arrowhead, .right, .arrowhead, .up, .below],

    //0357          ; COMBINING RIGHT HALF RING ABOVE
    "͗": [.ring, .rightHalf, .above],

    //0358          ; COMBINING DOT ABOVE RIGHT
    "͘": [.dot, .aboveRight],

    //0359          ; COMBINING ASTERISK BELOW
    "͙": [.asterisk, .below],

    //035A          ; COMBINING DOUBLE RING BELOW
    "͚": [.ring, .double, .below],

    //035B          ; COMBINING ZIGZAG ABOVE
    "͛": [.zigzag, .above],

    //035C          ; COMBINING DOUBLE BREVE BELOW
    "͜": [.breve, .double, .below],

    //035D          ; COMBINING DOUBLE BREVE
    "͝": [.breve, .double, .above],

    //035E          ; COMBINING DOUBLE MACRON
    "͞": [.macron, .double, .above],

    //035F          ; COMBINING DOUBLE MACRON BELOW
    "͟": [.macron, .double, .below],

    //0360          ; COMBINING DOUBLE TILDE
    "͠": [.tilde, .double, .above],

    //0361          ; COMBINING DOUBLE INVERTED BREVE
    "͡": [.invertedBreve, .double, .above],

    //0362          ; COMBINING DOUBLE RIGHTWARDS ARROW BELOW
    "͢": [.macron, .double, .below, .greaterThanSign],

    //0363          ; COMBINING LATIN SMALL LETTER A
    "ͣ": [.a, .above],

    //0364          ; COMBINING LATIN SMALL LETTER E
    "ͤ": [.e, .above],

    //0365          ; COMBINING LATIN SMALL LETTER I
    "ͥ": [.i, .above],

    //0366          ; COMBINING LATIN SMALL LETTER O
    "ͦ": [.o, .above],

    //0367          ; COMBINING LATIN SMALL LETTER U
    "ͧ": [.u, .above],

    //0368          ; COMBINING LATIN SMALL LETTER C
    "ͨ": [.c, .above],

    //0369          ; COMBINING LATIN SMALL LETTER D
    "ͩ": [.d, .above],

    //036A          ; COMBINING LATIN SMALL LETTER H
    "ͪ": [.h, .above],

    //036B          ; COMBINING LATIN SMALL LETTER M
    "ͫ": [.m, .above],

    //036C          ; COMBINING LATIN SMALL LETTER R
    "ͬ": [.r, .above],

    //036D          ; COMBINING LATIN SMALL LETTER T
    "ͭ": [.t, .above],

    //036E          ; COMBINING LATIN SMALL LETTER V
    "ͮ": [.v, .above],

    //036F          ; COMBINING LATIN SMALL LETTER X
    "ͯ": [.x, .above],

    
    // MARK: - 0370..03FF; Greek and Coptic
    
    //0370          ; GREEK CAPITAL LETTER HETA
    //0371          ; GREEK SMALL LETTER HETA
    //0372          ; GREEK CAPITAL LETTER ARCHAIC SAMPI
    //0373          ; GREEK SMALL LETTER ARCHAIC SAMPI
    //0374          ; GREEK NUMERAL SIGN
    //0375          ; GREEK LOWER NUMERAL SIGN
    //0376          ; GREEK CAPITAL LETTER PAMPHYLIAN DIGAMMA
    //0377          ; GREEK SMALL LETTER PAMPHYLIAN DIGAMMA
    //037A          ; GREEK YPOGEGRAMMENI
    //037B          ; GREEK SMALL REVERSED LUNATE SIGMA SYMBOL
    //037C          ; GREEK SMALL DOTTED LUNATE SIGMA SYMBOL
    //037D          ; GREEK SMALL REVERSED DOTTED LUNATE SIGMA SYMBOL
    //037E          ; GREEK QUESTION MARK
    //037F          ; GREEK CAPITAL LETTER YOT
    //0384          ; GREEK TONOS
    //0385          ; GREEK DIALYTIKA TONOS
    //0386          ; GREEK CAPITAL LETTER ALPHA WITH TONOS
    //0387          ; GREEK ANO TELEIA
    //0388          ; GREEK CAPITAL LETTER EPSILON WITH TONOS
    //0389          ; GREEK CAPITAL LETTER ETA WITH TONOS
    //038A          ; GREEK CAPITAL LETTER IOTA WITH TONOS
    //038C          ; GREEK CAPITAL LETTER OMICRON WITH TONOS
    //038E          ; GREEK CAPITAL LETTER UPSILON WITH TONOS
    //038F          ; GREEK CAPITAL LETTER OMEGA WITH TONOS
    //0390          ; GREEK SMALL LETTER IOTA WITH DIALYTIKA AND TONOS
    
    //0391          ; GREEK CAPITAL LETTER ALPHA
    "Α": [.a, .capital, .greek],

    //0392          ; GREEK CAPITAL LETTER BETA
    "Β": [.b, .capital, .greek],

    //0393          ; GREEK CAPITAL LETTER GAMMA
    "Γ": [.g, .capital, .greek],

    //0394          ; GREEK CAPITAL LETTER DELTA
    "Δ": [.d, .capital, .greek],

    //0395          ; GREEK CAPITAL LETTER EPSILON
    "Ε": [.e, .capital, .greek],

    //0396          ; GREEK CAPITAL LETTER ZETA
    "Ζ": [.z, .capital, .greek],

    //0397          ; GREEK CAPITAL LETTER ETA
    "Η": [.h, .capital, .greek],

    //0398          ; GREEK CAPITAL LETTER THETA
    "Θ": [.t, .h, .capital, .greek],

    //0399          ; GREEK CAPITAL LETTER IOTA
    "Ι": [.i, .capital, .greek],

    //039A          ; GREEK CAPITAL LETTER KAPPA
    "Κ": [.k, .capital, .greek],

    //039B          ; GREEK CAPITAL LETTER LAMDA
    "Λ": [.l, .capital, .greek],

    //039C          ; GREEK CAPITAL LETTER MU
    "Μ": [.m, .capital, .greek],

    //039D          ; GREEK CAPITAL LETTER NU
    "Ν": [.n, .capital, .greek],

    //039E          ; GREEK CAPITAL LETTER XI
    "Ξ": [.x, .capital, .greek],

    //039F          ; GREEK CAPITAL LETTER OMICRON
    "Ο": [.o, .capital, .greek],

    //03A0          ; GREEK CAPITAL LETTER PI
    "Π": [.p, .capital, .greek],

    //03A1          ; GREEK CAPITAL LETTER RHO
    "Ρ": [.r, .capital, .greek],

    //03A3          ; GREEK CAPITAL LETTER SIGMA
    "Σ": [.s, .capital, .greek],

    //03A4          ; GREEK CAPITAL LETTER TAU
    "Τ": [.t, .capital, .greek],

    //03A5          ; GREEK CAPITAL LETTER UPSILON
    "Υ": [.y, .capital, .greek],

    //03A6          ; GREEK CAPITAL LETTER PHI
    "Φ": [.p, .h, .capital, .greek],

    //03A7          ; GREEK CAPITAL LETTER CHI
    "Χ": [.c, .h, .capital, .greek],

    //03A8          ; GREEK CAPITAL LETTER PSI
    "Ψ": [.p, .s, .capital, .greek],

    //03A9          ; GREEK CAPITAL LETTER OMEGA
    "Ω": [.o, .o, .capital, .greek],

    //03AA          ; GREEK CAPITAL LETTER IOTA WITH DIALYTIKA
    //03AB          ; GREEK CAPITAL LETTER UPSILON WITH DIALYTIKA
    //03AC          ; GREEK SMALL LETTER ALPHA WITH TONOS
    //03AD          ; GREEK SMALL LETTER EPSILON WITH TONOS
    //03AE          ; GREEK SMALL LETTER ETA WITH TONOS
    //03AF          ; GREEK SMALL LETTER IOTA WITH TONOS
    //03B0          ; GREEK SMALL LETTER UPSILON WITH DIALYTIKA AND TONOS
    
    //03B1          ; GREEK SMALL LETTER ALPHA
    "α": [.a, .greek],

    //03B2          ; GREEK SMALL LETTER BETA
    "β": [.b, .greek],

    //03B3          ; GREEK SMALL LETTER GAMMA
    "γ": [.g, .greek],

    //03B4          ; GREEK SMALL LETTER DELTA
    "δ": [.d, .greek],

    //03B5          ; GREEK SMALL LETTER EPSILON
    "ε": [.e, .greek],

    //03B6          ; GREEK SMALL LETTER ZETA
    "ζ": [.z, .greek],

    //03B7          ; GREEK SMALL LETTER ETA
    "η": [.h, .greek],

    //03B8          ; GREEK SMALL LETTER THETA
    "θ": [.t, .h, .greek],

    //03B9          ; GREEK SMALL LETTER IOTA
    "ι": [.i, .greek],

    //03BA          ; GREEK SMALL LETTER KAPPA
    "κ": [.k, .greek],

    //03BB          ; GREEK SMALL LETTER LAMDA
    "λ": [.l, .greek],

    //03BC          ; GREEK SMALL LETTER MU
    "μ": [.m, .greek],

    //03BD          ; GREEK SMALL LETTER NU
    "ν": [.n, .greek],

    //03BE          ; GREEK SMALL LETTER XI
    "ξ": [.x, .greek],

    //03BF          ; GREEK SMALL LETTER OMICRON
    "ο": [.o, .greek],

    //03C0          ; GREEK SMALL LETTER PI
    "π": [.p, .greek],

    //03C1          ; GREEK SMALL LETTER RHO
    "ρ": [.r, .greek],

    //03C2          ; GREEK SMALL LETTER FINAL SIGMA
    "ς": [.s, .greek, .final],

    //03C3          ; GREEK SMALL LETTER SIGMA
    "σ": [.s, .greek],

    //03C4          ; GREEK SMALL LETTER TAU
    "τ": [.t, .greek],

    //03C5          ; GREEK SMALL LETTER UPSILON
    "υ": [.y, .greek],

    //03C6          ; GREEK SMALL LETTER PHI
    "φ": [.p, .h, .greek],

    //03C7          ; GREEK SMALL LETTER CHI
    "χ": [.c, .h, .greek],

    //03C8          ; GREEK SMALL LETTER PSI
    "ψ": [.p, .s, .greek],

    //03C9          ; GREEK SMALL LETTER OMEGA
    "ω": [.o, .o, .greek],

    //03CA          ; GREEK SMALL LETTER IOTA WITH DIALYTIKA
    //03CB          ; GREEK SMALL LETTER UPSILON WITH DIALYTIKA
    //03CC          ; GREEK SMALL LETTER OMICRON WITH TONOS
    //03CD          ; GREEK SMALL LETTER UPSILON WITH TONOS
    //03CE          ; GREEK SMALL LETTER OMEGA WITH TONOS
    //03CF          ; GREEK CAPITAL KAI SYMBOL
    //03D0          ; GREEK BETA SYMBOL
    
    //03D1          ; GREEK THETA SYMBOL
    "ϑ": [.t, .h, .greek, .symbol],

    //03D2          ; GREEK UPSILON WITH HOOK SYMBOL
    //03D3          ; GREEK UPSILON WITH ACUTE AND HOOK SYMBOL
    //03D4          ; GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL
    
    //03D5          ; GREEK PHI SYMBOL
    "ϕ": [.p, .h, .greek, .symbol],

    //03D6          ; GREEK PI SYMBOL
    "ϖ": [.p, .greek, .symbol],

    //03D7          ; GREEK KAI SYMBOL
    //03D8          ; GREEK LETTER ARCHAIC KOPPA
    //03D9          ; GREEK SMALL LETTER ARCHAIC KOPPA
    //03DA          ; GREEK LETTER STIGMA
    //03DB          ; GREEK SMALL LETTER STIGMA
    
    //03DC          ; GREEK LETTER DIGAMMA
    "Ϝ": [.g, .g, .capital, .greek],

    //03DD          ; GREEK SMALL LETTER DIGAMMA
    "ϝ": [.g, .g, .greek],

    //03DE          ; GREEK LETTER KOPPA
    //03DF          ; GREEK SMALL LETTER KOPPA
    //03E0          ; GREEK LETTER SAMPI
    //03E1          ; GREEK SMALL LETTER SAMPI
    //03E2          ; COPTIC CAPITAL LETTER SHEI
    //03E3          ; COPTIC SMALL LETTER SHEI
    //03E4          ; COPTIC CAPITAL LETTER FEI
    //03E5          ; COPTIC SMALL LETTER FEI
    //03E6          ; COPTIC CAPITAL LETTER KHEI
    //03E7          ; COPTIC SMALL LETTER KHEI
    //03E8          ; COPTIC CAPITAL LETTER HORI
    //03E9          ; COPTIC SMALL LETTER HORI
    //03EA          ; COPTIC CAPITAL LETTER GANGIA
    //03EB          ; COPTIC SMALL LETTER GANGIA
    //03EC          ; COPTIC CAPITAL LETTER SHIMA
    //03ED          ; COPTIC SMALL LETTER SHIMA
    //03EE          ; COPTIC CAPITAL LETTER DEI
    //03EF          ; COPTIC SMALL LETTER DEI
    
    //03F0          ; GREEK KAPPA SYMBOL
    "ϰ": [.k, .greek, .symbol],

    //03F1          ; GREEK RHO SYMBOL
    "ϱ": [.r, .greek, .symbol],

    //03F3          ; GREEK LETTER YOT
    
    //03F4          ; GREEK CAPITAL THETA SYMBOL
    "ϴ": [.t, .h, .capital, .greek, .symbol],

    //03F5          ; GREEK LUNATE EPSILON SYMBOL
    "ϵ": [.e, .greek, .symbol, .lunate],

    //03F6          ; GREEK REVERSED LUNATE EPSILON SYMBOL
    "϶": [.e, .greek, .symbol, .lunate, .reversed],

    //03F7          ; GREEK CAPITAL LETTER SHO
    //03F8          ; GREEK SMALL LETTER SHO
    //03F9          ; GREEK CAPITAL LUNATE SIGMA SYMBOL
    //03FA          ; GREEK CAPITAL LETTER SAN
    //03FB          ; GREEK SMALL LETTER SAN
    //03FC          ; GREEK RHO WITH STROKE SYMBOL
    //03FD          ; GREEK CAPITAL REVERSED LUNATE SIGMA SYMBOL
    //03FE          ; GREEK CAPITAL DOTTED LUNATE SIGMA SYMBOL
    //03FF          ; GREEK CAPITAL REVERSED DOTTED LUNATE SIGMA SYMBOL
    
    
    // MARK: - 0400..04FF; Cyrillic
    
    //043B          ; CYRILLIC SMALL LETTER EL
    "л": [.l, .k],


    // MARK: - 1AB0..1AFF; Combining Diacritical Marks Extended
    
    //1AB0          ; COMBINING DOUBLED CIRCUMFLEX ACCENT
    "᪰": [.circumflex, .doubled, .above],

    //1AB1          ; COMBINING DIAERESIS-RING
    "᪱": [.diaeresis, .ring, .above],

    //1AB2          ; COMBINING INFINITY
    "᪲": [.ring, .doubled, .above],

    //1AB3          ; COMBINING DOWNWARDS ARROW
    "᪳": [.verticalLine, .above, .lessThanSign],

    //1AB4          ; COMBINING TRIPLE DOT
    "᪴": [.diaeresis, .dot, .above],

    //1AB5          ; COMBINING X-X BELOW
    "᪵": [.cross, .doubled, .below],

    //1AB6          ; COMBINING WIGGLY LINE BELOW
    "᪶": [.line, .w, .below],

    //1AB7          ; COMBINING OPEN MARK BELOW
    "᪷": [.open, .below],

    //1AB8          ; COMBINING DOUBLE OPEN MARK BELOW
    "᪸": [.open, .doubled, .below],

    //1AB9          ; COMBINING LIGHT CENTRALIZATION STROKE BELOW
    "᪹": [.diagonalStroke, .below],

    //1ABA          ; COMBINING STRONG CENTRALIZATION STROKE BELOW
    "᪺": [.diagonalStroke, .dot, .below],

    //1ABB          ; COMBINING PARENTHESES ABOVE
    "᪻": [.parenthesis, .above],

    //1ABC          ; COMBINING DOUBLE PARENTHESES ABOVE
    "᪼": [.parenthesis, .doubled, .above],

    //1ABD          ; COMBINING PARENTHESES BELOW
    "᪽": [.parenthesis, .below],

    //1ABE          ; COMBINING PARENTHESES OVERLAY
    "᪾": [.parenthesis, .combining],
    
    
    // MARK: - 1D00..1D7F; Phonetic Extensions
    
    //1D00          ; LATIN LETTER SMALL CAPITAL A
    "ᴀ": [.a, .smallCapital],

    //1D01          ; LATIN LETTER SMALL CAPITAL AE
    "ᴁ": [.a, .e, .smallCapital],

    //1D02          ; LATIN SMALL LETTER TURNED AE
    "ᴂ": [.a, .e, .turned],

    //1D03          ; LATIN LETTER SMALL CAPITAL BARRED B
    "ᴃ": [.b, .stroke, .smallCapital],

    //1D04          ; LATIN LETTER SMALL CAPITAL C
    "ᴄ": [.c, .smallCapital],

    //1D05          ; LATIN LETTER SMALL CAPITAL D
    "ᴅ": [.d, .smallCapital],

    //1D06          ; LATIN LETTER SMALL CAPITAL ETH
    "ᴆ": [.d, .h, .smallCapital],

    //1D07          ; LATIN LETTER SMALL CAPITAL E
    "ᴇ": [.e, .smallCapital],

    //1D08          ; LATIN SMALL LETTER TURNED OPEN E
    "ᴈ": [.e, .open, .turned],

    //1D09          ; LATIN SMALL LETTER TURNED I
    "ᴉ": [.i, .turned],

    //1D0A          ; LATIN LETTER SMALL CAPITAL J
    "ᴊ": [.j, .smallCapital],

    //1D0B          ; LATIN LETTER SMALL CAPITAL K
    "ᴋ": [.k, .smallCapital],

    //1D0C          ; LATIN LETTER SMALL CAPITAL L WITH STROKE
    "ᴌ": [.l, .diagonalStroke, .smallCapital],

    //1D0D          ; LATIN LETTER SMALL CAPITAL M
    "ᴍ": [.m, .smallCapital],

    //1D0E          ; LATIN LETTER SMALL CAPITAL REVERSED N
    "ᴎ": [.n, .reversed, .smallCapital],

    //1D0F          ; LATIN LETTER SMALL CAPITAL O
    "ᴏ": [.smallCapital],

    //1D10          ; LATIN LETTER SMALL CAPITAL OPEN O
    "ᴐ": [.o, .open, .smallCapital],

    //1D11          ; LATIN SMALL LETTER SIDEWAYS O
    "ᴑ": [.o, .sideways],

    //1D12          ; LATIN SMALL LETTER SIDEWAYS OPEN O
    "ᴒ": [.o, .open, .sideways],

    //1D13          ; LATIN SMALL LETTER SIDEWAYS O WITH STROKE
    "ᴓ": [.o, .stroke, .sideways],

    //1D14          ; LATIN SMALL LETTER TURNED OE
    "ᴔ": [.o, .e, .turned],

    //1D15          ; LATIN LETTER SMALL CAPITAL OU
    "ᴕ": [.o, .uTop, .smallCapital],

    //1D16          ; LATIN SMALL LETTER TOP HALF O
    "ᴖ": [.o, .topHalf],

    //1D17          ; LATIN SMALL LETTER BOTTOM HALF O
    "ᴗ": [.o, .bottomHalf],

    //1D18          ; LATIN LETTER SMALL CAPITAL P
    "ᴘ": [.p, .smallCapital],

    //1D19          ; LATIN LETTER SMALL CAPITAL REVERSED R
    "ᴙ": [.r, .smallCapital, .reversed],

    //1D1A          ; LATIN LETTER SMALL CAPITAL TURNED R
    "ᴚ": [.r, .smallCapital, .turned],

    //1D1B          ; LATIN LETTER SMALL CAPITAL T
    "ᴛ": [.t, .smallCapital],

    //1D1C          ; LATIN LETTER SMALL CAPITAL U
    "ᴜ": [.u, .smallCapital],

    //1D1D          ; LATIN SMALL LETTER SIDEWAYS U
    "ᴝ": [.u, .sideways],

    //1D1E          ; LATIN SMALL LETTER SIDEWAYS DIAERESIZED U
    "ᴞ": [.u, .diaeresis, .above, .sideways],

    //1D1F          ; LATIN SMALL LETTER SIDEWAYS TURNED M
    "ᴟ": [.m, .turned, .sideways],

    //1D20          ; LATIN LETTER SMALL CAPITAL V
    "ᴠ": [.v, .smallCapital],

    //1D21          ; LATIN LETTER SMALL CAPITAL W
    "ᴡ": [.w, .smallCapital],

    //1D22          ; LATIN LETTER SMALL CAPITAL Z
    "ᴢ": [.z, .smallCapital],

    //1D23          ; LATIN LETTER SMALL CAPITAL EZH
    "ᴣ": [.z, .h, .smallCapital],

    //1D24          ; LATIN LETTER VOICED LARYNGEAL SPIRANT
    "ᴤ": [.h, .hook, .h],

    //1D25          ; LATIN LETTER AIN
    "ᴥ": [.apostrophe, .h, .h],

    //1D26          ; GREEK LETTER SMALL CAPITAL GAMMA
    "ᴦ": [.g, .greek, .smallCapital],

    //1D27          ; GREEK LETTER SMALL CAPITAL LAMDA
    "ᴧ": [.l, .greek, .smallCapital],

    //1D28          ; GREEK LETTER SMALL CAPITAL PI
    "ᴨ": [.p, .greek, .smallCapital],

    //1D29          ; GREEK LETTER SMALL CAPITAL RHO
    "ᴩ": [.r, .greek, .smallCapital],

    //1D2A          ; GREEK LETTER SMALL CAPITAL PSI
    "ᴪ": [.p, .s, .greek, .smallCapital],

    //1D2B          ; CYRILLIC LETTER SMALL CAPITAL EL
    "ᴫ": [.l, .k, .smallCapital],

    //1D2C          ; MODIFIER LETTER CAPITAL A
    "ᴬ": [.a, .capital, .superscript],

    //1D2D          ; MODIFIER LETTER CAPITAL AE
    "ᴭ": [.a, .e, .capital, .superscript],

    //1D2E          ; MODIFIER LETTER CAPITAL B
    "ᴮ": [.b, .capital, .superscript],

    //1D2F          ; MODIFIER LETTER CAPITAL BARRED B
    "ᴯ": [.b, .stroke, .capital, .superscript],

    //1D30          ; MODIFIER LETTER CAPITAL D
    "ᴰ": [.d, .capital, .superscript],

    //1D31          ; MODIFIER LETTER CAPITAL E
    "ᴱ": [.e, .capital, .superscript],

    //1D32          ; MODIFIER LETTER CAPITAL REVERSED E
    "ᴲ": [.e, .capital, .turned, .superscript],

    //1D33          ; MODIFIER LETTER CAPITAL G
    "ᴳ": [.g, .capital, .superscript],

    //1D34          ; MODIFIER LETTER CAPITAL H
    "ᴴ": [.h, .capital, .superscript],

    //1D35          ; MODIFIER LETTER CAPITAL I
    "ᴵ": [.i, .capital, .superscript],

    //1D36          ; MODIFIER LETTER CAPITAL J
    "ᴶ": [.j, .capital, .superscript],

    //1D37          ; MODIFIER LETTER CAPITAL K
    "ᴷ": [.k, .capital, .superscript],

    //1D38          ; MODIFIER LETTER CAPITAL L
    "ᴸ": [.l, .capital, .superscript],

    //1D39          ; MODIFIER LETTER CAPITAL M
    "ᴹ": [.m, .capital, .superscript],

    //1D3A          ; MODIFIER LETTER CAPITAL N
    "ᴺ": [.n, .capital, .superscript],

    //1D3B          ; MODIFIER LETTER CAPITAL REVERSED N
    "ᴻ": [.n, .capital, .reversed, .superscript],

    //1D3C          ; MODIFIER LETTER CAPITAL O
    "ᴼ": [.o, .capital, .superscript],

    //1D3D          ; MODIFIER LETTER CAPITAL OU
    "ᴽ": [.o, .uTop, .capital, .superscript],

    //1D3E          ; MODIFIER LETTER CAPITAL P
    "ᴾ": [.p, .capital, .superscript],

    //1D3F          ; MODIFIER LETTER CAPITAL R
    "ᴿ": [.r, .capital, .superscript],

    //1D40          ; MODIFIER LETTER CAPITAL T
    "ᵀ": [.t, .capital, .superscript],

    //1D41          ; MODIFIER LETTER CAPITAL U
    "ᵁ": [.u, .capital, .superscript],

    //1D42          ; MODIFIER LETTER CAPITAL W
    "ᵂ": [.w, .capital, .superscript],

    //1D43          ; MODIFIER LETTER SMALL A
    "ᵃ": [.a, .superscript],

    //1D44          ; MODIFIER LETTER SMALL TURNED A
    "ᵄ": [.a, .turned, .superscript],

    //1D45          ; MODIFIER LETTER SMALL ALPHA
    "ᵅ": [.a, .h, .superscript],

    //1D46          ; MODIFIER LETTER SMALL TURNED AE
    "ᵆ": [.a, .e, .turned, .superscript],

    //1D47          ; MODIFIER LETTER SMALL B
    "ᵇ": [.b, .superscript],

    //1D48          ; MODIFIER LETTER SMALL D
    "ᵈ": [.d, .superscript],

    //1D49          ; MODIFIER LETTER SMALL E
    "ᵉ": [.e, .superscript],

    //1D4A          ; MODIFIER LETTER SMALL SCHWA
    "ᵊ": [.schwa, .superscript],

    //1D4B          ; MODIFIER LETTER SMALL OPEN E
    "ᵋ": [.e, .open, .superscript],

    //1D4C          ; MODIFIER LETTER SMALL TURNED OPEN E
    "ᵌ": [.e, .open, .turned, .superscript],

    //1D4D          ; MODIFIER LETTER SMALL G
    "ᵍ": [.g, .superscript],

    //1D4E          ; MODIFIER LETTER SMALL TURNED I
    "ᵎ": [.i, .turned, .superscript],

    //1D4F          ; MODIFIER LETTER SMALL K
    "ᵏ": [.k, .superscript],

    //1D50          ; MODIFIER LETTER SMALL M
    "ᵐ": [.m, .superscript],

    //1D51          ; MODIFIER LETTER SMALL ENG
    "ᵑ": [.n, .g, .superscript],

    //1D52          ; MODIFIER LETTER SMALL O
    "ᵒ": [.o, .superscript],

    //1D53          ; MODIFIER LETTER SMALL OPEN O
    "ᵓ": [.o, .open, .superscript],

    //1D54          ; MODIFIER LETTER SMALL TOP HALF O
    "ᵔ": [.o, .topHalf, .superscript],

    //1D55          ; MODIFIER LETTER SMALL BOTTOM HALF O
    "ᵕ": [.o, .bottomHalf, .superscript],

    //1D56          ; MODIFIER LETTER SMALL P
    "ᵖ": [.p, .superscript],

    //1D57          ; MODIFIER LETTER SMALL T
    "ᵗ": [.t, .superscript],

    //1D58          ; MODIFIER LETTER SMALL U
    "ᵘ": [.u, .superscript],

    //1D59          ; MODIFIER LETTER SMALL SIDEWAYS U
    "ᵙ": [.u, .sideways, .superscript],

    //1D5A          ; MODIFIER LETTER SMALL TURNED M
    "ᵚ": [.m, .turned, .superscript],

    //1D5B          ; MODIFIER LETTER SMALL V
    "ᵛ": [.v, .superscript],

    //1D5C          ; MODIFIER LETTER SMALL AIN
    "ᵜ": [.apostrophe, .h, .h, .superscript],

    //1D5D          ; MODIFIER LETTER SMALL BETA
    "ᵝ": [.b, .h, .superscript],

    //1D5E          ; MODIFIER LETTER SMALL GREEK GAMMA
    "ᵞ": [.g, .greek, .superscript],

    //1D5F          ; MODIFIER LETTER SMALL DELTA
    "ᵟ": [.d, .h, .extra1, .superscript],

    //1D60          ; MODIFIER LETTER SMALL GREEK PHI
    "ᵠ": [.f, .greek, .superscript],

    //1D61          ; MODIFIER LETTER SMALL CHI
    "ᵡ": [.x, .h, .superscript],

    //1D62          ; LATIN SUBSCRIPT SMALL LETTER I
    "ᵢ": [.i, .subscript],

    //1D63          ; LATIN SUBSCRIPT SMALL LETTER R
    "ᵣ": [.r, .subscript],

    //1D64          ; LATIN SUBSCRIPT SMALL LETTER U
    "ᵤ": [.u, .subscript],

    //1D65          ; LATIN SUBSCRIPT SMALL LETTER V
    "ᵥ": [.v, .subscript],

    //1D66          ; GREEK SUBSCRIPT SMALL LETTER BETA
    "ᵦ": [.b, .greek, .subscript],

    //1D67          ; GREEK SUBSCRIPT SMALL LETTER GAMMA
    "ᵧ": [.g, .greek, .subscript],

    //1D68          ; GREEK SUBSCRIPT SMALL LETTER RHO
    "ᵨ": [.r, .greek, .subscript],

    //1D69          ; GREEK SUBSCRIPT SMALL LETTER PHI
    "ᵩ": [.f, .greek, .subscript],

    //1D6A          ; GREEK SUBSCRIPT SMALL LETTER CHI
    "ᵪ": [.c, .h, .greek, .subscript],

    //1D6B          ; LATIN SMALL LETTER UE
    "ᵫ": [.u, .e],

    //1D6C          ; LATIN SMALL LETTER B WITH MIDDLE TILDE
    "ᵬ": [.b, .tilde],

    //1D6D          ; LATIN SMALL LETTER D WITH MIDDLE TILDE
    "ᵭ": [.d, .tilde],

    //1D6E          ; LATIN SMALL LETTER F WITH MIDDLE TILDE
    "ᵮ": [.f, .tilde],

    //1D6F          ; LATIN SMALL LETTER M WITH MIDDLE TILDE
    "ᵯ": [.m, .tilde],

    //1D70          ; LATIN SMALL LETTER N WITH MIDDLE TILDE
    "ᵰ": [.n, .tilde],

    //1D71          ; LATIN SMALL LETTER P WITH MIDDLE TILDE
    "ᵱ": [.p, .tilde],

    //1D72          ; LATIN SMALL LETTER R WITH MIDDLE TILDE
    "ᵲ": [.r, .tilde],

    //1D73          ; LATIN SMALL LETTER R WITH FISHHOOK AND MIDDLE TILDE
    "ᵳ": [.r, .hook, .tilde],

    //1D74          ; LATIN SMALL LETTER S WITH MIDDLE TILDE
    "ᵴ": [.s, .tilde],

    //1D75          ; LATIN SMALL LETTER T WITH MIDDLE TILDE
    "ᵵ": [.t, .tilde],

    //1D76          ; LATIN SMALL LETTER Z WITH MIDDLE TILDE
    "ᵶ": [.z, .tilde],

    //1D77          ; LATIN SMALL LETTER TURNED G
    "ᵷ": [.g, .turned],

    //1D78          ; MODIFIER LETTER CYRILLIC EN
    "ᵸ": [.n, .k, .superscript],

    //1D79          ; LATIN SMALL LETTER INSULAR G
    "ᵹ": [.g, .insular],

    //1D7A          ; LATIN SMALL LETTER TH WITH STRIKETHROUGH
    "ᵺ": [.t, .joiner, .h, .stroke],

    //1D7B          ; LATIN SMALL CAPITAL LETTER I WITH STROKE
    "ᵻ": [.i, .smallCapital, .stroke],

    //1D7C          ; LATIN SMALL LETTER IOTA WITH STROKE
    "ᵼ": [.i, .h, .stroke],

    //1D7D          ; LATIN SMALL LETTER P WITH STROKE
    "ᵽ": [.p, .stroke],

    //1D7E          ; LATIN SMALL CAPITAL LETTER U WITH STROKE
    "ᵾ": [.u, .smallCapital, .stroke],

    //1D7F          ; LATIN SMALL LETTER UPSILON WITH STROKE
    "ᵿ": [.u, .h, .stroke],

    
    // MARK: - 1D80..1DBF; Phonetic Extensions Supplement
    
    //1D80          ; LATIN SMALL LETTER B WITH PALATAL HOOK
    "ᶀ": [.b, .palatalHook],

    //1D81          ; LATIN SMALL LETTER D WITH PALATAL HOOK
    "ᶁ": [.d, .palatalHook],

    //1D82          ; LATIN SMALL LETTER F WITH PALATAL HOOK
    "ᶂ": [.f, .palatalHook],

    //1D83          ; LATIN SMALL LETTER G WITH PALATAL HOOK
    "ᶃ": [.g, .palatalHook],

    //1D84          ; LATIN SMALL LETTER K WITH PALATAL HOOK
    "ᶄ": [.k, .palatalHook],

    //1D85          ; LATIN SMALL LETTER L WITH PALATAL HOOK
    "ᶅ": [.l, .palatalHook],

    //1D86          ; LATIN SMALL LETTER M WITH PALATAL HOOK
    "ᶆ": [.m, .palatalHook],

    //1D87          ; LATIN SMALL LETTER N WITH PALATAL HOOK
    "ᶇ": [.n, .palatalHook],

    //1D88          ; LATIN SMALL LETTER P WITH PALATAL HOOK
    "ᶈ": [.p, .palatalHook],

    //1D89          ; LATIN SMALL LETTER R WITH PALATAL HOOK
    "ᶉ": [.r, .palatalHook],

    //1D8A          ; LATIN SMALL LETTER S WITH PALATAL HOOK
    "ᶊ": [.s, .palatalHook],

    //1D8B          ; LATIN SMALL LETTER ESH WITH PALATAL HOOK
    "ᶋ": [.s, .h, .palatalHook],

    //1D8C          ; LATIN SMALL LETTER V WITH PALATAL HOOK
    "ᶌ": [.v, .palatalHook],

    //1D8D          ; LATIN SMALL LETTER X WITH PALATAL HOOK
    "ᶍ": [.x, .palatalHook],

    //1D8E          ; LATIN SMALL LETTER Z WITH PALATAL HOOK
    "ᶎ": [.z, .palatalHook],

    //1D8F          ; LATIN SMALL LETTER A WITH RETROFLEX HOOK
    "ᶏ": [.a, .retroflexHook],

    //1D90          ; LATIN SMALL LETTER ALPHA WITH RETROFLEX HOOK
    "ᶐ": [.a, .h, .retroflexHook],

    //1D91          ; LATIN SMALL LETTER D WITH HOOK AND TAIL
    "ᶑ": [.d, .retroflexHook, .hook],

    //1D92          ; LATIN SMALL LETTER E WITH RETROFLEX HOOK
    "ᶒ": [.e, .retroflexHook],

    //1D93          ; LATIN SMALL LETTER OPEN E WITH RETROFLEX HOOK
    "ᶓ": [.e, .open, .retroflexHook],

    //1D94          ; LATIN SMALL LETTER REVERSED OPEN E WITH RETROFLEX HOOK
    "ᶔ": [.e, .open, .retroflexHook, .reversed],

    //1D95          ; LATIN SMALL LETTER SCHWA WITH RETROFLEX HOOK
    "ᶕ": [.schwa, .retroflexHook],

    //1D96          ; LATIN SMALL LETTER I WITH RETROFLEX HOOK
    "ᶖ": [.i, .retroflexHook],

    //1D97          ; LATIN SMALL LETTER OPEN O WITH RETROFLEX HOOK
    "ᶗ": [.o, .open, .retroflexHook],

    //1D98          ; LATIN SMALL LETTER ESH WITH RETROFLEX HOOK
    "ᶘ": [.s, .h, .retroflexHook],

    //1D99          ; LATIN SMALL LETTER U WITH RETROFLEX HOOK
    "ᶙ": [.u, .retroflexHook],

    //1D9A          ; LATIN SMALL LETTER EZH WITH RETROFLEX HOOK
    "ᶚ": [.z, .h, .retroflexHook],

    //1D9B          ; MODIFIER LETTER SMALL TURNED ALPHA
    "ᶛ": [.a, .h, .turned, .superscript],

    //1D9C          ; MODIFIER LETTER SMALL C
    "ᶜ": [.c, .superscript],

    //1D9D          ; MODIFIER LETTER SMALL C WITH CURL
    "ᶝ": [.s, .curl, .superscript],

    //1D9E          ; MODIFIER LETTER SMALL ETH
    "ᶞ": [.d, .h, .superscript],

    //1D9F          ; MODIFIER LETTER SMALL REVERSED OPEN E
    "ᶟ": [.e, .open, .reversed, .superscript],

    //1DA0          ; MODIFIER LETTER SMALL F
    "ᶠ": [.f, .superscript],

    //1DA1          ; MODIFIER LETTER SMALL DOTLESS J WITH STROKE
    "ᶡ": [.j, .stroke, .dot, .superscript],

    //1DA2          ; MODIFIER LETTER SMALL SCRIPT G
    "ᶢ": [.g, .letterScript, .superscript],

    //1DA3          ; MODIFIER LETTER SMALL TURNED H
    "ᶣ": [.h, .turned, .superscript],

    //1DA4          ; MODIFIER LETTER SMALL I WITH STROKE
    "ᶤ": [.i, .stroke, .superscript],

    //1DA5          ; MODIFIER LETTER SMALL IOTA
    "ᶥ": [.i, .h, .superscript],

    //1DA6          ; MODIFIER LETTER SMALL CAPITAL I
    "ᶦ": [.i, .smallCapital, .superscript],

    //1DA7          ; MODIFIER LETTER SMALL CAPITAL I WITH STROKE
    "ᶧ": [.i, .smallCapital, .stroke, .superscript],

    //1DA8          ; MODIFIER LETTER SMALL J WITH CROSSED-TAIL
    "ᶨ": [.j, .crossedTail, .superscript],

    //1DA9          ; MODIFIER LETTER SMALL L WITH RETROFLEX HOOK
    "ᶩ": [.l, .retroflexHook, .superscript],

    //1DAA          ; MODIFIER LETTER SMALL L WITH PALATAL HOOK
    "ᶪ": [.l, .palatalHook, .superscript],

    //1DAB          ; MODIFIER LETTER SMALL CAPITAL L
    "ᶫ": [.l, .smallCapital, .superscript],

    //1DAC          ; MODIFIER LETTER SMALL M WITH HOOK
    "ᶬ": [.m, .f, .superscript],

    //1DAD          ; MODIFIER LETTER SMALL TURNED M WITH LONG LEG
    "ᶭ": [.m, .longLeg, .turned, .superscript],

    //1DAE          ; MODIFIER LETTER SMALL N WITH LEFT HOOK
    "ᶮ": [.n, .hook, .superscript],

    //1DAF          ; MODIFIER LETTER SMALL N WITH RETROFLEX HOOK
    "ᶯ": [.n, .retroflexHook, .superscript],

    //1DB0          ; MODIFIER LETTER SMALL CAPITAL N
    "ᶰ": [.n, .smallCapital, .superscript],

    //1DB1          ; MODIFIER LETTER SMALL BARRED O
    "ᶱ": [.o, .stroke, .superscript],

    //1DB2          ; MODIFIER LETTER SMALL PHI
    "ᶲ": [.p, .h, .superscript],

    //1DB3          ; MODIFIER LETTER SMALL S WITH HOOK
    "ᶳ": [.s, .retroflexHook, .superscript],

    //1DB4          ; MODIFIER LETTER SMALL ESH
    "ᶴ": [.s, .h, .superscript],

    //1DB5          ; MODIFIER LETTER SMALL T WITH PALATAL HOOK
    "ᶵ": [.t, .palatalHook, .superscript],

    //1DB6          ; MODIFIER LETTER SMALL U BAR
    "ᶶ": [.u, .stroke, .superscript],

    //1DB7          ; MODIFIER LETTER SMALL UPSILON
    "ᶷ": [.u, .h, .superscript],

    //1DB8          ; MODIFIER LETTER SMALL CAPITAL U
    "ᶸ": [.u, .smallCapital, .superscript],

    //1DB9          ; MODIFIER LETTER SMALL V WITH HOOK
    "ᶹ": [.v, .h, .superscript],

    //1DBA          ; MODIFIER LETTER SMALL TURNED V
    "ᶺ": [.v, .turned, .superscript],

    //1DBB          ; MODIFIER LETTER SMALL Z
    "ᶻ": [.z, .superscript],

    //1DBC          ; MODIFIER LETTER SMALL Z WITH RETROFLEX HOOK
    "ᶼ": [.z, .retroflexHook, .superscript],

    //1DBD          ; MODIFIER LETTER SMALL Z WITH CURL
    "ᶽ": [.z, .curl, .superscript],

    //1DBE          ; MODIFIER LETTER SMALL EZH
    "ᶾ": [.z, .h, .superscript],

    //1DBF          ; MODIFIER LETTER SMALL THETA
    "ᶿ": [.t, .h, .superscript],

    
    // MARK: - 1DC0..1DFF; Combining Diacritical Marks Supplement
    
    //1DC0          ; COMBINING DOTTED GRAVE ACCENT
    "᷀": [], //Greek

    //1DC1          ; COMBINING DOTTED ACUTE ACCENT
    "᷁": [], //Greek

    //1DC2          ; COMBINING SNAKE BELOW
    "᷂": [.snake, .below],

    //1DC3          ; COMBINING SUSPENSION MARK
    "᷃": [], //Glagolitic

    //1DC4          ; COMBINING MACRON-ACUTE
    "᷄": [.macron, .acute, .above],

    //1DC5          ; COMBINING GRAVE-MACRON
    "᷅": [.grave, .macron, .above],

    //1DC6          ; COMBINING MACRON-GRAVE
    "᷆": [.macron, .grave, .above],

    //1DC7          ; COMBINING ACUTE-MACRON
    "᷇": [.acute, .macron, .above],

    //1DC8          ; COMBINING GRAVE-ACUTE-GRAVE
    "᷈": [.caron, .grave, .above],

    //1DC9          ; COMBINING ACUTE-GRAVE-ACUTE
    "᷉": [.circumflex, .acute, .above],

    //1DCA          ; COMBINING LATIN SMALL LETTER R BELOW
    "᷊": [.r, .below],

    //1DCB          ; COMBINING BREVE-MACRON
    "᷋": [.breve, .macron, .above],

    //1DCC          ; COMBINING MACRON-BREVE
    "᷌": [.macron, .breve, .above],

    //1DCD          ; COMBINING DOUBLE CIRCUMFLEX ABOVE
    "᷍": [.circumflex, .double, .above],

    //1DCE          ; COMBINING OGONEK ABOVE
    "᷎": [.ogonek, .above],

    //1DCF          ; COMBINING ZIGZAG BELOW
    "᷏": [.zigzag, .below],

    //1DD0          ; COMBINING IS BELOW
    "᷐": [.i, .s, .below],

    //1DD1          ; COMBINING UR ABOVE
    "᷑": [.u, .r, .above],

    //1DD2          ; COMBINING US ABOVE
    "᷒": [.u, .s, .above],

    //1DD3          ; COMBINING LATIN SMALL LETTER FLATTENED OPEN A ABOVE
    "ᷓ": [.a, .open, .above],

    //1DD4          ; COMBINING LATIN SMALL LETTER AE
    "ᷔ": [.a, .e, .above],

    //1DD5          ; COMBINING LATIN SMALL LETTER AO
    "ᷕ": [.a, .o, .above],

    //1DD6          ; COMBINING LATIN SMALL LETTER AV
    "ᷖ": [.a, .v, .above],

    //1DD7          ; COMBINING LATIN SMALL LETTER C CEDILLA
    "ᷗ": [.c, .cedilla, .above],

    //1DD8          ; COMBINING LATIN SMALL LETTER INSULAR D
    "ᷘ": [.d, .insular, .above],

    //1DD9          ; COMBINING LATIN SMALL LETTER ETH
    "ᷙ": [.d, .h, .above],

    //1DDA          ; COMBINING LATIN SMALL LETTER G
    "ᷚ": [.g, .above],

    //1DDB          ; COMBINING LATIN LETTER SMALL CAPITAL G
    "ᷛ": [.g, .smallCapital, .above],

    //1DDC          ; COMBINING LATIN SMALL LETTER K
    "ᷜ": [.k, .above],

    //1DDD          ; COMBINING LATIN SMALL LETTER L
    "ᷝ": [.l, .above],

    //1DDE          ; COMBINING LATIN LETTER SMALL CAPITAL L
    "ᷞ": [.l, .smallCapital, .above],

    //1DDF          ; COMBINING LATIN LETTER SMALL CAPITAL M
    "ᷟ": [.m, .smallCapital, .above],

    //1DE0          ; COMBINING LATIN SMALL LETTER N
    "ᷠ": [.n, .above],

    //1DE1          ; COMBINING LATIN LETTER SMALL CAPITAL N
    "ᷡ": [.n, .smallCapital, .above],

    //1DE2          ; COMBINING LATIN LETTER SMALL CAPITAL R
    "ᷢ": [.r, .smallCapital, .above],

    //1DE3          ; COMBINING LATIN SMALL LETTER R ROTUNDA
    "ᷣ": [.r, .rightHalf, .above],

    //1DE4          ; COMBINING LATIN SMALL LETTER S
    "ᷤ": [.s, .above],

    //1DE5          ; COMBINING LATIN SMALL LETTER LONG S
    "ᷥ": [.s, .l, .above],

    //1DE6          ; COMBINING LATIN SMALL LETTER Z
    "ᷦ": [.z, .above],

    //1DE7          ; COMBINING LATIN SMALL LETTER ALPHA
    "ᷧ": [.a, .h, .above],

    //1DE8          ; COMBINING LATIN SMALL LETTER B
    "ᷨ": [.b, .above],

    //1DE9          ; COMBINING LATIN SMALL LETTER BETA
    "ᷩ": [.b, .h, .above],

    //1DEA          ; COMBINING LATIN SMALL LETTER SCHWA
    "ᷪ": [.schwa, .above],

    //1DEB          ; COMBINING LATIN SMALL LETTER F
    "ᷫ": [.f, .above],

    //1DEC          ; COMBINING LATIN SMALL LETTER L WITH DOUBLE MIDDLE TILDE
    "ᷬ": [.l, .tilde, .doubled],

    //1DED          ; COMBINING LATIN SMALL LETTER O WITH LIGHT CENTRALIZATION STROKE
    "ᷭ": [.o, .lightCentralizationStroke],

    //1DEE          ; COMBINING LATIN SMALL LETTER P
    "ᷮ": [.p, .above],

    //1DEF          ; COMBINING LATIN SMALL LETTER ESH
    "ᷯ": [.s, .h, .above],

    //1DF0          ; COMBINING LATIN SMALL LETTER U WITH LIGHT CENTRALIZATION STROKE
    "ᷰ": [.u, .lightCentralizationStroke],

    //1DF1          ; COMBINING LATIN SMALL LETTER W
    "ᷱ": [.w, .above],


    //1DF2          ; COMBINING LATIN SMALL LETTER A WITH DIAERESIS
    "ᷲ": [.a, .diaeresis, .above, .above],

    //1DF3          ; COMBINING LATIN SMALL LETTER O WITH DIAERESIS
    "ᷳ": [.o, .diaeresis, .above, .above],

    //1DF4          ; COMBINING LATIN SMALL LETTER U WITH DIAERESIS
    "ᷴ": [.u, .diaeresis, .above, .above],
    
    //1DF5          ; COMBINING UP TACK ABOVE
    "᷵": [.tack, .up, .above],

    //1DF6          ; COMBINING KAVYKA ABOVE RIGHT
    "᷶": [], //Typicon

    //1DF7          ; COMBINING KAVYKA ABOVE LEFT
    "᷷": [], //Typicon

    //1DF8          ; COMBINING DOT ABOVE LEFT
    "᷸": [.dot, .aboveLeft],

    //1DF9          ; COMBINING WIDE INVERTED BRIDGE BELOW
    "᷹": [], //Typicon

    //1DFB          ; COMBINING DELETION MARK
    "᷻": [], //Newa

    //1DFC          ; COMBINING DOUBLE INVERTED BREVE BELOW
    "᷼": [.invertedBreve, .double, .below],

    //1DFD          ; COMBINING ALMOST EQUAL TO BELOW
    "᷽": [.tilde, .doubled, .below],

    //1DFE          ; COMBINING LEFT ARROWHEAD ABOVE
    "᷾": [.arrowhead, .left, .above],

    //1DFF          ; COMBINING RIGHT ARROWHEAD AND DOWN ARROWHEAD BELOW
    "᷿": [.arrowhead, .right, .arrowhead, .up, .below],

    
    // MARK: - 1E00..1EFF; Latin Extended Additional
    
    //1E00          ; LATIN CAPITAL LETTER A WITH RING BELOW
    "Ḁ": [.a, .capital, .ring, .below],

    //1E01          ; LATIN SMALL LETTER A WITH RING BELOW
    "ḁ": [.a, .ring, .below],

    //1E02          ; LATIN CAPITAL LETTER B WITH DOT ABOVE
    "Ḃ": [.b, .capital, .dot, .above],

    //1E03          ; LATIN SMALL LETTER B WITH DOT ABOVE
    "ḃ": [.b, .dot, .above],

    //1E04          ; LATIN CAPITAL LETTER B WITH DOT BELOW
    "Ḅ": [.b, .capital, .dot, .below],

    //1E05          ; LATIN SMALL LETTER B WITH DOT BELOW
    "ḅ": [.b, .dot, .below],

    //1E06          ; LATIN CAPITAL LETTER B WITH LINE BELOW
    "Ḇ": [.b, .capital, .macron, .below],

    //1E07          ; LATIN SMALL LETTER B WITH LINE BELOW
    "ḇ": [.b, .macron, .below],

    //1E08          ; LATIN CAPITAL LETTER C WITH CEDILLA AND ACUTE
    "Ḉ": [.c, .capital, .cedilla, .acute, .above],

    //1E09          ; LATIN SMALL LETTER C WITH CEDILLA AND ACUTE
    "ḉ": [.c, .cedilla, .acute, .above],

    //1E0A          ; LATIN CAPITAL LETTER D WITH DOT ABOVE
    "Ḋ": [.d, .capital, .dot, .above],

    //1E0B          ; LATIN SMALL LETTER D WITH DOT ABOVE
    "ḋ": [.d, .dot, .above],

    //1E0C          ; LATIN CAPITAL LETTER D WITH DOT BELOW
    "Ḍ": [.d, .capital, .dot, .below],

    //1E0D          ; LATIN SMALL LETTER D WITH DOT BELOW
    "ḍ": [.d, .dot, .below],

    //1E0E          ; LATIN CAPITAL LETTER D WITH LINE BELOW
    "Ḏ": [.d, .capital, .macron, .below],

    //1E0F          ; LATIN SMALL LETTER D WITH LINE BELOW
    "ḏ": [.d, .macron, .below],

    //1E10          ; LATIN CAPITAL LETTER D WITH CEDILLA
    "Ḑ": [.d, .capital, .cedilla],

    //1E11          ; LATIN SMALL LETTER D WITH CEDILLA
    "ḑ": [.d, .cedilla],

    //1E12          ; LATIN CAPITAL LETTER D WITH CIRCUMFLEX BELOW
    "Ḓ": [.d, .capital, .circumflex, .below],

    //1E13          ; LATIN SMALL LETTER D WITH CIRCUMFLEX BELOW
    "ḓ": [.d, .circumflex, .below],

    //1E14          ; LATIN CAPITAL LETTER E WITH MACRON AND GRAVE
    "Ḕ": [.e, .capital, .macron, .above, .grave, .above],

    //1E15          ; LATIN SMALL LETTER E WITH MACRON AND GRAVE
    "ḕ": [.e, .macron, .above, .grave, .above],

    //1E16          ; LATIN CAPITAL LETTER E WITH MACRON AND ACUTE
    "Ḗ": [.e, .capital, .macron, .above, .acute, .above],

    //1E17          ; LATIN SMALL LETTER E WITH MACRON AND ACUTE
    "ḗ": [.e, .macron, .above, .acute, .above],

    //1E18          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX BELOW
    "Ḙ": [.e, .capital, .circumflex, .below],

    //1E19          ; LATIN SMALL LETTER E WITH CIRCUMFLEX BELOW
    "ḙ": [.e, .circumflex, .below],

    //1E1A          ; LATIN CAPITAL LETTER E WITH TILDE BELOW
    "Ḛ": [.e, .capital, .tilde, .below],

    //1E1B          ; LATIN SMALL LETTER E WITH TILDE BELOW
    "ḛ": [.e, .tilde, .below],

    //1E1C          ; LATIN CAPITAL LETTER E WITH CEDILLA AND BREVE
    "Ḝ": [.e, .capital, .cedilla, .breve, .above],

    //1E1D          ; LATIN SMALL LETTER E WITH CEDILLA AND BREVE
    "ḝ": [.e, .cedilla, .breve, .above],

    //1E1E          ; LATIN CAPITAL LETTER F WITH DOT ABOVE
    "Ḟ": [.f, .capital, .dot, .above],

    //1E1F          ; LATIN SMALL LETTER F WITH DOT ABOVE
    "ḟ": [.f, .dot, .above],

    //1E20          ; LATIN CAPITAL LETTER G WITH MACRON
    "Ḡ": [.g, .capital, .macron, .above],

    //1E21          ; LATIN SMALL LETTER G WITH MACRON
    "ḡ": [.g, .macron, .above],

    //1E22          ; LATIN CAPITAL LETTER H WITH DOT ABOVE
    "Ḣ": [.h, .capital, .dot, .above],

    //1E23          ; LATIN SMALL LETTER H WITH DOT ABOVE
    "ḣ": [.h, .dot, .above],

    //1E24          ; LATIN CAPITAL LETTER H WITH DOT BELOW
    "Ḥ": [.h, .capital, .dot, .below],

    //1E25          ; LATIN SMALL LETTER H WITH DOT BELOW
    "ḥ": [.h, .dot, .below],

    //1E26          ; LATIN CAPITAL LETTER H WITH DIAERESIS
    "Ḧ": [.h, .capital, .diaeresis, .above],

    //1E27          ; LATIN SMALL LETTER H WITH DIAERESIS
    "ḧ": [.h, .diaeresis, .above],

    //1E28          ; LATIN CAPITAL LETTER H WITH CEDILLA
    "Ḩ": [.h, .capital, .cedilla],

    //1E29          ; LATIN SMALL LETTER H WITH CEDILLA
    "ḩ": [.h, .cedilla],

    //1E2A          ; LATIN CAPITAL LETTER H WITH BREVE BELOW
    "Ḫ": [.h, .capital, .breve, .below],

    //1E2B          ; LATIN SMALL LETTER H WITH BREVE BELOW
    "ḫ": [.h, .breve, .below],

    //1E2C          ; LATIN CAPITAL LETTER I WITH TILDE BELOW
    "Ḭ": [.i, .capital, .tilde, .below],

    //1E2D          ; LATIN SMALL LETTER I WITH TILDE BELOW
    "ḭ": [.i, .tilde, .below],

    //1E2E          ; LATIN CAPITAL LETTER I WITH DIAERESIS AND ACUTE
    "Ḯ": [.i, .capital, .diaeresis, .above, .acute, .above],

    //1E2F          ; LATIN SMALL LETTER I WITH DIAERESIS AND ACUTE
    "ḯ": [.i, .diaeresis, .above, .acute, .above],

    //1E30          ; LATIN CAPITAL LETTER K WITH ACUTE
    "Ḱ": [.k, .capital, .acute, .above],

    //1E31          ; LATIN SMALL LETTER K WITH ACUTE
    "ḱ": [.k, .acute, .above],

    //1E32          ; LATIN CAPITAL LETTER K WITH DOT BELOW
    "Ḳ": [.k, .capital, .dot, .below],

    //1E33          ; LATIN SMALL LETTER K WITH DOT BELOW
    "ḳ": [.k, .dot, .below],

    //1E34          ; LATIN CAPITAL LETTER K WITH LINE BELOW
    "Ḵ": [.k, .capital, .macron, .below],

    //1E35          ; LATIN SMALL LETTER K WITH LINE BELOW
    "ḵ": [.k, .macron, .below],

    //1E36          ; LATIN CAPITAL LETTER L WITH DOT BELOW
    "Ḷ": [.l, .capital, .dot, .below],

    //1E37          ; LATIN SMALL LETTER L WITH DOT BELOW
    "ḷ": [.l, .dot, .below],

    //1E38          ; LATIN CAPITAL LETTER L WITH DOT BELOW AND MACRON
    "Ḹ": [.l, .capital, .dot, .below, .macron, .above],

    //1E39          ; LATIN SMALL LETTER L WITH DOT BELOW AND MACRON
    "ḹ": [.l, .dot, .below, .macron, .above],

    //1E3A          ; LATIN CAPITAL LETTER L WITH LINE BELOW
    "Ḻ": [.l, .capital, .macron, .below],

    //1E3B          ; LATIN SMALL LETTER L WITH LINE BELOW
    "ḻ": [.l, .macron, .below],

    //1E3C          ; LATIN CAPITAL LETTER L WITH CIRCUMFLEX BELOW
    "Ḽ": [.l, .capital, .circumflex, .below],

    //1E3D          ; LATIN SMALL LETTER L WITH CIRCUMFLEX BELOW
    "ḽ": [.l, .circumflex, .below],

    //1E3E          ; LATIN CAPITAL LETTER M WITH ACUTE
    "Ḿ": [.m, .capital, .acute, .above],

    //1E3F          ; LATIN SMALL LETTER M WITH ACUTE
    "ḿ": [.m, .acute, .above],

    //1E40          ; LATIN CAPITAL LETTER M WITH DOT ABOVE
    "Ṁ": [.m, .capital, .dot, .above],

    //1E41          ; LATIN SMALL LETTER M WITH DOT ABOVE
    "ṁ": [.m, .dot, .above],

    //1E42          ; LATIN CAPITAL LETTER M WITH DOT BELOW
    "Ṃ": [.m, .capital, .dot, .below],

    //1E43          ; LATIN SMALL LETTER M WITH DOT BELOW
    "ṃ": [.m, .dot, .below],

    //1E44          ; LATIN CAPITAL LETTER N WITH DOT ABOVE
    "Ṅ": [.n, .capital, .dot, .above],

    //1E45          ; LATIN SMALL LETTER N WITH DOT ABOVE
    "ṅ": [.n, .dot, .above],

    //1E46          ; LATIN CAPITAL LETTER N WITH DOT BELOW
    "Ṇ": [.n, .capital, .dot, .below],

    //1E47          ; LATIN SMALL LETTER N WITH DOT BELOW
    "ṇ": [.n, .dot, .below],

    //1E48          ; LATIN CAPITAL LETTER N WITH LINE BELOW
    "Ṉ": [.n, .capital, .macron, .below],

    //1E49          ; LATIN SMALL LETTER N WITH LINE BELOW
    "ṉ": [.n, .macron, .below],

    //1E4A          ; LATIN CAPITAL LETTER N WITH CIRCUMFLEX BELOW
    "Ṋ": [.n, .capital, .circumflex, .below],

    //1E4B          ; LATIN SMALL LETTER N WITH CIRCUMFLEX BELOW
    "ṋ": [.n, .circumflex, .below],

    //1E4C          ; LATIN CAPITAL LETTER O WITH TILDE AND ACUTE
    "Ṍ": [.o, .capital, .tilde, .above, .acute, .above],

    //1E4D          ; LATIN SMALL LETTER O WITH TILDE AND ACUTE
    "ṍ": [.o, .tilde, .above, .acute, .above],

    //1E4E          ; LATIN CAPITAL LETTER O WITH TILDE AND DIAERESIS
    "Ṏ": [.o, .capital, .tilde, .above, .diaeresis, .above],

    //1E4F          ; LATIN SMALL LETTER O WITH TILDE AND DIAERESIS
    "ṏ": [.o, .tilde, .above, .diaeresis, .above],

    //1E50          ; LATIN CAPITAL LETTER O WITH MACRON AND GRAVE
    "Ṑ": [.o, .capital, .macron, .above, .grave, .above],

    //1E51          ; LATIN SMALL LETTER O WITH MACRON AND GRAVE
    "ṑ": [.o, .macron, .above, .grave, .above],

    //1E52          ; LATIN CAPITAL LETTER O WITH MACRON AND ACUTE
    "Ṓ": [.o, .capital, .macron, .above, .acute, .above],

    //1E53          ; LATIN SMALL LETTER O WITH MACRON AND ACUTE
    "ṓ": [.o, .macron, .above, .acute, .above],

    //1E54          ; LATIN CAPITAL LETTER P WITH ACUTE
    "Ṕ": [.p, .capital, .acute, .above],

    //1E55          ; LATIN SMALL LETTER P WITH ACUTE
    "ṕ": [.p, .acute, .above],

    //1E56          ; LATIN CAPITAL LETTER P WITH DOT ABOVE
    "Ṗ": [.p, .capital, .dot, .above],

    //1E57          ; LATIN SMALL LETTER P WITH DOT ABOVE
    "ṗ": [.p, .dot, .above],

    //1E58          ; LATIN CAPITAL LETTER R WITH DOT ABOVE
    "Ṙ": [.r, .capital, .dot, .above],

    //1E59          ; LATIN SMALL LETTER R WITH DOT ABOVE
    "ṙ": [.r, .dot, .above],

    //1E5A          ; LATIN CAPITAL LETTER R WITH DOT BELOW
    "Ṛ": [.r, .capital, .dot, .below],

    //1E5B          ; LATIN SMALL LETTER R WITH DOT BELOW
    "ṛ": [.r, .dot, .below],

    //1E5C          ; LATIN CAPITAL LETTER R WITH DOT BELOW AND MACRON
    "Ṝ": [.r, .capital, .dot, .below, .macron, .above],

    //1E5D          ; LATIN SMALL LETTER R WITH DOT BELOW AND MACRON
    "ṝ": [.r, .dot, .below, .macron, .above],

    //1E5E          ; LATIN CAPITAL LETTER R WITH LINE BELOW
    "Ṟ": [.r, .capital, .macron, .below],

    //1E5F          ; LATIN SMALL LETTER R WITH LINE BELOW
    "ṟ": [.r, .macron, .below],

    //1E60          ; LATIN CAPITAL LETTER S WITH DOT ABOVE
    "Ṡ": [.s, .capital, .dot, .above],

    //1E61          ; LATIN SMALL LETTER S WITH DOT ABOVE
    "ṡ": [.s, .dot, .above],

    //1E62          ; LATIN CAPITAL LETTER S WITH DOT BELOW
    "Ṣ": [.s, .capital, .dot, .below],

    //1E63          ; LATIN SMALL LETTER S WITH DOT BELOW
    "ṣ": [.s, .dot, .below],

    //1E64          ; LATIN CAPITAL LETTER S WITH ACUTE AND DOT ABOVE
    "Ṥ": [.s, .capital, .acute, .above, .dot, .above],

    //1E65          ; LATIN SMALL LETTER S WITH ACUTE AND DOT ABOVE
    "ṥ": [.s, .acute, .above, .dot, .above],

    //1E66          ; LATIN CAPITAL LETTER S WITH CARON AND DOT ABOVE
    "Ṧ": [.s, .capital, .caron, .above, .dot, .above],

    //1E67          ; LATIN SMALL LETTER S WITH CARON AND DOT ABOVE
    "ṧ": [.s, .caron, .above, .dot, .above],

    //1E68          ; LATIN CAPITAL LETTER S WITH DOT BELOW AND DOT ABOVE
    "Ṩ": [.s, .capital, .dot, .below, .dot, .above],

    //1E69          ; LATIN SMALL LETTER S WITH DOT BELOW AND DOT ABOVE
    "ṩ": [.s, .dot, .below, .dot, .above],

    //1E6A          ; LATIN CAPITAL LETTER T WITH DOT ABOVE
    "Ṫ": [.t, .capital, .dot, .above],

    //1E6B          ; LATIN SMALL LETTER T WITH DOT ABOVE
    "ṫ": [.t, .dot, .above],

    //1E6C          ; LATIN CAPITAL LETTER T WITH DOT BELOW
    "Ṭ": [.t, .capital, .dot, .below],

    //1E6D          ; LATIN SMALL LETTER T WITH DOT BELOW
    "ṭ": [.t, .dot, .below],

    //1E6E          ; LATIN CAPITAL LETTER T WITH LINE BELOW
    "Ṯ": [.t, .capital, .macron, .below],

    //1E6F          ; LATIN SMALL LETTER T WITH LINE BELOW
    "ṯ": [.t, .macron, .below],

    //1E70          ; LATIN CAPITAL LETTER T WITH CIRCUMFLEX BELOW
    "Ṱ": [.t, .capital, .circumflex, .below],

    //1E71          ; LATIN SMALL LETTER T WITH CIRCUMFLEX BELOW
    "ṱ": [.t, .circumflex, .below],

    //1E72          ; LATIN CAPITAL LETTER U WITH DIAERESIS BELOW
    "Ṳ": [.u, .capital, .diaeresis, .below],

    //1E73          ; LATIN SMALL LETTER U WITH DIAERESIS BELOW
    "ṳ": [.u, .diaeresis, .below],

    //1E74          ; LATIN CAPITAL LETTER U WITH TILDE BELOW
    "Ṵ": [.u, .capital, .tilde, .below],

    //1E75          ; LATIN SMALL LETTER U WITH TILDE BELOW
    "ṵ": [.u, .tilde, .below],

    //1E76          ; LATIN CAPITAL LETTER U WITH CIRCUMFLEX BELOW
    "Ṷ": [.u, .capital, .circumflex, .below],

    //1E77          ; LATIN SMALL LETTER U WITH CIRCUMFLEX BELOW
    "ṷ": [.u, .circumflex, .below],

    //1E78          ; LATIN CAPITAL LETTER U WITH TILDE AND ACUTE
    "Ṹ": [.u, .capital, .tilde, .above, .acute, .above],

    //1E79          ; LATIN SMALL LETTER U WITH TILDE AND ACUTE
    "ṹ": [.u, .tilde, .above, .acute, .above],

    //1E7A          ; LATIN CAPITAL LETTER U WITH MACRON AND DIAERESIS
    "Ṻ": [.u, .capital, .macron, .above, .diaeresis, .above],

    //1E7B          ; LATIN SMALL LETTER U WITH MACRON AND DIAERESIS
    "ṻ": [.u, .macron, .above, .diaeresis, .above],

    //1E7C          ; LATIN CAPITAL LETTER V WITH TILDE
    "Ṽ": [.v, .capital, .tilde, .above],

    //1E7D          ; LATIN SMALL LETTER V WITH TILDE
    "ṽ": [.v, .tilde, .above],

    //1E7E          ; LATIN CAPITAL LETTER V WITH DOT BELOW
    "Ṿ": [.v, .capital, .dot, .below],

    //1E7F          ; LATIN SMALL LETTER V WITH DOT BELOW
    "ṿ": [.v, .dot, .below],

    //1E80          ; LATIN CAPITAL LETTER W WITH GRAVE
    "Ẁ": [.w, .capital, .grave, .above],

    //1E81          ; LATIN SMALL LETTER W WITH GRAVE
    "ẁ": [.w, .grave, .above],

    //1E82          ; LATIN CAPITAL LETTER W WITH ACUTE
    "Ẃ": [.w, .capital, .acute, .above],

    //1E83          ; LATIN SMALL LETTER W WITH ACUTE
    "ẃ": [.w, .acute, .above],

    //1E84          ; LATIN CAPITAL LETTER W WITH DIAERESIS
    "Ẅ": [.w, .capital, .diaeresis, .above],

    //1E85          ; LATIN SMALL LETTER W WITH DIAERESIS
    "ẅ": [.w, .diaeresis, .above],

    //1E86          ; LATIN CAPITAL LETTER W WITH DOT ABOVE
    "Ẇ": [.w, .capital, .dot, .above],

    //1E87          ; LATIN SMALL LETTER W WITH DOT ABOVE
    "ẇ": [.w, .dot, .above],

    //1E88          ; LATIN CAPITAL LETTER W WITH DOT BELOW
    "Ẉ": [.w, .capital, .dot, .below],

    //1E89          ; LATIN SMALL LETTER W WITH DOT BELOW
    "ẉ": [.w, .dot, .below],

    //1E8A          ; LATIN CAPITAL LETTER X WITH DOT ABOVE
    "Ẋ": [.x, .capital, .dot, .above],

    //1E8B          ; LATIN SMALL LETTER X WITH DOT ABOVE
    "ẋ": [.x, .dot, .above],

    //1E8C          ; LATIN CAPITAL LETTER X WITH DIAERESIS
    "Ẍ": [.x, .capital, .diaeresis, .above],

    //1E8D          ; LATIN SMALL LETTER X WITH DIAERESIS
    "ẍ": [.x, .diaeresis, .above],

    //1E8E          ; LATIN CAPITAL LETTER Y WITH DOT ABOVE
    "Ẏ": [.y, .capital, .dot, .above],

    //1E8F          ; LATIN SMALL LETTER Y WITH DOT ABOVE
    "ẏ": [.y, .dot, .above],

    //1E90          ; LATIN CAPITAL LETTER Z WITH CIRCUMFLEX
    "Ẑ": [.z, .capital, .circumflex, .above],

    //1E91          ; LATIN SMALL LETTER Z WITH CIRCUMFLEX
    "ẑ": [.z, .circumflex, .above],

    //1E92          ; LATIN CAPITAL LETTER Z WITH DOT BELOW
    "Ẓ": [.z, .capital, .dot, .below],

    //1E93          ; LATIN SMALL LETTER Z WITH DOT BELOW
    "ẓ": [.z, .dot, .below],

    //1E94          ; LATIN CAPITAL LETTER Z WITH LINE BELOW
    "Ẕ": [.z, .capital, .dot, .below],

    //1E95          ; LATIN SMALL LETTER Z WITH LINE BELOW
    "ẕ": [.z, .dot, .below],

    //1E96          ; LATIN SMALL LETTER H WITH LINE BELOW
    "ẖ": [.h, .macron, .below],

    //1E97          ; LATIN SMALL LETTER T WITH DIAERESIS
    "ẗ": [.t, .diaeresis, .above],

    //1E98          ; LATIN SMALL LETTER W WITH RING ABOVE
    "ẘ": [.w, .ring, .above],

    //1E99          ; LATIN SMALL LETTER Y WITH RING ABOVE
    "ẙ": [.y, .ring, .above],

    //1E9A          ; LATIN SMALL LETTER A WITH RIGHT HALF RING
    "ẚ": [.a, .ring, .rightHalf],

    //1E9B          ; LATIN SMALL LETTER LONG S WITH DOT ABOVE
    "ẛ": [.s, .l, .dot, .above],

    //1E9C          ; LATIN SMALL LETTER LONG S WITH DIAGONAL STROKE
    "ẜ": [.s, .l, .diagonalStroke],

    //1E9D          ; LATIN SMALL LETTER LONG S WITH HIGH STROKE
    "ẝ": [.s, .l, .stroke],

    //1E9E          ; LATIN CAPITAL LETTER SHARP S
    "ẞ": [.s, .s, .capital],

    //1E9F          ; LATIN SMALL LETTER DELTA
    "ẟ": [.d, .h, .extra1],

    //1EA0          ; LATIN CAPITAL LETTER A WITH DOT BELOW
    "Ạ": [.a, .capital, .dot, .below],

    //1EA1          ; LATIN SMALL LETTER A WITH DOT BELOW
    "ạ": [.a, .dot, .below],

    //1EA2          ; LATIN CAPITAL LETTER A WITH HOOK ABOVE
    "Ả": [.a, .capital, .hook, .above],

    //1EA3          ; LATIN SMALL LETTER A WITH HOOK ABOVE
    "ả": [.a, .hook, .above],

    //1EA4          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND ACUTE
    "Ấ": [.a, .capital, .circumflex, .above, .acute, .above],

    //1EA5          ; LATIN SMALL LETTER A WITH CIRCUMFLEX AND ACUTE
    "ấ": [.a, .circumflex, .above, .acute, .above],

    //1EA6          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND GRAVE
    "Ầ": [.a, .capital, .circumflex, .above, .grave, .above],

    //1EA7          ; LATIN SMALL LETTER A WITH CIRCUMFLEX AND GRAVE
    "ầ": [.a, .circumflex, .above, .grave, .above],

    //1EA8          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE
    "Ẩ": [.a, .capital, .circumflex, .above, .hook, .above],

    //1EA9          ; LATIN SMALL LETTER A WITH CIRCUMFLEX AND HOOK ABOVE
    "ẩ": [.a, .circumflex, .above, .hook, .above],

    //1EAA          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND TILDE
    "Ẫ": [.a, .capital, .circumflex, .above, .tilde, .above],

    //1EAB          ; LATIN SMALL LETTER A WITH CIRCUMFLEX AND TILDE
    "ẫ": [.a, .circumflex, .above, .tilde, .above],

    //1EAC          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX AND DOT BELOW
    "Ậ": [.a, .capital, .dot, .below, .circumflex, .above],

    //1EAD          ; LATIN SMALL LETTER A WITH CIRCUMFLEX AND DOT BELOW
    "ậ": [.a, .dot, .below, .circumflex, .above],

    //1EAE          ; LATIN CAPITAL LETTER A WITH BREVE AND ACUTE
    "Ắ": [.a, .capital, .breve, .above, .acute, .above],

    //1EAF          ; LATIN SMALL LETTER A WITH BREVE AND ACUTE
    "ắ": [.a, .breve, .above, .acute, .above],

    //1EB0          ; LATIN CAPITAL LETTER A WITH BREVE AND GRAVE
    "Ằ": [.a, .capital, .breve, .above, .grave, .above],

    //1EB1          ; LATIN SMALL LETTER A WITH BREVE AND GRAVE
    "ằ": [.a, .breve, .above, .grave, .above],

    //1EB2          ; LATIN CAPITAL LETTER A WITH BREVE AND HOOK ABOVE
    "Ẳ": [.a, .capital, .breve, .above, .hook, .above],

    //1EB3          ; LATIN SMALL LETTER A WITH BREVE AND HOOK ABOVE
    "ẳ": [.a, .breve, .above, .hook, .above],

    //1EB4          ; LATIN CAPITAL LETTER A WITH BREVE AND TILDE
    "Ẵ": [.a, .capital, .breve, .above, .tilde, .above],

    //1EB5          ; LATIN SMALL LETTER A WITH BREVE AND TILDE
    "ẵ": [.a, .breve, .above, .tilde, .above],

    //1EB6          ; LATIN CAPITAL LETTER A WITH BREVE AND DOT BELOW
    "Ặ": [.a, .capital, .dot, .below, .breve, .above],

    //1EB7          ; LATIN SMALL LETTER A WITH BREVE AND DOT BELOW
    "ặ": [.a, .dot, .below, .breve, .above],

    //1EB8          ; LATIN CAPITAL LETTER E WITH DOT BELOW
    "Ẹ": [.e,  .capital, .dot, .above],

    //1EB9          ; LATIN SMALL LETTER E WITH DOT BELOW
    "ẹ": [.e, .dot, .above],

    //1EBA          ; LATIN CAPITAL LETTER E WITH HOOK ABOVE
    "Ẻ": [.e, .capital, .hook, .above],

    //1EBB          ; LATIN SMALL LETTER E WITH HOOK ABOVE
    "ẻ": [.e, .hook, .above],

    //1EBC          ; LATIN CAPITAL LETTER E WITH TILDE
    "Ẽ": [.e, .capital, .tilde, .above],

    //1EBD          ; LATIN SMALL LETTER E WITH TILDE
    "ẽ": [.e, .tilde, .above],

    //1EBE          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND ACUTE
    "Ế": [.e, .capital, .circumflex, .above, .acute, .above],

    //1EBF          ; LATIN SMALL LETTER E WITH CIRCUMFLEX AND ACUTE
    "ế": [.e, .circumflex, .above, .acute, .above],

    //1EC0          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND GRAVE
    "Ề": [.e, .capital, .circumflex, .above, .grave, .above],

    //1EC1          ; LATIN SMALL LETTER E WITH CIRCUMFLEX AND GRAVE
    "ề": [.e, .circumflex, .above, .grave, .above],

    //1EC2          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
    "Ể": [.e, .capital, .circumflex, .above, .hook, .above],

    //1EC3          ; LATIN SMALL LETTER E WITH CIRCUMFLEX AND HOOK ABOVE
    "ể": [.e, .circumflex, .above, .hook, .above],

    //1EC4          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND TILDE
    "Ễ": [.e, .capital, .circumflex, .above, .tilde, .above],

    //1EC5          ; LATIN SMALL LETTER E WITH CIRCUMFLEX AND TILDE
    "ễ": [.e, .circumflex, .above, .tilde, .above],

    //1EC6          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX AND DOT BELOW
    "Ệ": [.e, .capital, .dot, .below, .circumflex, .above],

    //1EC7          ; LATIN SMALL LETTER E WITH CIRCUMFLEX AND DOT BELOW
    "ệ": [.e, .dot, .below, .circumflex, .above],

    //1EC8          ; LATIN CAPITAL LETTER I WITH HOOK ABOVE
    "Ỉ": [.i, .capital, .hook, .above],

    //1EC9          ; LATIN SMALL LETTER I WITH HOOK ABOVE
    "ỉ": [.i, .hook, .above],

    //1ECA          ; LATIN CAPITAL LETTER I WITH DOT BELOW
    "Ị": [.i, .capital, .dot, .below],

    //1ECB          ; LATIN SMALL LETTER I WITH DOT BELOW
    "ị": [.i, .dot, .below],

    //1ECC          ; LATIN CAPITAL LETTER O WITH DOT BELOW
    "Ọ": [.o, .capital, .dot, .below],

    //1ECD          ; LATIN SMALL LETTER O WITH DOT BELOW
    "ọ": [.o, .dot, .below],

    //1ECE          ; LATIN CAPITAL LETTER O WITH HOOK ABOVE
    "Ỏ": [.o, .capital, .hook, .above],

    //1ECF          ; LATIN SMALL LETTER O WITH HOOK ABOVE
    "ỏ": [.o, .hook, .above],

    //1ED0          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND ACUTE
    "Ố": [.o, .capital, .circumflex, .above, .acute, .above],

    //1ED1          ; LATIN SMALL LETTER O WITH CIRCUMFLEX AND ACUTE
    "ố": [.o, .circumflex, .above, .acute, .above],

    //1ED2          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND GRAVE
    "Ồ": [.o, .capital, .circumflex, .above, .grave, .above],

    //1ED3          ; LATIN SMALL LETTER O WITH CIRCUMFLEX AND GRAVE
    "ồ": [.o, .circumflex, .above, .grave, .above],

    //1ED4          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE
    "Ổ": [.o, .capital, .circumflex, .above, .hook, .above],

    //1ED5          ; LATIN SMALL LETTER O WITH CIRCUMFLEX AND HOOK ABOVE
    "ổ": [.o, .circumflex, .above, .hook, .above],

    //1ED6          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND TILDE
    "Ỗ": [.o, .capital, .circumflex, .above, .tilde, .above],

    //1ED7          ; LATIN SMALL LETTER O WITH CIRCUMFLEX AND TILDE
    "ỗ": [.o, .circumflex, .above, .tilde, .above],

    //1ED8          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX AND DOT BELOW
    "Ộ": [.o, .capital, .dot, .below, .circumflex, .above],

    //1ED9          ; LATIN SMALL LETTER O WITH CIRCUMFLEX AND DOT BELOW
    "ộ": [.o, .dot, .below, .circumflex, .above],

    //1EDA          ; LATIN CAPITAL LETTER O WITH HORN AND ACUTE
    "Ớ": [.o, .capital, .horn, .acute, .above],

    //1EDB          ; LATIN SMALL LETTER O WITH HORN AND ACUTE
    "ớ": [.o, .horn, .acute, .above],

    //1EDC          ; LATIN CAPITAL LETTER O WITH HORN AND GRAVE
    "Ờ": [.o, .capital, .horn, .grave, .above],

    //1EDD          ; LATIN SMALL LETTER O WITH HORN AND GRAVE
    "ờ": [.o, .horn, .grave, .above],

    //1EDE          ; LATIN CAPITAL LETTER O WITH HORN AND HOOK ABOVE
    "Ở": [.o, .capital, .horn, .hook, .above],

    //1EDF          ; LATIN SMALL LETTER O WITH HORN AND HOOK ABOVE
    "ở": [.o, .horn, .hook, .above],

    //1EE0          ; LATIN CAPITAL LETTER O WITH HORN AND TILDE
    "Ỡ": [.o, .capital, .horn, .tilde, .above],

    //1EE1          ; LATIN SMALL LETTER O WITH HORN AND TILDE
    "ỡ": [.o, .horn, .tilde, .above],

    //1EE2          ; LATIN CAPITAL LETTER O WITH HORN AND DOT BELOW
    "Ợ": [.o, .capital, .horn, .dot, .below],

    //1EE3          ; LATIN SMALL LETTER O WITH HORN AND DOT BELOW
    "ợ": [.o, .horn, .dot, .below],

    //1EE4          ; LATIN CAPITAL LETTER U WITH DOT BELOW
    "Ụ": [.u, .capital, .dot, .below],

    //1EE5          ; LATIN SMALL LETTER U WITH DOT BELOW
    "ụ": [.u, .dot, .below],

    //1EE6          ; LATIN CAPITAL LETTER U WITH HOOK ABOVE
    "Ủ": [.u, .capital, .hook, .above],

    //1EE7          ; LATIN SMALL LETTER U WITH HOOK ABOVE
    "ủ": [.u, .hook, .above],

    //1EE8          ; LATIN CAPITAL LETTER U WITH HORN AND ACUTE
    "Ứ": [.u, .capital, .horn, .acute, .above],

    //1EE9          ; LATIN SMALL LETTER U WITH HORN AND ACUTE
    "ứ": [.u, .horn, .acute, .above],

    //1EEA          ; LATIN CAPITAL LETTER U WITH HORN AND GRAVE
    "Ừ": [.u, .capital, .horn, .grave, .above],

    //1EEB          ; LATIN SMALL LETTER U WITH HORN AND GRAVE
    "ừ": [.u, .horn, .grave, .above],

    //1EEC          ; LATIN CAPITAL LETTER U WITH HORN AND HOOK ABOVE
    "Ử": [.u, .capital, .horn, .hook, .above],

    //1EED          ; LATIN SMALL LETTER U WITH HORN AND HOOK ABOVE
    "ử": [.u, .horn, .hook, .above],

    //1EEE          ; LATIN CAPITAL LETTER U WITH HORN AND TILDE
    "Ữ": [.u, .capital, .horn, .tilde, .above],

    //1EEF          ; LATIN SMALL LETTER U WITH HORN AND TILDE
    "ữ": [.u, .horn, .tilde, .above],

    //1EF0          ; LATIN CAPITAL LETTER U WITH HORN AND DOT BELOW
    "Ự": [.u, .capital, .horn, .dot, .below],

    //1EF1          ; LATIN SMALL LETTER U WITH HORN AND DOT BELOW
    "ự": [.u, .horn, .dot, .below],

    //1EF2          ; LATIN CAPITAL LETTER Y WITH GRAVE
    "Ỳ": [.y, .capital, .grave, .above],

    //1EF3          ; LATIN SMALL LETTER Y WITH GRAVE
    "ỳ": [.y, .grave, .above],

    //1EF4          ; LATIN CAPITAL LETTER Y WITH DOT BELOW
    "Ỵ": [.y, .capital, .dot, .below],

    //1EF5          ; LATIN SMALL LETTER Y WITH DOT BELOW
    "ỵ": [.y, .dot, .below],

    //1EF6          ; LATIN CAPITAL LETTER Y WITH HOOK ABOVE
    "Ỷ": [.y, .capital, .hook, .above],

    //1EF7          ; LATIN SMALL LETTER Y WITH HOOK ABOVE
    "ỷ": [.y, .hook, .above],

    //1EF8          ; LATIN CAPITAL LETTER Y WITH TILDE
    "Ỹ": [.y, .capital, .tilde, .above],

    //1EF9          ; LATIN SMALL LETTER Y WITH TILDE
    "ỹ": [.y, .tilde, .above],

    //1EFA          ; LATIN CAPITAL LETTER MIDDLE-WELSH LL
    "Ỻ": [.l, .l, .middleWelsh, .capital],

    //1EFB          ; LATIN SMALL LETTER MIDDLE-WELSH LL
    "ỻ": [.l, .l, .middleWelsh],

    //1EFC          ; LATIN CAPITAL LETTER MIDDLE-WELSH V
    "Ỽ": [.v, .middleWelsh, .capital],

    //1EFD          ; LATIN SMALL LETTER MIDDLE-WELSH V
    "ỽ": [.v, .middleWelsh],

    //1EFE          ; LATIN CAPITAL LETTER Y WITH LOOP
    "Ỿ": [.y, .loop, .capital],

    //1EFF          ; LATIN SMALL LETTER Y WITH LOOP
    "ỿ": [.y, .loop],

    
    // MARK: - 2000..206F; General Punctuation
    
    //2000          ; EN QUAD
    //2001          ; EM QUAD
    
    //2002          ; EN SPACE
    " ": [.space, .n],

    //2003          ; EM SPACE
    " ": [.space, .m],

    //2004          ; THREE-PER-EM SPACE
    " ": [.space, .m, .three],

    //2005          ; FOUR-PER-EM SPACE
    " ": [.space, .m, .four],

    //2006          ; SIX-PER-EM SPACE
    " ": [.space, .m, .six],

    //2007          ; FIGURE SPACE
    " ": [.space, .numberSign],

    //2008          ; PUNCTUATION SPACE
    " ": [.space, .fullStop],

    //2009          ; THIN SPACE
    " ": [.space, .m, .five],

    //200A          ; HAIR SPACE
    " ": [.space, .m, .seven],

    //200B          ; ZERO WIDTH SPACE
    "​": [.space, .zero],

    //200C          ; ZERO WIDTH NON-JOINER
    //200D          ; ZERO WIDTH JOINER
    //200E          ; LEFT-TO-RIGHT MARK
    //200F          ; RIGHT-TO-LEFT MARK
    
    //2010          ; HYPHEN
    "‐": [.hyphen],

    //2011          ; NON-BREAKING HYPHEN
    "‑": [.hyphen, .nonBreaking],

    //2012          ; FIGURE DASH
    "‒": [.hyphen, .numberSign],

    //2013          ; EN DASH
    "–": [.hyphen, .n],

    //2014          ; EM DASH
    "—": [.hyphen, .m],

    //2015          ; HORIZONTAL BAR
    "―": [.hyphen, .quotation],

    //2016          ; DOUBLE VERTICAL LINE
    "‖": [.verticalLine, .doubled],

    //2017          ; DOUBLE LOW LINE
    "‗": [.lowLine, .doubled],

    //2018          ; LEFT SINGLE QUOTATION MARK
    "‘": [.commaQuotationMark, .turned, .superscript],

    //2019          ; RIGHT SINGLE QUOTATION MARK
    "’": [.commaQuotationMark, .superscript],

    //201A          ; SINGLE LOW-9 QUOTATION MARK
    "‚": [.commaQuotationMark, .subscript],

    //201B          ; SINGLE HIGH-REVERSED-9 QUOTATION MARK
    "‛": [.commaQuotationMark, .reversed, .superscript],

    //201C          ; LEFT DOUBLE QUOTATION MARK
    "“": [.commaQuotationMark, .doubled, .turned, .superscript],

    //201D          ; RIGHT DOUBLE QUOTATION MARK
    "”": [.commaQuotationMark, .doubled, .superscript],

    //201E          ; DOUBLE LOW-9 QUOTATION MARK
    "„": [.commaQuotationMark, .doubled, .subscript],

    //201F          ; DOUBLE HIGH-REVERSED-9 QUOTATION MARK
    "‟": [.commaQuotationMark, .doubled, .reversed, .superscript],

    //2020          ; DAGGER
    "†": [.asterisk, .extra1],

    //2021          ; DOUBLE DAGGER
    "‡": [.asterisk, .extra2],

    //2022          ; BULLET
    "•": [],

    //2023          ; TRIANGULAR BULLET
    "‣": [],

    //2024          ; ONE DOT LEADER
    "․": [],

    //2025          ; TWO DOT LEADER
    "‥": [],

    //2026          ; HORIZONTAL ELLIPSIS
    "…": [],

    //2027          ; HYPHENATION POINT
    "‧": [.hyphen, .fullStop],

    //2028          ; LINE SEPARATOR
    //2029          ; PARAGRAPH SEPARATOR
    //202A          ; LEFT-TO-RIGHT EMBEDDING
    //202B          ; RIGHT-TO-LEFT EMBEDDING
    //202C          ; POP DIRECTIONAL FORMATTING
    //202D          ; LEFT-TO-RIGHT OVERRIDE
    //202E          ; RIGHT-TO-LEFT OVERRIDE

    //202F          ; NARROW NO-BREAK SPACE
    " ": [.space, .m, .five, .nonBreaking],

    //2030          ; PER MILLE SIGN
    "‰": [.percentSign, .extra1],

    //2031          ; PER TEN THOUSAND SIGN
    "‱": [.percentSign, .extra2],

    //2032          ; PRIME
    "′": [],

    //2033          ; DOUBLE PRIME
    "″": [],

    //2034          ; TRIPLE PRIME
    "‴": [],

    //2035          ; REVERSED PRIME
    "‵": [],

    //2036          ; REVERSED DOUBLE PRIME
    "‶": [],

    //2037          ; REVERSED TRIPLE PRIME
    "‷": [],

    //2038          ; CARET
    "‸": [.caret, .subscript],

    //2039          ; SINGLE LEFT-POINTING ANGLE QUOTATION MARK
    "‹": [.angleQuotationMark],

    //203A          ; SINGLE RIGHT-POINTING ANGLE QUOTATION MARK
    "›": [.angleQuotationMark, .turned],

    //203B          ; REFERENCE MARK
    "※": [],

    //203C          ; DOUBLE EXCLAMATION MARK
    "‼": [.exclamationMark, .joiner, .exclamationMark],

    //203D          ; INTERROBANG
    "‽": [.exclamationMark, .questionMark],

    //203E          ; OVERLINE
    "‾": [.line, .superscript],

    //203F          ; UNDERTIE
    "‿": [.breve, .subscript],

    //2040          ; CHARACTER TIE
    "⁀": [.invertedBreve, .superscript],

    //2041          ; CARET INSERTION POINT
    "⁁": [.caret, .diagonalStroke, .subscript],

    //2042          ; ASTERISM
    "⁂": [],

    //2043          ; HYPHEN BULLET
    "⁃": [],

    //2044          ; FRACTION SLASH
    "⁄": [.fractionSlash],

    //2045          ; LEFT SQUARE BRACKET WITH QUILL
    "⁅": [.squareBracket, .stroke],

    //2046          ; RIGHT SQUARE BRACKET WITH QUILL
    "⁆": [.squareBracket, .stroke, .turned],

    //2047          ; DOUBLE QUESTION MARK
    "⁇": [.questionMark, .joiner, .questionMark],

    //2048          ; QUESTION EXCLAMATION MARK
    "⁈": [.questionMark, .joiner, .exclamationMark],

    //2049          ; EXCLAMATION QUESTION MARK
    "⁉": [.exclamationMark, .joiner, .questionMark],

    //204A          ; TIRONIAN SIGN ET
    "⁊": [],

    //204B          ; REVERSED PILCROW SIGN
    "⁋": [],

    //204C          ; BLACK LEFTWARDS BULLET
    "⁌": [],

    //204D          ; BLACK RIGHTWARDS BULLET
    "⁍": [],

    //204E          ; LOW ASTERISK
    "⁎": [.asterisk, .subscript],

    //204F          ; REVERSED SEMICOLON
    "⁏": [.semicolon, .reversed],

    //2050          ; CLOSE UP
    "⁐": [.invertedBreve, .breve],

    //2051          ; TWO ASTERISKS ALIGNED VERTICALLY
    "⁑": [.asterisk, .doubled],

    //2052          ; COMMERCIAL MINUS SIGN
    "⁒": [.percentSign, .dot],

    //2053          ; SWUNG DASH
    "⁓": [.tilde, .m],

    //2054          ; INVERTED UNDERTIE
    "⁔": [.invertedBreve, .subscript],

    //2055          ; FLOWER PUNCTUATION MARK
    "⁕": [], //Indic

    //2056          ; THREE DOT PUNCTUATION
    "⁖": [],

    //2057          ; QUADRUPLE PRIME
    "⁗": [],

    //2058          ; FOUR DOT PUNCTUATION
    "⁘": [],

    //2059          ; FIVE DOT PUNCTUATION
    "⁙": [],

    //205A          ; TWO DOT PUNCTUATION
    "⁚": [],

    //205B          ; FOUR DOT MARK
    "⁛": [],

    //205C          ; DOTTED CROSS
    "⁜": [],

    //205D          ; TRICOLON
    "⁝": [],

    //205E          ; VERTICAL FOUR DOTS
    "⁞": [],

    //205F          ; MEDIUM MATHEMATICAL SPACE
    " ": [.space, .plusSign],

    //2060          ; WORD JOINER
    "⁠": [.space, .zero, .nonBreaking],

    //2061          ; FUNCTION APPLICATION
    
    //2062          ; INVISIBLE TIMES
    "⁢": [.multiplicationSign, .extraLeft],

    //2063          ; INVISIBLE SEPARATOR
    "⁣": [.comma, .extraLeft],

    //2064          ; INVISIBLE PLUS
    "⁤": [.plusSign, .extraLeft],

    //2066          ; LEFT-TO-RIGHT ISOLATE
    //2067          ; RIGHT-TO-LEFT ISOLATE
    //2068          ; FIRST STRONG ISOLATE
    //2069          ; POP DIRECTIONAL ISOLATE
    //206A          ; INHIBIT SYMMETRIC SWAPPING
    //206B          ; ACTIVATE SYMMETRIC SWAPPING
    //206C          ; INHIBIT ARABIC FORM SHAPING
    //206D          ; ACTIVATE ARABIC FORM SHAPING
    //206E          ; NATIONAL DIGIT SHAPES
    //206F          ; NOMINAL DIGIT SHAPES

    
    // MARK: - 2070..209F; Superscripts and Subscripts
    
    //2070          ; SUPERSCRIPT ZERO
    "⁰": [.zero, .superscript],

    //2071          ; SUPERSCRIPT LATIN SMALL LETTER I
    "ⁱ": [.i, .superscript],

    //2074          ; SUPERSCRIPT FOUR
    "⁴": [.four, .superscript],

    //2075          ; SUPERSCRIPT FIVE
    "⁵": [.five, .superscript],

    //2076          ; SUPERSCRIPT SIX
    "⁶": [.six, .superscript],

    //2077          ; SUPERSCRIPT SEVEN
    "⁷": [.seven, .superscript],

    //2078          ; SUPERSCRIPT EIGHT
    "⁸": [.eight, .superscript],

    //2079          ; SUPERSCRIPT NINE
    "⁹": [.nine, .superscript],

    //207A          ; SUPERSCRIPT PLUS SIGN
    "⁺": [.plusSign, .superscript],

    //207B          ; SUPERSCRIPT MINUS
    "⁻": [.minusSign, .superscript],

    //207C          ; SUPERSCRIPT EQUALS SIGN
    "⁼": [.equalsSign, .superscript],

    //207D          ; SUPERSCRIPT LEFT PARENTHESIS
    "⁽": [.parenthesis, .superscript],

    //207E          ; SUPERSCRIPT RIGHT PARENTHESIS
    "⁾": [.parenthesis, .turned, .superscript],

    //207F          ; SUPERSCRIPT LATIN SMALL LETTER N
    "ⁿ": [.n, .superscript],

    //2080          ; SUBSCRIPT ZERO
    "₀": [.zero, .subscript],

    //2081          ; SUBSCRIPT ONE
    "₁": [.one, .subscript],

    //2082          ; SUBSCRIPT TWO
    "₂": [.two, .subscript],

    //2083          ; SUBSCRIPT THREE
    "₃": [.three, .subscript],

    //2084          ; SUBSCRIPT FOUR
    "₄": [.four, .subscript],

    //2085          ; SUBSCRIPT FIVE
    "₅": [.five, .subscript],

    //2086          ; SUBSCRIPT SIX
    "₆": [.six, .subscript],

    //2087          ; SUBSCRIPT SEVEN
    "₇": [.seven, .subscript],

    //2088          ; SUBSCRIPT EIGHT
    "₈": [.eight, .subscript],

    //2089          ; SUBSCRIPT NINE
    "₉": [.nine, .subscript],

    //208A          ; SUBSCRIPT PLUS SIGN
    "₊": [.plusSign, .subscript],

    //208B          ; SUBSCRIPT MINUS
    "₋": [.minusSign, .subscript],

    //208C          ; SUBSCRIPT EQUALS SIGN
    "₌": [.equalsSign, .subscript],

    //208D          ; SUBSCRIPT LEFT PARENTHESIS
    "₍": [.parenthesis, .subscript],

    //208E          ; SUBSCRIPT RIGHT PARENTHESIS
    "₎": [.parenthesis, .turned, .subscript],

    //2090          ; LATIN SUBSCRIPT SMALL LETTER A
    "ₐ": [.a, .subscript],

    //2091          ; LATIN SUBSCRIPT SMALL LETTER E
    "ₑ": [.e, .subscript],

    //2092          ; LATIN SUBSCRIPT SMALL LETTER O
    "ₒ": [.o, .subscript],

    //2093          ; LATIN SUBSCRIPT SMALL LETTER X
    "ₓ": [.x, .subscript],

    //2094          ; LATIN SUBSCRIPT SMALL LETTER SCHWA
    "ₔ": [.schwa, .subscript],

    //2095          ; LATIN SUBSCRIPT SMALL LETTER H
    "ₕ": [.h, .subscript],

    //2096          ; LATIN SUBSCRIPT SMALL LETTER K
    "ₖ": [.k, .subscript],

    //2097          ; LATIN SUBSCRIPT SMALL LETTER L
    "ₗ": [.l, .subscript],

    //2098          ; LATIN SUBSCRIPT SMALL LETTER M
    "ₘ": [.m, .subscript],

    //2099          ; LATIN SUBSCRIPT SMALL LETTER N
    "ₙ": [.n, .subscript],

    //209A          ; LATIN SUBSCRIPT SMALL LETTER P
    "ₚ": [.p, .subscript],

    //209B          ; LATIN SUBSCRIPT SMALL LETTER S
    "ₛ": [.s, .subscript],

    //209C          ; LATIN SUBSCRIPT SMALL LETTER T
    "ₜ": [.t, .subscript],

    
    // MARK: - 20D0..20FF; Combining Diacritical Marks for Symbols
    
    //20D0          ; COMBINING LEFT HARPOON ABOVE
    "⃐": [.macron, .above, .lessThanSign, .topHalf],

    //20D1          ; COMBINING RIGHT HARPOON ABOVE
    "⃑": [.macron, .above, .greaterThanSign, .topHalf],

    //20D2          ; COMBINING LONG VERTICAL LINE OVERLAY
    "⃒": [.verticalLine, .combining],

    //20D3          ; COMBINING SHORT VERTICAL LINE OVERLAY
    "⃓": [.verticalLine, .combining, .short],

    //20D4          ; COMBINING ANTICLOCKWISE ARROW ABOVE
    "⃔": [.breve, .above, .lessThanSign],

    //20D5          ; COMBINING CLOCKWISE ARROW ABOVE
    "⃕": [.breve, .above, .greaterThanSign],

    //20D6          ; COMBINING LEFT ARROW ABOVE
    "⃖": [.macron, .above, .lessThanSign],

    //20D7          ; COMBINING RIGHT ARROW ABOVE
    "⃗": [.macron, .above, .greaterThanSign],

    //20D8          ; COMBINING RING OVERLAY
    "⃘": [.ring, .combining],

    //20D9          ; COMBINING CLOCKWISE RING OVERLAY
    "⃙": [.ring, .combining, .greaterThanSign],

    //20DA          ; COMBINING ANTICLOCKWISE RING OVERLAY
    "⃚": [.ring, .combining, .lessThanSign],

    //20DB          ; COMBINING THREE DOTS ABOVE
    "⃛": [],

    //20DC          ; COMBINING FOUR DOTS ABOVE
    "⃜": [],

    //20DD          ; COMBINING ENCLOSING CIRCLE
    "⃝": [],

    //20DE          ; COMBINING ENCLOSING SQUARE
    "⃞": [],

    //20DF          ; COMBINING ENCLOSING DIAMOND
    "⃟": [],

    //20E0          ; COMBINING ENCLOSING CIRCLE BACKSLASH
    "⃠": [],

    //20E1          ; COMBINING LEFT RIGHT ARROW ABOVE
    "⃡": [.macron, .above, .lessThanSign, .greaterThanSign],

    //20E2          ; COMBINING ENCLOSING SCREEN
    "⃢": [],

    //20E3          ; COMBINING ENCLOSING KEYCAP
    "⃣": [],

    //20E4          ; COMBINING ENCLOSING UPWARD POINTING TRIANGLE
    "⃤": [],

    //20E5          ; COMBINING REVERSE SOLIDUS OVERLAY
    "⃥": [.solidus, .reversed, .combining],

    //20E6          ; COMBINING DOUBLE VERTICAL STROKE OVERLAY
    "⃦": [.verticalLine, .doubled, .combining],

    //20E7          ; COMBINING ANNUITY SYMBOL
    "⃧": [],

    //20E8          ; COMBINING TRIPLE UNDERDOT
    "⃨": [],

    //20E9          ; COMBINING WIDE BRIDGE ABOVE
    "⃩": [],

    //20EA          ; COMBINING LEFTWARDS ARROW OVERLAY
    "⃪": [.stroke, .lessThanSign],

    //20EB          ; COMBINING LONG DOUBLE SOLIDUS OVERLAY
    "⃫": [.solidus, .doubled, .combining],

    //20EC          ; COMBINING RIGHTWARDS HARPOON WITH BARB DOWNWARDS
    "⃬": [.macron, .below, .greaterThanSign, .bottomHalf],

    //20ED          ; COMBINING LEFTWARDS HARPOON WITH BARB DOWNWARDS
    "⃭": [.macron, .below, .lessThanSign, .bottomHalf],

    //20EE          ; COMBINING LEFT ARROW BELOW
    "⃮": [.macron, .below, .lessThanSign],

    //20EF          ; COMBINING RIGHT ARROW BELOW
    "⃯": [.macron, .below, .greaterThanSign],

    //20F0          ; COMBINING ASTERISK ABOVE
    "⃰": [.asterisk, .above],

    
    // MARK: - 2100..214F; Letterlike Symbols
    
    //2100          ; ACCOUNT OF
    "℀": [],

    //2101          ; ADDRESSED TO THE SUBJECT
    "℁": [],

    //2102          ; DOUBLE-STRUCK CAPITAL C
    "ℂ": [.c, .capital, .doubleStruck],

    //2103          ; DEGREE CELSIUS
    "℃": [],

    //2104          ; CENTRE LINE SYMBOL
    "℄": [],

    //2105          ; CARE OF
    "℅": [],

    //2106          ; CADA UNA
    "℆": [],

    //2107          ; EULER CONSTANT
    "ℇ": [],

    //2108          ; SCRUPLE
    "℈": [],

    //2109          ; DEGREE FAHRENHEIT
    "℉": [],

    //210A          ; SCRIPT SMALL G
    "ℊ": [.g, .script],

    //210B          ; SCRIPT CAPITAL H
    "ℋ": [.h, .capital, .script],

    //210C          ; BLACK-LETTER CAPITAL H
    "ℌ": [.h, .capital, .fraktur],

    //210D          ; DOUBLE-STRUCK CAPITAL H
    "ℍ": [.h, .capital, .doubleStruck],

    //210E          ; PLANCK CONSTANT
    "ℎ": [],

    //210F          ; PLANCK CONSTANT OVER TWO PI
    "ℏ": [],

    //2110          ; SCRIPT CAPITAL I
    "ℐ": [.i, .capital, .script],

    //2111          ; BLACK-LETTER CAPITAL I
    "ℑ": [.i, .capital, .fraktur],

    //2112          ; SCRIPT CAPITAL L
    "ℒ": [.l, .capital, .script],

    //2113          ; SCRIPT SMALL L
    "ℓ": [.l, .script],

    //2114          ; L B BAR SYMBOL
    "℔": [.l, .b],

    //2115          ; DOUBLE-STRUCK CAPITAL N
    "ℕ": [.n, .capital, .doubleStruck],

    //2116          ; NUMERO SIGN
    "№": [.n, .capital, .numberSign],

    //2117          ; SOUND RECORDING COPYRIGHT
    "℗": [],

    //2118          ; SCRIPT CAPITAL P
    "℘": [.p, .capital, .script],

    //2119          ; DOUBLE-STRUCK CAPITAL P
    "ℙ": [.p, .capital, .doubleStruck],

    //211A          ; DOUBLE-STRUCK CAPITAL Q
    "ℚ": [.q, .capital, .doubleStruck],

    //211B          ; SCRIPT CAPITAL R
    "ℛ": [.r, .capital, .script],

    //211C          ; BLACK-LETTER CAPITAL R
    "ℜ": [.r, .capital, .fraktur],

    //211D          ; DOUBLE-STRUCK CAPITAL R
    "ℝ": [.r, .capital, .doubleStruck],

    //211E          ; PRESCRIPTION TAKE
    "℞": [],

    //211F          ; RESPONSE
    "℟": [],

    //2120          ; SERVICE MARK
    "℠": [],

    //2121          ; TELEPHONE SIGN
    "℡": [],

    //2122          ; TRADE MARK SIGN
    "™": [],

    //2123          ; VERSICLE
    "℣": [],

    //2124          ; DOUBLE-STRUCK CAPITAL Z
    "ℤ": [.z, .capital, .doubleStruck],

    //2125          ; OUNCE SIGN
    "℥": [],

    //2126          ; OHM SIGN
    //"Ω": [],

    //2127          ; INVERTED OHM SIGN
    "℧": [],

    //2128          ; BLACK-LETTER CAPITAL Z
    "ℨ": [.z, .capital, .fraktur],

    //2129          ; TURNED GREEK SMALL LETTER IOTA
    "℩": [.i, .greek, .turned],

    //212A          ; KELVIN SIGN
    //"K": [],

    //212B          ; ANGSTROM SIGN
    //"Å": [],

    //212C          ; SCRIPT CAPITAL B
    "ℬ": [.b, .capital, .script],

    //212D          ; BLACK-LETTER CAPITAL C
    "ℭ": [.c, .capital, .fraktur],

    //212E          ; ESTIMATED SYMBOL
    "℮": [],

    //212F          ; SCRIPT SMALL E
    "ℯ": [.e, .script],

    //2130          ; SCRIPT CAPITAL E
    "ℰ": [.e, .capital, .script],

    //2131          ; SCRIPT CAPITAL F
    "ℱ": [.f, .capital, .script],

    //2132          ; TURNED CAPITAL F
    "Ⅎ": [.f, .capital, .turned],

    //2133          ; SCRIPT CAPITAL M
    "ℳ": [.m, .capital, .script],

    //2134          ; SCRIPT SMALL O
    "ℴ": [.o, .script],

    //2135          ; ALEF SYMBOL
    "ℵ": [],

    //2136          ; BET SYMBOL
    "ℶ": [],

    //2137          ; GIMEL SYMBOL
    "ℷ": [],

    //2138          ; DALET SYMBOL
    "ℸ": [],

    //2139          ; INFORMATION SOURCE
    "ℹ": [],

    //213A          ; ROTATED CAPITAL Q
    "℺": [.q, .capital, .sideways],

    //213B          ; FACSIMILE SIGN
    "℻": [],

    //213C          ; DOUBLE-STRUCK SMALL PI
    "ℼ": [.p, .greek, .doubleStruck],

    //213D          ; DOUBLE-STRUCK SMALL GAMMA
    "ℽ": [.g, .greek, .doubleStruck],

    //213E          ; DOUBLE-STRUCK CAPITAL GAMMA
    "ℾ": [.g, .capital, .greek, .doubleStruck],

    //213F          ; DOUBLE-STRUCK CAPITAL PI
    "ℿ": [.p, .capital, .greek, .doubleStruck],

    //2140          ; DOUBLE-STRUCK N-ARY SUMMATION
    "⅀": [.s, .capital, .greek, .doubleStruck],

    //2141          ; TURNED SANS-SERIF CAPITAL G
    "⅁": [.g, .capital, .sansSerif, .turned],

    //2142          ; TURNED SANS-SERIF CAPITAL L
    "⅂": [.l, .capital, .sansSerif, .turned],

    //2143          ; REVERSED SANS-SERIF CAPITAL L
    "⅃": [.l, .capital, .sansSerif, .reversed],

    //2144          ; TURNED SANS-SERIF CAPITAL Y
    "⅄": [.y, .capital, .sansSerif, .turned],

    //2145          ; DOUBLE-STRUCK ITALIC CAPITAL D
    "ⅅ": [.d, .capital, .doubleStruck, .italic],

    //2146          ; DOUBLE-STRUCK ITALIC SMALL D
    "ⅆ": [.d, .doubleStruck, .italic],

    //2147          ; DOUBLE-STRUCK ITALIC SMALL E
    "ⅇ": [.e, .doubleStruck, .italic],

    //2148          ; DOUBLE-STRUCK ITALIC SMALL I
    "ⅈ": [.i, .doubleStruck, .italic],

    //2149          ; DOUBLE-STRUCK ITALIC SMALL J
    "ⅉ": [.j, .doubleStruck, .italic],

    //214A          ; PROPERTY LINE
    "⅊": [],

    //214B          ; TURNED AMPERSAND
    "⅋": [.ampersand, .turned],

    //214C          ; PER SIGN
    "⅌": [],

    //214D          ; AKTIESELSKAB
    "⅍": [],

    //214E          ; TURNED SMALL F
    "ⅎ": [.f, .smallCapital, .turned],

    //214F          ; SYMBOL FOR SAMARITAN SOURCE
    "⅏": [],

    
    // MARK: - 2150..218F; Number Forms
    
    //2150          ; VULGAR FRACTION ONE SEVENTH
    "⅐": [.one, .fractionSlash, .seven],

    //2151          ; VULGAR FRACTION ONE NINTH
    "⅑": [.one, .fractionSlash, .nine],

    //2152          ; VULGAR FRACTION ONE TENTH
    "⅒": [.one, .fractionSlash, .one, .zero],

    //2153          ; VULGAR FRACTION ONE THIRD
    "⅓": [.one, .fractionSlash, .three],

    //2154          ; VULGAR FRACTION TWO THIRDS
    "⅔": [.two, .fractionSlash, .three],

    //2155          ; VULGAR FRACTION ONE FIFTH
    "⅕": [.one, .fractionSlash, .five],

    //2156          ; VULGAR FRACTION TWO FIFTHS
    "⅖": [.two, .fractionSlash, .five],

    //2157          ; VULGAR FRACTION THREE FIFTHS
    "⅗": [.three, .fractionSlash, .five],

    //2158          ; VULGAR FRACTION FOUR FIFTHS
    "⅘": [.four, .fractionSlash, .five],

    //2159          ; VULGAR FRACTION ONE SIXTH
    "⅙": [.one, .fractionSlash, .six],

    //215A          ; VULGAR FRACTION FIVE SIXTHS
    "⅚": [.five, .fractionSlash, .six],

    //215B          ; VULGAR FRACTION ONE EIGHTH
    "⅛": [.one, .fractionSlash, .eight],

    //215C          ; VULGAR FRACTION THREE EIGHTHS
    "⅜": [.three, .fractionSlash, .eight],

    //215D          ; VULGAR FRACTION FIVE EIGHTHS
    "⅝": [.five, .fractionSlash, .eight],

    //215E          ; VULGAR FRACTION SEVEN EIGHTHS
    "⅞": [.seven, .fractionSlash, .eight],

    //215F          ; FRACTION NUMERATOR ONE
    "⅟": [.one, .fractionSlash],

    //2160          ; ROMAN NUMERAL ONE
    //2161          ; ROMAN NUMERAL TWO
    //2162          ; ROMAN NUMERAL THREE
    //2163          ; ROMAN NUMERAL FOUR
    //2164          ; ROMAN NUMERAL FIVE
    //2165          ; ROMAN NUMERAL SIX
    //2166          ; ROMAN NUMERAL SEVEN
    //2167          ; ROMAN NUMERAL EIGHT
    //2168          ; ROMAN NUMERAL NINE
    //2169          ; ROMAN NUMERAL TEN
    //216A          ; ROMAN NUMERAL ELEVEN
    //216B          ; ROMAN NUMERAL TWELVE
    //216C          ; ROMAN NUMERAL FIFTY
    //216D          ; ROMAN NUMERAL ONE HUNDRED
    //216E          ; ROMAN NUMERAL FIVE HUNDRED
    //216F          ; ROMAN NUMERAL ONE THOUSAND
    //2170          ; SMALL ROMAN NUMERAL ONE
    //2171          ; SMALL ROMAN NUMERAL TWO
    //2172          ; SMALL ROMAN NUMERAL THREE
    //2173          ; SMALL ROMAN NUMERAL FOUR
    //2174          ; SMALL ROMAN NUMERAL FIVE
    //2175          ; SMALL ROMAN NUMERAL SIX
    //2176          ; SMALL ROMAN NUMERAL SEVEN
    //2177          ; SMALL ROMAN NUMERAL EIGHT
    //2178          ; SMALL ROMAN NUMERAL NINE
    //2179          ; SMALL ROMAN NUMERAL TEN
    //217A          ; SMALL ROMAN NUMERAL ELEVEN
    //217B          ; SMALL ROMAN NUMERAL TWELVE
    //217C          ; SMALL ROMAN NUMERAL FIFTY
    //217D          ; SMALL ROMAN NUMERAL ONE HUNDRED
    //217E          ; SMALL ROMAN NUMERAL FIVE HUNDRED
    //217F          ; SMALL ROMAN NUMERAL ONE THOUSAND
    
    //2180          ; ROMAN NUMERAL ONE THOUSAND C D
    "ↀ": [],

    //2181          ; ROMAN NUMERAL FIVE THOUSAND
    "ↁ": [],

    //2182          ; ROMAN NUMERAL TEN THOUSAND
    "ↂ": [],

    //2183          ; ROMAN NUMERAL REVERSED ONE HUNDRED
    "Ↄ": [.c, .capital, .reversed],

    //2184          ; LATIN SMALL LETTER REVERSED C
    "ↄ": [.c, .reversed],

    //2185          ; ROMAN NUMERAL SIX LATE FORM
    "ↅ": [],

    //2186          ; ROMAN NUMERAL FIFTY EARLY FORM
    "ↆ": [],

    //2187          ; ROMAN NUMERAL FIFTY THOUSAND
    "ↇ": [],

    //2188          ; ROMAN NUMERAL ONE HUNDRED THOUSAND
    "ↈ": [],

    //2189          ; VULGAR FRACTION ZERO THIRDS
    "↉": [.zero, .fractionSlash, .three],

    //218A          ; TURNED DIGIT TWO
    "↊": [.two, .turned],

    //218B          ; TURNED DIGIT THREE
    "↋": [.three, .turned],

    
    // MARK: - 2190..21FF; Arrows
    
    //2190          ; LEFTWARDS ARROW
    "←": [.hyphen, .lessThanSign],

    //2191          ; UPWARDS ARROW
    "↑": [.verticalLine, .greaterThanSign],

    //2192          ; RIGHTWARDS ARROW
    "→": [.hyphen, .greaterThanSign],

    //2193          ; DOWNWARDS ARROW
    "↓": [.verticalLine, .lessThanSign],

    //2194          ; LEFT RIGHT ARROW
    "↔︎": [.hyphen, .lessThanSign, .greaterThanSign],

    //2195          ; UP DOWN ARROW
    "↕︎": [.verticalLine, .lessThanSign, .greaterThanSign],

    //2196          ; NORTH WEST ARROW
    "↖︎": [.solidus, .reversed, .lessThanSign],

    //2197          ; NORTH EAST ARROW
    "↗︎": [.solidus, .greaterThanSign],

    //2198          ; SOUTH EAST ARROW
    "↘︎": [.solidus, .reversed, .greaterThanSign],

    //2199          ; SOUTH WEST ARROW
    "↙︎": [.solidus, .lessThanSign],

    
    // MARK: - 2200..22FF; Mathematical Operators
    
    //2200          ; FOR ALL
    "∀": [],

    //2201          ; COMPLEMENT
    "∁": [],

    //2202          ; PARTIAL DIFFERENTIAL
    "∂": [.d, .greek, .symbol],

    //2203          ; THERE EXISTS
    "∃": [],

    //2204          ; THERE DOES NOT EXIST
    "∄": [],

    //2205          ; EMPTY SET
    "∅": [],

    //2206          ; INCREMENT
    "∆": [],

    //2207          ; NABLA
    "∇": [],

    //2208          ; ELEMENT OF
    "∈": [],

    //2209          ; NOT AN ELEMENT OF
    "∉": [],

    //220A          ; SMALL ELEMENT OF
    "∊": [],

    //220B          ; CONTAINS AS MEMBER
    "∋": [],

    //220C          ; DOES NOT CONTAIN AS MEMBER
    "∌": [],

    //220D          ; SMALL CONTAINS AS MEMBER
    "∍": [],

    //220E          ; END OF PROOF
    "∎": [],

    //220F          ; N-ARY PRODUCT
    "∏": [],

    //2210          ; N-ARY COPRODUCT
    "∐": [],

    //2211          ; N-ARY SUMMATION
    "∑": [],

    //2212          ; MINUS SIGN
    "−": [.minusSign],

    //2213          ; MINUS-OR-PLUS SIGN
    "∓": [.minusSign, .plusSign],

    //2214          ; DOT PLUS
    "∔": [.plusSign, .dot, .above],

    //2215          ; DIVISION SLASH
    "∕": [.divisionSign, .extra2],

    //2216          ; SET MINUS
    "∖": [],

    //2217          ; ASTERISK OPERATOR
    "∗": [.multiplicationSign, .extra2],

    //2218          ; RING OPERATOR
    "∘": [],

    //2219          ; BULLET OPERATOR
    "∙": [],

    //221A          ; SQUARE ROOT
    "√": [],

    //221B          ; CUBE ROOT
    "∛": [],

    //221C          ; FOURTH ROOT
    "∜": [],

    //221D          ; PROPORTIONAL TO
    "∝": [],

    //221E          ; INFINITY
    "∞": [.zero, .extra1],

    //221F          ; RIGHT ANGLE
    "∟": [],

    //2220          ; ANGLE
    "∠": [],

    //2221          ; MEASURED ANGLE
    "∡": [],

    //2222          ; SPHERICAL ANGLE
    "∢": [],

    //2223          ; DIVIDES
    "∣": [],

    //2224          ; DOES NOT DIVIDE
    "∤": [],

    //2225          ; PARALLEL TO
    "∥": [],

    //2226          ; NOT PARALLEL TO
    "∦": [],

    //2227          ; LOGICAL AND
    "∧": [.ampersand, .extra0],

    //2228          ; LOGICAL OR
    "∨": [.verticalLine, .extra0],

    //2229          ; INTERSECTION
    "∩": [],

    //222A          ; UNION
    "∪": [],

    //222B          ; INTEGRAL
    "∫": [],

    //222C          ; DOUBLE INTEGRAL
    "∬": [],

    //222D          ; TRIPLE INTEGRAL
    "∭": [],

    //222E          ; CONTOUR INTEGRAL
    "∮": [],

    //222F          ; SURFACE INTEGRAL
    "∯": [],

    //2230          ; VOLUME INTEGRAL
    "∰": [],

    //2231          ; CLOCKWISE INTEGRAL
    "∱": [],

    //2232          ; CLOCKWISE CONTOUR INTEGRAL
    "∲": [],

    //2233          ; ANTICLOCKWISE CONTOUR INTEGRAL
    "∳": [],

    //2234          ; THEREFORE
    "∴": [],

    //2235          ; BECAUSE
    "∵": [],

    //2236          ; RATIO
    "∶": [.divisionSign, .extra1],

    //2237          ; PROPORTION
    "∷": [],

    //2238          ; DOT MINUS
    "∸": [.minusSign, .dot, .above],

    //2239          ; EXCESS
    "∹": [.minusSign, .colon],

    //223A          ; GEOMETRIC PROPORTION
    "∺": [.colon, .minusSign, .colon],

    //223B          ; HOMOTHETIC
    "∻": [.tilde, .dot, .below, .dot, .above],

    //223C          ; TILDE OPERATOR
    "∼": [],

    //223D          ; REVERSED TILDE
    "∽": [.tilde, .reversed],

    //223E          ; INVERTED LAZY S
    "∾": [],

    //223F          ; SINE WAVE
    "∿": [],

    //2240          ; WREATH PRODUCT
    "≀": [],

    //2241          ; NOT TILDE
    "≁": [.tilde, .not],

    //2242          ; MINUS TILDE
    "≂": [.minusSign, .tilde],

    //2243          ; ASYMPTOTICALLY EQUAL TO
    "≃": [.tilde, .equalsSign],

    //2244          ; NOT ASYMPTOTICALLY EQUAL TO
    "≄": [.tilde, .not, .equalsSign],

    //2245          ; APPROXIMATELY EQUAL TO
    "≅": [.tilde, .equalsSign, .doubled],

    //2246          ; APPROXIMATELY BUT NOT ACTUALLY EQUAL TO
    "≆": [.tilde, .equalsSign, .doubled, .not],

    //2247          ; NEITHER APPROXIMATELY NOR ACTUALLY EQUAL TO
    "≇": [.tilde, .not, .equalsSign, .doubled],

    //2248          ; ALMOST EQUAL TO
    "≈": [.tilde, .doubled],

    //2249          ; NOT ALMOST EQUAL TO
    "≉": [.tilde, .doubled, .not],

    //224A          ; ALMOST EQUAL OR EQUAL TO
    "≊": [.tilde, .doubled, .equalsSign],

    //224B          ; TRIPLE TILDE
    "≋": [.tilde, .doubled, .tilde],

    //224C          ; ALL EQUAL TO
    "≌": [.tilde, .equalsSign, .doubled, .reversed],

    //224D          ; EQUIVALENT TO
    "≍": [.breve, .invertedBreve],

    //224E          ; GEOMETRICALLY EQUIVALENT TO
    "≎": [],

    //224F          ; DIFFERENCE BETWEEN
    "≏": [],

    //2250          ; APPROACHES THE LIMIT
    "≐": [.equalsSign, .dot, .above],

    //2251          ; GEOMETRICALLY EQUAL TO
    "≑": [.equalsSign, .dot, .below, .dot, .above],

    //2252          ; APPROXIMATELY EQUAL TO OR THE IMAGE OF
    "≒": [.equalsSign, .dot, .belowRight, .dot, .aboveLeft],

    //2253          ; IMAGE OF OR APPROXIMATELY EQUAL TO
    "≓": [.equalsSign, .dot, .belowLeft, .dot, .aboveRight],

    //2254          ; COLON EQUALS
    "≔": [.colon, .equalsSign],

    //2255          ; EQUALS COLON
    "≕": [.equalsSign, .colon],

    //2256          ; RING IN EQUAL TO
    "≖": [.ring, .equalsSign],

    //2257          ; RING EQUAL TO
    "≗": [.equalsSign, .ring, .above],

    //2258          ; CORRESPONDS TO
    "≘": [.equalsSign, .invertedBreve, .above],

    //2259          ; ESTIMATES
    "≙": [.equalsSign, .circumflex, .above],

    //225A          ; EQUIANGULAR TO
    "≚": [.equalsSign, .caron, .above],

    //225B          ; STAR EQUALS
    "≛": [],

    //225C          ; DELTA EQUAL TO
    "≜": [.equalsSign, .d, .capital, .greek, .above],

    //225D          ; EQUAL TO BY DEFINITION
    "≝": [],

    //225E          ; MEASURED BY
    "≞": [.equalsSign, .m, .above],

    //225F          ; QUESTIONED EQUAL TO
    "≟": [.equalsSign, .questionMark, .above],

    //2260          ; NOT EQUAL TO
    "≠": [.equalsSign, .not],

    //2261          ; IDENTICAL TO
    "≡": [.equalsSign, .doubled],

    //2262          ; NOT IDENTICAL TO
    "≢": [.equalsSign, .doubled, .not],

    //2263          ; STRICTLY EQUIVALENT TO
    "≣": [.equalsSign, .equalsSign],

    //2264          ; LESS-THAN OR EQUAL TO
    "≤": [.lessThanSign, .equalsSign],

    //2265          ; GREATER-THAN OR EQUAL TO
    "≥": [.greaterThanSign, .equalsSign],

    //2266          ; LESS-THAN OVER EQUAL TO
    "≦": [.lessThanSign, .equalsSign, .doubled],

    //2267          ; GREATER-THAN OVER EQUAL TO
    "≧": [.greaterThanSign, .equalsSign, .doubled],

    //2268          ; LESS-THAN BUT NOT EQUAL TO
    "≨": [.lessThanSign, .equalsSign, .doubled, .not],

    //2269          ; GREATER-THAN BUT NOT EQUAL TO
    "≩": [.greaterThanSign, .equalsSign, .doubled, .not],

    //226A          ; MUCH LESS-THAN
    "≪": [.lessThanSign, .lessThanSign],

    //226B          ; MUCH GREATER-THAN
    "≫": [.greaterThanSign, .greaterThanSign],

    //226C          ; BETWEEN
    "≬": [.parenthesis, .parenthesis, .turned],

    //226D          ; NOT EQUIVALENT TO
    "≭": [.breve, .invertedBreve, .not],

    //226E          ; NOT LESS-THAN
    "≮": [.lessThanSign, .not],

    //226F          ; NOT GREATER-THAN
    "≯": [.greaterThanSign, .not],

    //2270          ; NEITHER LESS-THAN NOR EQUAL TO
    "≰": [.lessThanSign, .not, .equalsSign],

    //2271          ; NEITHER GREATER-THAN NOR EQUAL TO
    "≱": [.greaterThanSign, .not, .equalsSign],

    //2272          ; LESS-THAN OR EQUIVALENT TO
    "≲": [.lessThanSign, .tilde],

    //2273          ; GREATER-THAN OR EQUIVALENT TO
    "≳": [.greaterThanSign, .tilde],

    //2274          ; NEITHER LESS-THAN NOR EQUIVALENT TO
    "≴": [.lessThanSign, .not, .tilde],

    //2275          ; NEITHER GREATER-THAN NOR EQUIVALENT TO
    "≵": [.greaterThanSign, .not, .tilde],

    //2276          ; LESS-THAN OR GREATER-THAN
    "≶": [.lessThanSign, .greaterThanSign],

    //2277          ; GREATER-THAN OR LESS-THAN
    "≷": [.greaterThanSign, .lessThanSign],

    //2278          ; NEITHER LESS-THAN NOR GREATER-THAN
    "≸": [.lessThanSign, .greaterThanSign, .not],

    //2279          ; NEITHER GREATER-THAN NOR LESS-THAN
    "≹": [.greaterThanSign, .lessThanSign, .not],

    //227A          ; PRECEDES
    "≺": [],

    //227B          ; SUCCEEDS
    "≻": [],

    //227C          ; PRECEDES OR EQUAL TO
    "≼": [],

    //227D          ; SUCCEEDS OR EQUAL TO
    "≽": [],

    //227E          ; PRECEDES OR EQUIVALENT TO
    "≾": [],

    //227F          ; SUCCEEDS OR EQUIVALENT TO
    "≿": [],

    //2280          ; DOES NOT PRECEDE
    "⊀": [],

    //2281          ; DOES NOT SUCCEED
    "⊁": [],

    //2282          ; SUBSET OF
    "⊂": [],

    //2283          ; SUPERSET OF
    "⊃": [],

    //2284          ; NOT A SUBSET OF
    "⊄": [],

    //2285          ; NOT A SUPERSET OF
    "⊅": [],

    //2286          ; SUBSET OF OR EQUAL TO
    "⊆": [],

    //2287          ; SUPERSET OF OR EQUAL TO
    "⊇": [],

    //2288          ; NEITHER A SUBSET OF NOR EQUAL TO
    "⊈": [],

    //2289          ; NEITHER A SUPERSET OF NOR EQUAL TO
    "⊉": [],

    //228A          ; SUBSET OF WITH NOT EQUAL TO
    "⊊": [],

    //228B          ; SUPERSET OF WITH NOT EQUAL TO
    "⊋": [],

    //228C          ; MULTISET
    "⊌": [],

    //228D          ; MULTISET MULTIPLICATION
    "⊍": [],

    //228E          ; MULTISET UNION
    "⊎": [],

    //228F          ; SQUARE IMAGE OF
    "⊏": [],

    //2290          ; SQUARE ORIGINAL OF
    "⊐": [],

    //2291          ; SQUARE IMAGE OF OR EQUAL TO
    "⊑": [],

    //2292          ; SQUARE ORIGINAL OF OR EQUAL TO
    "⊒": [],

    //2293          ; SQUARE CAP
    "⊓": [],

    //2294          ; SQUARE CUP
    "⊔": [],

    //2295          ; CIRCLED PLUS
    "⊕": [.plusSign, .ring],

    //2296          ; CIRCLED MINUS
    "⊖": [.minusSign, .ring],

    //2297          ; CIRCLED TIMES
    "⊗": [.multiplicationSign, .ring],

    //2298          ; CIRCLED DIVISION SLASH
    "⊘": [.divisionSign, .extra2, .ring],

    //2299          ; CIRCLED DOT OPERATOR
    "⊙": [.multiplicationSign, .extra1, .ring],

    //229A          ; CIRCLED RING OPERATOR
    "⊚": [.ring, .ring],

    //229B          ; CIRCLED ASTERISK OPERATOR
    "⊛": [.multiplicationSign, .extra2, .ring],

    //229C          ; CIRCLED EQUALS
    "⊜": [.equalsSign, .ring],

    //229D          ; CIRCLED DASH
    "⊝": [.hyphen, .ring],

    //229E          ; SQUARED PLUS
    "⊞": [],

    //229F          ; SQUARED MINUS
    "⊟": [],

    //22A0          ; SQUARED TIMES
    "⊠": [],

    //22A1          ; SQUARED DOT OPERATOR
    "⊡": [],

    //22A2          ; RIGHT TACK
    "⊢": [.tack, .right],

    //22A3          ; LEFT TACK
    "⊣": [.tack, .left],

    //22A4          ; DOWN TACK
    "⊤": [.tack, .down],

    //22A5          ; UP TACK
    "⊥": [.tack, .up],

    //22A6          ; ASSERTION
    "⊦": [],

    //22A7          ; MODELS
    "⊧": [],

    //22A8          ; TRUE
    "⊨": [],

    //22A9          ; FORCES
    "⊩": [],

    //22AA          ; TRIPLE VERTICAL BAR RIGHT TURNSTILE
    "⊪": [],

    //22AB          ; DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
    "⊫": [],

    //22AC          ; DOES NOT PROVE
    "⊬": [],

    //22AD          ; NOT TRUE
    "⊭": [],

    //22AE          ; DOES NOT FORCE
    "⊮": [],

    //22AF          ; NEGATED DOUBLE VERTICAL BAR DOUBLE RIGHT TURNSTILE
    "⊯": [],

    //22B0          ; PRECEDES UNDER RELATION
    "⊰": [],

    //22B1          ; SUCCEEDS UNDER RELATION
    "⊱": [],

    //22B2          ; NORMAL SUBGROUP OF
    "⊲": [],

    //22B3          ; CONTAINS AS NORMAL SUBGROUP
    "⊳": [],

    //22B4          ; NORMAL SUBGROUP OF OR EQUAL TO
    "⊴": [],

    //22B5          ; CONTAINS AS NORMAL SUBGROUP OR EQUAL TO
    "⊵": [],

    //22B6          ; ORIGINAL OF
    "⊶": [],

    //22B7          ; IMAGE OF
    "⊷": [],

    //22B8          ; MULTIMAP
    "⊸": [],

    //22B9          ; HERMITIAN CONJUGATE MATRIX
    "⊹": [],

    //22BA          ; INTERCALATE
    "⊺": [],

    //22BB          ; XOR
    "⊻": [.verticalLine, .extra0, .minusSign],

    //22BC          ; NAND
    "⊼": [.minusSign, .ampersand, .extra0],

    //22BD          ; NOR
    "⊽": [.minusSign, .verticalLine, .extra0],

    //22BE          ; RIGHT ANGLE WITH ARC
    "⊾": [],

    //22BF          ; RIGHT TRIANGLE
    "⊿": [],

    //22C0          ; N-ARY LOGICAL AND
    "⋀": [],

    //22C1          ; N-ARY LOGICAL OR
    "⋁": [],

    //22C2          ; N-ARY INTERSECTION
    "⋂": [],

    //22C3          ; N-ARY UNION
    "⋃": [],

    //22C4          ; DIAMOND OPERATOR
    "⋄": [],

    //22C5          ; DOT OPERATOR
    "⋅": [.multiplicationSign, .extra1],

    //22C6          ; STAR OPERATOR
    "⋆": [],

    //22C7          ; DIVISION TIMES
    "⋇": [.divisionSign, .multiplicationSign],

    //22C8          ; BOWTIE
    "⋈": [],

    //22C9          ; LEFT NORMAL FACTOR SEMIDIRECT PRODUCT
    "⋉": [],

    //22CA          ; RIGHT NORMAL FACTOR SEMIDIRECT PRODUCT
    "⋊": [],

    //22CB          ; LEFT SEMIDIRECT PRODUCT
    "⋋": [],

    //22CC          ; RIGHT SEMIDIRECT PRODUCT
    "⋌": [],

    //22CD          ; REVERSED TILDE EQUALS
    "⋍": [.tilde, .equalsSign, .reversed],

    //22CE          ; CURLY LOGICAL OR
    "⋎": [],

    //22CF          ; CURLY LOGICAL AND
    "⋏": [],

    //22D0          ; DOUBLE SUBSET
    "⋐": [],

    //22D1          ; DOUBLE SUPERSET
    "⋑": [],

    //22D2          ; DOUBLE INTERSECTION
    "⋒": [],

    //22D3          ; DOUBLE UNION
    "⋓": [],

    //22D4          ; PITCHFORK
    "⋔": [],

    //22D5          ; EQUAL AND PARALLEL TO
    "⋕": [],

    //22D6          ; LESS-THAN WITH DOT
    "⋖": [.lessThanSign, .dot],

    //22D7          ; GREATER-THAN WITH DOT
    "⋗": [.greaterThanSign, .dot],

    //22D8          ; VERY MUCH LESS-THAN
    "⋘": [.lessThanSign, .lessThanSign, .lessThanSign],

    //22D9          ; VERY MUCH GREATER-THAN
    "⋙": [.greaterThanSign, .greaterThanSign, .greaterThanSign],

    //22DA          ; LESS-THAN EQUAL TO OR GREATER-THAN
    "⋚": [.lessThanSign, .equalsSign, .greaterThanSign],

    //22DB          ; GREATER-THAN EQUAL TO OR LESS-THAN
    "⋛": [.greaterThanSign, .equalsSign, .lessThanSign],

    //22DC          ; EQUAL TO OR LESS-THAN
    "⋜": [.equalsSign, .lessThanSign],

    //22DD          ; EQUAL TO OR GREATER-THAN
    "⋝": [.equalsSign, .greaterThanSign],

    //22DE          ; EQUAL TO OR PRECEDES
    "⋞": [],

    //22DF          ; EQUAL TO OR SUCCEEDS
    "⋟": [],

    //22E0          ; DOES NOT PRECEDE OR EQUAL
    "⋠": [],

    //22E1          ; DOES NOT SUCCEED OR EQUAL
    "⋡": [],

    //22E2          ; NOT SQUARE IMAGE OF OR EQUAL TO
    "⋢": [],

    //22E3          ; NOT SQUARE ORIGINAL OF OR EQUAL TO
    "⋣": [],

    //22E4          ; SQUARE IMAGE OF OR NOT EQUAL TO
    "⋤": [],

    //22E5          ; SQUARE ORIGINAL OF OR NOT EQUAL TO
    "⋥": [],

    //22E6          ; LESS-THAN BUT NOT EQUIVALENT TO
    "⋦": [.lessThanSign, .tilde, .not],

    //22E7          ; GREATER-THAN BUT NOT EQUIVALENT TO
    "⋧": [.greaterThanSign, .tilde, .not],

    //22E8          ; PRECEDES BUT NOT EQUIVALENT TO
    "⋨": [],

    //22E9          ; SUCCEEDS BUT NOT EQUIVALENT TO
    "⋩": [],

    //22EA          ; NOT NORMAL SUBGROUP OF
    "⋪": [],

    //22EB          ; DOES NOT CONTAIN AS NORMAL SUBGROUP
    "⋫": [],

    //22EC          ; NOT NORMAL SUBGROUP OF OR EQUAL TO
    "⋬": [],

    //22ED          ; DOES NOT CONTAIN AS NORMAL SUBGROUP OR EQUAL
    "⋭": [],

    //22EE          ; VERTICAL ELLIPSIS
    "⋮": [],

    //22EF          ; MIDLINE HORIZONTAL ELLIPSIS
    "⋯": [],

    //22F0          ; UP RIGHT DIAGONAL ELLIPSIS
    "⋰": [],

    //22F1          ; DOWN RIGHT DIAGONAL ELLIPSIS
    "⋱": [],

    //22F2          ; ELEMENT OF WITH LONG HORIZONTAL STROKE
    "⋲": [],

    //22F3          ; ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    "⋳": [],

    //22F4          ; SMALL ELEMENT OF WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    "⋴": [],

    //22F5          ; ELEMENT OF WITH DOT ABOVE
    "⋵": [],

    //22F6          ; ELEMENT OF WITH OVERBAR
    "⋶": [],

    //22F7          ; SMALL ELEMENT OF WITH OVERBAR
    "⋷": [],

    //22F8          ; ELEMENT OF WITH UNDERBAR
    "⋸": [],

    //22F9          ; ELEMENT OF WITH TWO HORIZONTAL STROKES
    "⋹": [],

    //22FA          ; CONTAINS WITH LONG HORIZONTAL STROKE
    "⋺": [],

    //22FB          ; CONTAINS WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    "⋻": [],

    //22FC          ; SMALL CONTAINS WITH VERTICAL BAR AT END OF HORIZONTAL STROKE
    "⋼": [],

    //22FD          ; CONTAINS WITH OVERBAR
    "⋽": [],

    //22FE          ; SMALL CONTAINS WITH OVERBAR
    "⋾": [],

    //22FF          ; Z NOTATION BAG MEMBERSHIP
    "⋿": [],

    
    // MARK: - 2A00..2AFF; Supplemental Mathematical Operators
    
    //2A00          ; N-ARY CIRCLED DOT OPERATOR
    "⨀": [],

    //2A01          ; N-ARY CIRCLED PLUS OPERATOR
    "⨁": [],

    //2A02          ; N-ARY CIRCLED TIMES OPERATOR
    "⨂": [],

    //2A03          ; N-ARY UNION OPERATOR WITH DOT
    "⨃": [],

    //2A04          ; N-ARY UNION OPERATOR WITH PLUS
    "⨄": [],

    //2A05          ; N-ARY SQUARE INTERSECTION OPERATOR
    "⨅": [],

    //2A06          ; N-ARY SQUARE UNION OPERATOR
    "⨆": [],

    //2A07          ; TWO LOGICAL AND OPERATOR
    "⨇": [.ampersand, .extra0, .ampersand, .extra0],

    //2A08          ; TWO LOGICAL OR OPERATOR
    "⨈": [.verticalLine, .extra0, .verticalLine, .extra0],

    //2A09          ; N-ARY TIMES OPERATOR
    "⨉": [],

    //2A0A          ; MODULO TWO SUM
    "⨊": [],

    //2A0B          ; SUMMATION WITH INTEGRAL
    "⨋": [],

    //2A0C          ; QUADRUPLE INTEGRAL OPERATOR
    "⨌": [],

    //2A0D          ; FINITE PART INTEGRAL
    "⨍": [],

    //2A0E          ; INTEGRAL WITH DOUBLE STROKE
    "⨎": [],

    //2A0F          ; INTEGRAL AVERAGE WITH SLASH
    "⨏": [],

    //2A10          ; CIRCULATION FUNCTION
    "⨐": [],

    //2A11          ; ANTICLOCKWISE INTEGRATION
    "⨑": [],

    //2A12          ; LINE INTEGRATION WITH RECTANGULAR PATH AROUND POLE
    "⨒": [],

    //2A13          ; LINE INTEGRATION WITH SEMICIRCULAR PATH AROUND POLE
    "⨓": [],

    //2A14          ; LINE INTEGRATION NOT INCLUDING THE POLE
    "⨔": [],

    //2A15          ; INTEGRAL AROUND A POINT OPERATOR
    "⨕": [],

    //2A16          ; QUATERNION INTEGRAL OPERATOR
    "⨖": [],

    //2A17          ; INTEGRAL WITH LEFTWARDS ARROW WITH HOOK
    "⨗": [],

    //2A18          ; INTEGRAL WITH TIMES SIGN
    "⨘": [],

    //2A19          ; INTEGRAL WITH INTERSECTION
    "⨙": [],

    //2A1A          ; INTEGRAL WITH UNION
    "⨚": [],

    //2A1B          ; INTEGRAL WITH OVERBAR
    "⨛": [],

    //2A1C          ; INTEGRAL WITH UNDERBAR
    "⨜": [],

    //2A1D          ; JOIN
    "⨝": [],

    //2A1E          ; LARGE LEFT TRIANGLE OPERATOR
    "⨞": [],

    //2A1F          ; Z NOTATION SCHEMA COMPOSITION
    "⨟": [],

    //2A20          ; Z NOTATION SCHEMA PIPING
    "⨠": [],

    //2A21          ; Z NOTATION SCHEMA PROJECTION
    "⨡": [],

    //2A22          ; PLUS SIGN WITH SMALL CIRCLE ABOVE
    "⨢": [.plusSign, .ring, .above],

    //2A23          ; PLUS SIGN WITH CIRCUMFLEX ACCENT ABOVE
    "⨣": [.plusSign, .circumflex, .above],

    //2A24          ; PLUS SIGN WITH TILDE ABOVE
    "⨤": [.plusSign, .tilde, .above],

    //2A25          ; PLUS SIGN WITH DOT BELOW
    "⨥": [.plusSign, .dot, .below],

    //2A26          ; PLUS SIGN WITH TILDE BELOW
    "⨦": [.plusSign, .tilde, .below],

    //2A27          ; PLUS SIGN WITH SUBSCRIPT TWO
    "⨧": [.plusSign, .two],

    //2A28          ; PLUS SIGN WITH BLACK TRIANGLE
    "⨨": [],

    //2A29          ; MINUS SIGN WITH COMMA ABOVE
    "⨩": [.minusSign, .comma, .above],

    //2A2A          ; MINUS SIGN WITH DOT BELOW
    "⨪": [.minusSign, .dot, .below],

    //2A2B          ; MINUS SIGN WITH FALLING DOTS
    "⨫": [.minusSign, .dot, .belowRight, .dot, .aboveLeft],

    //2A2C          ; MINUS SIGN WITH RISING DOTS
    "⨬": [.minusSign, .dot, .belowLeft, .dot, .aboveRight],

    //2A2D          ; PLUS SIGN IN LEFT HALF CIRCLE
    "⨭": [.plusSign, .ring, .leftHalf],

    //2A2E          ; PLUS SIGN IN RIGHT HALF CIRCLE
    "⨮": [.plusSign, .ring, .rightHalf],

    //2A2F          ; VECTOR OR CROSS PRODUCT
    "⨯": [],

    //2A30          ; MULTIPLICATION SIGN WITH DOT ABOVE
    "⨰": [.multiplicationSign, .dot, .above],

    //2A31          ; MULTIPLICATION SIGN WITH UNDERBAR
    "⨱": [.multiplicationSign, .macron, .below],

    //2A32          ; SEMIDIRECT PRODUCT WITH BOTTOM CLOSED
    "⨲": [],

    //2A33          ; SMASH PRODUCT
    "⨳": [],

    //2A34          ; MULTIPLICATION SIGN IN LEFT HALF CIRCLE
    "⨴": [.multiplicationSign, .ring, .leftHalf],

    //2A35          ; MULTIPLICATION SIGN IN RIGHT HALF CIRCLE
    "⨵": [.multiplicationSign, .ring, .rightHalf],

    //2A36          ; CIRCLED MULTIPLICATION SIGN WITH CIRCUMFLEX ACCENT
    "⨶": [.multiplicationSign, .ring, .circumflex, .above],

    //2A37          ; MULTIPLICATION SIGN IN DOUBLE CIRCLE
    "⨷": [.multiplicationSign, .ring, .doubled],

    //2A38          ; CIRCLED DIVISION SIGN
    "⨸": [.divisionSign, .ring],

    //2A39          ; PLUS SIGN IN TRIANGLE
    "⨹": [],

    //2A3A          ; MINUS SIGN IN TRIANGLE
    "⨺": [],

    //2A3B          ; MULTIPLICATION SIGN IN TRIANGLE
    "⨻": [],

    //2A3C          ; INTERIOR PRODUCT
    "⨼": [],

    //2A3D          ; RIGHTHAND INTERIOR PRODUCT
    "⨽": [],

    //2A3E          ; Z NOTATION RELATIONAL COMPOSITION
    "⨾": [],

    //2A3F          ; AMALGAMATION OR COPRODUCT
    "⨿": [],

    //2A40          ; INTERSECTION WITH DOT
    "⩀": [],

    //2A41          ; UNION WITH MINUS SIGN
    "⩁": [],

    //2A42          ; UNION WITH OVERBAR
    "⩂": [],

    //2A43          ; INTERSECTION WITH OVERBAR
    "⩃": [],

    //2A44          ; INTERSECTION WITH LOGICAL AND
    "⩄": [],

    //2A45          ; UNION WITH LOGICAL OR
    "⩅": [],

    //2A46          ; UNION ABOVE INTERSECTION
    "⩆": [],

    //2A47          ; INTERSECTION ABOVE UNION
    "⩇": [],

    //2A48          ; UNION ABOVE BAR ABOVE INTERSECTION
    "⩈": [],

    //2A49          ; INTERSECTION ABOVE BAR ABOVE UNION
    "⩉": [],

    //2A4A          ; UNION BESIDE AND JOINED WITH UNION
    "⩊": [],

    //2A4B          ; INTERSECTION BESIDE AND JOINED WITH INTERSECTION
    "⩋": [],

    //2A4C          ; CLOSED UNION WITH SERIFS
    "⩌": [],

    //2A4D          ; CLOSED INTERSECTION WITH SERIFS
    "⩍": [],

    //2A4E          ; DOUBLE SQUARE INTERSECTION
    "⩎": [],

    //2A4F          ; DOUBLE SQUARE UNION
    "⩏": [],

    //2A50          ; CLOSED UNION WITH SERIFS AND SMASH PRODUCT
    "⩐": [],

    //2A51          ; LOGICAL AND WITH DOT ABOVE
    "⩑": [.ampersand, .extra0, .dot, .above],

    //2A52          ; LOGICAL OR WITH DOT ABOVE
    "⩒": [.verticalLine, .extra0, .dot, .above],

    //2A53          ; DOUBLE LOGICAL AND
    "⩓": [.ampersand, .extra0, .doubled],

    //2A54          ; DOUBLE LOGICAL OR
    "⩔": [.verticalLine, .extra0, .doubled],

    //2A55          ; TWO INTERSECTING LOGICAL AND
    "⩕": [],

    //2A56          ; TWO INTERSECTING LOGICAL OR
    "⩖": [],

    //2A57          ; SLOPING LARGE OR
    "⩗": [],

    //2A58          ; SLOPING LARGE AND
    "⩘": [],

    //2A59          ; LOGICAL OR OVERLAPPING LOGICAL AND
    "⩙": [.verticalLine, .extra0, .ampersand, .extra0],

    //2A5A          ; LOGICAL AND WITH MIDDLE STEM
    "⩚": [.ampersand, .extra0, .verticalLine],

    //2A5B          ; LOGICAL OR WITH MIDDLE STEM
    "⩛": [.verticalLine, .extra0, .verticalLine],

    //2A5C          ; LOGICAL AND WITH HORIZONTAL DASH
    "⩜": [.ampersand, .extra0, .stroke],

    //2A5D          ; LOGICAL OR WITH HORIZONTAL DASH
    "⩝": [.verticalLine, .extra0, .stroke],

    //2A5E          ; LOGICAL AND WITH DOUBLE OVERBAR
    "⩞": [.ampersand, .extra0, .line, .doubled, .above],

    //2A5F          ; LOGICAL AND WITH UNDERBAR
    "⩟": [.ampersand, .extra0, .line, .below],

    //2A60          ; LOGICAL AND WITH DOUBLE UNDERBAR
    "⩠": [.ampersand, .extra0, .line, .doubled, .below],

    //2A61          ; SMALL VEE WITH UNDERBAR
    "⩡": [],

    //2A62          ; LOGICAL OR WITH DOUBLE OVERBAR
    "⩢": [.verticalLine, .extra0, .line, .doubled, .above],

    //2A63          ; LOGICAL OR WITH DOUBLE UNDERBAR
    "⩣": [.verticalLine, .extra0, .line, .doubled, .below],

    //2A64          ; Z NOTATION DOMAIN ANTIRESTRICTION
    "⩤": [],

    //2A65          ; Z NOTATION RANGE ANTIRESTRICTION
    "⩥": [],

    //2A66          ; EQUALS SIGN WITH DOT BELOW
    "⩦": [.equalsSign, .dot, .below],

    //2A67          ; IDENTICAL WITH DOT ABOVE
    "⩧": [.equalsSign, .doubled, .dot, .above],

    //2A68          ; TRIPLE HORIZONTAL BAR WITH DOUBLE VERTICAL STROKE
    "⩨": [],

    //2A69          ; TRIPLE HORIZONTAL BAR WITH TRIPLE VERTICAL STROKE
    "⩩": [],

    //2A6A          ; TILDE OPERATOR WITH DOT ABOVE
    "⩪": [.tilde, .dot, .above],

    //2A6B          ; TILDE OPERATOR WITH RISING DOTS
    "⩫": [.tilde, .dot, .belowLeft, .dot, .aboveRight],

    //2A6C          ; SIMILAR MINUS SIMILAR
    "⩬": [.tilde, .minusSign, .tilde],

    //2A6D          ; CONGRUENT WITH DOT ABOVE
    "⩭": [.tilde, .equalsSign, .doubled, .dot, .above],

    //2A6E          ; EQUALS WITH ASTERISK
    "⩮": [.equalsSign, .asterisk, .above],

    //2A6F          ; ALMOST EQUAL TO WITH CIRCUMFLEX ACCENT
    "⩯": [.tilde, .doubled, .circumflex, .above],

    //2A70          ; APPROXIMATELY EQUAL OR EQUAL TO
    "⩰": [.tilde, .doubled, .equalsSign],

    //2A71          ; EQUALS SIGN ABOVE PLUS SIGN
    "⩱": [.equalsSign, .plusSign],

    //2A72          ; PLUS SIGN ABOVE EQUALS SIGN
    "⩲": [.plusSign, .equalsSign],

    //2A73          ; EQUALS SIGN ABOVE TILDE OPERATOR
    "⩳": [.equalsSign, .tilde],

    //2A74          ; DOUBLE COLON EQUAL
    "⩴": [.colon, .colon, .equalsSign],

    //2A75          ; TWO CONSECUTIVE EQUALS SIGNS
    "⩵": [.equalsSign, .joiner, .equalsSign],

    //2A76          ; THREE CONSECUTIVE EQUALS SIGNS
    "⩶": [.equalsSign, .joiner, .equalsSign, .joiner, .equalsSign],

    //2A77          ; EQUALS SIGN WITH TWO DOTS ABOVE AND TWO DOTS BELOW
    "⩷": [.equalsSign, .diaeresis, .below, .diaeresis, .above],

    //2A78          ; EQUIVALENT WITH FOUR DOTS ABOVE
    "⩸": [.equalsSign, .doubled, .diaeresis, .doubled, .above],

    //2A79          ; LESS-THAN WITH CIRCLE INSIDE
    "⩹": [.ring, .lessThanSign],

    //2A7A          ; GREATER-THAN WITH CIRCLE INSIDE
    "⩺": [.ring, .greaterThanSign],

    //2A7B          ; LESS-THAN WITH QUESTION MARK ABOVE
    "⩻": [.lessThanSign, .questionMark, .above],

    //2A7C          ; GREATER-THAN WITH QUESTION MARK ABOVE
    "⩼": [.greaterThanSign, .questionMark, .above],

    //2A7D          ; LESS-THAN OR SLANTED EQUAL TO
    "⩽": [.lessThanSign, .equalsSign, .extra1],

    //2A7E          ; GREATER-THAN OR SLANTED EQUAL TO
    "⩾": [.greaterThanSign, .equalsSign, .extra1],

    //2A7F          ; LESS-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
    "⩿": [.lessThanSign, .equalsSign, .dot],

    //2A80          ; GREATER-THAN OR SLANTED EQUAL TO WITH DOT INSIDE
    "⪀": [.greaterThanSign, .equalsSign, .dot],

    //2A81          ; LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
    "⪁": [.lessThanSign, .equalsSign, .dot, .above],

    //2A82          ; GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE
    "⪂": [.greaterThanSign, .equalsSign, .dot, .above],

    //2A83          ; LESS-THAN OR SLANTED EQUAL TO WITH DOT ABOVE RIGHT
    "⪃": [.lessThanSign, .equalsSign, .dot, .aboveRight],

    //2A84          ; GREATER-THAN OR SLANTED EQUAL TO WITH DOT ABOVE LEFT
    "⪄": [.greaterThanSign, .equalsSign, .dot, .aboveLeft],

    //2A85          ; LESS-THAN OR APPROXIMATE
    "⪅": [.lessThanSign, .tilde, .doubled],

    //2A86          ; GREATER-THAN OR APPROXIMATE
    "⪆": [.greaterThanSign, .tilde, .doubled],

    //2A87          ; LESS-THAN AND SINGLE-LINE NOT EQUAL TO
    "⪇": [.lessThanSign, .equalsSign, .not],

    //2A88          ; GREATER-THAN AND SINGLE-LINE NOT EQUAL TO
    "⪈": [.greaterThanSign, .equalsSign, .not],

    //2A89          ; LESS-THAN AND NOT APPROXIMATE
    "⪉": [.lessThanSign, .tilde, .doubled, .not],

    //2A8A          ; GREATER-THAN AND NOT APPROXIMATE
    "⪊": [.greaterThanSign, .tilde, .doubled, .not],

    //2A8B          ; LESS-THAN ABOVE DOUBLE-LINE EQUAL ABOVE GREATER-THAN
    "⪋": [.lessThanSign, .equalsSign, .doubled, .greaterThanSign],

    //2A8C          ; GREATER-THAN ABOVE DOUBLE-LINE EQUAL ABOVE LESS-THAN
    "⪌": [.greaterThanSign, .equalsSign, .doubled, .lessThanSign],

    //2A8D          ; LESS-THAN ABOVE SIMILAR OR EQUAL
    "⪍": [.lessThanSign, .tilde, .equalsSign],

    //2A8E          ; GREATER-THAN ABOVE SIMILAR OR EQUAL
    "⪎": [.greaterThanSign, .tilde, .equalsSign],

    //2A8F          ; LESS-THAN ABOVE SIMILAR ABOVE GREATER-THAN
    "⪏": [.lessThanSign, .tilde, .greaterThanSign],

    //2A90          ; GREATER-THAN ABOVE SIMILAR ABOVE LESS-THAN
    "⪐": [.greaterThanSign, .tilde, .lessThanSign],

    //2A91          ; LESS-THAN ABOVE GREATER-THAN ABOVE DOUBLE-LINE EQUAL
    "⪑": [.lessThanSign, .greaterThanSign, .equalsSign, .doubled],

    //2A92          ; GREATER-THAN ABOVE LESS-THAN ABOVE DOUBLE-LINE EQUAL
    "⪒": [.greaterThanSign, .lessThanSign, .equalsSign, .doubled],

    //2A93          ; LESS-THAN ABOVE SLANTED EQUAL ABOVE GREATER-THAN ABOVE SLANTED EQUAL
    "⪓": [.lessThanSign, .equalsSign, .extra1, .greaterThanSign, .equalsSign, .extra1],

    //2A94          ; GREATER-THAN ABOVE SLANTED EQUAL ABOVE LESS-THAN ABOVE SLANTED EQUAL
    "⪔": [.greaterThanSign, .equalsSign, .extra1, .lessThanSign, .equalsSign, .extra1],

    //2A95          ; SLANTED EQUAL TO OR LESS-THAN
    "⪕": [.equalsSign, .lessThanSign, .extra1],

    //2A96          ; SLANTED EQUAL TO OR GREATER-THAN
    "⪖": [.equalsSign, .greaterThanSign, .extra1],

    //2A97          ; SLANTED EQUAL TO OR LESS-THAN WITH DOT INSIDE
    "⪗": [.equalsSign, .lessThanSign, .extra1, .dot],

    //2A98          ; SLANTED EQUAL TO OR GREATER-THAN WITH DOT INSIDE
    "⪘": [.equalsSign, .greaterThanSign, .extra1, .dot],

    //2A99          ; DOUBLE-LINE EQUAL TO OR LESS-THAN
    "⪙": [.equalsSign, .doubled, .lessThanSign],

    //2A9A          ; DOUBLE-LINE EQUAL TO OR GREATER-THAN
    "⪚": [.equalsSign, .doubled, .greaterThanSign],

    //2A9B          ; DOUBLE-LINE SLANTED EQUAL TO OR LESS-THAN
    "⪛": [.equalsSign, .doubled, .lessThanSign, .extra1],

    //2A9C          ; DOUBLE-LINE SLANTED EQUAL TO OR GREATER-THAN
    "⪜": [.equalsSign, .doubled, .greaterThanSign, .extra1],

    //2A9D          ; SIMILAR OR LESS-THAN
    "⪝": [.tilde, .lessThanSign],

    //2A9E          ; SIMILAR OR GREATER-THAN
    "⪞": [.tilde, .greaterThanSign],

    //2A9F          ; SIMILAR ABOVE LESS-THAN ABOVE EQUALS SIGN
    "⪟": [.tilde, .lessThanSign, .equalsSign, .doubled],

    //2AA0          ; SIMILAR ABOVE GREATER-THAN ABOVE EQUALS SIGN
    "⪠": [.tilde, .greaterThanSign, .equalsSign, .doubled],

    //2AA1          ; DOUBLE NESTED LESS-THAN
    "⪡": [.lessThanSign, .doubled],

    //2AA2          ; DOUBLE NESTED GREATER-THAN
    "⪢": [.greaterThanSign, .doubled],

    //2AA3          ; DOUBLE NESTED LESS-THAN WITH UNDERBAR
    "⪣": [.lessThanSign, .lessThanSign, .line, .below],

    //2AA4          ; GREATER-THAN OVERLAPPING LESS-THAN
    "⪤": [.greaterThanSign, .lessThanSign],

    //2AA5          ; GREATER-THAN BESIDE LESS-THAN
    "⪥": [.greaterThanSign, .joiner, .lessThanSign],

    //2AA6          ; LESS-THAN CLOSED BY CURVE
    "⪦": [.lessThanSign, .closed],

    //2AA7          ; GREATER-THAN CLOSED BY CURVE
    "⪧": [.greaterThanSign, .closed],

    //2AA8          ; LESS-THAN CLOSED BY CURVE ABOVE SLANTED EQUAL
    "⪨": [.lessThanSign, .closed, .equalsSign, .extra1],

    //2AA9          ; GREATER-THAN CLOSED BY CURVE ABOVE SLANTED EQUAL
    "⪩": [.greaterThanSign, .closed, .equalsSign, .extra1],

    //2AAA          ; SMALLER THAN
    "⪪": [.lessThanSign, .stroke],

    //2AAB          ; LARGER THAN
    "⪫": [.greaterThanSign, .stroke],

    //2AAC          ; SMALLER THAN OR EQUAL TO
    "⪬": [.lessThanSign, .stroke, .equalsSign],

    //2AAD          ; LARGER THAN OR EQUAL TO
    "⪭": [.greaterThanSign, .stroke, .equalsSign],

    //2AAE          ; EQUALS SIGN WITH BUMPY ABOVE
    "⪮": [],

    //2AAF          ; PRECEDES ABOVE SINGLE-LINE EQUALS SIGN
    "⪯": [],

    //2AB0          ; SUCCEEDS ABOVE SINGLE-LINE EQUALS SIGN
    "⪰": [],

    //2AB1          ; PRECEDES ABOVE SINGLE-LINE NOT EQUAL TO
    "⪱": [],

    //2AB2          ; SUCCEEDS ABOVE SINGLE-LINE NOT EQUAL TO
    "⪲": [],

    //2AB3          ; PRECEDES ABOVE EQUALS SIGN
    "⪳": [],

    //2AB4          ; SUCCEEDS ABOVE EQUALS SIGN
    "⪴": [],

    //2AB5          ; PRECEDES ABOVE NOT EQUAL TO
    "⪵": [],

    //2AB6          ; SUCCEEDS ABOVE NOT EQUAL TO
    "⪶": [],

    //2AB7          ; PRECEDES ABOVE ALMOST EQUAL TO
    "⪷": [],

    //2AB8          ; SUCCEEDS ABOVE ALMOST EQUAL TO
    "⪸": [],

    //2AB9          ; PRECEDES ABOVE NOT ALMOST EQUAL TO
    "⪹": [],

    //2ABA          ; SUCCEEDS ABOVE NOT ALMOST EQUAL TO
    "⪺": [],

    //2ABB          ; DOUBLE PRECEDES
    "⪻": [],

    //2ABC          ; DOUBLE SUCCEEDS
    "⪼": [],

    //2ABD          ; SUBSET WITH DOT
    "⪽": [],

    //2ABE          ; SUPERSET WITH DOT
    "⪾": [],

    //2ABF          ; SUBSET WITH PLUS SIGN BELOW
    "⪿": [],

    //2AC0          ; SUPERSET WITH PLUS SIGN BELOW
    "⫀": [],

    //2AC1          ; SUBSET WITH MULTIPLICATION SIGN BELOW
    "⫁": [],

    //2AC2          ; SUPERSET WITH MULTIPLICATION SIGN BELOW
    "⫂": [],

    //2AC3          ; SUBSET OF OR EQUAL TO WITH DOT ABOVE
    "⫃": [],

    //2AC4          ; SUPERSET OF OR EQUAL TO WITH DOT ABOVE
    "⫄": [],

    //2AC5          ; SUBSET OF ABOVE EQUALS SIGN
    "⫅": [],

    //2AC6          ; SUPERSET OF ABOVE EQUALS SIGN
    "⫆": [],

    //2AC7          ; SUBSET OF ABOVE TILDE OPERATOR
    "⫇": [],

    //2AC8          ; SUPERSET OF ABOVE TILDE OPERATOR
    "⫈": [],

    //2AC9          ; SUBSET OF ABOVE ALMOST EQUAL TO
    "⫉": [],

    //2ACA          ; SUPERSET OF ABOVE ALMOST EQUAL TO
    "⫊": [],

    //2ACB          ; SUBSET OF ABOVE NOT EQUAL TO
    "⫋": [],

    //2ACC          ; SUPERSET OF ABOVE NOT EQUAL TO
    "⫌": [],

    //2ACD          ; SQUARE LEFT OPEN BOX OPERATOR
    "⫍": [],

    //2ACE          ; SQUARE RIGHT OPEN BOX OPERATOR
    "⫎": [],

    //2ACF          ; CLOSED SUBSET
    "⫏": [],

    //2AD0          ; CLOSED SUPERSET
    "⫐": [],

    //2AD1          ; CLOSED SUBSET OR EQUAL TO
    "⫑": [],

    //2AD2          ; CLOSED SUPERSET OR EQUAL TO
    "⫒": [],

    //2AD3          ; SUBSET ABOVE SUPERSET
    "⫓": [],

    //2AD4          ; SUPERSET ABOVE SUBSET
    "⫔": [],

    //2AD5          ; SUBSET ABOVE SUBSET
    "⫕": [],

    //2AD6          ; SUPERSET ABOVE SUPERSET
    "⫖": [],

    //2AD7          ; SUPERSET BESIDE SUBSET
    "⫗": [],

    //2AD8          ; SUPERSET BESIDE AND JOINED BY DASH WITH SUBSET
    "⫘": [],

    //2AD9          ; ELEMENT OF OPENING DOWNWARDS
    "⫙": [],

    //2ADA          ; PITCHFORK WITH TEE TOP
    "⫚": [],

    //2ADB          ; TRANSVERSAL INTERSECTION
    "⫛": [],

    //2ADC          ; FORKING
    "⫝̸": [],

    //2ADD          ; NONFORKING
    "⫝": [],

    //2ADE          ; SHORT LEFT TACK
    "⫞": [],

    //2ADF          ; SHORT DOWN TACK
    "⫟": [],

    //2AE0          ; SHORT UP TACK
    "⫠": [],

    //2AE1          ; PERPENDICULAR WITH S
    "⫡": [],

    //2AE2          ; VERTICAL BAR TRIPLE RIGHT TURNSTILE
    "⫢": [],

    //2AE3          ; DOUBLE VERTICAL BAR LEFT TURNSTILE
    "⫣": [],

    //2AE4          ; VERTICAL BAR DOUBLE LEFT TURNSTILE
    "⫤": [],

    //2AE5          ; DOUBLE VERTICAL BAR DOUBLE LEFT TURNSTILE
    "⫥": [],

    //2AE6          ; LONG DASH FROM LEFT MEMBER OF DOUBLE VERTICAL
    "⫦": [],

    //2AE7          ; SHORT DOWN TACK WITH OVERBAR
    "⫧": [],

    //2AE8          ; SHORT UP TACK WITH UNDERBAR
    "⫨": [],

    //2AE9          ; SHORT UP TACK ABOVE SHORT DOWN TACK
    "⫩": [],

    //2AEA          ; DOUBLE DOWN TACK
    "⫪": [],

    //2AEB          ; DOUBLE UP TACK
    "⫫": [],

    //2AEC          ; DOUBLE STROKE NOT SIGN
    "⫬": [.notSign, .doubled],

    //2AED          ; REVERSED DOUBLE STROKE NOT SIGN
    "⫭": [.notSign, .doubled, .reversed],

    //2AEE          ; DOES NOT DIVIDE WITH REVERSED NEGATION SLASH
    "⫮": [],

    //2AEF          ; VERTICAL LINE WITH CIRCLE ABOVE
    "⫯": [.verticalLine, .ring, .above],

    //2AF0          ; VERTICAL LINE WITH CIRCLE BELOW
    "⫰": [.verticalLine, .ring, .above],

    //2AF1          ; DOWN TACK WITH CIRCLE BELOW
    "⫱": [.tack, .down, .ring, .below],

    //2AF2          ; PARALLEL WITH HORIZONTAL STROKE
    "⫲": [],

    //2AF3          ; PARALLEL WITH TILDE OPERATOR
    "⫳": [],

    //2AF4          ; TRIPLE VERTICAL BAR BINARY RELATION
    "⫴": [],

    //2AF5          ; TRIPLE VERTICAL BAR WITH HORIZONTAL STROKE
    "⫵": [],

    //2AF6          ; TRIPLE COLON OPERATOR
    "⫶": [],

    //2AF7          ; TRIPLE NESTED LESS-THAN
    "⫷": [.lessThanSign, .doubled, .lessThanSign],

    //2AF8          ; TRIPLE NESTED GREATER-THAN
    "⫸": [.greaterThanSign, .doubled, .greaterThanSign],

    //2AF9          ; DOUBLE-LINE SLANTED LESS-THAN OR EQUAL TO
    "⫹": [.lessThanSign, .equalsSign, .doubled, .extra1],

    //2AFA          ; DOUBLE-LINE SLANTED GREATER-THAN OR EQUAL TO
    "⫺": [.greaterThanSign, .equalsSign, .doubled, .extra1],

    //2AFB          ; TRIPLE SOLIDUS BINARY RELATION
    "⫻": [],

    //2AFC          ; LARGE TRIPLE VERTICAL BAR OPERATOR
    "⫼": [],

    //2AFD          ; DOUBLE SOLIDUS OPERATOR
    "⫽": [],

    //2AFE          ; WHITE VERTICAL BAR
    "⫾": [],

    //2AFF          ; N-ARY WHITE VERTICAL BAR
    "⫿": [],

]

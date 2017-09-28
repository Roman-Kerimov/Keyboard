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
    "\\": [.reverseSolidus],

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
    " ": [],

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
    "¬": [],

    //00AD          ; SOFT HYPHEN
    "­": [],

    //00AE          ; REGISTERED SIGN
    "®": [],

    //00AF          ; MACRON
    "¯": [],

    //00B0          ; DEGREE SIGN
    "°": [],

    //00B1          ; PLUS-MINUS SIGN
    "±": [.plusSign, .hyphenMinus],

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
    "¼": [.one, .four],

    //00BD          ; VULGAR FRACTION ONE HALF
    "½": [.one, .two],

    //00BE          ; VULGAR FRACTION THREE QUARTERS
    "¾": [.three, .four],

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
    "×": [],

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
    "÷": [],

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
    "ƍ": [.d, .y, .turned],

    //018E          ; LATIN CAPITAL LETTER REVERSED E
    "Ǝ": [.e, .reversed, .capital],

    //018F          ; LATIN CAPITAL LETTER SCHWA
    "Ə": [.a, .h, .capital],

    //0190          ; LATIN CAPITAL LETTER OPEN E
    "Ɛ": [.e, .open, .capital],

    //0191          ; LATIN CAPITAL LETTER F WITH HOOK
    "Ƒ": [.f, .hook, .capital],

    //0192          ; LATIN SMALL LETTER F WITH HOOK
    "ƒ": [.f, .hook],

    //0193          ; LATIN CAPITAL LETTER G WITH HOOK
    "Ɠ": [.g, .hook, .capital],

    //0194          ; LATIN CAPITAL LETTER GAMMA
    "Ɣ": [.g, .y, .capital],

    //0195          ; LATIN SMALL LETTER HV
    "ƕ": [.h, .v],

    //0196          ; LATIN CAPITAL LETTER IOTA
    "Ɩ": [.i, .y, .capital],

    //0197          ; LATIN CAPITAL LETTER I WITH STROKE
    "Ɨ": [.i, .stroke],

    //0198          ; LATIN CAPITAL LETTER K WITH HOOK
    "Ƙ": [.k, .hook, .capital],

    //0199          ; LATIN SMALL LETTER K WITH HOOK
    "ƙ": [.k, .hook],

    //019A          ; LATIN SMALL LETTER L WITH BAR
    "ƚ": [.l, .stroke],

    //019B          ; LATIN SMALL LETTER LAMBDA WITH STROKE
    "ƛ": [.l, .y, .diagonalStroke],

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
    "Ʊ": [.u, .y, .capital],

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
    "Ȝ": [.g, .h, .capital],

    //021D          ; LATIN SMALL LETTER YOGH
    "ȝ": [.g, .h],

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
    "ɑ": [.a, .y],

    //0252          ; LATIN SMALL LETTER TURNED ALPHA
    "ɒ": [.a, .y, .turned],

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
    "ə": [.a, .h],

    //025A          ; LATIN SMALL LETTER SCHWA WITH HOOK
    "ɚ": [.a, .h, .rhoticHook],

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
    "ɡ": [.g, .script],

    //0262          ; LATIN LETTER SMALL CAPITAL G
    "ɢ": [.g, .smallCapital],

    //0263          ; LATIN SMALL LETTER GAMMA
    "ɣ": [.g, .y],

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
    "ɩ": [.i, .y],

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
    "ɷ": [.o, .y, .closed],

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
    "ʊ": [.u, .y],

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
    "ʝ": [.j, .curl],

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
    "ˠ": [.g, .y, .superscript],

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
    "˿": [.arrow, .left, .subscript],

]

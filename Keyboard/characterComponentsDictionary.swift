//
//  characterComponentsDictionary.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-09-25.
//

// This file uses data from UCD/Blocks.txt and UCD/extracted/DerivedName.txt

let characterComponentsDictionary: [String: [CharacterComponent]] = [
    
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
    ")": [.parenthesis, .reversed],
    
    //002A          ; ASTERISK
    "*": [.asterisk],
    
    //002B          ; PLUS SIGN
    "+": [.plusSign],
    
    //002C          ; COMMA
    ",": [.comma],
    
    //002D          ; HYPHEN-MINUS
    "-": [.caret, .extra2],
    
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
    "]": [.squareBracket, .reversed],

    //005E          ; CIRCUMFLEX ACCENT
    "^": [.caret],

    //005F          ; LOW LINE
    "_": [.lowLine],

    //0060          ; GRAVE ACCENT
    "`": [.caret, .extra1],

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
    "}": [.curlyBracket, .reversed],

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
    "¦": [.verticalLine, .broken],

    //00A7          ; SECTION SIGN
    "§": [],

    //00A8          ; DIAERESIS
    "¨": [.diaeresis, .superscript],

    //00A9          ; COPYRIGHT SIGN
    "©": [],

    //00AA          ; FEMININE ORDINAL INDICATOR
    "ª": [],

    //00AB          ; LEFT-POINTING DOUBLE ANGLE QUOTATION MARK
    "«": [.quotationMark, .extraLeft],

    //00AC          ; NOT SIGN
    "¬": [.tilde, .extra0],

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
    "·": [.dot, .middle],

    //00B8          ; CEDILLA
    "¸": [.cedilla],

    //00B9          ; SUPERSCRIPT ONE
    "¹": [.one, .superscript],

    //00BA          ; MASCULINE ORDINAL INDICATOR
    "º": [],

    //00BB          ; RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK
    "»": [.quotationMark, .extraRight],

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
    "Ð": [.d, .extraH, .capital],

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
    "Þ": [.t, .extraH, .capital],

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
    "ð": [.d, .extraH],

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
    "þ": [.t, .extraH],

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
    "ĿL": [.l, .l, .capital, .capital],
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
    "œ": [.o, .e],

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
    "Ɔ": [.o, .extraH, .capital],

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
    "ƍ": [.d, .extraH, .extra1, .turned],

    //018E          ; LATIN CAPITAL LETTER REVERSED E
    "Ǝ": [.e, .turned, .capital],

    //018F          ; LATIN CAPITAL LETTER SCHWA
    "Ə": [.a, .extra0, .capital],

    //0190          ; LATIN CAPITAL LETTER OPEN E
    "Ɛ": [.e, .extraH, .capital],

    //0191          ; LATIN CAPITAL LETTER F WITH HOOK
    "Ƒ": [.f, .extraH, .capital],

    //0192          ; LATIN SMALL LETTER F WITH HOOK
    "ƒ": [.f, .extraH],

    //0193          ; LATIN CAPITAL LETTER G WITH HOOK
    "Ɠ": [.g, .hook, .capital],

    //0194          ; LATIN CAPITAL LETTER GAMMA
    "Ɣ": [.g, .extraH, .capital],

    //0195          ; LATIN SMALL LETTER HV
    "ƕ": [.h, .v],

    //0196          ; LATIN CAPITAL LETTER IOTA
    "Ɩ": [.i, .extraH, .capital],

    //0197          ; LATIN CAPITAL LETTER I WITH STROKE
    "Ɨ": [.i, .capital, .stroke],

    //0198          ; LATIN CAPITAL LETTER K WITH HOOK
    "Ƙ": [.k, .hook, .capital],

    //0199          ; LATIN SMALL LETTER K WITH HOOK
    "ƙ": [.k, .hook],

    //019A          ; LATIN SMALL LETTER L WITH BAR
    "ƚ": [.l, .stroke],

    //019B          ; LATIN SMALL LETTER LAMBDA WITH STROKE
    "ƛ": [.l, .extraH],

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
    "Ʃ": [.s, .extraH, .capital],

    //01AA          ; LATIN LETTER REVERSED ESH LOOP
    "ƪ": [.s, .extraH, .curl, .inverted],

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
    "Ʊ": [.u, .extraH, .capital],

    //01B2          ; LATIN CAPITAL LETTER V WITH HOOK
    "Ʋ": [.v, .extraH, .capital],

    //01B3          ; LATIN CAPITAL LETTER Y WITH HOOK
    "Ƴ": [.y, .hook, .capital],

    //01B4          ; LATIN SMALL LETTER Y WITH HOOK
    "ƴ": [.y, .hook],

    //01B5          ; LATIN CAPITAL LETTER Z WITH STROKE
    "Ƶ": [.z, .stroke, .capital],

    //01B6          ; LATIN SMALL LETTER Z WITH STROKE
    "ƶ": [.z, .stroke],

    //01B7          ; LATIN CAPITAL LETTER EZH
    "Ʒ": [.z, .extraH, .capital],

    //01B8          ; LATIN CAPITAL LETTER EZH REVERSED
    "Ƹ": [.z, .extraH, .reversed, .capital],

    //01B9          ; LATIN SMALL LETTER EZH REVERSED
    "ƹ": [.z, .extraH, .reversed],

    //01BA          ; LATIN SMALL LETTER EZH WITH TAIL
    "ƺ": [.z, .extraH, .tail],

    //01BB          ; LATIN LETTER TWO WITH STROKE
    "ƻ": [.two, .stroke],

    //01BC          ; LATIN CAPITAL LETTER TONE FIVE
    "Ƽ": [.five, .tone, .capital],

    //01BD          ; LATIN SMALL LETTER TONE FIVE
    "ƽ": [.five, .tone],

    //01BE          ; LATIN LETTER INVERTED GLOTTAL STOP WITH STROKE
    "ƾ": [.t, .sBottom],

    //01BF          ; LATIN LETTER WYNN
    "ƿ": [.w, .extraH],

    //01C0          ; LATIN LETTER DENTAL CLICK
    "ǀ": [.d, .click],

    //01C1          ; LATIN LETTER LATERAL CLICK
    "ǁ": [.l, .click],

    //01C2          ; LATIN LETTER ALVEOLAR CLICK
    "ǂ": [.j, .click],

    //01C3          ; LATIN LETTER RETROFLEX CLICK
    "ǃ": [.t, .click],

    //01C4          ; LATIN CAPITAL LETTER DZ WITH CARON
    "Ǆ": [.d, .capital, .z, .caron, .above, .capital],

    //01C5          ; LATIN CAPITAL LETTER D WITH SMALL LETTER Z WITH CARON
    "ǅ": [.d, .capital, .z, .caron, .above],
    
    //01C6          ; LATIN SMALL LETTER DZ WITH CARON
    "ǆ": [.d, .z, .caron, .above],

    //01C7          ; LATIN CAPITAL LETTER LJ
    "Ǉ": [.l, .capital, .j, .capital],

    //01C8          ; LATIN CAPITAL LETTER L WITH SMALL LETTER J
    "ǈ": [.l, .capital, .j],

    //01C9          ; LATIN SMALL LETTER LJ
    "ǉ": [.l, .j],

    //01CA          ; LATIN CAPITAL LETTER NJ
    "Ǌ": [.n, .capital, .j, .capital],

    //01CB          ; LATIN CAPITAL LETTER N WITH SMALL LETTER J
    "ǋ": [.n, .capital, .j],

    //01CC          ; LATIN SMALL LETTER NJ
    "ǌ": [.n, .j],

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
    "Ǯ": [.z, .extraH, .caron, .above, .capital],

    //01EF          ; LATIN SMALL LETTER EZH WITH CARON
    "ǯ": [.z, .extraH, .caron, .above],

    //01F0          ; LATIN SMALL LETTER J WITH CARON
    "ǰ": [.j, .caron, .above],

    //01F1          ; LATIN CAPITAL LETTER DZ
    "Ǳ": [.d, .capital, .z, .capital],

    //01F2          ; LATIN CAPITAL LETTER D WITH SMALL LETTER Z
    "ǲ": [.d, .capital, .z],

    //01F3          ; LATIN SMALL LETTER DZ
    "ǳ": [.d, .z],

    //01F4          ; LATIN CAPITAL LETTER G WITH ACUTE
    "Ǵ": [.g, .acute, .above, .capital],

    //01F5          ; LATIN SMALL LETTER G WITH ACUTE
    "ǵ": [.g, .acute, .above],

    //01F6          ; LATIN CAPITAL LETTER HWAIR
    "Ƕ": [.h, .v, .capital],

    //01F7          ; LATIN CAPITAL LETTER WYNN
    "Ƿ": [.w, .extraH, .capital],

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
    "Ȝ": [.y, .extraH, .capital],

    //021D          ; LATIN SMALL LETTER YOGH
    "ȝ": [.y, .extraH],

    //021E          ; LATIN CAPITAL LETTER H WITH CARON
    "Ȟ": [.h, .caron, .above, .capital],

    //021F          ; LATIN SMALL LETTER H WITH CARON
    "ȟ": [.h, .caron, .above],

    //0220          ; LATIN CAPITAL LETTER N WITH LONG RIGHT LEG
    "Ƞ": [.n, .longLeg, .capital],

    //0221          ; LATIN SMALL LETTER D WITH CURL
    "ȡ": [.d, .curl],

    //0222          ; LATIN CAPITAL LETTER OU
    "Ȣ": [.o, .u, .capital],

    //0223          ; LATIN SMALL LETTER OU
    "ȣ": [.o, .u],

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
    "ȵ": [.n, .curl, .extra0],

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
    "Ɂ": [.h, .extraH, .capital],

    //0242          ; LATIN SMALL LETTER GLOTTAL STOP
    "ɂ": [.h, .extraH],

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
    "ɑ": [.a, .extraH],

    //0252          ; LATIN SMALL LETTER TURNED ALPHA
    "ɒ": [.a, .extraH, .turned],

    //0253          ; LATIN SMALL LETTER B WITH HOOK
    "ɓ": [.b, .hook],

    //0254          ; LATIN SMALL LETTER OPEN O
    "ɔ": [.o, .extraH],

    //0255          ; LATIN SMALL LETTER C WITH CURL
    "ɕ": [.s, .curl],

    //0256          ; LATIN SMALL LETTER D WITH TAIL
    "ɖ": [.d, .retroflexHook],

    //0257          ; LATIN SMALL LETTER D WITH HOOK
    "ɗ": [.d, .hook],

    //0258          ; LATIN SMALL LETTER REVERSED E
    "ɘ": [.e, .reversed],

    //0259          ; LATIN SMALL LETTER SCHWA
    "ə": [.a, .extra0],

    //025A          ; LATIN SMALL LETTER SCHWA WITH HOOK
    "ɚ": [.a, .extra0, .rhoticHook],

    //025B          ; LATIN SMALL LETTER OPEN E
    "ɛ": [.e, .extraH],

    //025C          ; LATIN SMALL LETTER REVERSED OPEN E
    "ɜ": [.e, .extraH, .reversed],

    //025D          ; LATIN SMALL LETTER REVERSED OPEN E WITH HOOK
    "ɝ": [.e, .extraH, .reversed, .rhoticHook],

    //025E          ; LATIN SMALL LETTER CLOSED REVERSED OPEN E
    "ɞ": [.e, .extraH, .closed, .reversed],

    //025F          ; LATIN SMALL LETTER DOTLESS J WITH STROKE
    "ɟ": [.j, .stroke, .dot, .above],

    //0260          ; LATIN SMALL LETTER G WITH HOOK
    "ɠ": [.g, .hook],

    //0261          ; LATIN SMALL LETTER SCRIPT G
    "ɡ": [.g, .letterScript],

    //0262          ; LATIN LETTER SMALL CAPITAL G
    "ɢ": [.g, .smallCapital],

    //0263          ; LATIN SMALL LETTER GAMMA
    "ɣ": [.g, .extraH],

    //0264          ; LATIN SMALL LETTER RAMS HORN
    "ɤ": [.g, .extraH, .smallCapital],

    //0265          ; LATIN SMALL LETTER TURNED H
    "ɥ": [.h, .turned],

    //0266          ; LATIN SMALL LETTER H WITH HOOK
    "ɦ": [.h, .hook],

    //0267          ; LATIN SMALL LETTER HENG WITH HOOK
    "ɧ": [.h, .g, .hook],

    //0268          ; LATIN SMALL LETTER I WITH STROKE
    "ɨ": [.i, .stroke],

    //0269          ; LATIN SMALL LETTER IOTA
    "ɩ": [.i, .extraH],

    //026A          ; LATIN LETTER SMALL CAPITAL I
    "ɪ": [.i, .smallCapital],

    //026B          ; LATIN SMALL LETTER L WITH MIDDLE TILDE
    "ɫ": [.l, .tilde],

    //026C          ; LATIN SMALL LETTER L WITH BELT
    "ɬ": [.l, .belt],

    //026D          ; LATIN SMALL LETTER L WITH RETROFLEX HOOK
    "ɭ": [.l, .retroflexHook],

    //026E          ; LATIN SMALL LETTER LEZH
    "ɮ": [.l, .z, .extraH],

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
    "ɷ": [.o, .o, .extraH, .closed],

    //0278          ; LATIN SMALL LETTER PHI
    "ɸ": [.p, .extraH],

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
    "ʃ": [.s, .extraH],

    //0284          ; LATIN SMALL LETTER DOTLESS J WITH STROKE AND HOOK
    "ʄ": [.j, .stroke, .hook],

    //0285          ; LATIN SMALL LETTER SQUAT REVERSED ESH
    "ʅ": [.r, .retroflexHook, .hook, .reversed],

    //0286          ; LATIN SMALL LETTER ESH WITH CURL
    "ʆ": [.s, .extraH, .curl],

    //0287          ; LATIN SMALL LETTER TURNED T
    "ʇ": [.t, .turned],

    //0288          ; LATIN SMALL LETTER T WITH RETROFLEX HOOK
    "ʈ": [.t, .retroflexHook],

    //0289          ; LATIN SMALL LETTER U BAR
    "ʉ": [.u, .stroke],

    //028A          ; LATIN SMALL LETTER UPSILON
    "ʊ": [.u, .extraH],

    //028B          ; LATIN SMALL LETTER V WITH HOOK
    "ʋ": [.v, .extraH],

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
    "ʒ": [.z, .extraH],

    //0293          ; LATIN SMALL LETTER EZH WITH CURL
    "ʓ": [.z, .extraH, .curl],

    //0294          ; LATIN LETTER GLOTTAL STOP
    "ʔ": [.glottalStop],

    //0295          ; LATIN LETTER PHARYNGEAL VOICED FRICATIVE
    "ʕ": [.glottalStop, .reversed],

    //0296          ; LATIN LETTER INVERTED GLOTTAL STOP
    "ʖ": [.glottalStop, .inverted],

    //0297          ; LATIN LETTER STRETCHED C
    "ʗ": [.c, .extraH],

    //0298          ; LATIN LETTER BILABIAL CLICK
    "ʘ": [.o, .click],

    //0299          ; LATIN LETTER SMALL CAPITAL B
    "ʙ": [.b, .smallCapital],

    //029A          ; LATIN SMALL LETTER CLOSED OPEN E
    "ʚ": [.e, .extraH, .closed],

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
    "ʡ": [.glottalStop, .stroke],

    //02A2          ; LATIN LETTER REVERSED GLOTTAL STOP WITH STROKE
    "ʢ": [.glottalStop, .stroke, .reversed],

    //02A3          ; LATIN SMALL LETTER DZ DIGRAPH
    "ʣ": [.d, .zDigraph],

    //02A4          ; LATIN SMALL LETTER DEZH DIGRAPH
    "ʤ": [.d, .zDigraph, .extraH],

    //02A5          ; LATIN SMALL LETTER DZ DIGRAPH WITH CURL
    "ʥ": [.d, .zDigraph, .curl],

    //02A6          ; LATIN SMALL LETTER TS DIGRAPH
    "ʦ": [.t, .s],

    //02A7          ; LATIN SMALL LETTER TESH DIGRAPH
    "ʧ": [.t, .s, .extraH],

    //02A8          ; LATIN SMALL LETTER TC DIGRAPH WITH CURL
    "ʨ": [.t, .s, .curl],

    //02A9          ; LATIN SMALL LETTER FENG DIGRAPH
    "ʩ": [.f, .g],

    //02AA          ; LATIN SMALL LETTER LS DIGRAPH
    "ʪ": [.l, .s],

    //02AB          ; LATIN SMALL LETTER LZ DIGRAPH
    "ʫ": [.l, .z],

    //02AC          ; LATIN LETTER BILABIAL PERCUSSIVE
    "ʬ": [.w, .w],

    //02AD          ; LATIN LETTER BIDENTAL PERCUSSIVE
    "ʭ": [.d, .d],

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
    "ˀ": [.glottalStop, .superscript],

    //02C1          ; MODIFIER LETTER REVERSED GLOTTAL STOP
    "ˁ": [.glottalStop, .reversed, .superscript],

    //02C2          ; MODIFIER LETTER LEFT ARROWHEAD
    "˂": [.arrowhead, .left, .superscript],

    //02C3          ; MODIFIER LETTER RIGHT ARROWHEAD
    "˃": [.arrowhead, .right, .superscript],

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
    "ˠ": [.g, .extraH, .superscript],

    //02E1          ; MODIFIER LETTER SMALL L
    "ˡ": [.l, .superscript],

    //02E2          ; MODIFIER LETTER SMALL S
    "ˢ": [.s, .superscript],

    //02E3          ; MODIFIER LETTER SMALL X
    "ˣ": [.x, .superscript],

    //02E4          ; MODIFIER LETTER SMALL REVERSED GLOTTAL STOP
    "ˤ": [],

    //02E5          ; MODIFIER LETTER EXTRA-HIGH TONE BAR
    "˥": [.extraHighTone],

    //02E6          ; MODIFIER LETTER HIGH TONE BAR
    "˦": [.highTone],

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
    "˰": [.arrowhead, .up, .subscript],

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
    "˹": [.beginHighTone],

    //02FA          ; MODIFIER LETTER END HIGH TONE
    "˺": [.endHighTone],

    //02FB          ; MODIFIER LETTER BEGIN LOW TONE
    "˻": [.beginLowTone],

    //02FC          ; MODIFIER LETTER END LOW TONE
    "˼": [.endLowTone],

    //02FD          ; MODIFIER LETTER SHELF
    "˽": [.shelf],

    //02FE          ; MODIFIER LETTER OPEN SHELF
    "˾": [.shelf, .extraH],

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
    "̧": [.cedilla, .below],

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
    "̴": [.tildeOverlay, .combining],

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
    "͚": [.zero, .extra1, .below],

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
    "Θ": [.t, .extraH, .capital, .greek],

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
    "Ξ": [.k, .s, .capital, .greek],

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
    "Υ": [.u, .capital, .greek],

    //03A6          ; GREEK CAPITAL LETTER PHI
    "Φ": [.p, .extraH, .capital, .greek],

    //03A7          ; GREEK CAPITAL LETTER CHI
    "Χ": [.x, .extraH, .capital, .greek],

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
    "θ": [.t, .extraH, .greek],

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
    "ξ": [.k, .s, .greek],

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
    "υ": [.u, .greek],

    //03C6          ; GREEK SMALL LETTER PHI
    "φ": [.p, .extraH, .greek],

    //03C7          ; GREEK SMALL LETTER CHI
    "χ": [.x, .extraH, .greek],

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
    "ϑ": [.t, .extraH, .greek, .symbol],

    //03D2          ; GREEK UPSILON WITH HOOK SYMBOL
    //03D3          ; GREEK UPSILON WITH ACUTE AND HOOK SYMBOL
    //03D4          ; GREEK UPSILON WITH DIAERESIS AND HOOK SYMBOL
    
    //03D5          ; GREEK PHI SYMBOL
    "ϕ": [.p, .extraH, .greek, .symbol],

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
    "ϴ": [.t, .extraH, .capital, .greek, .symbol],

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
    
    //0400          ; CYRILLIC CAPITAL LETTER IE WITH GRAVE
    "Ѐ": [.e, .capital, .cyrillic, .grave, .above],
    
    //0401          ; CYRILLIC CAPITAL LETTER IO
    "Ё": [.i, .o, .capital, .cyrillic],
    
    //0402          ; CYRILLIC CAPITAL LETTER DJE
    "Ђ": [.d, .capital, .extra0, .cyrillic],
    
    //0403          ; CYRILLIC CAPITAL LETTER GJE
    "Ѓ": [.g, .capital, .cyrillic, .acute, .above],
    
    //0404          ; CYRILLIC CAPITAL LETTER UKRAINIAN IE
    "Є": [.i, .e, .capital, .cyrillic],
    
    //0405          ; CYRILLIC CAPITAL LETTER DZE
    "Ѕ": [.d, .z, .capital, .cyrillic],
    
    //0406          ; CYRILLIC CAPITAL LETTER BYELORUSSIAN-UKRAINIAN I
    "І": [.i, .capital, .cyrillic, .extra0],
    
    //0407          ; CYRILLIC CAPITAL LETTER YI
    "Ї": [.i, .capital, .cyrillic, .extra0, .diaeresis, .above],
    
    //0408          ; CYRILLIC CAPITAL LETTER JE
    "Ј": [.j, .capital, .cyrillic],
    
    //0409          ; CYRILLIC CAPITAL LETTER LJE
    "Љ": [.l, .j, .capital, .cyrillic],
    
    //040A          ; CYRILLIC CAPITAL LETTER NJE
    "Њ": [.n, .j, .capital, .cyrillic],
    
    //040B          ; CYRILLIC CAPITAL LETTER TSHE
    "Ћ": [.t, .extra0, .capital, .cyrillic],
    
    //040C          ; CYRILLIC CAPITAL LETTER KJE
    "Ќ": [.k, .capital, .cyrillic, .acute, .above],
    
    //040D          ; CYRILLIC CAPITAL LETTER I WITH GRAVE
    "Ѝ": [.i, .capital, .cyrillic, .grave, .above],
    
    //040E          ; CYRILLIC CAPITAL LETTER SHORT U
    "Ў": [.u, .capital, .cyrillic, .breve, .above],
    
    //040F          ; CYRILLIC CAPITAL LETTER DZHE
    "Џ": [.d, .z, .extraH, .capital, .cyrillic],
    
    //0410          ; CYRILLIC CAPITAL LETTER A
    "А": [.a, .capital, .cyrillic],
    
    //0411          ; CYRILLIC CAPITAL LETTER BE
    "Б": [.b, .capital, .cyrillic],
    
    //0412          ; CYRILLIC CAPITAL LETTER VE
    "В": [.v, .capital, .cyrillic],
    
    //0413          ; CYRILLIC CAPITAL LETTER GHE
    "Г": [.g, .capital, .cyrillic],
    
    //0414          ; CYRILLIC CAPITAL LETTER DE
    "Д": [.d, .capital, .cyrillic],
    
    //0415          ; CYRILLIC CAPITAL LETTER IE
    "Е": [.e, .capital, .cyrillic],
    
    //0416          ; CYRILLIC CAPITAL LETTER ZHE
    "Ж": [.z, .capital, .cyrillic, .extraH],
    
    //0417          ; CYRILLIC CAPITAL LETTER ZE
    "З": [.z, .capital, .cyrillic],
    
    //0418          ; CYRILLIC CAPITAL LETTER I
    "И": [.i, .capital, .cyrillic],
    
    //0419          ; CYRILLIC CAPITAL LETTER SHORT I
    "Й": [.i, .capital, .cyrillic, .breve, .above],
    
    //041A          ; CYRILLIC CAPITAL LETTER KA
    "К": [.k, .capital, .cyrillic],
    
    //041B          ; CYRILLIC CAPITAL LETTER EL
    "Л": [.l, .capital, .cyrillic],
    
    //041C          ; CYRILLIC CAPITAL LETTER EM
    "М": [.m, .capital, .cyrillic],
    
    //041D          ; CYRILLIC CAPITAL LETTER EN
    "Н": [.n, .capital, .cyrillic],
    
    //041E          ; CYRILLIC CAPITAL LETTER O
    "О": [.o, .capital, .cyrillic],
    
    //041F          ; CYRILLIC CAPITAL LETTER PE
    "П": [.p, .capital, .cyrillic],
    
    //0420          ; CYRILLIC CAPITAL LETTER ER
    "Р": [.r, .capital, .cyrillic],
    
    //0421          ; CYRILLIC CAPITAL LETTER ES
    "С": [.s, .capital, .cyrillic],
    
    //0422          ; CYRILLIC CAPITAL LETTER TE
    "Т": [.t, .capital, .cyrillic],
    
    //0423          ; CYRILLIC CAPITAL LETTER U
    "У": [.u, .capital, .cyrillic],
    
    //0424          ; CYRILLIC CAPITAL LETTER EF
    "Ф": [.f, .capital, .cyrillic],
    
    //0425          ; CYRILLIC CAPITAL LETTER HA
    "Х": [.h, .capital, .cyrillic],
    
    //0426          ; CYRILLIC CAPITAL LETTER TSE
    "Ц": [.c, .capital, .cyrillic],
    
    //0427          ; CYRILLIC CAPITAL LETTER CHE
    "Ч": [.c, .capital, .cyrillic, .extraH],
    
    //0428          ; CYRILLIC CAPITAL LETTER SHA
    "Ш": [.s, .capital, .cyrillic, .extraH],
    
    //0429          ; CYRILLIC CAPITAL LETTER SHCHA
    "Щ": [.s, .capital, .cyrillic, .extraH, .descender],
    
    //042A          ; CYRILLIC CAPITAL LETTER HARD SIGN
    "Ъ": [.y, .capital, .cyrillic, .extra0],
    
    //042B          ; CYRILLIC CAPITAL LETTER YERU
    "Ы": [.y, .capital, .cyrillic],
    
    //042C          ; CYRILLIC CAPITAL LETTER SOFT SIGN
    "Ь": [.j, .capital, .cyrillic, .extra0],
    
    //042D          ; CYRILLIC CAPITAL LETTER E
    "Э": [.e, .capital, .turned, .cyrillic],
    
    //042E          ; CYRILLIC CAPITAL LETTER YU
    "Ю": [.i, .u, .capital, .cyrillic],
    
    //042F          ; CYRILLIC CAPITAL LETTER YA
    "Я": [.i, .a, .capital, .cyrillic],
    
    //0430          ; CYRILLIC SMALL LETTER A
    "а": [.a, .cyrillic],
    
    //0431          ; CYRILLIC SMALL LETTER BE
    "б": [.b, .cyrillic],
    
    //0432          ; CYRILLIC SMALL LETTER VE
    "в": [.v, .cyrillic],
    
    //0433          ; CYRILLIC SMALL LETTER GHE
    "г": [.g, .cyrillic],
    
    //0434          ; CYRILLIC SMALL LETTER DE
    "д": [.d, .cyrillic],
    
    //0435          ; CYRILLIC SMALL LETTER IE
    "е": [.e, .cyrillic],
    
    //0436          ; CYRILLIC SMALL LETTER ZHE
    "ж": [.z, .extraH, .cyrillic],
    
    //0437          ; CYRILLIC SMALL LETTER ZE
    "з": [.z, .cyrillic],
    
    //0438          ; CYRILLIC SMALL LETTER I
    "и": [.i, .cyrillic],
    
    //0439          ; CYRILLIC SMALL LETTER SHORT I
    "й": [.i, .cyrillic, .breve, .above],
    
    //043A          ; CYRILLIC SMALL LETTER KA
    "к": [.k, .cyrillic],
    
    //043B          ; CYRILLIC SMALL LETTER EL
    "л": [.l, .cyrillic],
    
    //043C          ; CYRILLIC SMALL LETTER EM
    "м": [.m, .cyrillic],
    
    //043D          ; CYRILLIC SMALL LETTER EN
    "н": [.n, .cyrillic],
    
    //043E          ; CYRILLIC SMALL LETTER O
    "о": [.o, .cyrillic],
    
    //043F          ; CYRILLIC SMALL LETTER PE
    "п": [.p, .cyrillic],
    
    //0440          ; CYRILLIC SMALL LETTER ER
    "р": [.r, .cyrillic],
    
    //0441          ; CYRILLIC SMALL LETTER ES
    "с": [.s, .cyrillic],
    
    //0442          ; CYRILLIC SMALL LETTER TE
    "т": [.t, .cyrillic],
    
    //0443          ; CYRILLIC SMALL LETTER U
    "у": [.u, .cyrillic],
    
    //0444          ; CYRILLIC SMALL LETTER EF
    "ф": [.f, .cyrillic],
    
    //0445          ; CYRILLIC SMALL LETTER HA
    "х": [.h, .cyrillic],
    
    //0446          ; CYRILLIC SMALL LETTER TSE
    "ц": [.c, .cyrillic],
    
    //0447          ; CYRILLIC SMALL LETTER CHE
    "ч": [.c, .extraH, .cyrillic],
    
    //0448          ; CYRILLIC SMALL LETTER SHA
    "ш": [.s, .extraH, .cyrillic],
    
    //0449          ; CYRILLIC SMALL LETTER SHCHA
    "щ": [.s, .extraH, .cyrillic, .descender],
    
    //044A          ; CYRILLIC SMALL LETTER HARD SIGN
    "ъ": [.y, .cyrillic, .extra0],
    
    //044B          ; CYRILLIC SMALL LETTER YERU
    "ы": [.y, .cyrillic],
    
    //044C          ; CYRILLIC SMALL LETTER SOFT SIGN
    "ь": [.j, .cyrillic, .extra0],
    
    //044D          ; CYRILLIC SMALL LETTER E
    "э": [.e, .turned, .cyrillic],
    
    //044E          ; CYRILLIC SMALL LETTER YU
    "ю": [.i, .u, .cyrillic],
    
    //044F          ; CYRILLIC SMALL LETTER YA
    "я": [.i, .a, .cyrillic],
    
    //0450          ; CYRILLIC SMALL LETTER IE WITH GRAVE
    "ѐ": [.e, .cyrillic, .grave, .above],
    
    //0451          ; CYRILLIC SMALL LETTER IO
    "ё": [.i, .o, .cyrillic],
    
    //0452          ; CYRILLIC SMALL LETTER DJE
    "ђ": [.d, .extra0, .cyrillic],
    
    //0453          ; CYRILLIC SMALL LETTER GJE
    "ѓ": [.g, .cyrillic, .acute],
    
    //0454          ; CYRILLIC SMALL LETTER UKRAINIAN IE
    "є": [.i, .e, .cyrillic],
    
    //0455          ; CYRILLIC SMALL LETTER DZE
    "ѕ": [.d, .z, .cyrillic],
    
    //0456          ; CYRILLIC SMALL LETTER BYELORUSSIAN-UKRAINIAN I
    "і": [.i, .cyrillic, .extra0],
    
    //0457          ; CYRILLIC SMALL LETTER YI
    "ї": [.i, .cyrillic, .extra0, .diaeresis, .above],
    
    //0458          ; CYRILLIC SMALL LETTER JE
    "ј": [.j, .cyrillic],
    
    //0459          ; CYRILLIC SMALL LETTER LJE
    "љ": [.l, .j, .cyrillic],
    
    //045A          ; CYRILLIC SMALL LETTER NJE
    "њ": [.n, .j, .cyrillic],
    
    //045B          ; CYRILLIC SMALL LETTER TSHE
    "ћ": [.t, .extra0, .cyrillic],
    
    //045C          ; CYRILLIC SMALL LETTER KJE
    "ќ": [.k, .cyrillic, .acute, .above],
    
    //045D          ; CYRILLIC SMALL LETTER I WITH GRAVE
    "ѝ": [.i, .cyrillic, .grave, .above],
    
    //045E          ; CYRILLIC SMALL LETTER SHORT U
    "ў": [.u, .cyrillic, .breve, .above],
    
    //045F          ; CYRILLIC SMALL LETTER DZHE
    "џ": [.d, .z, .extraH, .cyrillic],
    
    //0460          ; CYRILLIC CAPITAL LETTER OMEGA
    "Ѡ": [.o, .capital, .o, .cyrillic],
    
    //0461          ; CYRILLIC SMALL LETTER OMEGA
    "ѡ": [.o, .o, .cyrillic],
    
    //0462          ; CYRILLIC CAPITAL LETTER YAT
    "Ѣ": [.i, .extra0, .e, .capital, .cyrillic],
    
    //0463          ; CYRILLIC SMALL LETTER YAT
    "ѣ": [.i, .extra0, .e, .cyrillic],
    
    //0464          ; CYRILLIC CAPITAL LETTER IOTIFIED E
    "Ѥ": [.j, .e, .capital, .cyrillic],
    
    //0465          ; CYRILLIC SMALL LETTER IOTIFIED E
    "ѥ": [.j, .e, .cyrillic],
    
    //0466          ; CYRILLIC CAPITAL LETTER LITTLE YUS
    "Ѧ": [.e, .n, .capital, .cyrillic],
    
    //0467          ; CYRILLIC SMALL LETTER LITTLE YUS
    "ѧ": [.e, .n, .cyrillic],
    
    //0468          ; CYRILLIC CAPITAL LETTER IOTIFIED LITTLE YUS
    "Ѩ": [.j, .e, .n, .capital, .cyrillic],
    
    //0469          ; CYRILLIC SMALL LETTER IOTIFIED LITTLE YUS
    "ѩ": [.j, .e, .n, .cyrillic],
    
    //046A          ; CYRILLIC CAPITAL LETTER BIG YUS
    "Ѫ": [.o, .n, .capital, .cyrillic],
    
    //046B          ; CYRILLIC SMALL LETTER BIG YUS
    "ѫ": [.o, .n, .cyrillic],
    
    //046C          ; CYRILLIC CAPITAL LETTER IOTIFIED BIG YUS
    "Ѭ": [.j, .o, .n, .capital, .cyrillic],
    
    //046D          ; CYRILLIC SMALL LETTER IOTIFIED BIG YUS
    "ѭ": [.j, .o, .n, .cyrillic],
    
    //046E          ; CYRILLIC CAPITAL LETTER KSI
    "Ѯ": [.x, .capital, .cyrillic],
    
    //046F          ; CYRILLIC SMALL LETTER KSI
    "ѯ": [.x, .cyrillic],
    
    //0470          ; CYRILLIC CAPITAL LETTER PSI
    "Ѱ": [.p, .s, .capital, .cyrillic],
    
    //0471          ; CYRILLIC SMALL LETTER PSI
    "ѱ": [.p, .s, .cyrillic],
    
    //0472          ; CYRILLIC CAPITAL LETTER FITA
    "Ѳ": [.t, .h, .capital, .cyrillic],
    
    //0473          ; CYRILLIC SMALL LETTER FITA
    "ѳ": [.t, .h, .cyrillic],
    
    //0474          ; CYRILLIC CAPITAL LETTER IZHITSA
    "Ѵ": [.i, .h, .capital, .cyrillic],
    
    //0475          ; CYRILLIC SMALL LETTER IZHITSA
    "ѵ": [.i, .h, .cyrillic],
    
    //0476          ; CYRILLIC CAPITAL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT
    "Ѷ": [.i, .h, .capital, .cyrillic, .grave, .doubled, .above],
    
    //0477          ; CYRILLIC SMALL LETTER IZHITSA WITH DOUBLE GRAVE ACCENT
    "ѷ": [.i, .h, .cyrillic, .grave, .doubled, .above],
    
    //0478          ; CYRILLIC CAPITAL LETTER UK
    "Ѹ": [.o, .u, .capital, .cyrillic],
    
    //0479          ; CYRILLIC SMALL LETTER UK
    "ѹ": [.o, .u, .cyrillic],
    
    //047A          ; CYRILLIC CAPITAL LETTER ROUND OMEGA
    "Ѻ": [.o, .extra0, .capital, .cyrillic],
    
    //047B          ; CYRILLIC SMALL LETTER ROUND OMEGA
    "ѻ": [.o, .extra0, .cyrillic],
    
    //047C          ; CYRILLIC CAPITAL LETTER OMEGA WITH TITLO
    "Ѽ": [.o, .o, .capital, .cyrillic, .titlo],
    
    //047D          ; CYRILLIC SMALL LETTER OMEGA WITH TITLO
    "ѽ": [.o, .o, .cyrillic, .titlo],
    
    //047E          ; CYRILLIC CAPITAL LETTER OT
    "Ѿ": [.o, .o, .t, .capital, .cyrillic],
    
    //047F          ; CYRILLIC SMALL LETTER OT
    "ѿ": [.o, .o, .t, .cyrillic],
    
    //0480          ; CYRILLIC CAPITAL LETTER KOPPA
    "Ҁ": [.q, .capital, .cyrillic],
    
    //0481          ; CYRILLIC SMALL LETTER KOPPA
    "ҁ": [.q, .cyrillic],
    
    //0482          ; CYRILLIC THOUSANDS SIGN
    "҂": [],
    
    //0483          ; COMBINING CYRILLIC TITLO
    "҃": [.titlo],
    
    //0484          ; COMBINING CYRILLIC PALATALIZATION
    "҄": [.palatalization],
    
    //0485          ; COMBINING CYRILLIC DASIA PNEUMATA
    "҅": [.dasia, .cyrillic],
    
    //0486          ; COMBINING CYRILLIC PSILI PNEUMATA
    "҆": [.psili, .cyrillic],
    
    //0487          ; COMBINING CYRILLIC POKRYTIE
    "҇": [.pokrytie],
    
    //0488          ; COMBINING CYRILLIC HUNDRED THOUSANDS SIGN
    "҈": [],
    
    //0489          ; COMBINING CYRILLIC MILLIONS SIGN
    "҉": [],
    
    //048A          ; CYRILLIC CAPITAL LETTER SHORT I WITH TAIL
    "Ҋ": [.i, .capital, .cyrillic, .tail],
    
    //048B          ; CYRILLIC SMALL LETTER SHORT I WITH TAIL
    "ҋ": [.i, .cyrillic, .tail],
    
    //048C          ; CYRILLIC CAPITAL LETTER SEMISOFT SIGN
    "Ҍ": [.j, .extra0, .stroke, .capital, .cyrillic],
    
    //048D          ; CYRILLIC SMALL LETTER SEMISOFT SIGN
    "ҍ": [.j, .extra0, .stroke, .cyrillic],
    
    //048E          ; CYRILLIC CAPITAL LETTER ER WITH TICK
    "Ҏ": [.r, .capital, .stroke, .cyrillic],
    
    //048F          ; CYRILLIC SMALL LETTER ER WITH TICK
    "ҏ": [.r, .stroke, .cyrillic],
    
    //0490          ; CYRILLIC CAPITAL LETTER GHE WITH UPTURN
    "Ґ": [.g, .capital, .extra0, .cyrillic],
    
    //0491          ; CYRILLIC SMALL LETTER GHE WITH UPTURN
    "ґ": [.g, .extra0, .cyrillic],
    
    //0492          ; CYRILLIC CAPITAL LETTER GHE WITH STROKE
    "Ғ": [.g, .capital, .stroke, .cyrillic],
    
    //0493          ; CYRILLIC SMALL LETTER GHE WITH STROKE
    "ғ": [.g, .stroke, .cyrillic],
    
    //0494          ; CYRILLIC CAPITAL LETTER GHE WITH MIDDLE HOOK
    "Ҕ": [.g, .capital, .hook, .cyrillic],
    
    //0495          ; CYRILLIC SMALL LETTER GHE WITH MIDDLE HOOK
    "ҕ": [.g, .hook, .cyrillic],
    
    //0496          ; CYRILLIC CAPITAL LETTER ZHE WITH DESCENDER
    "Җ": [.z, .extraH, .capital, .cyrillic, .descender],
    
    //0497          ; CYRILLIC SMALL LETTER ZHE WITH DESCENDER
    "җ": [.z, .extraH, .cyrillic, .descender],
    
    //0498          ; CYRILLIC CAPITAL LETTER ZE WITH DESCENDER
    "Ҙ": [.z, .capital, .cyrillic, .descender],
    
    //0499          ; CYRILLIC SMALL LETTER ZE WITH DESCENDER
    "ҙ": [.z, .cyrillic, .descender],
    
    //049A          ; CYRILLIC CAPITAL LETTER KA WITH DESCENDER
    "Қ": [.k, .capital, .cyrillic, .descender],
    
    //049B          ; CYRILLIC SMALL LETTER KA WITH DESCENDER
    "қ": [.k, .cyrillic, .descender],
    
    //049C          ; CYRILLIC CAPITAL LETTER KA WITH VERTICAL STROKE
    "Ҝ": [.k, .capital, .cyrillic, .verticalStroke],
    
    //049D          ; CYRILLIC SMALL LETTER KA WITH VERTICAL STROKE
    "ҝ": [.k, .cyrillic, .verticalStroke],
    
    //049E          ; CYRILLIC CAPITAL LETTER KA WITH STROKE
    "Ҟ": [.k, .capital, .cyrillic, .stroke],
    
    //049F          ; CYRILLIC SMALL LETTER KA WITH STROKE
    "ҟ": [.k, .cyrillic, .stroke],
    
    //04A0          ; CYRILLIC CAPITAL LETTER BASHKIR KA
    "Ҡ": [.k, .capital, .cyrillic, .extra0],
    
    //04A1          ; CYRILLIC SMALL LETTER BASHKIR KA
    "ҡ": [.k, .cyrillic, .extra0],
    
    //04A2          ; CYRILLIC CAPITAL LETTER EN WITH DESCENDER
    "Ң": [.n, .capital, .cyrillic, .descender],
    
    //04A3          ; CYRILLIC SMALL LETTER EN WITH DESCENDER
    "ң": [.n, .cyrillic, .descender],
    
    //04A4          ; CYRILLIC CAPITAL LIGATURE EN GHE
    "Ҥ": [.n, .g, .capital, .cyrillic],
    
    //04A5          ; CYRILLIC SMALL LIGATURE EN GHE
    "ҥ": [.n, .g, .cyrillic],
    
    //04A6          ; CYRILLIC CAPITAL LETTER PE WITH MIDDLE HOOK
    "Ҧ": [.p, .capital, .cyrillic, .hook],
    
    //04A7          ; CYRILLIC SMALL LETTER PE WITH MIDDLE HOOK
    "ҧ": [.p, .cyrillic, .hook],
    
    //04A8          ; CYRILLIC CAPITAL LETTER ABKHASIAN HA
    "Ҩ": [.o, .capital, .cyrillic, .curl],
    
    //04A9          ; CYRILLIC SMALL LETTER ABKHASIAN HA
    "ҩ": [.o, .cyrillic, .curl],
    
    //04AA          ; CYRILLIC CAPITAL LETTER ES WITH DESCENDER
    "Ҫ": [.s, .capital, .cyrillic, .descender],
    
    //04AB          ; CYRILLIC SMALL LETTER ES WITH DESCENDER
    "ҫ": [.s, .cyrillic, .descender],
    
    //04AC          ; CYRILLIC CAPITAL LETTER TE WITH DESCENDER
    "Ҭ": [.t, .capital, .cyrillic, .descender],
    
    //04AD          ; CYRILLIC SMALL LETTER TE WITH DESCENDER
    "ҭ": [.t, .cyrillic, .descender],
    
    //04AE          ; CYRILLIC CAPITAL LETTER STRAIGHT U
    "Ү": [.u, .capital, .cyrillic, .extra0],

    //04AF          ; CYRILLIC SMALL LETTER STRAIGHT U
    "ү": [.u, .cyrillic, .extra0],

    //04B0          ; CYRILLIC CAPITAL LETTER STRAIGHT U WITH STROKE
    "Ұ": [.u, .capital, .cyrillic, .extra0, .stroke],

    //04B1          ; CYRILLIC SMALL LETTER STRAIGHT U WITH STROKE
    "ұ": [.u, .cyrillic, .extra0, .stroke],

    //04B2          ; CYRILLIC CAPITAL LETTER HA WITH DESCENDER
    "Ҳ": [.h, .capital, .cyrillic, .descender],

    //04B3          ; CYRILLIC SMALL LETTER HA WITH DESCENDER
    "ҳ": [.h, .cyrillic, .descender],

    //04B4          ; CYRILLIC CAPITAL LIGATURE TE TSE
    "Ҵ": [.t, .c, .capital, .cyrillic],

    //04B5          ; CYRILLIC SMALL LIGATURE TE TSE
    "ҵ": [.t, .c, .cyrillic],

    //04B6          ; CYRILLIC CAPITAL LETTER CHE WITH DESCENDER
    "Ҷ": [.c, .extraH, .capital, .cyrillic, .descender],

    //04B7          ; CYRILLIC SMALL LETTER CHE WITH DESCENDER
    "ҷ": [.c, .extraH, .cyrillic, .descender],

    //04B8          ; CYRILLIC CAPITAL LETTER CHE WITH VERTICAL STROKE
    "Ҹ": [.c, .extraH, .capital, .cyrillic, .verticalStroke],

    //04B9          ; CYRILLIC SMALL LETTER CHE WITH VERTICAL STROKE
    "ҹ": [.c, .extraH, .cyrillic, .verticalStroke],

    //04BA          ; CYRILLIC CAPITAL LETTER SHHA
    "Һ": [.h, .capital, .cyrillic, .extra0],

    //04BB          ; CYRILLIC SMALL LETTER SHHA
    "һ": [.h, .cyrillic, .extra0],

    //04BC          ; CYRILLIC CAPITAL LETTER ABKHASIAN CHE
    "Ҽ": [.c, .extraH, .capital, .cyrillic, .extra2],

    //04BD          ; CYRILLIC SMALL LETTER ABKHASIAN CHE
    "ҽ": [.c, .extraH, .cyrillic, .extra2],

    //04BE          ; CYRILLIC CAPITAL LETTER ABKHASIAN CHE WITH DESCENDER
    "Ҿ": [.c, .extraH, .capital, .cyrillic, .extra2, .descender],

    //04BF          ; CYRILLIC SMALL LETTER ABKHASIAN CHE WITH DESCENDER
    "ҿ": [.c, .extraH, .cyrillic, .extra2, .descender],

    //04C0          ; CYRILLIC LETTER PALOCHKA
    "Ӏ": [.h, .extraH, .capital, .cyrillic],

    //04C1          ; CYRILLIC CAPITAL LETTER ZHE WITH BREVE
    "Ӂ": [.z, .extraH, .capital, .cyrillic, .breve, .above],

    //04C2          ; CYRILLIC SMALL LETTER ZHE WITH BREVE
    "ӂ": [.z, .extraH, .cyrillic, .breve, .above],

    //04C3          ; CYRILLIC CAPITAL LETTER KA WITH HOOK
    "Ӄ": [.k, .capital, .cyrillic, .hook],

    //04C4          ; CYRILLIC SMALL LETTER KA WITH HOOK
    "ӄ": [.k, .cyrillic, .hook],

    //04C5          ; CYRILLIC CAPITAL LETTER EL WITH TAIL
    "Ӆ": [.l, .capital, .cyrillic, .tail],

    //04C6          ; CYRILLIC SMALL LETTER EL WITH TAIL
    "ӆ": [.l, .cyrillic, .tail],

    //04C7          ; CYRILLIC CAPITAL LETTER EN WITH HOOK
    "Ӈ": [.n, .capital, .cyrillic, .hook],

    //04C8          ; CYRILLIC SMALL LETTER EN WITH HOOK
    "ӈ": [.n, .cyrillic, .hook],

    //04C9          ; CYRILLIC CAPITAL LETTER EN WITH TAIL
    "Ӊ": [.n, .capital, .cyrillic, .tail],

    //04CA          ; CYRILLIC SMALL LETTER EN WITH TAIL
    "ӊ": [.n, .cyrillic, .tail],

    //04CB          ; CYRILLIC CAPITAL LETTER KHAKASSIAN CHE
    "Ӌ": [.c, .extraH, .capital, .cyrillic, .extra1],

    //04CC          ; CYRILLIC SMALL LETTER KHAKASSIAN CHE
    "ӌ": [.c, .extraH, .cyrillic, .extra1],

    //04CD          ; CYRILLIC CAPITAL LETTER EM WITH TAIL
    "Ӎ": [.m, .capital, .cyrillic, .tail],

    //04CE          ; CYRILLIC SMALL LETTER EM WITH TAIL
    "ӎ": [.m, .cyrillic, .tail],

    //04CF          ; CYRILLIC SMALL LETTER PALOCHKA
    "ӏ": [.h, .extraH, .cyrillic],

    //04D0          ; CYRILLIC CAPITAL LETTER A WITH BREVE
    "Ӑ": [.a, .capital, .cyrillic, .breve, .above],

    //04D1          ; CYRILLIC SMALL LETTER A WITH BREVE
    "ӑ": [.a, .cyrillic, .breve, .above],

    //04D2          ; CYRILLIC CAPITAL LETTER A WITH DIAERESIS
    "Ӓ": [.a, .capital, .cyrillic, .diaeresis, .above],

    //04D3          ; CYRILLIC SMALL LETTER A WITH DIAERESIS
    "ӓ": [.a, .cyrillic, .diaeresis, .above],

    //04D4          ; CYRILLIC CAPITAL LIGATURE A IE
    "Ӕ": [.a, .e, .capital, .cyrillic],

    //04D5          ; CYRILLIC SMALL LIGATURE A IE
    "ӕ": [.a, .e, .cyrillic],

    //04D6          ; CYRILLIC CAPITAL LETTER IE WITH BREVE
    "Ӗ": [.e, .capital, .cyrillic, .breve, .above],

    //04D7          ; CYRILLIC SMALL LETTER IE WITH BREVE
    "ӗ": [.e, .cyrillic, .breve, .above],

    //04D8          ; CYRILLIC CAPITAL LETTER SCHWA
    "Ә": [.a, .extra0, .capital, .cyrillic],

    //04D9          ; CYRILLIC SMALL LETTER SCHWA
    "ә": [.a, .extra0, .cyrillic],

    //04DA          ; CYRILLIC CAPITAL LETTER SCHWA WITH DIAERESIS
    "Ӛ": [.a, .extra0, .capital, .cyrillic, .diaeresis, .above],

    //04DB          ; CYRILLIC SMALL LETTER SCHWA WITH DIAERESIS
    "ӛ": [.a, .extra0, .cyrillic, .diaeresis, .above],

    //04DC          ; CYRILLIC CAPITAL LETTER ZHE WITH DIAERESIS
    "Ӝ": [.z, .extraH, .capital, .cyrillic, .diaeresis, .above],

    //04DD          ; CYRILLIC SMALL LETTER ZHE WITH DIAERESIS
    "ӝ": [.z, .extraH, .cyrillic, .diaeresis, .above],

    //04DE          ; CYRILLIC CAPITAL LETTER ZE WITH DIAERESIS
    "Ӟ": [.z, .capital, .cyrillic, .diaeresis, .above],

    //04DF          ; CYRILLIC SMALL LETTER ZE WITH DIAERESIS
    "ӟ": [.z, .cyrillic, .diaeresis, .above],

    //04E0          ; CYRILLIC CAPITAL LETTER ABKHASIAN DZE
    "Ӡ": [.d, .z, .capital, .cyrillic, .extra0],

    //04E1          ; CYRILLIC SMALL LETTER ABKHASIAN DZE
    "ӡ": [.d, .z, .cyrillic, .extra0],

    //04E2          ; CYRILLIC CAPITAL LETTER I WITH MACRON
    "Ӣ": [.i, .capital, .cyrillic, .macron, .above],

    //04E3          ; CYRILLIC SMALL LETTER I WITH MACRON
    "ӣ": [.i, .cyrillic, .macron, .above],

    //04E4          ; CYRILLIC CAPITAL LETTER I WITH DIAERESIS
    "Ӥ": [.i, .capital, .cyrillic, .diaeresis, .above],

    //04E5          ; CYRILLIC SMALL LETTER I WITH DIAERESIS
    "ӥ": [.i, .cyrillic, .diaeresis, .above],

    //04E6          ; CYRILLIC CAPITAL LETTER O WITH DIAERESIS
    "Ӧ": [.o, .capital, .cyrillic, .diaeresis, .above],

    //04E7          ; CYRILLIC SMALL LETTER O WITH DIAERESIS
    "ӧ": [.o, .cyrillic, .diaeresis, .above],

    //04E8          ; CYRILLIC CAPITAL LETTER BARRED O
    "Ө": [.o, .stroke, .capital, .cyrillic],

    //04E9          ; CYRILLIC SMALL LETTER BARRED O
    "ө": [.o, .stroke, .cyrillic],

    //04EA          ; CYRILLIC CAPITAL LETTER BARRED O WITH DIAERESIS
    "Ӫ": [.o, .stroke, .capital, .cyrillic, .diaeresis, .above],

    //04EB          ; CYRILLIC SMALL LETTER BARRED O WITH DIAERESIS
    "ӫ": [.o, .stroke, .cyrillic, .diaeresis, .above],

    //04EC          ; CYRILLIC CAPITAL LETTER E WITH DIAERESIS
    "Ӭ": [.e, .capital, .cyrillic, .turned, .diaeresis, .above],

    //04ED          ; CYRILLIC SMALL LETTER E WITH DIAERESIS
    "ӭ": [.e, .cyrillic, .turned, .diaeresis, .above],

    //04EE          ; CYRILLIC CAPITAL LETTER U WITH MACRON
    "Ӯ": [.u, .capital, .cyrillic, .macron, .above],

    //04EF          ; CYRILLIC SMALL LETTER U WITH MACRON
    "ӯ": [.u, .cyrillic, .macron, .above],

    //04F0          ; CYRILLIC CAPITAL LETTER U WITH DIAERESIS
    "Ӱ": [.u, .capital, .cyrillic, .diaeresis, .above],

    //04F1          ; CYRILLIC SMALL LETTER U WITH DIAERESIS
    "ӱ": [.u, .cyrillic, .diaeresis, .above],

    //04F2          ; CYRILLIC CAPITAL LETTER U WITH DOUBLE ACUTE
    "Ӳ": [.u, .capital, .cyrillic, .acute, .doubled, .above],

    //04F3          ; CYRILLIC SMALL LETTER U WITH DOUBLE ACUTE
    "ӳ": [.u, .cyrillic, .acute, .doubled, .above],

    //04F4          ; CYRILLIC CAPITAL LETTER CHE WITH DIAERESIS
    "Ӵ": [.c, .extraH, .capital, .cyrillic, .diaeresis, .above],

    //04F5          ; CYRILLIC SMALL LETTER CHE WITH DIAERESIS
    "ӵ": [.c, .extraH, .cyrillic, .diaeresis, .above],

    //04F6          ; CYRILLIC CAPITAL LETTER GHE WITH DESCENDER
    "Ӷ": [.g, .capital, .cyrillic, .descender],

    //04F7          ; CYRILLIC SMALL LETTER GHE WITH DESCENDER
    "ӷ": [.g, .cyrillic, .descender],

    //04F8          ; CYRILLIC CAPITAL LETTER YERU WITH DIAERESIS
    "Ӹ": [.y, .capital, .cyrillic, .diaeresis, .above],

    //04F9          ; CYRILLIC SMALL LETTER YERU WITH DIAERESIS
    "ӹ": [.y, .cyrillic, .diaeresis, .above],

    //04FA          ; CYRILLIC CAPITAL LETTER GHE WITH STROKE AND HOOK
    "Ӻ": [.g, .capital, .cyrillic, .stroke, .hook],

    //04FB          ; CYRILLIC SMALL LETTER GHE WITH STROKE AND HOOK
    "ӻ": [.g, .cyrillic, .stroke, .hook],

    //04FC          ; CYRILLIC CAPITAL LETTER HA WITH HOOK
    "Ӽ": [.h, .capital, .cyrillic, .hook],

    //04FD          ; CYRILLIC SMALL LETTER HA WITH HOOK
    "ӽ": [.h, .cyrillic, .hook],

    //04FE          ; CYRILLIC CAPITAL LETTER HA WITH STROKE
    "Ӿ": [.h, .capital, .cyrillic, .stroke],

    //04FF          ; CYRILLIC SMALL LETTER HA WITH STROKE
    "ӿ": [.h, .cyrillic, .stroke],


    // MARK: - 1AB0..1AFF; Combining Diacritical Marks Extended
    
    //1AB0          ; COMBINING DOUBLED CIRCUMFLEX ACCENT
    "᪰": [.circumflex, .doubled, .above],

    //1AB1          ; COMBINING DIAERESIS-RING
    "᪱": [.diaeresis, .ring, .above],

    //1AB2          ; COMBINING INFINITY
    "᪲": [.zero, .extra1, .above],

    //1AB3          ; COMBINING DOWNWARDS ARROW
    "᪳": [.verticalLine, .above, .lessThanSign],

    //1AB4          ; COMBINING TRIPLE DOT
    "᪴": [.diaeresis, .dot, .above],

    //1AB5          ; COMBINING X-X BELOW
    "᪵": [.cross, .doubled, .below],

    //1AB6          ; COMBINING WIGGLY LINE BELOW
    "᪶": [.line, .w, .below],

    //1AB7          ; COMBINING OPEN MARK BELOW
    "᪷": [.extraH, .below],

    //1AB8          ; COMBINING DOUBLE OPEN MARK BELOW
    "᪸": [.extraH, .doubled, .below],

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
    "ᴆ": [.d, .extraH, .smallCapital],

    //1D07          ; LATIN LETTER SMALL CAPITAL E
    "ᴇ": [.e, .smallCapital],

    //1D08          ; LATIN SMALL LETTER TURNED OPEN E
    "ᴈ": [.e, .extraH, .turned],

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
    "ᴏ": [.o, .smallCapital],

    //1D10          ; LATIN LETTER SMALL CAPITAL OPEN O
    "ᴐ": [.o, .extraH, .smallCapital],

    //1D11          ; LATIN SMALL LETTER SIDEWAYS O
    "ᴑ": [.o, .sideways],

    //1D12          ; LATIN SMALL LETTER SIDEWAYS OPEN O
    "ᴒ": [.o, .extraH, .sideways],

    //1D13          ; LATIN SMALL LETTER SIDEWAYS O WITH STROKE
    "ᴓ": [.o, .diagonalStroke, .sideways],

    //1D14          ; LATIN SMALL LETTER TURNED OE
    "ᴔ": [.o, .e, .turned],

    //1D15          ; LATIN LETTER SMALL CAPITAL OU
    "ᴕ": [.o, .u, .smallCapital],

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
    "ᴣ": [.z, .extraH, .smallCapital],

    //1D24          ; LATIN LETTER VOICED LARYNGEAL SPIRANT
    "ᴤ": [.h, .hook, .extraH],

    //1D25          ; LATIN LETTER AIN
    "ᴥ": [.ain],

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
    "ᴫ": [.l, .cyrillic, .smallCapital],

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
    "ᴽ": [.o, .u, .capital, .superscript],

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
    "ᵅ": [.a, .extraH, .superscript],

    //1D46          ; MODIFIER LETTER SMALL TURNED AE
    "ᵆ": [.a, .e, .turned, .superscript],

    //1D47          ; MODIFIER LETTER SMALL B
    "ᵇ": [.b, .superscript],

    //1D48          ; MODIFIER LETTER SMALL D
    "ᵈ": [.d, .superscript],

    //1D49          ; MODIFIER LETTER SMALL E
    "ᵉ": [.e, .superscript],

    //1D4A          ; MODIFIER LETTER SMALL SCHWA
    "ᵊ": [.a, .extra0, .superscript],

    //1D4B          ; MODIFIER LETTER SMALL OPEN E
    "ᵋ": [.e, .extraH, .superscript],

    //1D4C          ; MODIFIER LETTER SMALL TURNED OPEN E
    "ᵌ": [.e, .extraH, .turned, .superscript],

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
    "ᵓ": [.o, .extraH, .superscript],

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
    "ᵜ": [.ain, .superscript],

    //1D5D          ; MODIFIER LETTER SMALL BETA
    "ᵝ": [.b, .extraH, .superscript],

    //1D5E          ; MODIFIER LETTER SMALL GREEK GAMMA
    "ᵞ": [.g, .greek, .superscript],

    //1D5F          ; MODIFIER LETTER SMALL DELTA
    "ᵟ": [.d, .extraH, .extra1, .superscript],

    //1D60          ; MODIFIER LETTER SMALL GREEK PHI
    "ᵠ": [.p, .greek, .superscript],

    //1D61          ; MODIFIER LETTER SMALL CHI
    "ᵡ": [.x, .extraH, .superscript],

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
    "ᵩ": [.p, .greek, .subscript],

    //1D6A          ; GREEK SUBSCRIPT SMALL LETTER CHI
    "ᵪ": [.x, .extraH, .greek, .subscript],

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
    "ᵸ": [.n, .cyrillic, .superscript],

    //1D79          ; LATIN SMALL LETTER INSULAR G
    "ᵹ": [.g, .insular],

    //1D7A          ; LATIN SMALL LETTER TH WITH STRIKETHROUGH
    "ᵺ": [.t, .h],

    //1D7B          ; LATIN SMALL CAPITAL LETTER I WITH STROKE
    "ᵻ": [.i, .smallCapital, .stroke],

    //1D7C          ; LATIN SMALL LETTER IOTA WITH STROKE
    "ᵼ": [.i, .extraH, .stroke],

    //1D7D          ; LATIN SMALL LETTER P WITH STROKE
    "ᵽ": [.p, .stroke],

    //1D7E          ; LATIN SMALL CAPITAL LETTER U WITH STROKE
    "ᵾ": [.u, .smallCapital, .stroke],

    //1D7F          ; LATIN SMALL LETTER UPSILON WITH STROKE
    "ᵿ": [.u, .extraH, .stroke],

    
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
    "ᶋ": [.s, .extraH, .palatalHook],

    //1D8C          ; LATIN SMALL LETTER V WITH PALATAL HOOK
    "ᶌ": [.v, .palatalHook],

    //1D8D          ; LATIN SMALL LETTER X WITH PALATAL HOOK
    "ᶍ": [.x, .palatalHook],

    //1D8E          ; LATIN SMALL LETTER Z WITH PALATAL HOOK
    "ᶎ": [.z, .palatalHook],

    //1D8F          ; LATIN SMALL LETTER A WITH RETROFLEX HOOK
    "ᶏ": [.a, .retroflexHook],

    //1D90          ; LATIN SMALL LETTER ALPHA WITH RETROFLEX HOOK
    "ᶐ": [.a, .extraH, .retroflexHook],

    //1D91          ; LATIN SMALL LETTER D WITH HOOK AND TAIL
    "ᶑ": [.d, .retroflexHook, .hook],

    //1D92          ; LATIN SMALL LETTER E WITH RETROFLEX HOOK
    "ᶒ": [.e, .retroflexHook],

    //1D93          ; LATIN SMALL LETTER OPEN E WITH RETROFLEX HOOK
    "ᶓ": [.e, .extraH, .retroflexHook],

    //1D94          ; LATIN SMALL LETTER REVERSED OPEN E WITH RETROFLEX HOOK
    "ᶔ": [.e, .extraH, .retroflexHook, .reversed],

    //1D95          ; LATIN SMALL LETTER SCHWA WITH RETROFLEX HOOK
    "ᶕ": [.a, .extra0, .retroflexHook],

    //1D96          ; LATIN SMALL LETTER I WITH RETROFLEX HOOK
    "ᶖ": [.i, .retroflexHook],

    //1D97          ; LATIN SMALL LETTER OPEN O WITH RETROFLEX HOOK
    "ᶗ": [.o, .extraH, .retroflexHook],

    //1D98          ; LATIN SMALL LETTER ESH WITH RETROFLEX HOOK
    "ᶘ": [.s, .extraH, .retroflexHook],

    //1D99          ; LATIN SMALL LETTER U WITH RETROFLEX HOOK
    "ᶙ": [.u, .retroflexHook],

    //1D9A          ; LATIN SMALL LETTER EZH WITH RETROFLEX HOOK
    "ᶚ": [.z, .extraH, .retroflexHook],

    //1D9B          ; MODIFIER LETTER SMALL TURNED ALPHA
    "ᶛ": [.a, .extraH, .turned, .superscript],

    //1D9C          ; MODIFIER LETTER SMALL C
    "ᶜ": [.c, .superscript],

    //1D9D          ; MODIFIER LETTER SMALL C WITH CURL
    "ᶝ": [.s, .curl, .superscript],

    //1D9E          ; MODIFIER LETTER SMALL ETH
    "ᶞ": [.d, .extraH, .superscript],

    //1D9F          ; MODIFIER LETTER SMALL REVERSED OPEN E
    "ᶟ": [.e, .extraH, .reversed, .superscript],

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
    "ᶥ": [.i, .extraH, .superscript],

    //1DA6          ; MODIFIER LETTER SMALL CAPITAL I
    "ᶦ": [.i, .smallCapital, .superscript],

    //1DA7          ; MODIFIER LETTER SMALL CAPITAL I WITH STROKE
    "ᶧ": [.i, .smallCapital, .stroke, .superscript],

    //1DA8          ; MODIFIER LETTER SMALL J WITH CROSSED-TAIL
    "ᶨ": [.j, .curl, .superscript],

    //1DA9          ; MODIFIER LETTER SMALL L WITH RETROFLEX HOOK
    "ᶩ": [.l, .retroflexHook, .superscript],

    //1DAA          ; MODIFIER LETTER SMALL L WITH PALATAL HOOK
    "ᶪ": [.l, .palatalHook, .superscript],

    //1DAB          ; MODIFIER LETTER SMALL CAPITAL L
    "ᶫ": [.l, .smallCapital, .superscript],

    //1DAC          ; MODIFIER LETTER SMALL M WITH HOOK
    "ᶬ": [.m, .hook, .superscript],

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
    "ᶲ": [.p, .extraH, .superscript],

    //1DB3          ; MODIFIER LETTER SMALL S WITH HOOK
    "ᶳ": [.s, .retroflexHook, .superscript],

    //1DB4          ; MODIFIER LETTER SMALL ESH
    "ᶴ": [.s, .extraH, .superscript],

    //1DB5          ; MODIFIER LETTER SMALL T WITH PALATAL HOOK
    "ᶵ": [.t, .palatalHook, .superscript],

    //1DB6          ; MODIFIER LETTER SMALL U BAR
    "ᶶ": [.u, .stroke, .superscript],

    //1DB7          ; MODIFIER LETTER SMALL UPSILON
    "ᶷ": [.u, .extraH, .superscript],

    //1DB8          ; MODIFIER LETTER SMALL CAPITAL U
    "ᶸ": [.u, .smallCapital, .superscript],

    //1DB9          ; MODIFIER LETTER SMALL V WITH HOOK
    "ᶹ": [.v, .extraH, .superscript],

    //1DBA          ; MODIFIER LETTER SMALL TURNED V
    "ᶺ": [.v, .turned, .superscript],

    //1DBB          ; MODIFIER LETTER SMALL Z
    "ᶻ": [.z, .superscript],

    //1DBC          ; MODIFIER LETTER SMALL Z WITH RETROFLEX HOOK
    "ᶼ": [.z, .retroflexHook, .superscript],

    //1DBD          ; MODIFIER LETTER SMALL Z WITH CURL
    "ᶽ": [.z, .curl, .superscript],

    //1DBE          ; MODIFIER LETTER SMALL EZH
    "ᶾ": [.z, .extraH, .superscript],

    //1DBF          ; MODIFIER LETTER SMALL THETA
    "ᶿ": [.t, .extraH, .superscript],

    
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
    "ᷓ": [.breve, .doubled, .above],

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
    "ᷙ": [.d, .extraH, .above],

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
    "ᷧ": [.a, .extraH, .above],

    //1DE8          ; COMBINING LATIN SMALL LETTER B
    "ᷨ": [.b, .above],

    //1DE9          ; COMBINING LATIN SMALL LETTER BETA
    "ᷩ": [.b, .extraH, .above],

    //1DEA          ; COMBINING LATIN SMALL LETTER SCHWA
    "ᷪ": [.a, .extra0, .above],

    //1DEB          ; COMBINING LATIN SMALL LETTER F
    "ᷫ": [.f, .above],

    //1DEC          ; COMBINING LATIN SMALL LETTER L WITH DOUBLE MIDDLE TILDE
    "ᷬ": [.l, .above, .tilde, .doubled],

    //1DED          ; COMBINING LATIN SMALL LETTER O WITH LIGHT CENTRALIZATION STROKE
    "ᷭ": [.o, .above, .lightCentralizationStroke],

    //1DEE          ; COMBINING LATIN SMALL LETTER P
    "ᷮ": [.p, .above],

    //1DEF          ; COMBINING LATIN SMALL LETTER ESH
    "ᷯ": [.s, .extraH, .above],

    //1DF0          ; COMBINING LATIN SMALL LETTER U WITH LIGHT CENTRALIZATION STROKE
    "ᷰ": [.u, .above, .lightCentralizationStroke],

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
    "᷿": [.arrowhead, .right, .arrowhead, .down, .below],

    
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
    "Ẕ": [.z, .capital, .macron, .below],

    //1E95          ; LATIN SMALL LETTER Z WITH LINE BELOW
    "ẕ": [.z, .macron, .below],

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
    "ẟ": [.d, .extraH, .extra1],

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
    "Ẹ": [.e, .capital, .dot, .below],

    //1EB9          ; LATIN SMALL LETTER E WITH DOT BELOW
    "ẹ": [.e, .dot, .below],

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
    "Ỿ": [.y, .curl, .capital],

    //1EFF          ; LATIN SMALL LETTER Y WITH LOOP
    "ỿ": [.y, .curl],

    
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
    "‘": [.apostrophe, .extraUpLeft],

    //2019          ; RIGHT SINGLE QUOTATION MARK
    "’": [.apostrophe, .extraUpRight],

    //201A          ; SINGLE LOW-9 QUOTATION MARK
    "‚": [.apostrophe, .extraDownLeft],

    //201B          ; SINGLE HIGH-REVERSED-9 QUOTATION MARK
    "‛": [.apostrophe, .extraUpRight, .reversed],

    //201C          ; LEFT DOUBLE QUOTATION MARK
    "“": [.quotationMark, .extraUpLeft],

    //201D          ; RIGHT DOUBLE QUOTATION MARK
    "”": [.quotationMark, .extraUpRight],

    //201E          ; DOUBLE LOW-9 QUOTATION MARK
    "„": [.quotationMark, .extraDownLeft],

    //201F          ; DOUBLE HIGH-REVERSED-9 QUOTATION MARK
    "‟": [.quotationMark, .extraUpRight, .reversed],

    //2020          ; DAGGER
    "†": [.asterisk, .extra1],

    //2021          ; DOUBLE DAGGER
    "‡": [.asterisk, .extra1, .doubled],

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
    "‰": [.percentSign, .percentSign],

    //2031          ; PER TEN THOUSAND SIGN
    "‱": [.percentSign, .percentSign, .percentSign],

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
    "‹": [.apostrophe, .extraLeft],

    //203A          ; SINGLE RIGHT-POINTING ANGLE QUOTATION MARK
    "›": [.apostrophe, .extraRight],

    //203B          ; REFERENCE MARK
    "※": [],

    //203C          ; DOUBLE EXCLAMATION MARK
    "‼": [.exclamationMark, .exclamationMark],

    //203D          ; INTERROBANG
    "‽": [.interrobang],

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
    "⁆": [.squareBracket, .stroke, .reversed],

    //2047          ; DOUBLE QUESTION MARK
    "⁇": [.questionMark, .questionMark],

    //2048          ; QUESTION EXCLAMATION MARK
    "⁈": [.questionMark, .exclamationMark],

    //2049          ; EXCLAMATION QUESTION MARK
    "⁉": [.exclamationMark, .questionMark],

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
    "⁢": [],

    //2063          ; INVISIBLE SEPARATOR
    "⁣": [],

    //2064          ; INVISIBLE PLUS
    "⁤": [],

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
    "⁾": [.parenthesis, .reversed, .superscript],

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
    "₎": [.parenthesis, .reversed, .subscript],

    //2090          ; LATIN SUBSCRIPT SMALL LETTER A
    "ₐ": [.a, .subscript],

    //2091          ; LATIN SUBSCRIPT SMALL LETTER E
    "ₑ": [.e, .subscript],

    //2092          ; LATIN SUBSCRIPT SMALL LETTER O
    "ₒ": [.o, .subscript],

    //2093          ; LATIN SUBSCRIPT SMALL LETTER X
    "ₓ": [.x, .subscript],

    //2094          ; LATIN SUBSCRIPT SMALL LETTER SCHWA
    "ₔ": [.a, .extra0, .subscript],

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
    "⃒": [.verticalLineOverlay, .combining],

    //20D3          ; COMBINING SHORT VERTICAL LINE OVERLAY
    "⃓": [.verticalLineOverlay, .combining, .short],

    //20D4          ; COMBINING ANTICLOCKWISE ARROW ABOVE
    "⃔": [.breve, .above, .lessThanSign],

    //20D5          ; COMBINING CLOCKWISE ARROW ABOVE
    "⃕": [.breve, .above, .greaterThanSign],

    //20D6          ; COMBINING LEFT ARROW ABOVE
    "⃖": [.macron, .above, .lessThanSign],

    //20D7          ; COMBINING RIGHT ARROW ABOVE
    "⃗": [.macron, .above, .greaterThanSign],

    //20D8          ; COMBINING RING OVERLAY
    "⃘": [.ringOverlay, .combining],

    //20D9          ; COMBINING CLOCKWISE RING OVERLAY
    "⃙": [.ringOverlay, .combining, .greaterThanSign],

    //20DA          ; COMBINING ANTICLOCKWISE RING OVERLAY
    "⃚": [.ringOverlay, .combining, .lessThanSign],

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
    "⃪": [.stroke, .lessThanSign, .combining],

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
    "ℓ": [.l, .letterScript],

    //2114          ; L B BAR SYMBOL
    "℔": [.l, .b],

    //2115          ; DOUBLE-STRUCK CAPITAL N
    "ℕ": [.n, .capital, .doubleStruck],

    //2116          ; NUMERO SIGN
    "№": [.numberSign, .extra0],

    //2117          ; SOUND RECORDING COPYRIGHT
    "℗": [],

    //2118          ; SCRIPT CAPITAL P
    "℘": [.p, .capital, .letterScript],

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
    "ⅎ": [.f, .turned],

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
    "≍": [.equalsSign, .breve],

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
    "≬": [.parenthesis, .parenthesis, .reversed],

    //226D          ; NOT EQUIVALENT TO
    "≭": [.equalsSign, .breve, .not],

    //226E          ; NOT LESS-THAN
    "≮": [.lessThanSign, .not],

    //226F          ; NOT GREATER-THAN
    "≯": [.greaterThanSign, .not],

    //2270          ; NEITHER LESS-THAN NOR EQUAL TO
    "≰": [.lessThanSign, .equalsSign, .not],

    //2271          ; NEITHER GREATER-THAN NOR EQUAL TO
    "≱": [.greaterThanSign, .equalsSign, .not],

    //2272          ; LESS-THAN OR EQUIVALENT TO
    "≲": [.lessThanSign, .tilde],

    //2273          ; GREATER-THAN OR EQUIVALENT TO
    "≳": [.greaterThanSign, .tilde],

    //2274          ; NEITHER LESS-THAN NOR EQUIVALENT TO
    "≴": [.lessThanSign, .tilde, .not],

    //2275          ; NEITHER GREATER-THAN NOR EQUIVALENT TO
    "≵": [.greaterThanSign, .tilde, .not],

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
    "⋦": [.lessThanSign, .tilde, .notLow],

    //22E7          ; GREATER-THAN BUT NOT EQUIVALENT TO
    "⋧": [.greaterThanSign, .tilde, .notLow],

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
    "⩪": [.tildeOperator, .dot, .above],

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
    "⩰": [.tilde, .doubled, .equalsSign, .doubled],

    //2A71          ; EQUALS SIGN ABOVE PLUS SIGN
    "⩱": [.equalsSign, .plusSign],

    //2A72          ; PLUS SIGN ABOVE EQUALS SIGN
    "⩲": [.plusSign, .equalsSign],

    //2A73          ; EQUALS SIGN ABOVE TILDE OPERATOR
    "⩳": [.equalsSign, .tilde],

    //2A74          ; DOUBLE COLON EQUAL
    "⩴": [.colon, .colon, .equalsSign],

    //2A75          ; TWO CONSECUTIVE EQUALS SIGNS
    "⩵": [.equalsSign, .equalsSign, .extra0],

    //2A76          ; THREE CONSECUTIVE EQUALS SIGNS
    "⩶": [.equalsSign, .equalsSign, .extra0, .equalsSign],

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
    "⪇": [.lessThanSign, .equalsSign, .notLow],

    //2A88          ; GREATER-THAN AND SINGLE-LINE NOT EQUAL TO
    "⪈": [.greaterThanSign, .equalsSign, .notLow],

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
    "⪤": [.greaterThanSign, .lessThanSign, .extra1],

    //2AA5          ; GREATER-THAN BESIDE LESS-THAN
    "⪥": [.greaterThanSign, .lessThanSign, .extra0],

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
    "⫬": [.tilde, .extra0, .doubled],

    //2AED          ; REVERSED DOUBLE STROKE NOT SIGN
    "⫭": [.tilde, .extra0, .doubled, .reversed],

    //2AEE          ; DOES NOT DIVIDE WITH REVERSED NEGATION SLASH
    "⫮": [],

    //2AEF          ; VERTICAL LINE WITH CIRCLE ABOVE
    "⫯": [.verticalLine, .ring, .above],

    //2AF0          ; VERTICAL LINE WITH CIRCLE BELOW
    "⫰": [.verticalLine, .ring, .below],

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

    
    // MARK: - 2C60..2C7F; Latin Extended-C
    
    //2C60          ; LATIN CAPITAL LETTER L WITH DOUBLE BAR
    "Ⱡ": [.l, .capital, .stroke, .doubled],

    //2C61          ; LATIN SMALL LETTER L WITH DOUBLE BAR
    "ⱡ": [.l, .stroke, .doubled],

    //2C62          ; LATIN CAPITAL LETTER L WITH MIDDLE TILDE
    "Ɫ": [.l, .capital, .tilde],

    //2C63          ; LATIN CAPITAL LETTER P WITH STROKE
    "Ᵽ": [.p, .capital, .stroke],

    //2C64          ; LATIN CAPITAL LETTER R WITH TAIL
    "Ɽ": [.r, .capital, .retroflexHook],

    //2C65          ; LATIN SMALL LETTER A WITH STROKE
    "ⱥ": [.a, .diagonalStroke],

    //2C66          ; LATIN SMALL LETTER T WITH DIAGONAL STROKE
    "ⱦ": [.t, .diagonalStroke],

    //2C67          ; LATIN CAPITAL LETTER H WITH DESCENDER
    "Ⱨ": [.h, .capital, .descender],

    //2C68          ; LATIN SMALL LETTER H WITH DESCENDER
    "ⱨ": [.h, .descender],

    //2C69          ; LATIN CAPITAL LETTER K WITH DESCENDER
    "Ⱪ": [.k, .capital, .descender],

    //2C6A          ; LATIN SMALL LETTER K WITH DESCENDER
    "ⱪ": [.k, .descender],

    //2C6B          ; LATIN CAPITAL LETTER Z WITH DESCENDER
    "Ⱬ": [.z, .capital, .descender],

    //2C6C          ; LATIN SMALL LETTER Z WITH DESCENDER
    "ⱬ": [.z, .descender],

    //2C6D          ; LATIN CAPITAL LETTER ALPHA
    "Ɑ": [.a, .extraH, .capital],

    //2C6E          ; LATIN CAPITAL LETTER M WITH HOOK
    "Ɱ": [.m, .capital, .hook],

    //2C6F          ; LATIN CAPITAL LETTER TURNED A
    "Ɐ": [.a, .capital, .turned],

    //2C70          ; LATIN CAPITAL LETTER TURNED ALPHA
    "Ɒ": [.a, .extraH, .capital, .turned],

    //2C71          ; LATIN SMALL LETTER V WITH RIGHT HOOK
    "ⱱ": [.v, .hook],

    //2C72          ; LATIN CAPITAL LETTER W WITH HOOK
    "Ⱳ": [.w, .capital, .hook],

    //2C73          ; LATIN SMALL LETTER W WITH HOOK
    "ⱳ": [.w, .hook],

    //2C74          ; LATIN SMALL LETTER V WITH CURL
    "ⱴ": [.v, .curl],

    //2C75          ; LATIN CAPITAL LETTER HALF H
    "Ⱶ": [.h, .capital, .leftHalf],

    //2C76          ; LATIN SMALL LETTER HALF H
    "ⱶ": [.h, .leftHalf],

    //2C77          ; LATIN SMALL LETTER TAILLESS PHI
    "ⱷ": [.p, .extraH, .longLeg],

    //2C78          ; LATIN SMALL LETTER E WITH NOTCH
    "ⱸ": [.e, .notch],

    //2C79          ; LATIN SMALL LETTER TURNED R WITH TAIL
    "ⱹ": [.r, .hook, .turned],

    //2C7A          ; LATIN SMALL LETTER O WITH LOW RING INSIDE
    "ⱺ": [.o, .ringBottom],

    //2C7B          ; LATIN LETTER SMALL CAPITAL TURNED E
    "ⱻ": [.e, .smallCapital, .turned],

    //2C7C          ; LATIN SUBSCRIPT SMALL LETTER J
    "ⱼ": [.j, .subscript],

    //2C7D          ; MODIFIER LETTER CAPITAL V
    "ⱽ": [.v, .capital, .superscript],

    //2C7E          ; LATIN CAPITAL LETTER S WITH SWASH TAIL
    "Ȿ": [.s, .capital, .tail],

    //2C7F          ; LATIN CAPITAL LETTER Z WITH SWASH TAIL
    "Ɀ": [.z, .capital, .tail],

    
    // MARK: - 2E00..2E7F; Supplemental Punctuation
    
    //2E00          ; RIGHT ANGLE SUBSTITUTION MARKER
    "⸀": [],

    //2E01          ; RIGHT ANGLE DOTTED SUBSTITUTION MARKER
    "⸁": [],

    //2E02          ; LEFT SUBSTITUTION BRACKET
    "⸂": [],

    //2E03          ; RIGHT SUBSTITUTION BRACKET
    "⸃": [],

    //2E04          ; LEFT DOTTED SUBSTITUTION BRACKET
    "⸄": [],

    //2E05          ; RIGHT DOTTED SUBSTITUTION BRACKET
    "⸅": [],

    //2E06          ; RAISED INTERPOLATION MARKER
    "⸆": [],

    //2E07          ; RAISED DOTTED INTERPOLATION MARKER
    "⸇": [],

    //2E08          ; DOTTED TRANSPOSITION MARKER
    "⸈": [],

    //2E09          ; LEFT TRANSPOSITION BRACKET
    "⸉": [],

    //2E0A          ; RIGHT TRANSPOSITION BRACKET
    "⸊": [],

    //2E0B          ; RAISED SQUARE
    "⸋": [],

    //2E0C          ; LEFT RAISED OMISSION BRACKET
    "⸌": [],

    //2E0D          ; RIGHT RAISED OMISSION BRACKET
    "⸍": [],

    //2E0E          ; EDITORIAL CORONIS
    "⸎": [],

    //2E0F          ; PARAGRAPHOS
    "⸏": [],

    //2E10          ; FORKED PARAGRAPHOS
    "⸐": [],

    //2E11          ; REVERSED FORKED PARAGRAPHOS
    "⸑": [],

    //2E12          ; HYPODIASTOLE
    "⸒": [],

    //2E13          ; DOTTED OBELOS
    "⸓": [],

    //2E14          ; DOWNWARDS ANCORA
    "⸔": [],

    //2E15          ; UPWARDS ANCORA
    "⸕": [],

    //2E16          ; DOTTED RIGHT-POINTING ANGLE
    "⸖": [],

    //2E17          ; DOUBLE OBLIQUE HYPHEN
    "⸗": [],

    //2E18          ; INVERTED INTERROBANG
    "⸘": [.interrobang, .turned],

    //2E19          ; PALM BRANCH
    "⸙": [],

    //2E1A          ; HYPHEN WITH DIAERESIS
    "⸚": [.hyphen, .diaeresis, .above],

    //2E1B          ; TILDE WITH RING ABOVE
    "⸛": [.tilde, .ring, .above],

    //2E1C          ; LEFT LOW PARAPHRASE BRACKET
    "⸜": [],

    //2E1D          ; RIGHT LOW PARAPHRASE BRACKET
    "⸝": [],

    //2E1E          ; TILDE WITH DOT ABOVE
    "⸞": [.tilde, .dot, .above],

    //2E1F          ; TILDE WITH DOT BELOW
    "⸟": [.tilde, .dot, .below],

    //2E20          ; LEFT VERTICAL BAR WITH QUILL
    "⸠": [],

    //2E21          ; RIGHT VERTICAL BAR WITH QUILL
    "⸡": [],

    //2E22          ; TOP LEFT HALF BRACKET
    "⸢": [.squareBracket, .topHalf],

    //2E23          ; TOP RIGHT HALF BRACKET
    "⸣": [.squareBracket, .topHalf, .reversed],

    //2E24          ; BOTTOM LEFT HALF BRACKET
    "⸤": [.squareBracket, .bottomHalf],

    //2E25          ; BOTTOM RIGHT HALF BRACKET
    "⸥": [.squareBracket, .bottomHalf, .reversed],

    //2E26          ; LEFT SIDEWAYS U BRACKET
    "⸦": [],

    //2E27          ; RIGHT SIDEWAYS U BRACKET
    "⸧": [],

    //2E28          ; LEFT DOUBLE PARENTHESIS
    "⸨": [.parenthesis, .doubled],

    //2E29          ; RIGHT DOUBLE PARENTHESIS
    "⸩": [.parenthesis, .doubled, .reversed],

    //2E2A          ; TWO DOTS OVER ONE DOT PUNCTUATION
    "⸪": [],

    //2E2B          ; ONE DOT OVER TWO DOTS PUNCTUATION
    "⸫": [],

    //2E2C          ; SQUARED FOUR DOT PUNCTUATION
    "⸬": [],

    //2E2D          ; FIVE DOT MARK
    "⸭": [],

    //2E2E          ; REVERSED QUESTION MARK
    "⸮": [.questionMark, .reversed],

    //2E2F          ; VERTICAL TILDE
    "ⸯ": [.verticalTilde],

    //2E30          ; RING POINT
    "⸰": [],

    //2E31          ; WORD SEPARATOR MIDDLE DOT
    "⸱": [],

    //2E32          ; TURNED COMMA
    "⸲": [.comma, .turned],

    //2E33          ; RAISED DOT
    "⸳": [.dot, .raised],

    //2E34          ; RAISED COMMA
    "⸴": [.comma, .raised],

    //2E35          ; TURNED SEMICOLON
    "⸵": [.semicolon, .turned],

    //2E36          ; DAGGER WITH LEFT GUARD
    "⸶": [.asterisk, .extra1, .leftHalf],

    //2E37          ; DAGGER WITH RIGHT GUARD
    "⸷": [.asterisk, .extra1, .rightHalf],

    //2E38          ; TURNED DAGGER
    "⸸": [.asterisk, .extra1, .turned],

    //2E39          ; TOP HALF SECTION SIGN
    "⸹": [],

    //2E3A          ; TWO-EM DASH
    "⸺": [.hyphen, .m, .doubled],

    //2E3B          ; THREE-EM DASH
    "⸻": [.hyphen, .m, .doubled, .m],

    //2E3C          ; STENOGRAPHIC FULL STOP
    "⸼": [],

    //2E3D          ; VERTICAL SIX DOTS
    "⸽": [],

    //2E3E          ; WIGGLY VERTICAL LINE
    "⸾": [.verticalLine, .w],

    //2E3F          ; CAPITULUM
    "⸿": [],

    //2E40          ; DOUBLE HYPHEN
    "⹀": [.hyphen, .doubled],

    //2E41          ; REVERSED COMMA
    "⹁": [.comma, .reversed],

    //2E42          ; DOUBLE LOW-REVERSED-9 QUOTATION MARK
    "⹂": [.quotationMark, .extraDownLeft, .reversed],

    //2E43          ; DASH WITH LEFT UPTURN
    "⹃": [],

    //2E44          ; DOUBLE SUSPENSION MARK
    "⹄": [],

    //2E45          ; INVERTED LOW KAVYKA
    "⹅": [],

    //2E46          ; INVERTED LOW KAVYKA WITH KAVYKA ABOVE
    "⹆": [],

    //2E47          ; LOW KAVYKA
    "⹇": [],

    //2E48          ; LOW KAVYKA WITH DOT
    "⹈": [],

    //2E49          ; DOUBLE STACKED COMMA
    "⹉": [],
    
    //2E4A          ; DOTTED SOLIDUS
    "⹊": [.solidus, .dot],
    
    //2E4B          ; TRIPLE DAGGER
    "⹋": [.asterisk, .extra1, .tripled],
    
    //2E4C          ; MEDIEVAL COMMA
    "⹌": [],
    
    //2E4D          ; PARAGRAPHUS MARK
    "⹍": [],
    
    //2E4E          ; PUNCTUS ELEVATUS MARK
    "⹎": [],

    
    // MARK: - A700..A71F; Modifier Tone Letters
    
    //A700          ; MODIFIER LETTER CHINESE TONE YIN PING
    "꜀": [],

    //A701          ; MODIFIER LETTER CHINESE TONE YANG PING
    "꜁": [],

    //A702          ; MODIFIER LETTER CHINESE TONE YIN SHANG
    "꜂": [],

    //A703          ; MODIFIER LETTER CHINESE TONE YANG SHANG
    "꜃": [],

    //A704          ; MODIFIER LETTER CHINESE TONE YIN QU
    "꜄": [],

    //A705          ; MODIFIER LETTER CHINESE TONE YANG QU
    "꜅": [],

    //A706          ; MODIFIER LETTER CHINESE TONE YIN RU
    "꜆": [],

    //A707          ; MODIFIER LETTER CHINESE TONE YANG RU
    "꜇": [],

    //A708          ; MODIFIER LETTER EXTRA-HIGH DOTTED TONE BAR
    "꜈": [.extraHighTone, .dot],

    //A709          ; MODIFIER LETTER HIGH DOTTED TONE BAR
    "꜉": [.highTone, .dot],

    //A70A          ; MODIFIER LETTER MID DOTTED TONE BAR
    "꜊": [.midTone, .dot],

    //A70B          ; MODIFIER LETTER LOW DOTTED TONE BAR
    "꜋": [.lowTone, .dot],

    //A70C          ; MODIFIER LETTER EXTRA-LOW DOTTED TONE BAR
    "꜌": [.extraLowTone, .dot],

    //A70D          ; MODIFIER LETTER EXTRA-HIGH DOTTED LEFT-STEM TONE BAR
    "꜍": [.extraHighTone, .dot, .reversed],

    //A70E          ; MODIFIER LETTER HIGH DOTTED LEFT-STEM TONE BAR
    "꜎": [.highTone, .dot, .reversed],

    //A70F          ; MODIFIER LETTER MID DOTTED LEFT-STEM TONE BAR
    "꜏": [.midTone, .dot, .reversed],

    //A710          ; MODIFIER LETTER LOW DOTTED LEFT-STEM TONE BAR
    "꜐": [.lowTone, .dot, .reversed],

    //A711          ; MODIFIER LETTER EXTRA-LOW DOTTED LEFT-STEM TONE BAR
    "꜑": [.extraLowTone, .dot, .reversed],

    //A712          ; MODIFIER LETTER EXTRA-HIGH LEFT-STEM TONE BAR
    "꜒": [.extraHighTone, .reversed],

    //A713          ; MODIFIER LETTER HIGH LEFT-STEM TONE BAR
    "꜓": [.highTone, .reversed],

    //A714          ; MODIFIER LETTER MID LEFT-STEM TONE BAR
    "꜔": [.midTone, .reversed],

    //A715          ; MODIFIER LETTER LOW LEFT-STEM TONE BAR
    "꜕": [.lowTone, .reversed],

    //A716          ; MODIFIER LETTER EXTRA-LOW LEFT-STEM TONE BAR
    "꜖": [.extraLowTone, .reversed],

    //A717          ; MODIFIER LETTER DOT VERTICAL BAR
    "ꜗ": [],

    //A718          ; MODIFIER LETTER DOT SLASH
    "ꜘ": [],

    //A719          ; MODIFIER LETTER DOT HORIZONTAL BAR
    "ꜙ": [],

    //A71A          ; MODIFIER LETTER LOWER RIGHT CORNER ANGLE
    "ꜚ": [],

    //A71B          ; MODIFIER LETTER RAISED UP ARROW
    "ꜛ": [.verticalLine, .greaterThanSign, .superscript],

    //A71C          ; MODIFIER LETTER RAISED DOWN ARROW
    "ꜜ": [.verticalLine, .lessThanSign, .superscript],

    //A71D          ; MODIFIER LETTER RAISED EXCLAMATION MARK
    "ꜝ": [.exclamationMark, .superscript],

    //A71E          ; MODIFIER LETTER RAISED INVERTED EXCLAMATION MARK
    "ꜞ": [.exclamationMark, .turned, .superscript],

    //A71F          ; MODIFIER LETTER LOW INVERTED EXCLAMATION MARK
    "ꜟ": [.exclamationMark, .turned, .subscript],

    
    // MARK: - A720..A7FF; Latin Extended-D
    
    //A720          ; MODIFIER LETTER STRESS AND HIGH TONE
    "꜠": [],

    //A721          ; MODIFIER LETTER STRESS AND LOW TONE
    "꜡": [],

    //A722          ; LATIN CAPITAL LETTER EGYPTOLOGICAL ALEF
    "Ꜣ": [.egyptologialAlef, .capital],

    //A723          ; LATIN SMALL LETTER EGYPTOLOGICAL ALEF
    "ꜣ": [.egyptologialAlef],

    //A724          ; LATIN CAPITAL LETTER EGYPTOLOGICAL AIN
    "Ꜥ": [.egyptologicalAin, .capital],

    //A725          ; LATIN SMALL LETTER EGYPTOLOGICAL AIN
    "ꜥ": [.egyptologicalAin],

    //A726          ; LATIN CAPITAL LETTER HENG
    "Ꜧ": [.h, .g, .capital],

    //A727          ; LATIN SMALL LETTER HENG
    "ꜧ": [.h, .g],

    //A728          ; LATIN CAPITAL LETTER TZ
    "Ꜩ": [.t, .z, .capital],

    //A729          ; LATIN SMALL LETTER TZ
    "ꜩ": [.t, .z],

    //A72A          ; LATIN CAPITAL LETTER TRESILLO
    "Ꜫ": [.q, .capital, .ejective],

    //A72B          ; LATIN SMALL LETTER TRESILLO
    "ꜫ": [.q, .ejective],

    //A72C          ; LATIN CAPITAL LETTER CUATRILLO
    "Ꜭ": [.k, .capital, .ejective],

    //A72D          ; LATIN SMALL LETTER CUATRILLO
    "ꜭ": [.k, .ejective],

    //A72E          ; LATIN CAPITAL LETTER CUATRILLO WITH COMMA
    "Ꜯ": [.k, .capital, .ejective, .comma],

    //A72F          ; LATIN SMALL LETTER CUATRILLO WITH COMMA
    "ꜯ": [.k, .ejective, .comma],

    //A730          ; LATIN LETTER SMALL CAPITAL F
    "ꜰ": [.f, .smallCapital],

    //A731          ; LATIN LETTER SMALL CAPITAL S
    "ꜱ": [.s, .smallCapital],

    //A732          ; LATIN CAPITAL LETTER AA
    "Ꜳ": [.a, .a, .capital],

    //A733          ; LATIN SMALL LETTER AA
    "ꜳ": [.a, .a],

    //A734          ; LATIN CAPITAL LETTER AO
    "Ꜵ": [.a, .o, .capital],

    //A735          ; LATIN SMALL LETTER AO
    "ꜵ": [.a, .o],

    //A736          ; LATIN CAPITAL LETTER AU
    "Ꜷ": [.a, .u, .capital],

    //A737          ; LATIN SMALL LETTER AU
    "ꜷ": [.a, .u],

    //A738          ; LATIN CAPITAL LETTER AV
    "Ꜹ": [.a, .v, .capital],

    //A739          ; LATIN SMALL LETTER AV
    "ꜹ": [.a, .v],

    //A73A          ; LATIN CAPITAL LETTER AV WITH HORIZONTAL BAR
    "Ꜻ": [.a, .v, .capital, .stroke],

    //A73B          ; LATIN SMALL LETTER AV WITH HORIZONTAL BAR
    "ꜻ": [.a, .v, .stroke],

    //A73C          ; LATIN CAPITAL LETTER AY
    "Ꜽ": [.a, .y, .capital],

    //A73D          ; LATIN SMALL LETTER AY
    "ꜽ": [.a, .y],

    //A73E          ; LATIN CAPITAL LETTER REVERSED C WITH DOT
    "Ꜿ": [.c, .capital, .reversed, .dot],

    //A73F          ; LATIN SMALL LETTER REVERSED C WITH DOT
    "ꜿ": [.c, .reversed, .dot],

    //A740          ; LATIN CAPITAL LETTER K WITH STROKE
    "Ꝁ": [.k, .capital, .stroke],

    //A741          ; LATIN SMALL LETTER K WITH STROKE
    "ꝁ": [.k, .stroke],

    //A742          ; LATIN CAPITAL LETTER K WITH DIAGONAL STROKE
    "Ꝃ": [.k, .capital, .diagonalStroke],

    //A743          ; LATIN SMALL LETTER K WITH DIAGONAL STROKE
    "ꝃ": [.k, .diagonalStroke],

    //A744          ; LATIN CAPITAL LETTER K WITH STROKE AND DIAGONAL STROKE
    "Ꝅ": [.k, .capital, .stroke, .diagonalStroke],

    //A745          ; LATIN SMALL LETTER K WITH STROKE AND DIAGONAL STROKE
    "ꝅ": [.k, .stroke, .diagonalStroke],

    //A746          ; LATIN CAPITAL LETTER BROKEN L
    "Ꝇ": [.l, .capital, .broken],

    //A747          ; LATIN SMALL LETTER BROKEN L
    "ꝇ": [.l, .broken],

    //A748          ; LATIN CAPITAL LETTER L WITH HIGH STROKE
    "Ꝉ": [.l, .capital, .highStroke],

    //A749          ; LATIN SMALL LETTER L WITH HIGH STROKE
    "ꝉ": [.l, .highStroke],

    //A74A          ; LATIN CAPITAL LETTER O WITH LONG STROKE OVERLAY
    "Ꝋ": [.o, .capital, .longStroke],

    //A74B          ; LATIN SMALL LETTER O WITH LONG STROKE OVERLAY
    "ꝋ": [.o, .longStroke],

    //A74C          ; LATIN CAPITAL LETTER O WITH LOOP
    "Ꝍ": [.o, .capital, .curl],

    //A74D          ; LATIN SMALL LETTER O WITH LOOP
    "ꝍ": [.o, .curl],

    //A74E          ; LATIN CAPITAL LETTER OO
    "Ꝏ": [.o, .o, .capital],

    //A74F          ; LATIN SMALL LETTER OO
    "ꝏ": [.o, .o],

    //A750          ; LATIN CAPITAL LETTER P WITH STROKE THROUGH DESCENDER
    "Ꝑ": [.p, .capital, .lowStroke],

    //A751          ; LATIN SMALL LETTER P WITH STROKE THROUGH DESCENDER
    "ꝑ": [.p, .lowStroke],

    //A752          ; LATIN CAPITAL LETTER P WITH FLOURISH
    "Ꝓ": [.p, .capital, .flourish],

    //A753          ; LATIN SMALL LETTER P WITH FLOURISH
    "ꝓ": [.p, .flourish],

    //A754          ; LATIN CAPITAL LETTER P WITH SQUIRREL TAIL
    "Ꝕ": [.p, .capital, .tail],

    //A755          ; LATIN SMALL LETTER P WITH SQUIRREL TAIL
    "ꝕ": [.p, .tail],

    //A756          ; LATIN CAPITAL LETTER Q WITH STROKE THROUGH DESCENDER
    "Ꝗ": [.q, .capital, .stroke],

    //A757          ; LATIN SMALL LETTER Q WITH STROKE THROUGH DESCENDER
    "ꝗ": [.q, .stroke],

    //A758          ; LATIN CAPITAL LETTER Q WITH DIAGONAL STROKE
    "Ꝙ": [.q, .capital, .diagonalStroke],

    //A759          ; LATIN SMALL LETTER Q WITH DIAGONAL STROKE
    "ꝙ": [.q, .diagonalStroke],

    //A75A          ; LATIN CAPITAL LETTER R ROTUNDA
    "Ꝛ": [.r, .capital, .rightHalf],

    //A75B          ; LATIN SMALL LETTER R ROTUNDA
    "ꝛ": [.r, .rightHalf],

    //A75C          ; LATIN CAPITAL LETTER RUM ROTUNDA
    "Ꝝ": [.r, .capital, .rightHalf, .um],

    //A75D          ; LATIN SMALL LETTER RUM ROTUNDA
    "ꝝ": [.r, .rightHalf, .um],

    //A75E          ; LATIN CAPITAL LETTER V WITH DIAGONAL STROKE
    "Ꝟ": [.v, .capital, .diagonalStroke],

    //A75F          ; LATIN SMALL LETTER V WITH DIAGONAL STROKE
    "ꝟ": [.v, .diagonalStroke],

    //A760          ; LATIN CAPITAL LETTER VY
    "Ꝡ": [.v, .y, .capital],

    //A761          ; LATIN SMALL LETTER VY
    "ꝡ": [.v, .y],

    //A762          ; LATIN CAPITAL LETTER VISIGOTHIC Z
    "Ꝣ": [.z, .capital, .visigothic],

    //A763          ; LATIN SMALL LETTER VISIGOTHIC Z
    "ꝣ": [.z, .visigothic],

    //A764          ; LATIN CAPITAL LETTER THORN WITH STROKE
    "Ꝥ": [.t, .extraH, .capital, .stroke],

    //A765          ; LATIN SMALL LETTER THORN WITH STROKE
    "ꝥ": [.t, .extraH, .stroke],

    //A766          ; LATIN CAPITAL LETTER THORN WITH STROKE THROUGH DESCENDER
    "Ꝧ": [.t, .extraH, .capital, .lowStroke],

    //A767          ; LATIN SMALL LETTER THORN WITH STROKE THROUGH DESCENDER
    "ꝧ": [.t, .extraH, .lowStroke],

    //A768          ; LATIN CAPITAL LETTER VEND
    "Ꝩ": [.v, .capital, .vend],

    //A769          ; LATIN SMALL LETTER VEND
    "ꝩ": [.v, .vend],

    //A76A          ; LATIN CAPITAL LETTER ET
    "Ꝫ": [.e, .t, .capital],

    //A76B          ; LATIN SMALL LETTER ET
    "ꝫ": [.e, .t],

    //A76C          ; LATIN CAPITAL LETTER IS
    "Ꝭ": [.i, .s, .capital],

    //A76D          ; LATIN SMALL LETTER IS
    "ꝭ": [.i, .s],

    //A76E          ; LATIN CAPITAL LETTER CON
    "Ꝯ": [.u, .s, .capital],

    //A76F          ; LATIN SMALL LETTER CON
    "ꝯ": [.u, .s],

    //A770          ; MODIFIER LETTER US
    "ꝰ": [.u, .s, .superscript],

    //A771          ; LATIN SMALL LETTER DUM
    "ꝱ": [.d, .um],

    //A772          ; LATIN SMALL LETTER LUM
    "ꝲ": [.l, .um],

    //A773          ; LATIN SMALL LETTER MUM
    "ꝳ": [.m, .um],

    //A774          ; LATIN SMALL LETTER NUM
    "ꝴ": [.n, .um],

    //A775          ; LATIN SMALL LETTER RUM
    "ꝵ": [.r, .um],

    //A776          ; LATIN LETTER SMALL CAPITAL RUM
    "ꝶ": [.r, .smallCapital, .um],

    //A777          ; LATIN SMALL LETTER TUM
    "ꝷ": [.t, .um],

    //A778          ; LATIN SMALL LETTER UM
    "ꝸ": [.u, .m],

    //A779          ; LATIN CAPITAL LETTER INSULAR D
    "Ꝺ": [.d, .capital, .insular],

    //A77A          ; LATIN SMALL LETTER INSULAR D
    "ꝺ": [.d, .insular],

    //A77B          ; LATIN CAPITAL LETTER INSULAR F
    "Ꝼ": [.f, .capital, .insular],

    //A77C          ; LATIN SMALL LETTER INSULAR F
    "ꝼ": [.f, .insular],

    //A77D          ; LATIN CAPITAL LETTER INSULAR G
    "Ᵹ": [.g, .capital, .insular],

    //A77E          ; LATIN CAPITAL LETTER TURNED INSULAR G
    "Ꝿ": [.g, .capital, .insular, .turned],

    //A77F          ; LATIN SMALL LETTER TURNED INSULAR G
    "ꝿ": [.g, .insular, .turned],

    //A780          ; LATIN CAPITAL LETTER TURNED L
    "Ꞁ": [.l, .capital, .turned],

    //A781          ; LATIN SMALL LETTER TURNED L
    "ꞁ": [.l, .turned],

    //A782          ; LATIN CAPITAL LETTER INSULAR R
    "Ꞃ": [.r, .capital, .insular],

    //A783          ; LATIN SMALL LETTER INSULAR R
    "ꞃ": [.r, .insular],

    //A784          ; LATIN CAPITAL LETTER INSULAR S
    "Ꞅ": [.s, .capital, .insular],

    //A785          ; LATIN SMALL LETTER INSULAR S
    "ꞅ": [.s, .insular],

    //A786          ; LATIN CAPITAL LETTER INSULAR T
    "Ꞇ": [.t, .capital, .insular],

    //A787          ; LATIN SMALL LETTER INSULAR T
    "ꞇ": [.t, .insular],

    //A788          ; MODIFIER LETTER LOW CIRCUMFLEX ACCENT
    "ꞈ": [.circumflex, .subscript],

    //A789          ; MODIFIER LETTER COLON
    "꞉": [.modifierColon],

    //A78A          ; MODIFIER LETTER SHORT EQUALS SIGN
    "꞊": [.modifierEqualsSign],

    //A78B          ; LATIN CAPITAL LETTER SALTILLO
    "Ꞌ": [.saltillo, .capital],

    //A78C          ; LATIN SMALL LETTER SALTILLO
    "ꞌ": [.saltillo],

    //A78D          ; LATIN CAPITAL LETTER TURNED H
    "Ɥ": [.h, .capital, .turned],

    //A78E          ; LATIN SMALL LETTER L WITH RETROFLEX HOOK AND BELT
    "ꞎ": [.l, .retroflexHook, .belt],

    //A78F          ; LATIN LETTER SINOLOGICAL DOT
    "ꞏ": [.sinologicalDot],

    //A790          ; LATIN CAPITAL LETTER N WITH DESCENDER
    "Ꞑ": [.n, .capital, .descender],

    //A791          ; LATIN SMALL LETTER N WITH DESCENDER
    "ꞑ": [.n, .descender],

    //A792          ; LATIN CAPITAL LETTER C WITH BAR
    "Ꞓ": [.c, .capital, .stroke],

    //A793          ; LATIN SMALL LETTER C WITH BAR
    "ꞓ": [.c, .stroke],

    //A794          ; LATIN SMALL LETTER C WITH PALATAL HOOK
    "ꞔ": [.c, .palatalHook],

    //A795          ; LATIN SMALL LETTER H WITH PALATAL HOOK
    "ꞕ": [.h, .palatalHook],

    //A796          ; LATIN CAPITAL LETTER B WITH FLOURISH
    "Ꞗ": [.b, .capital, .flourish],

    //A797          ; LATIN SMALL LETTER B WITH FLOURISH
    "ꞗ": [.b, .flourish],

    //A798          ; LATIN CAPITAL LETTER F WITH STROKE
    "Ꞙ": [.f, .capital, .stroke],

    //A799          ; LATIN SMALL LETTER F WITH STROKE
    "ꞙ": [.f, .stroke],

    //A79A          ; LATIN CAPITAL LETTER VOLAPUK AE
    "Ꞛ": [.a, .e, .capital, .volapuk],

    //A79B          ; LATIN SMALL LETTER VOLAPUK AE
    "ꞛ": [.a, .e, .volapuk],

    //A79C          ; LATIN CAPITAL LETTER VOLAPUK OE
    "Ꞝ": [.o, .e, .capital, .volapuk],

    //A79D          ; LATIN SMALL LETTER VOLAPUK OE
    "ꞝ": [.o, .e, .volapuk],

    //A79E          ; LATIN CAPITAL LETTER VOLAPUK UE
    "Ꞟ": [.u, .e, .capital, .volapuk],

    //A79F          ; LATIN SMALL LETTER VOLAPUK UE
    "ꞟ": [.u, .e, .volapuk],

    //A7A0          ; LATIN CAPITAL LETTER G WITH OBLIQUE STROKE
    "Ꞡ": [.g, .capital, .obliqueStroke],

    //A7A1          ; LATIN SMALL LETTER G WITH OBLIQUE STROKE
    "ꞡ": [.g, .obliqueStroke],

    //A7A2          ; LATIN CAPITAL LETTER K WITH OBLIQUE STROKE
    "Ꞣ": [.k, .capital, .obliqueStroke],

    //A7A3          ; LATIN SMALL LETTER K WITH OBLIQUE STROKE
    "ꞣ": [.k, .obliqueStroke],

    //A7A4          ; LATIN CAPITAL LETTER N WITH OBLIQUE STROKE
    "Ꞥ": [.n, .capital, .obliqueStroke],

    //A7A5          ; LATIN SMALL LETTER N WITH OBLIQUE STROKE
    "ꞥ": [.n, .obliqueStroke],

    //A7A6          ; LATIN CAPITAL LETTER R WITH OBLIQUE STROKE
    "Ꞧ": [.r, .capital, .obliqueStroke],

    //A7A7          ; LATIN SMALL LETTER R WITH OBLIQUE STROKE
    "ꞧ": [.r, .obliqueStroke],

    //A7A8          ; LATIN CAPITAL LETTER S WITH OBLIQUE STROKE
    "Ꞩ": [.s, .capital, .obliqueStroke],

    //A7A9          ; LATIN SMALL LETTER S WITH OBLIQUE STROKE
    "ꞩ": [.s, .obliqueStroke],

    //A7AA          ; LATIN CAPITAL LETTER H WITH HOOK
    "Ɦ": [.h, .capital, .hook],

    //A7AB          ; LATIN CAPITAL LETTER REVERSED OPEN E
    "Ɜ": [.e, .capital, .extraH, .reversed],

    //A7AC          ; LATIN CAPITAL LETTER SCRIPT G
    "Ɡ": [.g, .capital, .letterScript],

    //A7AD          ; LATIN CAPITAL LETTER L WITH BELT
    "Ɬ": [.l, .capital, .belt],

    //A7AE          ; LATIN CAPITAL LETTER SMALL CAPITAL I
    "Ɪ": [.i, .smallCapital, .capital],
    
    //A7AF          ; LATIN LETTER SMALL CAPITAL Q
    "ꞯ": [.q, .smallCapital],

    //A7B0          ; LATIN CAPITAL LETTER TURNED K
    "Ʞ": [.k, .capital, .turned],

    //A7B1          ; LATIN CAPITAL LETTER TURNED T
    "Ʇ": [.t, .capital, .turned],

    //A7B2          ; LATIN CAPITAL LETTER J WITH CROSSED-TAIL
    "Ʝ": [.j, .capital, .curl],

    //A7B3          ; LATIN CAPITAL LETTER CHI
    "Ꭓ": [.x, .extraH, .capital],

    //A7B4          ; LATIN CAPITAL LETTER BETA
    "Ꞵ": [.b, .extraH, .capital],

    //A7B5          ; LATIN SMALL LETTER BETA
    "ꞵ": [.b, .extraH],

    //A7B6          ; LATIN CAPITAL LETTER OMEGA
    "Ꞷ": [.o, .o, .extraH, .capital],

    //A7B7          ; LATIN SMALL LETTER OMEGA
    "ꞷ": [.o, .o, .extraH],
    
    //A7B8          ; LATIN CAPITAL LETTER U WITH STROKE
    "Ꞹ": [.u, .capital, .diagonalStroke],
    
    //A7B9          ; LATIN SMALL LETTER U WITH STROKE
    "ꞹ": [.u, .diagonalStroke],

    //A7F7          ; LATIN EPIGRAPHIC LETTER SIDEWAYS I
    "ꟷ": [.i, .capital, .sideways],

    //A7F8          ; MODIFIER LETTER CAPITAL H WITH STROKE
    "ꟸ": [.h, .capital, .stroke, .superscript],

    //A7F9          ; MODIFIER LETTER SMALL LIGATURE OE
    "ꟹ": [.o, .e, .superscript],

    //A7FA          ; LATIN LETTER SMALL CAPITAL TURNED M
    "ꟺ": [.m, .smallCapital, .turned],

    //A7FB          ; LATIN EPIGRAPHIC LETTER REVERSED F
    "ꟻ": [.f, .capital, .reversed],

    //A7FC          ; LATIN EPIGRAPHIC LETTER REVERSED P
    "ꟼ": [.p, .capital, .reversed],

    //A7FD          ; LATIN EPIGRAPHIC LETTER INVERTED M
    "ꟽ": [.m, .capital, .inverted],

    //A7FE          ; LATIN EPIGRAPHIC LETTER I LONGA
    "ꟾ": [.i, .capital, .longLeg],

    //A7FF          ; LATIN EPIGRAPHIC LETTER ARCHAIC M
    "ꟿ": [.m, .capital, .archaic],

    
    // MARK: - AB30..AB6F; Latin Extended-E
    
    //AB30          ; LATIN SMALL LETTER BARRED ALPHA
    "ꬰ": [.a, .extraH, .stroke],

    //AB31          ; LATIN SMALL LETTER A REVERSED-SCHWA
    "ꬱ": [.a, .a, .extra0],

    //AB32          ; LATIN SMALL LETTER BLACKLETTER E
    "ꬲ": [.e, .blackletter],

    //AB33          ; LATIN SMALL LETTER BARRED E
    "ꬳ": [.e, .stroke],

    //AB34          ; LATIN SMALL LETTER E WITH FLOURISH
    "ꬴ": [.e, .flourish],

    //AB35          ; LATIN SMALL LETTER LENIS F
    "ꬵ": [.f, .lenis],

    //AB36          ; LATIN SMALL LETTER SCRIPT G WITH CROSSED-TAIL
    "ꬶ": [.g, .curl],

    //AB37          ; LATIN SMALL LETTER L WITH INVERTED LAZY S
    "ꬷ": [.l, .lazyS],

    //AB38          ; LATIN SMALL LETTER L WITH DOUBLE MIDDLE TILDE
    "ꬸ": [.l, .tilde, .doubled],

    //AB39          ; LATIN SMALL LETTER L WITH MIDDLE RING
    "ꬹ": [.l, .ring],

    //AB3A          ; LATIN SMALL LETTER M WITH CROSSED-TAIL
    "ꬺ": [.m, .curl],

    //AB3B          ; LATIN SMALL LETTER N WITH CROSSED-TAIL
    "ꬻ": [.n, .curl],

    //AB3C          ; LATIN SMALL LETTER ENG WITH CROSSED-TAIL
    "ꬼ": [.n, .g, .curl],

    //AB3D          ; LATIN SMALL LETTER BLACKLETTER O
    "ꬽ": [.o, .blackletter],

    //AB3E          ; LATIN SMALL LETTER BLACKLETTER O WITH STROKE
    "ꬾ": [.o, .blackletter, .diagonalStroke],

    //AB3F          ; LATIN SMALL LETTER OPEN O WITH STROKE
    "ꬿ": [.o, .extraH, .diagonalStroke],

    //AB40          ; LATIN SMALL LETTER INVERTED OE
    "ꭀ": [.o, .e, .inverted],

    //AB41          ; LATIN SMALL LETTER TURNED OE WITH STROKE
    "ꭁ": [.o, .e, .turned, .diagonalStroke],

    //AB42          ; LATIN SMALL LETTER TURNED OE WITH HORIZONTAL STROKE
    "ꭂ": [.o, .e, .turned, .stroke],

    //AB43          ; LATIN SMALL LETTER TURNED O OPEN-O
    "ꭃ": [.o, .extraH, .o],

    //AB44          ; LATIN SMALL LETTER TURNED O OPEN-O WITH STROKE
    "ꭄ": [.o, .extraH, .o, .diagonalStroke],

    //AB45          ; LATIN SMALL LETTER STIRRUP R
    "ꭅ": [.r, .stirrup],

    //AB46          ; LATIN LETTER SMALL CAPITAL R WITH RIGHT LEG
    "ꭆ": [.r, .smallCapital, .longLeg],

    //AB47          ; LATIN SMALL LETTER R WITHOUT HANDLE
    "ꭇ": [.r, .withoutHandle],

    //AB48          ; LATIN SMALL LETTER DOUBLE R
    "ꭈ": [.r, .r],

    //AB49          ; LATIN SMALL LETTER R WITH CROSSED-TAIL
    "ꭉ": [.r, .curl],

    //AB4A          ; LATIN SMALL LETTER DOUBLE R WITH CROSSED-TAIL
    "ꭊ": [.r, .r, .curl],

    //AB4B          ; LATIN SMALL LETTER SCRIPT R
    "ꭋ": [.r, .letterScript],

    //AB4C          ; LATIN SMALL LETTER SCRIPT R WITH RING
    "ꭌ": [.r, .script, .ring],

    //AB4D          ; LATIN SMALL LETTER BASELINE ESH
    "ꭍ": [.s, .extraH, .baseline],

    //AB4E          ; LATIN SMALL LETTER U WITH SHORT RIGHT LEG
    "ꭎ": [.u, .shortRightLeg],

    //AB4F          ; LATIN SMALL LETTER U BAR WITH SHORT RIGHT LEG
    "ꭏ": [.u, .shortRightLeg, .stroke],

    //AB50          ; LATIN SMALL LETTER UI
    "ꭐ": [.u, .i],

    //AB51          ; LATIN SMALL LETTER TURNED UI
    "ꭑ": [.u, .i, .turned],

    //AB52          ; LATIN SMALL LETTER U WITH LEFT HOOK
    "ꭒ": [.u, .hook],

    //AB53          ; LATIN SMALL LETTER CHI
    "ꭓ": [.x, .extraH],

    //AB54          ; LATIN SMALL LETTER CHI WITH LOW RIGHT RING
    "ꭔ": [.x, .extraH, .ring],

    //AB55          ; LATIN SMALL LETTER CHI WITH LOW LEFT SERIF
    "ꭕ": [.x, .extraH, .serif],

    //AB56          ; LATIN SMALL LETTER X WITH LOW RIGHT RING
    "ꭖ": [.x, .ring],

    //AB57          ; LATIN SMALL LETTER X WITH LONG LEFT LEG
    "ꭗ": [.x, .longLeg],

    //AB58          ; LATIN SMALL LETTER X WITH LONG LEFT LEG AND LOW RIGHT RING
    "ꭘ": [.x, .longLeg, .ring],

    //AB59          ; LATIN SMALL LETTER X WITH LONG LEFT LEG WITH SERIF
    "ꭙ": [.x, .longLeg, .serif],

    //AB5A          ; LATIN SMALL LETTER Y WITH SHORT RIGHT LEG
    "ꭚ": [.y, .shortRightLeg],

    //AB5B          ; MODIFIER BREVE WITH INVERTED BREVE
    "꭛": [.breve, .invertedBreve],

    //AB5C          ; MODIFIER LETTER SMALL HENG
    "ꭜ": [.h, .g, .superscript],

    //AB5D          ; MODIFIER LETTER SMALL L WITH INVERTED LAZY S
    "ꭝ": [.l, .s, .superscript],

    //AB5E          ; MODIFIER LETTER SMALL L WITH MIDDLE TILDE
    "ꭞ": [.l, .tilde, .superscript],

    //AB5F          ; MODIFIER LETTER SMALL U WITH LEFT HOOK
    "ꭟ": [.u, .hook, .superscript],

    //AB60          ; LATIN SMALL LETTER SAKHA YAT
    "ꭠ": [.i, .a],

    //AB61          ; LATIN SMALL LETTER IOTIFIED E
    "ꭡ": [.i, .e],

    //AB62          ; LATIN SMALL LETTER OPEN OE
    "ꭢ": [.o, .extraH, .e],

    //AB63          ; LATIN SMALL LETTER UO
    "ꭣ": [.u, .o],

    //AB64          ; LATIN SMALL LETTER INVERTED ALPHA
    "ꭤ": [.a, .extraH, .inverted],

    //AB65          ; GREEK LETTER SMALL CAPITAL OMEGA
    "ꭥ": [.o, .o, .greek, .smallCapital],

    
    // MARK: - FB00..FB4F; Alphabetic Presentation Forms
    
    //FB00          ; LATIN SMALL LIGATURE FF
    "ﬀ": [.f, .f],

    //FB01          ; LATIN SMALL LIGATURE FI
    "ﬁ": [.f, .i],

    //FB02          ; LATIN SMALL LIGATURE FL
    "ﬂ": [.f, .l],

    //FB03          ; LATIN SMALL LIGATURE FFI
    "ﬃ": [.f, .f, .i],

    //FB04          ; LATIN SMALL LIGATURE FFL
    "ﬄ": [.f, .f, .l],

    //FB05          ; LATIN SMALL LIGATURE LONG S T
    "ﬅ": [.s, .l, .t],

    //FB06          ; LATIN SMALL LIGATURE ST
    "ﬆ": [.s, .t],

    
    // MARK: - FE20..FE2F; Combining Half Marks
    
    //FE20          ; COMBINING LIGATURE LEFT HALF
    "︠": [.invertedBreve, .double, .leftHalf, .above],

    //FE21          ; COMBINING LIGATURE RIGHT HALF
    "︡": [.invertedBreve, .double, .rightHalf, .above],

    //FE22          ; COMBINING DOUBLE TILDE LEFT HALF
    "︢": [.tilde, .double, .leftHalf, .above],

    //FE23          ; COMBINING DOUBLE TILDE RIGHT HALF
    "︣": [.tilde, .double, .rightHalf, .above],

    //FE24          ; COMBINING MACRON LEFT HALF
    "︤": [.macron, .double, .leftHalf, .above],

    //FE25          ; COMBINING MACRON RIGHT HALF
    "︥": [.macron, .double, .rightHalf, .above],

    //FE26          ; COMBINING CONJOINING MACRON
    "︦": [], //Coptic

    //FE27          ; COMBINING LIGATURE LEFT HALF BELOW
    "︧": [.breve, .double, .leftHalf, .below],

    //FE28          ; COMBINING LIGATURE RIGHT HALF BELOW
    "︨": [.breve, .double, .rightHalf, .below],

    //FE29          ; COMBINING TILDE LEFT HALF BELOW
    "︩": [.tilde, .double, .leftHalf, .below],

    //FE2A          ; COMBINING TILDE RIGHT HALF BELOW
    "︪": [.tilde, .double, .rightHalf, .below],

    //FE2B          ; COMBINING MACRON LEFT HALF BELOW
    "︫": [.macron, .double, .leftHalf, .below],

    //FE2C          ; COMBINING MACRON RIGHT HALF BELOW
    "︬": [.macron, .double, .rightHalf, .below],

    //FE2D          ; COMBINING CONJOINING MACRON BELOW
    "︭": [], //Coptic

    //FE2E          ; COMBINING CYRILLIC TITLO LEFT HALF
    "︮": [],

    //FE2F          ; COMBINING CYRILLIC TITLO RIGHT HALF
    "︯": [],

    
    // MARK: - 1D400..1D7FF; Mathematical Alphanumeric Symbols
    
    //1D400         ; MATHEMATICAL BOLD CAPITAL A
    "𝐀": [.a, .capital, .bold],

    //1D401         ; MATHEMATICAL BOLD CAPITAL B
    "𝐁": [.b, .capital, .bold],

    //1D402         ; MATHEMATICAL BOLD CAPITAL C
    "𝐂": [.c, .capital, .bold],

    //1D403         ; MATHEMATICAL BOLD CAPITAL D
    "𝐃": [.d, .capital, .bold],

    //1D404         ; MATHEMATICAL BOLD CAPITAL E
    "𝐄": [.e, .capital, .bold],

    //1D405         ; MATHEMATICAL BOLD CAPITAL F
    "𝐅": [.f, .capital, .bold],

    //1D406         ; MATHEMATICAL BOLD CAPITAL G
    "𝐆": [.g, .capital, .bold],

    //1D407         ; MATHEMATICAL BOLD CAPITAL H
    "𝐇": [.h, .capital, .bold],

    //1D408         ; MATHEMATICAL BOLD CAPITAL I
    "𝐈": [.i, .capital, .bold],

    //1D409         ; MATHEMATICAL BOLD CAPITAL J
    "𝐉": [.j, .capital, .bold],

    //1D40A         ; MATHEMATICAL BOLD CAPITAL K
    "𝐊": [.k, .capital, .bold],

    //1D40B         ; MATHEMATICAL BOLD CAPITAL L
    "𝐋": [.l, .capital, .bold],

    //1D40C         ; MATHEMATICAL BOLD CAPITAL M
    "𝐌": [.m, .capital, .bold],

    //1D40D         ; MATHEMATICAL BOLD CAPITAL N
    "𝐍": [.n, .capital, .bold],

    //1D40E         ; MATHEMATICAL BOLD CAPITAL O
    "𝐎": [.o, .capital, .bold],

    //1D40F         ; MATHEMATICAL BOLD CAPITAL P
    "𝐏": [.p, .capital, .bold],

    //1D410         ; MATHEMATICAL BOLD CAPITAL Q
    "𝐐": [.q, .capital, .bold],

    //1D411         ; MATHEMATICAL BOLD CAPITAL R
    "𝐑": [.r, .capital, .bold],

    //1D412         ; MATHEMATICAL BOLD CAPITAL S
    "𝐒": [.s, .capital, .bold],

    //1D413         ; MATHEMATICAL BOLD CAPITAL T
    "𝐓": [.t, .capital, .bold],

    //1D414         ; MATHEMATICAL BOLD CAPITAL U
    "𝐔": [.u, .capital, .bold],

    //1D415         ; MATHEMATICAL BOLD CAPITAL V
    "𝐕": [.v, .capital, .bold],

    //1D416         ; MATHEMATICAL BOLD CAPITAL W
    "𝐖": [.w, .capital, .bold],

    //1D417         ; MATHEMATICAL BOLD CAPITAL X
    "𝐗": [.x, .capital, .bold],

    //1D418         ; MATHEMATICAL BOLD CAPITAL Y
    "𝐘": [.y, .capital, .bold],

    //1D419         ; MATHEMATICAL BOLD CAPITAL Z
    "𝐙": [.z, .capital, .bold],

    //1D41A         ; MATHEMATICAL BOLD SMALL A
    "𝐚": [.a, .bold],

    //1D41B         ; MATHEMATICAL BOLD SMALL B
    "𝐛": [.b, .bold],

    //1D41C         ; MATHEMATICAL BOLD SMALL C
    "𝐜": [.c, .bold],

    //1D41D         ; MATHEMATICAL BOLD SMALL D
    "𝐝": [.d, .bold],

    //1D41E         ; MATHEMATICAL BOLD SMALL E
    "𝐞": [.e, .bold],

    //1D41F         ; MATHEMATICAL BOLD SMALL F
    "𝐟": [.f, .bold],

    //1D420         ; MATHEMATICAL BOLD SMALL G
    "𝐠": [.g, .bold],

    //1D421         ; MATHEMATICAL BOLD SMALL H
    "𝐡": [.h, .bold],

    //1D422         ; MATHEMATICAL BOLD SMALL I
    "𝐢": [.i, .bold],

    //1D423         ; MATHEMATICAL BOLD SMALL J
    "𝐣": [.j, .bold],

    //1D424         ; MATHEMATICAL BOLD SMALL K
    "𝐤": [.k, .bold],

    //1D425         ; MATHEMATICAL BOLD SMALL L
    "𝐥": [.l, .bold],

    //1D426         ; MATHEMATICAL BOLD SMALL M
    "𝐦": [.m, .bold],

    //1D427         ; MATHEMATICAL BOLD SMALL N
    "𝐧": [.n, .bold],

    //1D428         ; MATHEMATICAL BOLD SMALL O
    "𝐨": [.o, .bold],

    //1D429         ; MATHEMATICAL BOLD SMALL P
    "𝐩": [.p, .bold],

    //1D42A         ; MATHEMATICAL BOLD SMALL Q
    "𝐪": [.q, .bold],

    //1D42B         ; MATHEMATICAL BOLD SMALL R
    "𝐫": [.r, .bold],

    //1D42C         ; MATHEMATICAL BOLD SMALL S
    "𝐬": [.s, .bold],

    //1D42D         ; MATHEMATICAL BOLD SMALL T
    "𝐭": [.t, .bold],

    //1D42E         ; MATHEMATICAL BOLD SMALL U
    "𝐮": [.u, .bold],

    //1D42F         ; MATHEMATICAL BOLD SMALL V
    "𝐯": [.v, .bold],

    //1D430         ; MATHEMATICAL BOLD SMALL W
    "𝐰": [.w, .bold],

    //1D431         ; MATHEMATICAL BOLD SMALL X
    "𝐱": [.x, .bold],

    //1D432         ; MATHEMATICAL BOLD SMALL Y
    "𝐲": [.y, .bold],

    //1D433         ; MATHEMATICAL BOLD SMALL Z
    "𝐳": [.z, .bold],

    //1D434         ; MATHEMATICAL ITALIC CAPITAL A
    "𝐴": [.a, .capital, .italic],

    //1D435         ; MATHEMATICAL ITALIC CAPITAL B
    "𝐵": [.b, .capital, .italic],

    //1D436         ; MATHEMATICAL ITALIC CAPITAL C
    "𝐶": [.c, .capital, .italic],

    //1D437         ; MATHEMATICAL ITALIC CAPITAL D
    "𝐷": [.d, .capital, .italic],

    //1D438         ; MATHEMATICAL ITALIC CAPITAL E
    "𝐸": [.e, .capital, .italic],

    //1D439         ; MATHEMATICAL ITALIC CAPITAL F
    "𝐹": [.f, .capital, .italic],

    //1D43A         ; MATHEMATICAL ITALIC CAPITAL G
    "𝐺": [.g, .capital, .italic],

    //1D43B         ; MATHEMATICAL ITALIC CAPITAL H
    "𝐻": [.h, .capital, .italic],

    //1D43C         ; MATHEMATICAL ITALIC CAPITAL I
    "𝐼": [.i, .capital, .italic],

    //1D43D         ; MATHEMATICAL ITALIC CAPITAL J
    "𝐽": [.j, .capital, .italic],

    //1D43E         ; MATHEMATICAL ITALIC CAPITAL K
    "𝐾": [.k, .capital, .italic],

    //1D43F         ; MATHEMATICAL ITALIC CAPITAL L
    "𝐿": [.l, .capital, .italic],

    //1D440         ; MATHEMATICAL ITALIC CAPITAL M
    "𝑀": [.m, .capital, .italic],

    //1D441         ; MATHEMATICAL ITALIC CAPITAL N
    "𝑁": [.n, .capital, .italic],

    //1D442         ; MATHEMATICAL ITALIC CAPITAL O
    "𝑂": [.o, .capital, .italic],

    //1D443         ; MATHEMATICAL ITALIC CAPITAL P
    "𝑃": [.p, .capital, .italic],

    //1D444         ; MATHEMATICAL ITALIC CAPITAL Q
    "𝑄": [.q, .capital, .italic],

    //1D445         ; MATHEMATICAL ITALIC CAPITAL R
    "𝑅": [.r, .capital, .italic],

    //1D446         ; MATHEMATICAL ITALIC CAPITAL S
    "𝑆": [.s, .capital, .italic],

    //1D447         ; MATHEMATICAL ITALIC CAPITAL T
    "𝑇": [.t, .capital, .italic],

    //1D448         ; MATHEMATICAL ITALIC CAPITAL U
    "𝑈": [.u, .capital, .italic],

    //1D449         ; MATHEMATICAL ITALIC CAPITAL V
    "𝑉": [.v, .capital, .italic],

    //1D44A         ; MATHEMATICAL ITALIC CAPITAL W
    "𝑊": [.w, .capital, .italic],

    //1D44B         ; MATHEMATICAL ITALIC CAPITAL X
    "𝑋": [.x, .capital, .italic],

    //1D44C         ; MATHEMATICAL ITALIC CAPITAL Y
    "𝑌": [.y, .capital, .italic],

    //1D44D         ; MATHEMATICAL ITALIC CAPITAL Z
    "𝑍": [.z, .capital, .italic],

    //1D44E         ; MATHEMATICAL ITALIC SMALL A
    "𝑎": [.a, .italic],

    //1D44F         ; MATHEMATICAL ITALIC SMALL B
    "𝑏": [.b, .italic],

    //1D450         ; MATHEMATICAL ITALIC SMALL C
    "𝑐": [.c, .italic],

    //1D451         ; MATHEMATICAL ITALIC SMALL D
    "𝑑": [.d, .italic],

    //1D452         ; MATHEMATICAL ITALIC SMALL E
    "𝑒": [.e, .italic],

    //1D453         ; MATHEMATICAL ITALIC SMALL F
    "𝑓": [.f, .italic],

    //1D454         ; MATHEMATICAL ITALIC SMALL G
    "𝑔": [.g, .italic],

    //1D456         ; MATHEMATICAL ITALIC SMALL I
    "𝑖": [.i, .italic],

    //1D457         ; MATHEMATICAL ITALIC SMALL J
    "𝑗": [.j, .italic],

    //1D458         ; MATHEMATICAL ITALIC SMALL K
    "𝑘": [.k, .italic],

    //1D459         ; MATHEMATICAL ITALIC SMALL L
    "𝑙": [.l, .italic],

    //1D45A         ; MATHEMATICAL ITALIC SMALL M
    "𝑚": [.m, .italic],

    //1D45B         ; MATHEMATICAL ITALIC SMALL N
    "𝑛": [.n, .italic],

    //1D45C         ; MATHEMATICAL ITALIC SMALL O
    "𝑜": [.o, .italic],

    //1D45D         ; MATHEMATICAL ITALIC SMALL P
    "𝑝": [.p, .italic],

    //1D45E         ; MATHEMATICAL ITALIC SMALL Q
    "𝑞": [.q, .italic],

    //1D45F         ; MATHEMATICAL ITALIC SMALL R
    "𝑟": [.r, .italic],

    //1D460         ; MATHEMATICAL ITALIC SMALL S
    "𝑠": [.s, .italic],

    //1D461         ; MATHEMATICAL ITALIC SMALL T
    "𝑡": [.t, .italic],

    //1D462         ; MATHEMATICAL ITALIC SMALL U
    "𝑢": [.u, .italic],

    //1D463         ; MATHEMATICAL ITALIC SMALL V
    "𝑣": [.v, .italic],

    //1D464         ; MATHEMATICAL ITALIC SMALL W
    "𝑤": [.w, .italic],

    //1D465         ; MATHEMATICAL ITALIC SMALL X
    "𝑥": [.x, .italic],

    //1D466         ; MATHEMATICAL ITALIC SMALL Y
    "𝑦": [.y, .italic],

    //1D467         ; MATHEMATICAL ITALIC SMALL Z
    "𝑧": [.z, .italic],

    //1D468         ; MATHEMATICAL BOLD ITALIC CAPITAL A
    "𝑨": [.a, .capital, .bold, .italic],

    //1D469         ; MATHEMATICAL BOLD ITALIC CAPITAL B
    "𝑩": [.b, .capital, .bold, .italic],

    //1D46A         ; MATHEMATICAL BOLD ITALIC CAPITAL C
    "𝑪": [.c, .capital, .bold, .italic],

    //1D46B         ; MATHEMATICAL BOLD ITALIC CAPITAL D
    "𝑫": [.d, .capital, .bold, .italic],

    //1D46C         ; MATHEMATICAL BOLD ITALIC CAPITAL E
    "𝑬": [.e, .capital, .bold, .italic],

    //1D46D         ; MATHEMATICAL BOLD ITALIC CAPITAL F
    "𝑭": [.f, .capital, .bold, .italic],

    //1D46E         ; MATHEMATICAL BOLD ITALIC CAPITAL G
    "𝑮": [.g, .capital, .bold, .italic],

    //1D46F         ; MATHEMATICAL BOLD ITALIC CAPITAL H
    "𝑯": [.h, .capital, .bold, .italic],

    //1D470         ; MATHEMATICAL BOLD ITALIC CAPITAL I
    "𝑰": [.i, .capital, .bold, .italic],

    //1D471         ; MATHEMATICAL BOLD ITALIC CAPITAL J
    "𝑱": [.j, .capital, .bold, .italic],

    //1D472         ; MATHEMATICAL BOLD ITALIC CAPITAL K
    "𝑲": [.k, .capital, .bold, .italic],

    //1D473         ; MATHEMATICAL BOLD ITALIC CAPITAL L
    "𝑳": [.l, .capital, .bold, .italic],

    //1D474         ; MATHEMATICAL BOLD ITALIC CAPITAL M
    "𝑴": [.m, .capital, .bold, .italic],

    //1D475         ; MATHEMATICAL BOLD ITALIC CAPITAL N
    "𝑵": [.n, .capital, .bold, .italic],

    //1D476         ; MATHEMATICAL BOLD ITALIC CAPITAL O
    "𝑶": [.o, .capital, .bold, .italic],

    //1D477         ; MATHEMATICAL BOLD ITALIC CAPITAL P
    "𝑷": [.p, .capital, .bold, .italic],

    //1D478         ; MATHEMATICAL BOLD ITALIC CAPITAL Q
    "𝑸": [.q, .capital, .bold, .italic],

    //1D479         ; MATHEMATICAL BOLD ITALIC CAPITAL R
    "𝑹": [.r, .capital, .bold, .italic],

    //1D47A         ; MATHEMATICAL BOLD ITALIC CAPITAL S
    "𝑺": [.s, .capital, .bold, .italic],

    //1D47B         ; MATHEMATICAL BOLD ITALIC CAPITAL T
    "𝑻": [.t, .capital, .bold, .italic],

    //1D47C         ; MATHEMATICAL BOLD ITALIC CAPITAL U
    "𝑼": [.u, .capital, .bold, .italic],

    //1D47D         ; MATHEMATICAL BOLD ITALIC CAPITAL V
    "𝑽": [.v, .capital, .bold, .italic],

    //1D47E         ; MATHEMATICAL BOLD ITALIC CAPITAL W
    "𝑾": [.w, .capital, .bold, .italic],

    //1D47F         ; MATHEMATICAL BOLD ITALIC CAPITAL X
    "𝑿": [.x, .capital, .bold, .italic],

    //1D480         ; MATHEMATICAL BOLD ITALIC CAPITAL Y
    "𝒀": [.y, .capital, .bold, .italic],

    //1D481         ; MATHEMATICAL BOLD ITALIC CAPITAL Z
    "𝒁": [.z, .capital, .bold, .italic],

    //1D482         ; MATHEMATICAL BOLD ITALIC SMALL A
    "𝒂": [.a, .bold, .italic],

    //1D483         ; MATHEMATICAL BOLD ITALIC SMALL B
    "𝒃": [.b, .bold, .italic],

    //1D484         ; MATHEMATICAL BOLD ITALIC SMALL C
    "𝒄": [.c, .bold, .italic],

    //1D485         ; MATHEMATICAL BOLD ITALIC SMALL D
    "𝒅": [.d, .bold, .italic],

    //1D486         ; MATHEMATICAL BOLD ITALIC SMALL E
    "𝒆": [.e, .bold, .italic],

    //1D487         ; MATHEMATICAL BOLD ITALIC SMALL F
    "𝒇": [.f, .bold, .italic],

    //1D488         ; MATHEMATICAL BOLD ITALIC SMALL G
    "𝒈": [.g, .bold, .italic],

    //1D489         ; MATHEMATICAL BOLD ITALIC SMALL H
    "𝒉": [.h, .bold, .italic],

    //1D48A         ; MATHEMATICAL BOLD ITALIC SMALL I
    "𝒊": [.i, .bold, .italic],

    //1D48B         ; MATHEMATICAL BOLD ITALIC SMALL J
    "𝒋": [.j, .bold, .bold, .italic],

    //1D48C         ; MATHEMATICAL BOLD ITALIC SMALL K
    "𝒌": [.k, .bold, .italic],

    //1D48D         ; MATHEMATICAL BOLD ITALIC SMALL L
    "𝒍": [.l, .bold, .italic],

    //1D48E         ; MATHEMATICAL BOLD ITALIC SMALL M
    "𝒎": [.m, .bold, .italic],

    //1D48F         ; MATHEMATICAL BOLD ITALIC SMALL N
    "𝒏": [.n, .bold, .italic],

    //1D490         ; MATHEMATICAL BOLD ITALIC SMALL O
    "𝒐": [.o, .bold, .italic],

    //1D491         ; MATHEMATICAL BOLD ITALIC SMALL P
    "𝒑": [.p, .bold, .italic],

    //1D492         ; MATHEMATICAL BOLD ITALIC SMALL Q
    "𝒒": [.q, .bold, .italic],

    //1D493         ; MATHEMATICAL BOLD ITALIC SMALL R
    "𝒓": [.r, .bold, .italic],

    //1D494         ; MATHEMATICAL BOLD ITALIC SMALL S
    "𝒔": [.s, .bold, .italic],

    //1D495         ; MATHEMATICAL BOLD ITALIC SMALL T
    "𝒕": [.t, .bold, .italic],

    //1D496         ; MATHEMATICAL BOLD ITALIC SMALL U
    "𝒖": [.u, .bold, .italic],

    //1D497         ; MATHEMATICAL BOLD ITALIC SMALL V
    "𝒗": [.v, .bold, .italic],

    //1D498         ; MATHEMATICAL BOLD ITALIC SMALL W
    "𝒘": [.w, .bold, .italic],

    //1D499         ; MATHEMATICAL BOLD ITALIC SMALL X
    "𝒙": [.x, .bold, .italic],

    //1D49A         ; MATHEMATICAL BOLD ITALIC SMALL Y
    "𝒚": [.y, .bold, .italic],

    //1D49B         ; MATHEMATICAL BOLD ITALIC SMALL Z
    "𝒛": [.z, .bold, .italic],

    //1D49C         ; MATHEMATICAL SCRIPT CAPITAL A
    "𝒜": [.a, .capital, .script],

    //1D49E         ; MATHEMATICAL SCRIPT CAPITAL C
    "𝒞": [.c, .capital, .script],

    //1D49F         ; MATHEMATICAL SCRIPT CAPITAL D
    "𝒟": [.d, .capital, .script],

    //1D4A2         ; MATHEMATICAL SCRIPT CAPITAL G
    "𝒢": [.g, .capital, .script],

    //1D4A5         ; MATHEMATICAL SCRIPT CAPITAL J
    "𝒥": [.j, .capital, .script],

    //1D4A6         ; MATHEMATICAL SCRIPT CAPITAL K
    "𝒦": [.k, .capital, .script],

    //1D4A9         ; MATHEMATICAL SCRIPT CAPITAL N
    "𝒩": [.n, .capital, .script],

    //1D4AA         ; MATHEMATICAL SCRIPT CAPITAL O
    "𝒪": [.o, .capital, .script],

    //1D4AB         ; MATHEMATICAL SCRIPT CAPITAL P
    "𝒫": [.p, .capital, .script],

    //1D4AC         ; MATHEMATICAL SCRIPT CAPITAL Q
    "𝒬": [.q, .capital, .script],

    //1D4AE         ; MATHEMATICAL SCRIPT CAPITAL S
    "𝒮": [.s, .capital, .script],

    //1D4AF         ; MATHEMATICAL SCRIPT CAPITAL T
    "𝒯": [.t, .capital, .script],

    //1D4B0         ; MATHEMATICAL SCRIPT CAPITAL U
    "𝒰": [.u, .capital, .script],

    //1D4B1         ; MATHEMATICAL SCRIPT CAPITAL V
    "𝒱": [.v, .capital, .script],

    //1D4B2         ; MATHEMATICAL SCRIPT CAPITAL W
    "𝒲": [.w, .capital, .script],

    //1D4B3         ; MATHEMATICAL SCRIPT CAPITAL X
    "𝒳": [.x, .capital, .script],

    //1D4B4         ; MATHEMATICAL SCRIPT CAPITAL Y
    "𝒴": [.y, .capital, .script],

    //1D4B5         ; MATHEMATICAL SCRIPT CAPITAL Z
    "𝒵": [.z, .capital, .script],

    //1D4B6         ; MATHEMATICAL SCRIPT SMALL A
    "𝒶": [.a, .script],

    //1D4B7         ; MATHEMATICAL SCRIPT SMALL B
    "𝒷": [.b, .script],

    //1D4B8         ; MATHEMATICAL SCRIPT SMALL C
    "𝒸": [.c, .script],

    //1D4B9         ; MATHEMATICAL SCRIPT SMALL D
    "𝒹": [.d, .script],

    //1D4BB         ; MATHEMATICAL SCRIPT SMALL F
    "𝒻": [.f, .script],

    //1D4BD         ; MATHEMATICAL SCRIPT SMALL H
    "𝒽": [.h, .script],

    //1D4BE         ; MATHEMATICAL SCRIPT SMALL I
    "𝒾": [.i, .script],

    //1D4BF         ; MATHEMATICAL SCRIPT SMALL J
    "𝒿": [.j, .script],

    //1D4C0         ; MATHEMATICAL SCRIPT SMALL K
    "𝓀": [.k, .script],

    //1D4C1         ; MATHEMATICAL SCRIPT SMALL L
    "𝓁": [.l, .script],

    //1D4C2         ; MATHEMATICAL SCRIPT SMALL M
    "𝓂": [.m, .script],

    //1D4C3         ; MATHEMATICAL SCRIPT SMALL N
    "𝓃": [.n, .script],

    //1D4C5         ; MATHEMATICAL SCRIPT SMALL P
    "𝓅": [.p, .script],

    //1D4C6         ; MATHEMATICAL SCRIPT SMALL Q
    "𝓆": [.q, .script],

    //1D4C7         ; MATHEMATICAL SCRIPT SMALL R
    "𝓇": [.r, .script],

    //1D4C8         ; MATHEMATICAL SCRIPT SMALL S
    "𝓈": [.s, .script],

    //1D4C9         ; MATHEMATICAL SCRIPT SMALL T
    "𝓉": [.t, .script],

    //1D4CA         ; MATHEMATICAL SCRIPT SMALL U
    "𝓊": [.u, .script],

    //1D4CB         ; MATHEMATICAL SCRIPT SMALL V
    "𝓋": [.v, .script],

    //1D4CC         ; MATHEMATICAL SCRIPT SMALL W
    "𝓌": [.w, .script],

    //1D4CD         ; MATHEMATICAL SCRIPT SMALL X
    "𝓍": [.x, .script],

    //1D4CE         ; MATHEMATICAL SCRIPT SMALL Y
    "𝓎": [.y, .script],

    //1D4CF         ; MATHEMATICAL SCRIPT SMALL Z
    "𝓏": [.z, .script],

    //1D4D0         ; MATHEMATICAL BOLD SCRIPT CAPITAL A
    "𝓐": [.a, .capital, .bold, .script],

    //1D4D1         ; MATHEMATICAL BOLD SCRIPT CAPITAL B
    "𝓑": [.b, .capital, .bold, .script],

    //1D4D2         ; MATHEMATICAL BOLD SCRIPT CAPITAL C
    "𝓒": [.c, .capital, .bold, .script],

    //1D4D3         ; MATHEMATICAL BOLD SCRIPT CAPITAL D
    "𝓓": [.d, .capital, .bold, .script],

    //1D4D4         ; MATHEMATICAL BOLD SCRIPT CAPITAL E
    "𝓔": [.e, .capital, .bold, .script],

    //1D4D5         ; MATHEMATICAL BOLD SCRIPT CAPITAL F
    "𝓕": [.f, .capital, .bold, .script],

    //1D4D6         ; MATHEMATICAL BOLD SCRIPT CAPITAL G
    "𝓖": [.g, .capital, .bold, .script],

    //1D4D7         ; MATHEMATICAL BOLD SCRIPT CAPITAL H
    "𝓗": [.h, .capital, .bold, .script],

    //1D4D8         ; MATHEMATICAL BOLD SCRIPT CAPITAL I
    "𝓘": [.i, .capital, .bold, .script],

    //1D4D9         ; MATHEMATICAL BOLD SCRIPT CAPITAL J
    "𝓙": [.j, .capital, .bold, .script],

    //1D4DA         ; MATHEMATICAL BOLD SCRIPT CAPITAL K
    "𝓚": [.k, .capital, .bold, .script],

    //1D4DB         ; MATHEMATICAL BOLD SCRIPT CAPITAL L
    "𝓛": [.l, .capital, .bold, .script],

    //1D4DC         ; MATHEMATICAL BOLD SCRIPT CAPITAL M
    "𝓜": [.m, .capital, .bold, .script],

    //1D4DD         ; MATHEMATICAL BOLD SCRIPT CAPITAL N
    "𝓝": [.n, .capital, .bold, .script],

    //1D4DE         ; MATHEMATICAL BOLD SCRIPT CAPITAL O
    "𝓞": [.o, .capital, .bold, .script],

    //1D4DF         ; MATHEMATICAL BOLD SCRIPT CAPITAL P
    "𝓟": [.p, .capital, .bold, .script],

    //1D4E0         ; MATHEMATICAL BOLD SCRIPT CAPITAL Q
    "𝓠": [.q, .capital, .bold, .script],

    //1D4E1         ; MATHEMATICAL BOLD SCRIPT CAPITAL R
    "𝓡": [.r, .capital, .bold, .script],

    //1D4E2         ; MATHEMATICAL BOLD SCRIPT CAPITAL S
    "𝓢": [.s, .capital, .bold, .script],

    //1D4E3         ; MATHEMATICAL BOLD SCRIPT CAPITAL T
    "𝓣": [.t, .capital, .bold, .script],

    //1D4E4         ; MATHEMATICAL BOLD SCRIPT CAPITAL U
    "𝓤": [.u, .capital, .bold, .script],

    //1D4E5         ; MATHEMATICAL BOLD SCRIPT CAPITAL V
    "𝓥": [.v, .capital, .bold, .script],

    //1D4E6         ; MATHEMATICAL BOLD SCRIPT CAPITAL W
    "𝓦": [.w, .capital, .bold, .script],

    //1D4E7         ; MATHEMATICAL BOLD SCRIPT CAPITAL X
    "𝓧": [.x, .capital, .bold, .script],

    //1D4E8         ; MATHEMATICAL BOLD SCRIPT CAPITAL Y
    "𝓨": [.y, .capital, .bold, .script],

    //1D4E9         ; MATHEMATICAL BOLD SCRIPT CAPITAL Z
    "𝓩": [.z, .capital, .bold, .script],

    //1D4EA         ; MATHEMATICAL BOLD SCRIPT SMALL A
    "𝓪": [.a, .bold, .script],

    //1D4EB         ; MATHEMATICAL BOLD SCRIPT SMALL B
    "𝓫": [.b, .bold, .script],

    //1D4EC         ; MATHEMATICAL BOLD SCRIPT SMALL C
    "𝓬": [.c, .bold, .script],

    //1D4ED         ; MATHEMATICAL BOLD SCRIPT SMALL D
    "𝓭": [.d, .bold, .script],

    //1D4EE         ; MATHEMATICAL BOLD SCRIPT SMALL E
    "𝓮": [.e, .bold, .script],

    //1D4EF         ; MATHEMATICAL BOLD SCRIPT SMALL F
    "𝓯": [.f, .bold, .script],

    //1D4F0         ; MATHEMATICAL BOLD SCRIPT SMALL G
    "𝓰": [.g, .bold, .script],

    //1D4F1         ; MATHEMATICAL BOLD SCRIPT SMALL H
    "𝓱": [.h, .bold, .script],

    //1D4F2         ; MATHEMATICAL BOLD SCRIPT SMALL I
    "𝓲": [.i, .bold, .script],

    //1D4F3         ; MATHEMATICAL BOLD SCRIPT SMALL J
    "𝓳": [.j, .bold, .script],

    //1D4F4         ; MATHEMATICAL BOLD SCRIPT SMALL K
    "𝓴": [.k, .bold, .script],

    //1D4F5         ; MATHEMATICAL BOLD SCRIPT SMALL L
    "𝓵": [.l, .bold, .script],

    //1D4F6         ; MATHEMATICAL BOLD SCRIPT SMALL M
    "𝓶": [.m, .bold, .script],

    //1D4F7         ; MATHEMATICAL BOLD SCRIPT SMALL N
    "𝓷": [.n, .bold, .script],

    //1D4F8         ; MATHEMATICAL BOLD SCRIPT SMALL O
    "𝓸": [.o, .bold, .script],

    //1D4F9         ; MATHEMATICAL BOLD SCRIPT SMALL P
    "𝓹": [.p, .bold, .script],

    //1D4FA         ; MATHEMATICAL BOLD SCRIPT SMALL Q
    "𝓺": [.q, .bold, .script],

    //1D4FB         ; MATHEMATICAL BOLD SCRIPT SMALL R
    "𝓻": [.r, .bold, .script],

    //1D4FC         ; MATHEMATICAL BOLD SCRIPT SMALL S
    "𝓼": [.s, .bold, .script],

    //1D4FD         ; MATHEMATICAL BOLD SCRIPT SMALL T
    "𝓽": [.t, .bold, .script],

    //1D4FE         ; MATHEMATICAL BOLD SCRIPT SMALL U
    "𝓾": [.u, .bold, .script],

    //1D4FF         ; MATHEMATICAL BOLD SCRIPT SMALL V
    "𝓿": [.v, .bold, .script],

    //1D500         ; MATHEMATICAL BOLD SCRIPT SMALL W
    "𝔀": [.w, .bold, .script],

    //1D501         ; MATHEMATICAL BOLD SCRIPT SMALL X
    "𝔁": [.x, .bold, .script],

    //1D502         ; MATHEMATICAL BOLD SCRIPT SMALL Y
    "𝔂": [.y, .bold, .script],

    //1D503         ; MATHEMATICAL BOLD SCRIPT SMALL Z
    "𝔃": [.z, .bold, .script],

    //1D504         ; MATHEMATICAL FRAKTUR CAPITAL A
    "𝔄": [.a, .capital, .fraktur],

    //1D505         ; MATHEMATICAL FRAKTUR CAPITAL B
    "𝔅": [.b, .capital, .fraktur],

    //1D507         ; MATHEMATICAL FRAKTUR CAPITAL D
    "𝔇": [.d, .capital, .fraktur],

    //1D508         ; MATHEMATICAL FRAKTUR CAPITAL E
    "𝔈": [.e, .capital, .fraktur],

    //1D509         ; MATHEMATICAL FRAKTUR CAPITAL F
    "𝔉": [.f, .capital, .fraktur],

    //1D50A         ; MATHEMATICAL FRAKTUR CAPITAL G
    "𝔊": [.g, .capital, .fraktur],

    //1D50D         ; MATHEMATICAL FRAKTUR CAPITAL J
    "𝔍": [.j, .capital, .fraktur],

    //1D50E         ; MATHEMATICAL FRAKTUR CAPITAL K
    "𝔎": [.k, .capital, .fraktur],

    //1D50F         ; MATHEMATICAL FRAKTUR CAPITAL L
    "𝔏": [.l, .capital, .fraktur],

    //1D510         ; MATHEMATICAL FRAKTUR CAPITAL M
    "𝔐": [.m, .capital, .fraktur],

    //1D511         ; MATHEMATICAL FRAKTUR CAPITAL N
    "𝔑": [.n, .capital, .fraktur],

    //1D512         ; MATHEMATICAL FRAKTUR CAPITAL O
    "𝔒": [.o, .capital, .fraktur],

    //1D513         ; MATHEMATICAL FRAKTUR CAPITAL P
    "𝔓": [.p, .capital, .fraktur],

    //1D514         ; MATHEMATICAL FRAKTUR CAPITAL Q
    "𝔔": [.q, .capital, .fraktur],

    //1D516         ; MATHEMATICAL FRAKTUR CAPITAL S
    "𝔖": [.s, .capital, .fraktur],

    //1D517         ; MATHEMATICAL FRAKTUR CAPITAL T
    "𝔗": [.t, .capital, .fraktur],

    //1D518         ; MATHEMATICAL FRAKTUR CAPITAL U
    "𝔘": [.u, .capital, .fraktur],

    //1D519         ; MATHEMATICAL FRAKTUR CAPITAL V
    "𝔙": [.v, .capital, .fraktur],

    //1D51A         ; MATHEMATICAL FRAKTUR CAPITAL W
    "𝔚": [.w, .capital, .fraktur],

    //1D51B         ; MATHEMATICAL FRAKTUR CAPITAL X
    "𝔛": [.x, .capital, .fraktur],

    //1D51C         ; MATHEMATICAL FRAKTUR CAPITAL Y
    "𝔜": [.y, .capital, .fraktur],

    //1D51E         ; MATHEMATICAL FRAKTUR SMALL A
    "𝔞": [.a, .fraktur],

    //1D51F         ; MATHEMATICAL FRAKTUR SMALL B
    "𝔟": [.b, .fraktur],

    //1D520         ; MATHEMATICAL FRAKTUR SMALL C
    "𝔠": [.c, .fraktur],

    //1D521         ; MATHEMATICAL FRAKTUR SMALL D
    "𝔡": [.d, .fraktur],

    //1D522         ; MATHEMATICAL FRAKTUR SMALL E
    "𝔢": [.e, .fraktur],

    //1D523         ; MATHEMATICAL FRAKTUR SMALL F
    "𝔣": [.f, .fraktur],

    //1D524         ; MATHEMATICAL FRAKTUR SMALL G
    "𝔤": [.g, .fraktur],

    //1D525         ; MATHEMATICAL FRAKTUR SMALL H
    "𝔥": [.h, .fraktur],

    //1D526         ; MATHEMATICAL FRAKTUR SMALL I
    "𝔦": [.i, .fraktur],

    //1D527         ; MATHEMATICAL FRAKTUR SMALL J
    "𝔧": [.j, .fraktur],

    //1D528         ; MATHEMATICAL FRAKTUR SMALL K
    "𝔨": [.k, .fraktur],

    //1D529         ; MATHEMATICAL FRAKTUR SMALL L
    "𝔩": [.l, .fraktur],

    //1D52A         ; MATHEMATICAL FRAKTUR SMALL M
    "𝔪": [.m, .fraktur],

    //1D52B         ; MATHEMATICAL FRAKTUR SMALL N
    "𝔫": [.n, .fraktur],

    //1D52C         ; MATHEMATICAL FRAKTUR SMALL O
    "𝔬": [.o, .fraktur],

    //1D52D         ; MATHEMATICAL FRAKTUR SMALL P
    "𝔭": [.p, .fraktur],

    //1D52E         ; MATHEMATICAL FRAKTUR SMALL Q
    "𝔮": [.q, .fraktur],

    //1D52F         ; MATHEMATICAL FRAKTUR SMALL R
    "𝔯": [.r, .fraktur],

    //1D530         ; MATHEMATICAL FRAKTUR SMALL S
    "𝔰": [.s, .fraktur],

    //1D531         ; MATHEMATICAL FRAKTUR SMALL T
    "𝔱": [.t, .fraktur],

    //1D532         ; MATHEMATICAL FRAKTUR SMALL U
    "𝔲": [.u, .fraktur],

    //1D533         ; MATHEMATICAL FRAKTUR SMALL V
    "𝔳": [.v, .fraktur],

    //1D534         ; MATHEMATICAL FRAKTUR SMALL W
    "𝔴": [.w, .fraktur],

    //1D535         ; MATHEMATICAL FRAKTUR SMALL X
    "𝔵": [.x, .fraktur],

    //1D536         ; MATHEMATICAL FRAKTUR SMALL Y
    "𝔶": [.y, .fraktur],

    //1D537         ; MATHEMATICAL FRAKTUR SMALL Z
    "𝔷": [.z, .fraktur],

    //1D538         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL A
    "𝔸": [.a, .capital, .doubleStruck],

    //1D539         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL B
    "𝔹": [.b, .capital, .doubleStruck],

    //1D53B         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL D
    "𝔻": [.d, .capital, .doubleStruck],

    //1D53C         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL E
    "𝔼": [.e, .capital, .doubleStruck],

    //1D53D         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL F
    "𝔽": [.f, .capital, .doubleStruck],

    //1D53E         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL G
    "𝔾": [.g, .capital, .doubleStruck],

    //1D540         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL I
    "𝕀": [.i, .capital, .doubleStruck],

    //1D541         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL J
    "𝕁": [.j, .capital, .doubleStruck],

    //1D542         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL K
    "𝕂": [.k, .capital, .doubleStruck],

    //1D543         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL L
    "𝕃": [.l, .capital, .doubleStruck],

    //1D544         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL M
    "𝕄": [.m, .capital, .doubleStruck],

    //1D546         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL O
    "𝕆": [.o, .capital, .doubleStruck],

    //1D54A         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL S
    "𝕊": [.s, .capital, .doubleStruck],

    //1D54B         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL T
    "𝕋": [.t, .capital, .doubleStruck],

    //1D54C         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL U
    "𝕌": [.u, .capital, .doubleStruck],

    //1D54D         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL V
    "𝕍": [.v, .capital, .doubleStruck],

    //1D54E         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL W
    "𝕎": [.w, .capital, .doubleStruck],

    //1D54F         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL X
    "𝕏": [.x, .capital, .doubleStruck],

    //1D550         ; MATHEMATICAL DOUBLE-STRUCK CAPITAL Y
    "𝕐": [.y, .capital, .doubleStruck],

    //1D552         ; MATHEMATICAL DOUBLE-STRUCK SMALL A
    "𝕒": [.a, .doubleStruck],

    //1D553         ; MATHEMATICAL DOUBLE-STRUCK SMALL B
    "𝕓": [.b, .doubleStruck],

    //1D554         ; MATHEMATICAL DOUBLE-STRUCK SMALL C
    "𝕔": [.c, .doubleStruck],

    //1D555         ; MATHEMATICAL DOUBLE-STRUCK SMALL D
    "𝕕": [.d, .doubleStruck],

    //1D556         ; MATHEMATICAL DOUBLE-STRUCK SMALL E
    "𝕖": [.e, .doubleStruck],

    //1D557         ; MATHEMATICAL DOUBLE-STRUCK SMALL F
    "𝕗": [.f, .doubleStruck],

    //1D558         ; MATHEMATICAL DOUBLE-STRUCK SMALL G
    "𝕘": [.g, .doubleStruck],

    //1D559         ; MATHEMATICAL DOUBLE-STRUCK SMALL H
    "𝕙": [.h, .doubleStruck],

    //1D55A         ; MATHEMATICAL DOUBLE-STRUCK SMALL I
    "𝕚": [.i, .doubleStruck],

    //1D55B         ; MATHEMATICAL DOUBLE-STRUCK SMALL J
    "𝕛": [.j, .doubleStruck],

    //1D55C         ; MATHEMATICAL DOUBLE-STRUCK SMALL K
    "𝕜": [.k, .doubleStruck],

    //1D55D         ; MATHEMATICAL DOUBLE-STRUCK SMALL L
    "𝕝": [.l, .doubleStruck],

    //1D55E         ; MATHEMATICAL DOUBLE-STRUCK SMALL M
    "𝕞": [.m, .doubleStruck],

    //1D55F         ; MATHEMATICAL DOUBLE-STRUCK SMALL N
    "𝕟": [.n, .doubleStruck],

    //1D560         ; MATHEMATICAL DOUBLE-STRUCK SMALL O
    "𝕠": [.o, .doubleStruck],

    //1D561         ; MATHEMATICAL DOUBLE-STRUCK SMALL P
    "𝕡": [.p, .doubleStruck],

    //1D562         ; MATHEMATICAL DOUBLE-STRUCK SMALL Q
    "𝕢": [.q, .doubleStruck],

    //1D563         ; MATHEMATICAL DOUBLE-STRUCK SMALL R
    "𝕣": [.r, .doubleStruck],

    //1D564         ; MATHEMATICAL DOUBLE-STRUCK SMALL S
    "𝕤": [.s, .doubleStruck],

    //1D565         ; MATHEMATICAL DOUBLE-STRUCK SMALL T
    "𝕥": [.t, .doubleStruck],

    //1D566         ; MATHEMATICAL DOUBLE-STRUCK SMALL U
    "𝕦": [.u, .doubleStruck],

    //1D567         ; MATHEMATICAL DOUBLE-STRUCK SMALL V
    "𝕧": [.v, .doubleStruck],

    //1D568         ; MATHEMATICAL DOUBLE-STRUCK SMALL W
    "𝕨": [.w, .doubleStruck],

    //1D569         ; MATHEMATICAL DOUBLE-STRUCK SMALL X
    "𝕩": [.x, .doubleStruck],

    //1D56A         ; MATHEMATICAL DOUBLE-STRUCK SMALL Y
    "𝕪": [.y, .doubleStruck],

    //1D56B         ; MATHEMATICAL DOUBLE-STRUCK SMALL Z
    "𝕫": [.z, .doubleStruck],

    //1D56C         ; MATHEMATICAL BOLD FRAKTUR CAPITAL A
    "𝕬": [.a, .capital, .bold, .fraktur],

    //1D56D         ; MATHEMATICAL BOLD FRAKTUR CAPITAL B
    "𝕭": [.b, .capital, .bold, .fraktur],

    //1D56E         ; MATHEMATICAL BOLD FRAKTUR CAPITAL C
    "𝕮": [.c, .capital, .bold, .fraktur],

    //1D56F         ; MATHEMATICAL BOLD FRAKTUR CAPITAL D
    "𝕯": [.d, .capital, .bold, .fraktur],

    //1D570         ; MATHEMATICAL BOLD FRAKTUR CAPITAL E
    "𝕰": [.e, .capital, .bold, .fraktur],

    //1D571         ; MATHEMATICAL BOLD FRAKTUR CAPITAL F
    "𝕱": [.f, .capital, .bold, .fraktur],

    //1D572         ; MATHEMATICAL BOLD FRAKTUR CAPITAL G
    "𝕲": [.g, .capital, .bold, .fraktur],

    //1D573         ; MATHEMATICAL BOLD FRAKTUR CAPITAL H
    "𝕳": [.h, .capital, .bold, .fraktur],

    //1D574         ; MATHEMATICAL BOLD FRAKTUR CAPITAL I
    "𝕴": [.i, .capital, .bold, .fraktur],

    //1D575         ; MATHEMATICAL BOLD FRAKTUR CAPITAL J
    "𝕵": [.j, .capital, .bold, .fraktur],

    //1D576         ; MATHEMATICAL BOLD FRAKTUR CAPITAL K
    "𝕶": [.k, .capital, .bold, .fraktur],

    //1D577         ; MATHEMATICAL BOLD FRAKTUR CAPITAL L
    "𝕷": [.l, .capital, .bold, .fraktur],

    //1D578         ; MATHEMATICAL BOLD FRAKTUR CAPITAL M
    "𝕸": [.m, .capital, .bold, .fraktur],

    //1D579         ; MATHEMATICAL BOLD FRAKTUR CAPITAL N
    "𝕹": [.n, .capital, .bold, .fraktur],

    //1D57A         ; MATHEMATICAL BOLD FRAKTUR CAPITAL O
    "𝕺": [.o, .capital, .bold, .fraktur],

    //1D57B         ; MATHEMATICAL BOLD FRAKTUR CAPITAL P
    "𝕻": [.p, .capital, .bold, .fraktur],

    //1D57C         ; MATHEMATICAL BOLD FRAKTUR CAPITAL Q
    "𝕼": [.q, .capital, .bold, .fraktur],

    //1D57D         ; MATHEMATICAL BOLD FRAKTUR CAPITAL R
    "𝕽": [.r, .capital, .bold, .fraktur],

    //1D57E         ; MATHEMATICAL BOLD FRAKTUR CAPITAL S
    "𝕾": [.s, .capital, .bold, .fraktur],

    //1D57F         ; MATHEMATICAL BOLD FRAKTUR CAPITAL T
    "𝕿": [.t, .capital, .bold, .fraktur],

    //1D580         ; MATHEMATICAL BOLD FRAKTUR CAPITAL U
    "𝖀": [.u, .capital, .bold, .fraktur],

    //1D581         ; MATHEMATICAL BOLD FRAKTUR CAPITAL V
    "𝖁": [.v, .capital, .bold, .fraktur],

    //1D582         ; MATHEMATICAL BOLD FRAKTUR CAPITAL W
    "𝖂": [.w, .capital, .bold, .fraktur],

    //1D583         ; MATHEMATICAL BOLD FRAKTUR CAPITAL X
    "𝖃": [.x, .capital, .bold, .fraktur],

    //1D584         ; MATHEMATICAL BOLD FRAKTUR CAPITAL Y
    "𝖄": [.y, .capital, .bold, .fraktur],

    //1D585         ; MATHEMATICAL BOLD FRAKTUR CAPITAL Z
    "𝖅": [.z, .capital, .bold, .fraktur],

    //1D586         ; MATHEMATICAL BOLD FRAKTUR SMALL A
    "𝖆": [.a, .bold, .fraktur],

    //1D587         ; MATHEMATICAL BOLD FRAKTUR SMALL B
    "𝖇": [.b, .bold, .fraktur],

    //1D588         ; MATHEMATICAL BOLD FRAKTUR SMALL C
    "𝖈": [.c, .bold, .fraktur],

    //1D589         ; MATHEMATICAL BOLD FRAKTUR SMALL D
    "𝖉": [.d, .bold, .fraktur],

    //1D58A         ; MATHEMATICAL BOLD FRAKTUR SMALL E
    "𝖊": [.e, .bold, .fraktur],

    //1D58B         ; MATHEMATICAL BOLD FRAKTUR SMALL F
    "𝖋": [.f, .bold, .fraktur],

    //1D58C         ; MATHEMATICAL BOLD FRAKTUR SMALL G
    "𝖌": [.g, .bold, .fraktur],

    //1D58D         ; MATHEMATICAL BOLD FRAKTUR SMALL H
    "𝖍": [.h, .bold, .fraktur],

    //1D58E         ; MATHEMATICAL BOLD FRAKTUR SMALL I
    "𝖎": [.i, .bold, .fraktur],

    //1D58F         ; MATHEMATICAL BOLD FRAKTUR SMALL J
    "𝖏": [.j, .bold, .fraktur],

    //1D590         ; MATHEMATICAL BOLD FRAKTUR SMALL K
    "𝖐": [.k, .bold, .fraktur],

    //1D591         ; MATHEMATICAL BOLD FRAKTUR SMALL L
    "𝖑": [.l, .bold, .fraktur],

    //1D592         ; MATHEMATICAL BOLD FRAKTUR SMALL M
    "𝖒": [.m, .bold, .fraktur],

    //1D593         ; MATHEMATICAL BOLD FRAKTUR SMALL N
    "𝖓": [.n, .bold, .fraktur],

    //1D594         ; MATHEMATICAL BOLD FRAKTUR SMALL O
    "𝖔": [.o, .bold, .fraktur],

    //1D595         ; MATHEMATICAL BOLD FRAKTUR SMALL P
    "𝖕": [.p, .bold, .fraktur],

    //1D596         ; MATHEMATICAL BOLD FRAKTUR SMALL Q
    "𝖖": [.q, .bold, .fraktur],

    //1D597         ; MATHEMATICAL BOLD FRAKTUR SMALL R
    "𝖗": [.r, .bold, .fraktur],

    //1D598         ; MATHEMATICAL BOLD FRAKTUR SMALL S
    "𝖘": [.s, .bold, .fraktur],

    //1D599         ; MATHEMATICAL BOLD FRAKTUR SMALL T
    "𝖙": [.t, .bold, .fraktur],

    //1D59A         ; MATHEMATICAL BOLD FRAKTUR SMALL U
    "𝖚": [.u, .bold, .fraktur],

    //1D59B         ; MATHEMATICAL BOLD FRAKTUR SMALL V
    "𝖛": [.v, .bold, .fraktur],

    //1D59C         ; MATHEMATICAL BOLD FRAKTUR SMALL W
    "𝖜": [.w, .bold, .fraktur],

    //1D59D         ; MATHEMATICAL BOLD FRAKTUR SMALL X
    "𝖝": [.x, .bold, .fraktur],

    //1D59E         ; MATHEMATICAL BOLD FRAKTUR SMALL Y
    "𝖞": [.y, .bold, .fraktur],

    //1D59F         ; MATHEMATICAL BOLD FRAKTUR SMALL Z
    "𝖟": [.z, .bold, .fraktur],

    //1D5A0         ; MATHEMATICAL SANS-SERIF CAPITAL A
    "𝖠": [.a, .capital, .sansSerif],

    //1D5A1         ; MATHEMATICAL SANS-SERIF CAPITAL B
    "𝖡": [.b, .capital, .sansSerif],

    //1D5A2         ; MATHEMATICAL SANS-SERIF CAPITAL C
    "𝖢": [.c, .capital, .sansSerif],

    //1D5A3         ; MATHEMATICAL SANS-SERIF CAPITAL D
    "𝖣": [.d, .capital, .sansSerif],

    //1D5A4         ; MATHEMATICAL SANS-SERIF CAPITAL E
    "𝖤": [.e, .capital, .sansSerif],

    //1D5A5         ; MATHEMATICAL SANS-SERIF CAPITAL F
    "𝖥": [.f, .capital, .sansSerif],

    //1D5A6         ; MATHEMATICAL SANS-SERIF CAPITAL G
    "𝖦": [.g, .capital, .sansSerif],

    //1D5A7         ; MATHEMATICAL SANS-SERIF CAPITAL H
    "𝖧": [.h, .capital, .sansSerif],

    //1D5A8         ; MATHEMATICAL SANS-SERIF CAPITAL I
    "𝖨": [.i, .capital, .sansSerif],

    //1D5A9         ; MATHEMATICAL SANS-SERIF CAPITAL J
    "𝖩": [.j, .capital, .sansSerif],

    //1D5AA         ; MATHEMATICAL SANS-SERIF CAPITAL K
    "𝖪": [.k, .capital, .sansSerif],

    //1D5AB         ; MATHEMATICAL SANS-SERIF CAPITAL L
    "𝖫": [.l, .capital, .sansSerif],

    //1D5AC         ; MATHEMATICAL SANS-SERIF CAPITAL M
    "𝖬": [.m, .capital, .sansSerif],

    //1D5AD         ; MATHEMATICAL SANS-SERIF CAPITAL N
    "𝖭": [.n, .capital, .sansSerif],

    //1D5AE         ; MATHEMATICAL SANS-SERIF CAPITAL O
    "𝖮": [.o, .capital, .sansSerif],

    //1D5AF         ; MATHEMATICAL SANS-SERIF CAPITAL P
    "𝖯": [.p, .capital, .sansSerif],

    //1D5B0         ; MATHEMATICAL SANS-SERIF CAPITAL Q
    "𝖰": [.q, .capital, .sansSerif],

    //1D5B1         ; MATHEMATICAL SANS-SERIF CAPITAL R
    "𝖱": [.r, .capital, .sansSerif],

    //1D5B2         ; MATHEMATICAL SANS-SERIF CAPITAL S
    "𝖲": [.s, .capital, .sansSerif],

    //1D5B3         ; MATHEMATICAL SANS-SERIF CAPITAL T
    "𝖳": [.t, .capital, .sansSerif],

    //1D5B4         ; MATHEMATICAL SANS-SERIF CAPITAL U
    "𝖴": [.u, .capital, .sansSerif],

    //1D5B5         ; MATHEMATICAL SANS-SERIF CAPITAL V
    "𝖵": [.v, .capital, .sansSerif],

    //1D5B6         ; MATHEMATICAL SANS-SERIF CAPITAL W
    "𝖶": [.w, .capital, .sansSerif],

    //1D5B7         ; MATHEMATICAL SANS-SERIF CAPITAL X
    "𝖷": [.x, .capital, .sansSerif],

    //1D5B8         ; MATHEMATICAL SANS-SERIF CAPITAL Y
    "𝖸": [.y, .capital, .sansSerif],

    //1D5B9         ; MATHEMATICAL SANS-SERIF CAPITAL Z
    "𝖹": [.z, .capital, .sansSerif],

    //1D5BA         ; MATHEMATICAL SANS-SERIF SMALL A
    "𝖺": [.a, .sansSerif],

    //1D5BB         ; MATHEMATICAL SANS-SERIF SMALL B
    "𝖻": [.b, .sansSerif],

    //1D5BC         ; MATHEMATICAL SANS-SERIF SMALL C
    "𝖼": [.c, .sansSerif],

    //1D5BD         ; MATHEMATICAL SANS-SERIF SMALL D
    "𝖽": [.d, .sansSerif],

    //1D5BE         ; MATHEMATICAL SANS-SERIF SMALL E
    "𝖾": [.e, .sansSerif],

    //1D5BF         ; MATHEMATICAL SANS-SERIF SMALL F
    "𝖿": [.f, .sansSerif],

    //1D5C0         ; MATHEMATICAL SANS-SERIF SMALL G
    "𝗀": [.g, .sansSerif],

    //1D5C1         ; MATHEMATICAL SANS-SERIF SMALL H
    "𝗁": [.h, .sansSerif],

    //1D5C2         ; MATHEMATICAL SANS-SERIF SMALL I
    "𝗂": [.i, .sansSerif],

    //1D5C3         ; MATHEMATICAL SANS-SERIF SMALL J
    "𝗃": [.j, .sansSerif],

    //1D5C4         ; MATHEMATICAL SANS-SERIF SMALL K
    "𝗄": [.k, .sansSerif],

    //1D5C5         ; MATHEMATICAL SANS-SERIF SMALL L
    "𝗅": [.l, .sansSerif],

    //1D5C6         ; MATHEMATICAL SANS-SERIF SMALL M
    "𝗆": [.m, .sansSerif],

    //1D5C7         ; MATHEMATICAL SANS-SERIF SMALL N
    "𝗇": [.n, .sansSerif],

    //1D5C8         ; MATHEMATICAL SANS-SERIF SMALL O
    "𝗈": [.o, .sansSerif],

    //1D5C9         ; MATHEMATICAL SANS-SERIF SMALL P
    "𝗉": [.p, .sansSerif],

    //1D5CA         ; MATHEMATICAL SANS-SERIF SMALL Q
    "𝗊": [.q, .sansSerif],

    //1D5CB         ; MATHEMATICAL SANS-SERIF SMALL R
    "𝗋": [.r, .sansSerif],

    //1D5CC         ; MATHEMATICAL SANS-SERIF SMALL S
    "𝗌": [.s, .sansSerif],

    //1D5CD         ; MATHEMATICAL SANS-SERIF SMALL T
    "𝗍": [.t, .sansSerif],

    //1D5CE         ; MATHEMATICAL SANS-SERIF SMALL U
    "𝗎": [.u, .sansSerif],

    //1D5CF         ; MATHEMATICAL SANS-SERIF SMALL V
    "𝗏": [.v, .sansSerif],

    //1D5D0         ; MATHEMATICAL SANS-SERIF SMALL W
    "𝗐": [.w, .sansSerif],

    //1D5D1         ; MATHEMATICAL SANS-SERIF SMALL X
    "𝗑": [.x, .sansSerif],

    //1D5D2         ; MATHEMATICAL SANS-SERIF SMALL Y
    "𝗒": [.y, .sansSerif],

    //1D5D3         ; MATHEMATICAL SANS-SERIF SMALL Z
    "𝗓": [.z, .sansSerif],

    //1D5D4         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL A
    "𝗔": [.a, .capital, .sansSerif, .bold],

    //1D5D5         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL B
    "𝗕": [.b, .capital, .sansSerif, .bold],

    //1D5D6         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL C
    "𝗖": [.c, .capital, .sansSerif, .bold],

    //1D5D7         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL D
    "𝗗": [.d, .capital, .sansSerif, .bold],

    //1D5D8         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL E
    "𝗘": [.e, .capital, .sansSerif, .bold],

    //1D5D9         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL F
    "𝗙": [.f, .capital, .sansSerif, .bold],

    //1D5DA         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL G
    "𝗚": [.g, .capital, .sansSerif, .bold],

    //1D5DB         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL H
    "𝗛": [.h, .capital, .sansSerif, .bold],

    //1D5DC         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL I
    "𝗜": [.i, .capital, .sansSerif, .bold],

    //1D5DD         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL J
    "𝗝": [.j, .capital, .sansSerif, .bold],

    //1D5DE         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL K
    "𝗞": [.k, .capital, .sansSerif, .bold],

    //1D5DF         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL L
    "𝗟": [.l, .capital, .sansSerif, .bold],

    //1D5E0         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL M
    "𝗠": [.m, .capital, .sansSerif, .bold],

    //1D5E1         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL N
    "𝗡": [.n, .capital, .sansSerif, .bold],

    //1D5E2         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL O
    "𝗢": [.o, .capital, .sansSerif, .bold],

    //1D5E3         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL P
    "𝗣": [.p, .capital, .sansSerif, .bold],

    //1D5E4         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL Q
    "𝗤": [.q, .capital, .sansSerif, .bold],

    //1D5E5         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL R
    "𝗥": [.r, .capital, .sansSerif, .bold],

    //1D5E6         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL S
    "𝗦": [.s, .capital, .sansSerif, .bold],

    //1D5E7         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL T
    "𝗧": [.t, .capital, .sansSerif, .bold],

    //1D5E8         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL U
    "𝗨": [.u, .capital, .sansSerif, .bold],

    //1D5E9         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL V
    "𝗩": [.v, .capital, .sansSerif, .bold],

    //1D5EA         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL W
    "𝗪": [.w, .capital, .sansSerif, .bold],

    //1D5EB         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL X
    "𝗫": [.x, .capital, .sansSerif, .bold],

    //1D5EC         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL Y
    "𝗬": [.y, .capital, .sansSerif, .bold],

    //1D5ED         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL Z
    "𝗭": [.z, .capital, .sansSerif, .bold],

    //1D5EE         ; MATHEMATICAL SANS-SERIF BOLD SMALL A
    "𝗮": [.a, .sansSerif, .bold],

    //1D5EF         ; MATHEMATICAL SANS-SERIF BOLD SMALL B
    "𝗯": [.b, .sansSerif, .bold],

    //1D5F0         ; MATHEMATICAL SANS-SERIF BOLD SMALL C
    "𝗰": [.c, .sansSerif, .bold],

    //1D5F1         ; MATHEMATICAL SANS-SERIF BOLD SMALL D
    "𝗱": [.d, .sansSerif, .bold],

    //1D5F2         ; MATHEMATICAL SANS-SERIF BOLD SMALL E
    "𝗲": [.e, .sansSerif, .bold],

    //1D5F3         ; MATHEMATICAL SANS-SERIF BOLD SMALL F
    "𝗳": [.f, .sansSerif, .bold],

    //1D5F4         ; MATHEMATICAL SANS-SERIF BOLD SMALL G
    "𝗴": [.g, .sansSerif, .bold],

    //1D5F5         ; MATHEMATICAL SANS-SERIF BOLD SMALL H
    "𝗵": [.h, .sansSerif, .bold],

    //1D5F6         ; MATHEMATICAL SANS-SERIF BOLD SMALL I
    "𝗶": [.i, .sansSerif, .bold],

    //1D5F7         ; MATHEMATICAL SANS-SERIF BOLD SMALL J
    "𝗷": [.j, .sansSerif, .bold],

    //1D5F8         ; MATHEMATICAL SANS-SERIF BOLD SMALL K
    "𝗸": [.k, .sansSerif, .bold],

    //1D5F9         ; MATHEMATICAL SANS-SERIF BOLD SMALL L
    "𝗹": [.l, .sansSerif, .bold],

    //1D5FA         ; MATHEMATICAL SANS-SERIF BOLD SMALL M
    "𝗺": [.m, .sansSerif, .bold],

    //1D5FB         ; MATHEMATICAL SANS-SERIF BOLD SMALL N
    "𝗻": [.n, .sansSerif, .bold],

    //1D5FC         ; MATHEMATICAL SANS-SERIF BOLD SMALL O
    "𝗼": [.o, .sansSerif, .bold],

    //1D5FD         ; MATHEMATICAL SANS-SERIF BOLD SMALL P
    "𝗽": [.p, .sansSerif, .bold],

    //1D5FE         ; MATHEMATICAL SANS-SERIF BOLD SMALL Q
    "𝗾": [.q, .sansSerif, .bold],

    //1D5FF         ; MATHEMATICAL SANS-SERIF BOLD SMALL R
    "𝗿": [.r, .sansSerif, .bold],

    //1D600         ; MATHEMATICAL SANS-SERIF BOLD SMALL S
    "𝘀": [.s, .sansSerif, .bold],

    //1D601         ; MATHEMATICAL SANS-SERIF BOLD SMALL T
    "𝘁": [.t, .sansSerif, .bold],

    //1D602         ; MATHEMATICAL SANS-SERIF BOLD SMALL U
    "𝘂": [.u, .sansSerif, .bold],

    //1D603         ; MATHEMATICAL SANS-SERIF BOLD SMALL V
    "𝘃": [.v, .sansSerif, .bold],

    //1D604         ; MATHEMATICAL SANS-SERIF BOLD SMALL W
    "𝘄": [.w, .sansSerif, .bold],

    //1D605         ; MATHEMATICAL SANS-SERIF BOLD SMALL X
    "𝘅": [.x, .sansSerif, .bold],

    //1D606         ; MATHEMATICAL SANS-SERIF BOLD SMALL Y
    "𝘆": [.y, .sansSerif, .bold],

    //1D607         ; MATHEMATICAL SANS-SERIF BOLD SMALL Z
    "𝘇": [.z, .sansSerif, .bold],

    //1D608         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL A
    "𝘈": [.a, .capital, .sansSerif, .italic],

    //1D609         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL B
    "𝘉": [.b, .capital, .sansSerif, .italic],

    //1D60A         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL C
    "𝘊": [.c, .capital, .sansSerif, .italic],

    //1D60B         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL D
    "𝘋": [.d, .capital, .sansSerif, .italic],

    //1D60C         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL E
    "𝘌": [.e, .capital, .sansSerif, .italic],

    //1D60D         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL F
    "𝘍": [.f, .capital, .sansSerif, .italic],

    //1D60E         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL G
    "𝘎": [.g, .capital, .sansSerif, .italic],

    //1D60F         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL H
    "𝘏": [.h, .capital, .sansSerif, .italic],

    //1D610         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL I
    "𝘐": [.i, .capital, .sansSerif, .italic],

    //1D611         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL J
    "𝘑": [.j, .capital, .sansSerif, .italic],

    //1D612         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL K
    "𝘒": [.k, .capital, .sansSerif, .italic],

    //1D613         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL L
    "𝘓": [.l, .capital, .sansSerif, .italic],

    //1D614         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL M
    "𝘔": [.m, .capital, .sansSerif, .italic],

    //1D615         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL N
    "𝘕": [.n, .capital, .sansSerif, .italic],

    //1D616         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL O
    "𝘖": [.o, .capital, .sansSerif, .italic],

    //1D617         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL P
    "𝘗": [.p, .capital, .sansSerif, .italic],

    //1D618         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL Q
    "𝘘": [.q, .capital, .sansSerif, .italic],

    //1D619         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL R
    "𝘙": [.r, .capital, .sansSerif, .italic],

    //1D61A         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL S
    "𝘚": [.s, .capital, .sansSerif, .italic],

    //1D61B         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL T
    "𝘛": [.t, .capital, .sansSerif, .italic],

    //1D61C         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL U
    "𝘜": [.u, .capital, .sansSerif, .italic],

    //1D61D         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL V
    "𝘝": [.v, .capital, .sansSerif, .italic],

    //1D61E         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL W
    "𝘞": [.w, .capital, .sansSerif, .italic],

    //1D61F         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL X
    "𝘟": [.x, .capital, .sansSerif, .italic],

    //1D620         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL Y
    "𝘠": [.y, .capital, .sansSerif, .italic],

    //1D621         ; MATHEMATICAL SANS-SERIF ITALIC CAPITAL Z
    "𝘡": [.z, .capital, .sansSerif, .italic],

    //1D622         ; MATHEMATICAL SANS-SERIF ITALIC SMALL A
    "𝘢": [.a, .sansSerif, .italic],

    //1D623         ; MATHEMATICAL SANS-SERIF ITALIC SMALL B
    "𝘣": [.b, .sansSerif, .italic],

    //1D624         ; MATHEMATICAL SANS-SERIF ITALIC SMALL C
    "𝘤": [.c, .sansSerif, .italic],

    //1D625         ; MATHEMATICAL SANS-SERIF ITALIC SMALL D
    "𝘥": [.d, .sansSerif, .italic],

    //1D626         ; MATHEMATICAL SANS-SERIF ITALIC SMALL E
    "𝘦": [.e, .sansSerif, .italic],

    //1D627         ; MATHEMATICAL SANS-SERIF ITALIC SMALL F
    "𝘧": [.f, .sansSerif, .italic],

    //1D628         ; MATHEMATICAL SANS-SERIF ITALIC SMALL G
    "𝘨": [.g, .sansSerif, .italic],

    //1D629         ; MATHEMATICAL SANS-SERIF ITALIC SMALL H
    "𝘩": [.h, .sansSerif, .italic],

    //1D62A         ; MATHEMATICAL SANS-SERIF ITALIC SMALL I
    "𝘪": [.i, .sansSerif, .italic],

    //1D62B         ; MATHEMATICAL SANS-SERIF ITALIC SMALL J
    "𝘫": [.j, .sansSerif, .italic],

    //1D62C         ; MATHEMATICAL SANS-SERIF ITALIC SMALL K
    "𝘬": [.k, .sansSerif, .italic],

    //1D62D         ; MATHEMATICAL SANS-SERIF ITALIC SMALL L
    "𝘭": [.l, .sansSerif, .italic],

    //1D62E         ; MATHEMATICAL SANS-SERIF ITALIC SMALL M
    "𝘮": [.m, .sansSerif, .italic],

    //1D62F         ; MATHEMATICAL SANS-SERIF ITALIC SMALL N
    "𝘯": [.n, .sansSerif, .italic],

    //1D630         ; MATHEMATICAL SANS-SERIF ITALIC SMALL O
    "𝘰": [.o, .sansSerif, .italic],

    //1D631         ; MATHEMATICAL SANS-SERIF ITALIC SMALL P
    "𝘱": [.p, .sansSerif, .italic],

    //1D632         ; MATHEMATICAL SANS-SERIF ITALIC SMALL Q
    "𝘲": [.q, .sansSerif, .italic],

    //1D633         ; MATHEMATICAL SANS-SERIF ITALIC SMALL R
    "𝘳": [.r, .sansSerif, .italic],

    //1D634         ; MATHEMATICAL SANS-SERIF ITALIC SMALL S
    "𝘴": [.s, .sansSerif, .italic],

    //1D635         ; MATHEMATICAL SANS-SERIF ITALIC SMALL T
    "𝘵": [.t, .sansSerif, .italic],

    //1D636         ; MATHEMATICAL SANS-SERIF ITALIC SMALL U
    "𝘶": [.u, .sansSerif, .italic],

    //1D637         ; MATHEMATICAL SANS-SERIF ITALIC SMALL V
    "𝘷": [.v, .sansSerif, .italic],

    //1D638         ; MATHEMATICAL SANS-SERIF ITALIC SMALL W
    "𝘸": [.w, .sansSerif, .italic],

    //1D639         ; MATHEMATICAL SANS-SERIF ITALIC SMALL X
    "𝘹": [.x, .sansSerif, .italic],

    //1D63A         ; MATHEMATICAL SANS-SERIF ITALIC SMALL Y
    "𝘺": [.y, .sansSerif, .italic],

    //1D63B         ; MATHEMATICAL SANS-SERIF ITALIC SMALL Z
    "𝘻": [.z, .sansSerif, .italic],

    //1D63C         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL A
    "𝘼": [.a, .capital, .sansSerif, .bold, .italic],

    //1D63D         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL B
    "𝘽": [.b, .capital, .sansSerif, .bold, .italic],

    //1D63E         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL C
    "𝘾": [.c, .capital, .sansSerif, .bold, .italic],

    //1D63F         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL D
    "𝘿": [.d, .capital, .sansSerif, .bold, .italic],

    //1D640         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL E
    "𝙀": [.e, .capital, .sansSerif, .bold, .italic],

    //1D641         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL F
    "𝙁": [.f, .capital, .sansSerif, .bold, .italic],

    //1D642         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL G
    "𝙂": [.g, .capital, .sansSerif, .bold, .italic],

    //1D643         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL H
    "𝙃": [.h, .capital, .sansSerif, .bold, .italic],

    //1D644         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL I
    "𝙄": [.i, .capital, .sansSerif, .bold, .italic],

    //1D645         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL J
    "𝙅": [.j, .capital, .sansSerif, .bold, .italic],

    //1D646         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL K
    "𝙆": [.k, .capital, .sansSerif, .bold, .italic],

    //1D647         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL L
    "𝙇": [.l, .capital, .sansSerif, .bold, .italic],

    //1D648         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL M
    "𝙈": [.m, .capital, .sansSerif, .bold, .italic],

    //1D649         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL N
    "𝙉": [.n, .capital, .sansSerif, .bold, .italic],

    //1D64A         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL O
    "𝙊": [.o, .capital, .sansSerif, .bold, .italic],

    //1D64B         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL P
    "𝙋": [.p, .capital, .sansSerif, .bold, .italic],

    //1D64C         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Q
    "𝙌": [.q, .capital, .sansSerif, .bold, .italic],

    //1D64D         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL R
    "𝙍": [.r, .capital, .sansSerif, .bold, .italic],

    //1D64E         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL S
    "𝙎": [.s, .capital, .sansSerif, .bold, .italic],

    //1D64F         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL T
    "𝙏": [.t, .capital, .sansSerif, .bold, .italic],

    //1D650         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL U
    "𝙐": [.u, .capital, .sansSerif, .bold, .italic],

    //1D651         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL V
    "𝙑": [.v, .capital, .sansSerif, .bold, .italic],

    //1D652         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL W
    "𝙒": [.w, .capital, .sansSerif, .bold, .italic],

    //1D653         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL X
    "𝙓": [.x, .capital, .sansSerif, .bold, .italic],

    //1D654         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Y
    "𝙔": [.y, .capital, .sansSerif, .bold, .italic],

    //1D655         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL Z
    "𝙕": [.z, .capital, .sansSerif, .bold, .italic],

    //1D656         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL A
    "𝙖": [.a, .sansSerif, .bold, .italic],

    //1D657         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL B
    "𝙗": [.b, .sansSerif, .bold, .italic],

    //1D658         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL C
    "𝙘": [.c, .sansSerif, .bold, .italic],

    //1D659         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL D
    "𝙙": [.d, .sansSerif, .bold, .italic],

    //1D65A         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL E
    "𝙚": [.e, .sansSerif, .bold, .italic],

    //1D65B         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL F
    "𝙛": [.f, .sansSerif, .bold, .italic],

    //1D65C         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL G
    "𝙜": [.g, .sansSerif, .bold, .italic],

    //1D65D         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL H
    "𝙝": [.h, .sansSerif, .bold, .italic],

    //1D65E         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL I
    "𝙞": [.i, .sansSerif, .bold, .italic],

    //1D65F         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL J
    "𝙟": [.j, .sansSerif, .bold, .italic],

    //1D660         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL K
    "𝙠": [.k, .sansSerif, .bold, .italic],

    //1D661         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL L
    "𝙡": [.l, .sansSerif, .bold, .italic],

    //1D662         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL M
    "𝙢": [.m, .sansSerif, .bold, .italic],

    //1D663         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL N
    "𝙣": [.n, .sansSerif, .bold, .italic],

    //1D664         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL O
    "𝙤": [.o, .sansSerif, .bold, .italic],

    //1D665         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL P
    "𝙥": [.p, .sansSerif, .bold, .italic],

    //1D666         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Q
    "𝙦": [.q, .sansSerif, .bold, .italic],

    //1D667         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL R
    "𝙧": [.r, .sansSerif, .bold, .italic],

    //1D668         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL S
    "𝙨": [.s, .sansSerif, .bold, .italic],

    //1D669         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL T
    "𝙩": [.t, .sansSerif, .bold, .italic],

    //1D66A         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL U
    "𝙪": [.u, .sansSerif, .bold, .italic],

    //1D66B         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL V
    "𝙫": [.v, .sansSerif, .bold, .italic],

    //1D66C         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL W
    "𝙬": [.w, .sansSerif, .bold, .italic],

    //1D66D         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL X
    "𝙭": [.x, .sansSerif, .bold, .italic],

    //1D66E         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Y
    "𝙮": [.y, .sansSerif, .bold, .italic],

    //1D66F         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL Z
    "𝙯": [.z, .sansSerif, .bold, .italic],

    //1D670         ; MATHEMATICAL MONOSPACE CAPITAL A
    "𝙰": [.a, .capital, .monospace],

    //1D671         ; MATHEMATICAL MONOSPACE CAPITAL B
    "𝙱": [.b, .capital, .monospace],

    //1D672         ; MATHEMATICAL MONOSPACE CAPITAL C
    "𝙲": [.c, .capital, .monospace],

    //1D673         ; MATHEMATICAL MONOSPACE CAPITAL D
    "𝙳": [.d, .capital, .monospace],

    //1D674         ; MATHEMATICAL MONOSPACE CAPITAL E
    "𝙴": [.e, .capital, .monospace],

    //1D675         ; MATHEMATICAL MONOSPACE CAPITAL F
    "𝙵": [.f, .capital, .monospace],

    //1D676         ; MATHEMATICAL MONOSPACE CAPITAL G
    "𝙶": [.g, .capital, .monospace],

    //1D677         ; MATHEMATICAL MONOSPACE CAPITAL H
    "𝙷": [.h, .capital, .monospace],

    //1D678         ; MATHEMATICAL MONOSPACE CAPITAL I
    "𝙸": [.i, .capital, .monospace],

    //1D679         ; MATHEMATICAL MONOSPACE CAPITAL J
    "𝙹": [.j, .capital, .monospace],

    //1D67A         ; MATHEMATICAL MONOSPACE CAPITAL K
    "𝙺": [.k, .capital, .monospace],

    //1D67B         ; MATHEMATICAL MONOSPACE CAPITAL L
    "𝙻": [.l, .capital, .monospace],

    //1D67C         ; MATHEMATICAL MONOSPACE CAPITAL M
    "𝙼": [.m, .capital, .monospace],

    //1D67D         ; MATHEMATICAL MONOSPACE CAPITAL N
    "𝙽": [.n, .capital, .monospace],

    //1D67E         ; MATHEMATICAL MONOSPACE CAPITAL O
    "𝙾": [.o, .capital, .monospace],

    //1D67F         ; MATHEMATICAL MONOSPACE CAPITAL P
    "𝙿": [.p, .capital, .monospace],

    //1D680         ; MATHEMATICAL MONOSPACE CAPITAL Q
    "𝚀": [.q, .capital, .monospace],

    //1D681         ; MATHEMATICAL MONOSPACE CAPITAL R
    "𝚁": [.r, .capital, .monospace],

    //1D682         ; MATHEMATICAL MONOSPACE CAPITAL S
    "𝚂": [.s, .capital, .monospace],

    //1D683         ; MATHEMATICAL MONOSPACE CAPITAL T
    "𝚃": [.t, .capital, .monospace],

    //1D684         ; MATHEMATICAL MONOSPACE CAPITAL U
    "𝚄": [.u, .capital, .monospace],

    //1D685         ; MATHEMATICAL MONOSPACE CAPITAL V
    "𝚅": [.v, .capital, .monospace],

    //1D686         ; MATHEMATICAL MONOSPACE CAPITAL W
    "𝚆": [.w, .capital, .monospace],

    //1D687         ; MATHEMATICAL MONOSPACE CAPITAL X
    "𝚇": [.x, .capital, .monospace],

    //1D688         ; MATHEMATICAL MONOSPACE CAPITAL Y
    "𝚈": [.y, .capital, .monospace],

    //1D689         ; MATHEMATICAL MONOSPACE CAPITAL Z
    "𝚉": [.z, .capital, .monospace],

    //1D68A         ; MATHEMATICAL MONOSPACE SMALL A
    "𝚊": [.a, .monospace],

    //1D68B         ; MATHEMATICAL MONOSPACE SMALL B
    "𝚋": [.b, .monospace],

    //1D68C         ; MATHEMATICAL MONOSPACE SMALL C
    "𝚌": [.c, .monospace],

    //1D68D         ; MATHEMATICAL MONOSPACE SMALL D
    "𝚍": [.d, .monospace],

    //1D68E         ; MATHEMATICAL MONOSPACE SMALL E
    "𝚎": [.e, .monospace],

    //1D68F         ; MATHEMATICAL MONOSPACE SMALL F
    "𝚏": [.f, .monospace],

    //1D690         ; MATHEMATICAL MONOSPACE SMALL G
    "𝚐": [.g, .monospace],

    //1D691         ; MATHEMATICAL MONOSPACE SMALL H
    "𝚑": [.h, .monospace],

    //1D692         ; MATHEMATICAL MONOSPACE SMALL I
    "𝚒": [.i, .monospace],

    //1D693         ; MATHEMATICAL MONOSPACE SMALL J
    "𝚓": [.j, .monospace],

    //1D694         ; MATHEMATICAL MONOSPACE SMALL K
    "𝚔": [.k, .monospace],

    //1D695         ; MATHEMATICAL MONOSPACE SMALL L
    "𝚕": [.l, .monospace],

    //1D696         ; MATHEMATICAL MONOSPACE SMALL M
    "𝚖": [.m, .monospace],

    //1D697         ; MATHEMATICAL MONOSPACE SMALL N
    "𝚗": [.n, .monospace],

    //1D698         ; MATHEMATICAL MONOSPACE SMALL O
    "𝚘": [.o, .monospace],

    //1D699         ; MATHEMATICAL MONOSPACE SMALL P
    "𝚙": [.p, .monospace],

    //1D69A         ; MATHEMATICAL MONOSPACE SMALL Q
    "𝚚": [.q, .monospace],

    //1D69B         ; MATHEMATICAL MONOSPACE SMALL R
    "𝚛": [.r, .monospace],

    //1D69C         ; MATHEMATICAL MONOSPACE SMALL S
    "𝚜": [.s, .monospace],

    //1D69D         ; MATHEMATICAL MONOSPACE SMALL T
    "𝚝": [.t, .monospace],

    //1D69E         ; MATHEMATICAL MONOSPACE SMALL U
    "𝚞": [.u, .monospace],

    //1D69F         ; MATHEMATICAL MONOSPACE SMALL V
    "𝚟": [.v, .monospace],

    //1D6A0         ; MATHEMATICAL MONOSPACE SMALL W
    "𝚠": [.w, .monospace],

    //1D6A1         ; MATHEMATICAL MONOSPACE SMALL X
    "𝚡": [.x, .monospace],

    //1D6A2         ; MATHEMATICAL MONOSPACE SMALL Y
    "𝚢": [.y, .monospace],

    //1D6A3         ; MATHEMATICAL MONOSPACE SMALL Z
    "𝚣": [.z, .monospace],

    //1D6A4         ; MATHEMATICAL ITALIC SMALL DOTLESS I
    "𝚤": [.i, .dot, .italic],

    //1D6A5         ; MATHEMATICAL ITALIC SMALL DOTLESS J
    "𝚥": [.j, .dot, .italic],

    //1D6A8         ; MATHEMATICAL BOLD CAPITAL ALPHA
    "𝚨": [.a, .capital, .greek, .bold],

    //1D6A9         ; MATHEMATICAL BOLD CAPITAL BETA
    "𝚩": [.b, .capital, .greek, .bold],

    //1D6AA         ; MATHEMATICAL BOLD CAPITAL GAMMA
    "𝚪": [.g, .capital, .greek, .bold],

    //1D6AB         ; MATHEMATICAL BOLD CAPITAL DELTA
    "𝚫": [.d, .capital, .greek, .bold],

    //1D6AC         ; MATHEMATICAL BOLD CAPITAL EPSILON
    "𝚬": [.e, .capital, .greek, .bold],

    //1D6AD         ; MATHEMATICAL BOLD CAPITAL ZETA
    "𝚭": [.z, .capital, .greek, .bold],

    //1D6AE         ; MATHEMATICAL BOLD CAPITAL ETA
    "𝚮": [.h, .capital, .greek, .bold],

    //1D6AF         ; MATHEMATICAL BOLD CAPITAL THETA
    "𝚯": [.t, .extraH, .capital, .greek, .bold],

    //1D6B0         ; MATHEMATICAL BOLD CAPITAL IOTA
    "𝚰": [.i, .capital, .greek, .bold],

    //1D6B1         ; MATHEMATICAL BOLD CAPITAL KAPPA
    "𝚱": [.k, .capital, .greek, .bold],

    //1D6B2         ; MATHEMATICAL BOLD CAPITAL LAMDA
    "𝚲": [.l, .capital, .greek, .bold],

    //1D6B3         ; MATHEMATICAL BOLD CAPITAL MU
    "𝚳": [.m, .capital, .greek, .bold],

    //1D6B4         ; MATHEMATICAL BOLD CAPITAL NU
    "𝚴": [.n, .capital, .greek, .bold],

    //1D6B5         ; MATHEMATICAL BOLD CAPITAL XI
    "𝚵": [.k, .s, .capital, .greek, .bold],

    //1D6B6         ; MATHEMATICAL BOLD CAPITAL OMICRON
    "𝚶": [.o, .capital, .greek, .bold],

    //1D6B7         ; MATHEMATICAL BOLD CAPITAL PI
    "𝚷": [.p, .capital, .greek, .bold],

    //1D6B8         ; MATHEMATICAL BOLD CAPITAL RHO
    "𝚸": [.r, .capital, .greek, .bold],

    //1D6B9         ; MATHEMATICAL BOLD CAPITAL THETA SYMBOL
    "𝚹": [.t, .extraH, .capital, .greek, .symbol, .bold],

    //1D6BA         ; MATHEMATICAL BOLD CAPITAL SIGMA
    "𝚺": [.s, .capital, .greek, .bold],

    //1D6BB         ; MATHEMATICAL BOLD CAPITAL TAU
    "𝚻": [.t, .capital, .greek, .bold],

    //1D6BC         ; MATHEMATICAL BOLD CAPITAL UPSILON
    "𝚼": [.u, .capital, .greek, .bold],

    //1D6BD         ; MATHEMATICAL BOLD CAPITAL PHI
    "𝚽": [.p, .extraH, .capital, .greek, .bold],

    //1D6BE         ; MATHEMATICAL BOLD CAPITAL CHI
    "𝚾": [.x, .capital, .greek, .bold],

    //1D6BF         ; MATHEMATICAL BOLD CAPITAL PSI
    "𝚿": [.p, .s, .capital, .greek, .bold],

    //1D6C0         ; MATHEMATICAL BOLD CAPITAL OMEGA
    "𝛀": [.o, .o, .capital, .greek, .bold],

    //1D6C1         ; MATHEMATICAL BOLD NABLA
    "𝛁": [.d, .capital, .greek, .bold, .turned],

    //1D6C2         ; MATHEMATICAL BOLD SMALL ALPHA
    "𝛂": [.a, .greek, .bold],

    //1D6C3         ; MATHEMATICAL BOLD SMALL BETA
    "𝛃": [.b, .greek, .bold],

    //1D6C4         ; MATHEMATICAL BOLD SMALL GAMMA
    "𝛄": [.g, .greek, .bold],

    //1D6C5         ; MATHEMATICAL BOLD SMALL DELTA
    "𝛅": [.d, .greek, .bold],

    //1D6C6         ; MATHEMATICAL BOLD SMALL EPSILON
    "𝛆": [.e, .greek, .bold],

    //1D6C7         ; MATHEMATICAL BOLD SMALL ZETA
    "𝛇": [.z, .greek, .bold],

    //1D6C8         ; MATHEMATICAL BOLD SMALL ETA
    "𝛈": [.h, .greek, .bold],

    //1D6C9         ; MATHEMATICAL BOLD SMALL THETA
    "𝛉": [.t, .extraH, .greek, .bold],

    //1D6CA         ; MATHEMATICAL BOLD SMALL IOTA
    "𝛊": [.i, .greek, .bold],

    //1D6CB         ; MATHEMATICAL BOLD SMALL KAPPA
    "𝛋": [.k, .greek, .bold],

    //1D6CC         ; MATHEMATICAL BOLD SMALL LAMDA
    "𝛌": [.l, .greek, .bold],

    //1D6CD         ; MATHEMATICAL BOLD SMALL MU
    "𝛍": [.m, .greek, .bold],

    //1D6CE         ; MATHEMATICAL BOLD SMALL NU
    "𝛎": [.n, .greek, .bold],

    //1D6CF         ; MATHEMATICAL BOLD SMALL XI
    "𝛏": [.k, .s, .greek, .bold],

    //1D6D0         ; MATHEMATICAL BOLD SMALL OMICRON
    "𝛐": [.o, .greek, .bold],

    //1D6D1         ; MATHEMATICAL BOLD SMALL PI
    "𝛑": [.p, .greek, .bold],

    //1D6D2         ; MATHEMATICAL BOLD SMALL RHO
    "𝛒": [.r, .greek, .bold],

    //1D6D3         ; MATHEMATICAL BOLD SMALL FINAL SIGMA
    "𝛓": [.s, .greek, .final, .bold],

    //1D6D4         ; MATHEMATICAL BOLD SMALL SIGMA
    "𝛔": [.s, .greek, .bold],

    //1D6D5         ; MATHEMATICAL BOLD SMALL TAU
    "𝛕": [.t, .greek, .bold],

    //1D6D6         ; MATHEMATICAL BOLD SMALL UPSILON
    "𝛖": [.u, .greek, .bold],

    //1D6D7         ; MATHEMATICAL BOLD SMALL PHI
    "𝛗": [.p, .extraH, .greek, .bold],

    //1D6D8         ; MATHEMATICAL BOLD SMALL CHI
    "𝛘": [.x, .greek, .bold],

    //1D6D9         ; MATHEMATICAL BOLD SMALL PSI
    "𝛙": [.p, .s, .greek, .bold],

    //1D6DA         ; MATHEMATICAL BOLD SMALL OMEGA
    "𝛚": [.o, .o, .greek, .bold],

    //1D6DB         ; MATHEMATICAL BOLD PARTIAL DIFFERENTIAL
    "𝛛": [.d, .greek, .symbol, .bold],

    //1D6DC         ; MATHEMATICAL BOLD EPSILON SYMBOL
    "𝛜": [.e, .greek, .symbol, .bold],

    //1D6DD         ; MATHEMATICAL BOLD THETA SYMBOL
    "𝛝": [.t, .extraH, .greek, .symbol, .bold],

    //1D6DE         ; MATHEMATICAL BOLD KAPPA SYMBOL
    "𝛞": [.k, .greek, .symbol, .bold],

    //1D6DF         ; MATHEMATICAL BOLD PHI SYMBOL
    "𝛟": [.p, .extraH, .greek, .symbol, .bold],

    //1D6E0         ; MATHEMATICAL BOLD RHO SYMBOL
    "𝛠": [.r, .greek, .symbol, .bold],

    //1D6E1         ; MATHEMATICAL BOLD PI SYMBOL
    "𝛡": [.p, .greek, .symbol, .bold],

    //1D6E2         ; MATHEMATICAL ITALIC CAPITAL ALPHA
    "𝛢": [.a, .capital, .greek, .italic],

    //1D6E3         ; MATHEMATICAL ITALIC CAPITAL BETA
    "𝛣": [.b, .capital, .greek, .italic],

    //1D6E4         ; MATHEMATICAL ITALIC CAPITAL GAMMA
    "𝛤": [.g, .capital, .greek, .italic],

    //1D6E5         ; MATHEMATICAL ITALIC CAPITAL DELTA
    "𝛥": [.d, .capital, .greek, .italic],

    //1D6E6         ; MATHEMATICAL ITALIC CAPITAL EPSILON
    "𝛦": [.e, .capital, .greek, .italic],

    //1D6E7         ; MATHEMATICAL ITALIC CAPITAL ZETA
    "𝛧": [.z, .capital, .greek, .italic],

    //1D6E8         ; MATHEMATICAL ITALIC CAPITAL ETA
    "𝛨": [.h, .capital, .greek, .italic],

    //1D6E9         ; MATHEMATICAL ITALIC CAPITAL THETA
    "𝛩": [.t, .extraH, .capital, .greek, .italic],

    //1D6EA         ; MATHEMATICAL ITALIC CAPITAL IOTA
    "𝛪": [.i, .capital, .greek, .italic],

    //1D6EB         ; MATHEMATICAL ITALIC CAPITAL KAPPA
    "𝛫": [.k, .capital, .greek, .italic],

    //1D6EC         ; MATHEMATICAL ITALIC CAPITAL LAMDA
    "𝛬": [.l, .capital, .greek, .italic],

    //1D6ED         ; MATHEMATICAL ITALIC CAPITAL MU
    "𝛭": [.m, .capital, .greek, .italic],

    //1D6EE         ; MATHEMATICAL ITALIC CAPITAL NU
    "𝛮": [.n, .capital, .greek, .italic],

    //1D6EF         ; MATHEMATICAL ITALIC CAPITAL XI
    "𝛯": [.k, .s, .capital, .greek, .italic],

    //1D6F0         ; MATHEMATICAL ITALIC CAPITAL OMICRON
    "𝛰": [.o, .capital, .greek, .italic],

    //1D6F1         ; MATHEMATICAL ITALIC CAPITAL PI
    "𝛱": [.p, .capital, .greek, .italic],

    //1D6F2         ; MATHEMATICAL ITALIC CAPITAL RHO
    "𝛲": [.r, .capital, .greek, .italic],

    //1D6F3         ; MATHEMATICAL ITALIC CAPITAL THETA SYMBOL
    "𝛳": [.t, .extraH, .capital, .greek, .symbol, .italic],

    //1D6F4         ; MATHEMATICAL ITALIC CAPITAL SIGMA
    "𝛴": [.s, .capital, .greek, .italic],

    //1D6F5         ; MATHEMATICAL ITALIC CAPITAL TAU
    "𝛵": [.t, .capital, .greek, .italic],

    //1D6F6         ; MATHEMATICAL ITALIC CAPITAL UPSILON
    "𝛶": [.u, .capital, .greek, .italic],

    //1D6F7         ; MATHEMATICAL ITALIC CAPITAL PHI
    "𝛷": [.p, .extraH, .capital, .greek, .italic],

    //1D6F8         ; MATHEMATICAL ITALIC CAPITAL CHI
    "𝛸": [.x, .capital, .greek, .italic],

    //1D6F9         ; MATHEMATICAL ITALIC CAPITAL PSI
    "𝛹": [.p, .s, .capital, .greek, .italic],

    //1D6FA         ; MATHEMATICAL ITALIC CAPITAL OMEGA
    "𝛺": [.o, .o, .capital, .greek, .italic],

    //1D6FB         ; MATHEMATICAL ITALIC NABLA
    "𝛻": [.d, .capital, .greek, .italic, .turned],

    //1D6FC         ; MATHEMATICAL ITALIC SMALL ALPHA
    "𝛼": [.a, .greek, .italic],

    //1D6FD         ; MATHEMATICAL ITALIC SMALL BETA
    "𝛽": [.b, .greek, .italic],

    //1D6FE         ; MATHEMATICAL ITALIC SMALL GAMMA
    "𝛾": [.g, .greek, .italic],

    //1D6FF         ; MATHEMATICAL ITALIC SMALL DELTA
    "𝛿": [.d, .greek, .italic],

    //1D700         ; MATHEMATICAL ITALIC SMALL EPSILON
    "𝜀": [.e, .greek, .italic],

    //1D701         ; MATHEMATICAL ITALIC SMALL ZETA
    "𝜁": [.z, .greek, .italic],

    //1D702         ; MATHEMATICAL ITALIC SMALL ETA
    "𝜂": [.h, .greek, .italic],

    //1D703         ; MATHEMATICAL ITALIC SMALL THETA
    "𝜃": [.t, .extraH, .greek, .italic],

    //1D704         ; MATHEMATICAL ITALIC SMALL IOTA
    "𝜄": [.i, .greek, .italic],

    //1D705         ; MATHEMATICAL ITALIC SMALL KAPPA
    "𝜅": [.k, .greek, .italic],

    //1D706         ; MATHEMATICAL ITALIC SMALL LAMDA
    "𝜆": [.l, .greek, .italic],

    //1D707         ; MATHEMATICAL ITALIC SMALL MU
    "𝜇": [.m, .greek, .italic],

    //1D708         ; MATHEMATICAL ITALIC SMALL NU
    "𝜈": [.n, .greek, .italic],

    //1D709         ; MATHEMATICAL ITALIC SMALL XI
    "𝜉": [.k, .s, .greek, .italic],

    //1D70A         ; MATHEMATICAL ITALIC SMALL OMICRON
    "𝜊": [.o, .greek, .italic],

    //1D70B         ; MATHEMATICAL ITALIC SMALL PI
    "𝜋": [.p, .greek, .italic],

    //1D70C         ; MATHEMATICAL ITALIC SMALL RHO
    "𝜌": [.r, .greek, .italic],

    //1D70D         ; MATHEMATICAL ITALIC SMALL FINAL SIGMA
    "𝜍": [.s, .greek, .final, .italic],

    //1D70E         ; MATHEMATICAL ITALIC SMALL SIGMA
    "𝜎": [.s, .greek, .italic],

    //1D70F         ; MATHEMATICAL ITALIC SMALL TAU
    "𝜏": [.t, .greek, .italic],

    //1D710         ; MATHEMATICAL ITALIC SMALL UPSILON
    "𝜐": [.u, .greek, .italic],

    //1D711         ; MATHEMATICAL ITALIC SMALL PHI
    "𝜑": [.p, .extraH, .greek, .italic],

    //1D712         ; MATHEMATICAL ITALIC SMALL CHI
    "𝜒": [.x, .greek, .italic],

    //1D713         ; MATHEMATICAL ITALIC SMALL PSI
    "𝜓": [.p, .s, .greek, .italic],

    //1D714         ; MATHEMATICAL ITALIC SMALL OMEGA
    "𝜔": [.o, .o, .greek, .italic],

    //1D715         ; MATHEMATICAL ITALIC PARTIAL DIFFERENTIAL
    "𝜕": [.d, .greek, .symbol, .italic],

    //1D716         ; MATHEMATICAL ITALIC EPSILON SYMBOL
    "𝜖": [.e, .greek, .symbol, .italic],

    //1D717         ; MATHEMATICAL ITALIC THETA SYMBOL
    "𝜗": [.t, .extraH, .greek, .symbol, .italic],

    //1D718         ; MATHEMATICAL ITALIC KAPPA SYMBOL
    "𝜘": [.k, .greek, .symbol, .italic],

    //1D719         ; MATHEMATICAL ITALIC PHI SYMBOL
    "𝜙": [.p, .extraH, .greek, .symbol, .italic],

    //1D71A         ; MATHEMATICAL ITALIC RHO SYMBOL
    "𝜚": [.r, .greek, .symbol, .italic],

    //1D71B         ; MATHEMATICAL ITALIC PI SYMBOL
    "𝜛": [.p, .greek, .symbol, .italic],

    //1D71C         ; MATHEMATICAL BOLD ITALIC CAPITAL ALPHA
    "𝜜": [.a, .capital, .greek, .bold, .italic],

    //1D71D         ; MATHEMATICAL BOLD ITALIC CAPITAL BETA
    "𝜝": [.b, .capital, .greek, .bold, .italic],

    //1D71E         ; MATHEMATICAL BOLD ITALIC CAPITAL GAMMA
    "𝜞": [.g, .capital, .greek, .bold, .italic],

    //1D71F         ; MATHEMATICAL BOLD ITALIC CAPITAL DELTA
    "𝜟": [.d, .capital, .greek, .bold, .italic],

    //1D720         ; MATHEMATICAL BOLD ITALIC CAPITAL EPSILON
    "𝜠": [.e, .capital, .greek, .bold, .italic],

    //1D721         ; MATHEMATICAL BOLD ITALIC CAPITAL ZETA
    "𝜡": [.z, .capital, .greek, .bold, .italic],

    //1D722         ; MATHEMATICAL BOLD ITALIC CAPITAL ETA
    "𝜢": [.h, .capital, .greek, .bold, .italic],

    //1D723         ; MATHEMATICAL BOLD ITALIC CAPITAL THETA
    "𝜣": [.t, .extraH, .capital, .greek, .bold, .italic],

    //1D724         ; MATHEMATICAL BOLD ITALIC CAPITAL IOTA
    "𝜤": [.i, .capital, .greek, .bold, .italic],

    //1D725         ; MATHEMATICAL BOLD ITALIC CAPITAL KAPPA
    "𝜥": [.k, .capital, .greek, .bold, .italic],

    //1D726         ; MATHEMATICAL BOLD ITALIC CAPITAL LAMDA
    "𝜦": [.l, .capital, .greek, .bold, .italic],

    //1D727         ; MATHEMATICAL BOLD ITALIC CAPITAL MU
    "𝜧": [.m, .capital, .greek, .bold, .italic],

    //1D728         ; MATHEMATICAL BOLD ITALIC CAPITAL NU
    "𝜨": [.n, .capital, .greek, .bold, .italic],

    //1D729         ; MATHEMATICAL BOLD ITALIC CAPITAL XI
    "𝜩": [.k, .s, .capital, .greek, .bold, .italic],

    //1D72A         ; MATHEMATICAL BOLD ITALIC CAPITAL OMICRON
    "𝜪": [.o, .capital, .greek, .bold, .italic],

    //1D72B         ; MATHEMATICAL BOLD ITALIC CAPITAL PI
    "𝜫": [.p, .capital, .greek, .bold, .italic],

    //1D72C         ; MATHEMATICAL BOLD ITALIC CAPITAL RHO
    "𝜬": [.r, .capital, .greek, .bold, .italic],

    //1D72D         ; MATHEMATICAL BOLD ITALIC CAPITAL THETA SYMBOL
    "𝜭": [.t, .extraH, .capital, .greek, .symbol, .bold, .italic],

    //1D72E         ; MATHEMATICAL BOLD ITALIC CAPITAL SIGMA
    "𝜮": [.s, .capital, .greek, .bold, .italic],

    //1D72F         ; MATHEMATICAL BOLD ITALIC CAPITAL TAU
    "𝜯": [.t, .capital, .greek, .bold, .italic],

    //1D730         ; MATHEMATICAL BOLD ITALIC CAPITAL UPSILON
    "𝜰": [.u, .capital, .greek, .bold, .italic],

    //1D731         ; MATHEMATICAL BOLD ITALIC CAPITAL PHI
    "𝜱": [.p, .extraH, .capital, .greek, .bold, .italic],

    //1D732         ; MATHEMATICAL BOLD ITALIC CAPITAL CHI
    "𝜲": [.x, .capital, .greek, .bold, .italic],

    //1D733         ; MATHEMATICAL BOLD ITALIC CAPITAL PSI
    "𝜳": [.p, .s, .capital, .greek, .bold, .italic],

    //1D734         ; MATHEMATICAL BOLD ITALIC CAPITAL OMEGA
    "𝜴": [.o, .o, .capital, .greek, .bold, .italic],

    //1D735         ; MATHEMATICAL BOLD ITALIC NABLA
    "𝜵": [.d, .capital, .greek, .bold, .italic, .turned],

    //1D736         ; MATHEMATICAL BOLD ITALIC SMALL ALPHA
    "𝜶": [.a, .greek, .bold, .italic],

    //1D737         ; MATHEMATICAL BOLD ITALIC SMALL BETA
    "𝜷": [.b, .greek, .bold, .italic],

    //1D738         ; MATHEMATICAL BOLD ITALIC SMALL GAMMA
    "𝜸": [.g, .greek, .bold, .italic],

    //1D739         ; MATHEMATICAL BOLD ITALIC SMALL DELTA
    "𝜹": [.d, .greek, .bold, .italic],

    //1D73A         ; MATHEMATICAL BOLD ITALIC SMALL EPSILON
    "𝜺": [.e, .greek, .bold, .italic],

    //1D73B         ; MATHEMATICAL BOLD ITALIC SMALL ZETA
    "𝜻": [.z, .greek, .bold, .italic],

    //1D73C         ; MATHEMATICAL BOLD ITALIC SMALL ETA
    "𝜼": [.h, .greek, .bold, .italic],

    //1D73D         ; MATHEMATICAL BOLD ITALIC SMALL THETA
    "𝜽": [.t, .extraH, .greek, .bold, .italic],

    //1D73E         ; MATHEMATICAL BOLD ITALIC SMALL IOTA
    "𝜾": [.i, .greek, .bold, .italic],

    //1D73F         ; MATHEMATICAL BOLD ITALIC SMALL KAPPA
    "𝜿": [.k, .greek, .bold, .italic],

    //1D740         ; MATHEMATICAL BOLD ITALIC SMALL LAMDA
    "𝝀": [.l, .greek, .bold, .italic],

    //1D741         ; MATHEMATICAL BOLD ITALIC SMALL MU
    "𝝁": [.m, .greek, .bold, .italic],

    //1D742         ; MATHEMATICAL BOLD ITALIC SMALL NU
    "𝝂": [.n, .greek, .bold, .italic],

    //1D743         ; MATHEMATICAL BOLD ITALIC SMALL XI
    "𝝃": [.k, .s, .greek, .bold, .italic],

    //1D744         ; MATHEMATICAL BOLD ITALIC SMALL OMICRON
    "𝝄": [.o, .greek, .bold, .italic],

    //1D745         ; MATHEMATICAL BOLD ITALIC SMALL PI
    "𝝅": [.p, .greek, .bold, .italic],

    //1D746         ; MATHEMATICAL BOLD ITALIC SMALL RHO
    "𝝆": [.r, .greek, .bold, .italic],

    //1D747         ; MATHEMATICAL BOLD ITALIC SMALL FINAL SIGMA
    "𝝇": [.s, .greek, .final, .bold, .italic],

    //1D748         ; MATHEMATICAL BOLD ITALIC SMALL SIGMA
    "𝝈": [.s, .greek, .bold, .italic],

    //1D749         ; MATHEMATICAL BOLD ITALIC SMALL TAU
    "𝝉": [.t, .greek, .bold, .italic],

    //1D74A         ; MATHEMATICAL BOLD ITALIC SMALL UPSILON
    "𝝊": [.u, .greek, .bold, .italic],

    //1D74B         ; MATHEMATICAL BOLD ITALIC SMALL PHI
    "𝝋": [.p, .extraH, .greek, .bold, .italic],

    //1D74C         ; MATHEMATICAL BOLD ITALIC SMALL CHI
    "𝝌": [.x, .greek, .bold, .italic],

    //1D74D         ; MATHEMATICAL BOLD ITALIC SMALL PSI
    "𝝍": [.p, .s, .greek, .bold, .italic],

    //1D74E         ; MATHEMATICAL BOLD ITALIC SMALL OMEGA
    "𝝎": [.o, .o, .greek, .bold, .italic],

    //1D74F         ; MATHEMATICAL BOLD ITALIC PARTIAL DIFFERENTIAL
    "𝝏": [.d, .greek, .symbol, .bold, .italic],

    //1D750         ; MATHEMATICAL BOLD ITALIC EPSILON SYMBOL
    "𝝐": [.e, .greek, .symbol, .bold, .italic],

    //1D751         ; MATHEMATICAL BOLD ITALIC THETA SYMBOL
    "𝝑": [.t, .extraH, .greek, .symbol, .bold, .italic],

    //1D752         ; MATHEMATICAL BOLD ITALIC KAPPA SYMBOL
    "𝝒": [.k, .greek, .symbol, .bold, .italic],

    //1D753         ; MATHEMATICAL BOLD ITALIC PHI SYMBOL
    "𝝓": [.p, .extraH, .greek, .symbol, .bold, .italic],

    //1D754         ; MATHEMATICAL BOLD ITALIC RHO SYMBOL
    "𝝔": [.r, .greek, .symbol, .bold, .italic],

    //1D755         ; MATHEMATICAL BOLD ITALIC PI SYMBOL
    "𝝕": [.p, .greek, .symbol, .bold, .italic],

    //1D756         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL ALPHA
    "𝝖": [.a, .capital, .greek, .sansSerif, .bold],
    
    //1D757         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL BETA
    "𝝗": [.b, .capital, .greek, .sansSerif, .bold],
    
    //1D758         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL GAMMA
    "𝝘": [.g, .capital, .greek, .sansSerif, .bold],

    //1D759         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL DELTA
    "𝝙": [.d, .capital, .greek, .sansSerif, .bold],

    //1D75A         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL EPSILON
    "𝝚": [.e, .capital, .greek, .sansSerif, .bold],

    //1D75B         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL ZETA
    "𝝛": [.z, .capital, .greek, .sansSerif, .bold],

    //1D75C         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL ETA
    "𝝜": [.h, .capital, .greek, .sansSerif, .bold],

    //1D75D         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL THETA
    "𝝝": [.t, .extraH, .capital, .greek, .sansSerif, .bold],

    //1D75E         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL IOTA
    "𝝞": [.i, .capital, .greek, .sansSerif, .bold],

    //1D75F         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL KAPPA
    "𝝟": [.k, .capital, .greek, .sansSerif, .bold],

    //1D760         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL LAMDA
    "𝝠": [.l, .capital, .greek, .sansSerif, .bold],

    //1D761         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL MU
    "𝝡": [.m, .capital, .greek, .sansSerif, .bold],

    //1D762         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL NU
    "𝝢": [.n, .capital, .greek, .sansSerif, .bold],

    //1D763         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL XI
    "𝝣": [.k, .s, .capital, .greek, .sansSerif, .bold],

    //1D764         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL OMICRON
    "𝝤": [.o, .capital, .greek, .sansSerif, .bold],

    //1D765         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL PI
    "𝝥": [.p, .capital, .greek, .sansSerif, .bold],

    //1D766         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL RHO
    "𝝦": [.r, .capital, .greek, .sansSerif, .bold],

    //1D767         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL THETA SYMBOL
    "𝝧": [.t, .extraH, .capital, .greek, .symbol, .sansSerif, .bold],

    //1D768         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL SIGMA
    "𝝨": [.s, .capital, .greek, .sansSerif, .bold],

    //1D769         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL TAU
    "𝝩": [.t, .capital, .greek, .sansSerif, .bold],

    //1D76A         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL UPSILON
    "𝝪": [.u, .capital, .greek, .sansSerif, .bold],

    //1D76B         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL PHI
    "𝝫": [.p, .extraH, .capital, .greek, .sansSerif, .bold],

    //1D76C         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL CHI
    "𝝬": [.x, .capital, .greek, .sansSerif, .bold],

    //1D76D         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL PSI
    "𝝭": [.p, .s, .capital, .greek, .sansSerif, .bold],

    //1D76E         ; MATHEMATICAL SANS-SERIF BOLD CAPITAL OMEGA
    "𝝮": [.o, .o, .capital, .greek, .sansSerif, .bold],

    //1D76F         ; MATHEMATICAL SANS-SERIF BOLD NABLA
    "𝝯": [.d, .capital, .greek, .sansSerif, .bold, .turned],

    //1D770         ; MATHEMATICAL SANS-SERIF BOLD SMALL ALPHA
    "𝝰": [.a, .greek, .sansSerif, .bold],

    //1D771         ; MATHEMATICAL SANS-SERIF BOLD SMALL BETA
    "𝝱": [.b, .greek, .sansSerif, .bold],

    //1D772         ; MATHEMATICAL SANS-SERIF BOLD SMALL GAMMA
    "𝝲": [.g, .greek, .sansSerif, .bold],

    //1D773         ; MATHEMATICAL SANS-SERIF BOLD SMALL DELTA
    "𝝳": [.d, .greek, .sansSerif, .bold],

    //1D774         ; MATHEMATICAL SANS-SERIF BOLD SMALL EPSILON
    "𝝴": [.e, .greek, .sansSerif, .bold],

    //1D775         ; MATHEMATICAL SANS-SERIF BOLD SMALL ZETA
    "𝝵": [.z, .greek, .sansSerif, .bold],

    //1D776         ; MATHEMATICAL SANS-SERIF BOLD SMALL ETA
    "𝝶": [.h, .greek, .sansSerif, .bold],

    //1D777         ; MATHEMATICAL SANS-SERIF BOLD SMALL THETA
    "𝝷": [.t, .extraH, .greek, .sansSerif, .bold],

    //1D778         ; MATHEMATICAL SANS-SERIF BOLD SMALL IOTA
    "𝝸": [.i, .greek, .sansSerif, .bold],

    //1D779         ; MATHEMATICAL SANS-SERIF BOLD SMALL KAPPA
    "𝝹": [.k, .greek, .sansSerif, .bold],

    //1D77A         ; MATHEMATICAL SANS-SERIF BOLD SMALL LAMDA
    "𝝺": [.l, .greek, .sansSerif, .bold],

    //1D77B         ; MATHEMATICAL SANS-SERIF BOLD SMALL MU
    "𝝻": [.m, .greek, .sansSerif, .bold],

    //1D77C         ; MATHEMATICAL SANS-SERIF BOLD SMALL NU
    "𝝼": [.n, .greek, .sansSerif, .bold],

    //1D77D         ; MATHEMATICAL SANS-SERIF BOLD SMALL XI
    "𝝽": [.k, .s, .greek, .sansSerif, .bold],

    //1D77E         ; MATHEMATICAL SANS-SERIF BOLD SMALL OMICRON
    "𝝾": [.o, .greek, .sansSerif, .bold],

    //1D77F         ; MATHEMATICAL SANS-SERIF BOLD SMALL PI
    "𝝿": [.p, .greek, .sansSerif, .bold],

    //1D780         ; MATHEMATICAL SANS-SERIF BOLD SMALL RHO
    "𝞀": [.r, .greek, .sansSerif, .bold],

    //1D781         ; MATHEMATICAL SANS-SERIF BOLD SMALL FINAL SIGMA
    "𝞁": [.s, .greek, .final, .sansSerif, .bold],

    //1D782         ; MATHEMATICAL SANS-SERIF BOLD SMALL SIGMA
    "𝞂": [.s, .greek, .sansSerif, .bold],

    //1D783         ; MATHEMATICAL SANS-SERIF BOLD SMALL TAU
    "𝞃": [.t, .greek, .sansSerif, .bold],

    //1D784         ; MATHEMATICAL SANS-SERIF BOLD SMALL UPSILON
    "𝞄": [.u, .greek, .sansSerif, .bold],

    //1D785         ; MATHEMATICAL SANS-SERIF BOLD SMALL PHI
    "𝞅": [.p, .extraH, .greek, .sansSerif, .bold],

    //1D786         ; MATHEMATICAL SANS-SERIF BOLD SMALL CHI
    "𝞆": [.x, .greek, .sansSerif, .bold],

    //1D787         ; MATHEMATICAL SANS-SERIF BOLD SMALL PSI
    "𝞇": [.p, .s, .greek, .sansSerif, .bold],

    //1D788         ; MATHEMATICAL SANS-SERIF BOLD SMALL OMEGA
    "𝞈": [.o, .o, .greek, .sansSerif, .bold],

    //1D789         ; MATHEMATICAL SANS-SERIF BOLD PARTIAL DIFFERENTIAL
    "𝞉": [.d, .greek, .symbol, .sansSerif, .bold],

    //1D78A         ; MATHEMATICAL SANS-SERIF BOLD EPSILON SYMBOL
    "𝞊": [.e, .greek, .symbol, .sansSerif, .bold],

    //1D78B         ; MATHEMATICAL SANS-SERIF BOLD THETA SYMBOL
    "𝞋": [.t, .extraH, .greek, .symbol, .sansSerif, .bold],

    //1D78C         ; MATHEMATICAL SANS-SERIF BOLD KAPPA SYMBOL
    "𝞌": [.k, .greek, .symbol, .sansSerif, .bold],

    //1D78D         ; MATHEMATICAL SANS-SERIF BOLD PHI SYMBOL
    "𝞍": [.p, .extraH, .greek, .symbol, .sansSerif, .bold],

    //1D78E         ; MATHEMATICAL SANS-SERIF BOLD RHO SYMBOL
    "𝞎": [.r, .greek, .symbol, .sansSerif, .bold],

    //1D78F         ; MATHEMATICAL SANS-SERIF BOLD PI SYMBOL
    "𝞏": [.p, .greek, .symbol, .sansSerif, .bold],

    //1D790         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL ALPHA
    "𝞐": [.a, .capital, .greek, .sansSerif, .bold, .italic],

    //1D791         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL BETA
    "𝞑": [.b, .capital, .greek, .sansSerif, .bold, .italic],

    //1D792         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL GAMMA
    "𝞒": [.g, .capital, .greek, .sansSerif, .bold, .italic],

    //1D793         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL DELTA
    "𝞓": [.d, .capital, .greek, .sansSerif, .bold, .italic],

    //1D794         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL EPSILON
    "𝞔": [.e, .capital, .greek, .sansSerif, .bold, .italic],

    //1D795         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL ZETA
    "𝞕": [.z, .capital, .greek, .sansSerif, .bold, .italic],

    //1D796         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL ETA
    "𝞖": [.h, .capital, .greek, .sansSerif, .bold, .italic],

    //1D797         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL THETA
    "𝞗": [.t, .extraH, .capital, .greek, .sansSerif, .bold, .italic],

    //1D798         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL IOTA
    "𝞘": [.i, .capital, .greek, .sansSerif, .bold, .italic],

    //1D799         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL KAPPA
    "𝞙": [.k, .capital, .greek, .sansSerif, .bold, .italic],

    //1D79A         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL LAMDA
    "𝞚": [.l, .capital, .greek, .sansSerif, .bold, .italic],

    //1D79B         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL MU
    "𝞛": [.m, .capital, .greek, .sansSerif, .bold, .italic],

    //1D79C         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL NU
    "𝞜": [.n, .capital, .greek, .sansSerif, .bold, .italic],

    //1D79D         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL XI
    "𝞝": [.k, .s, .capital, .greek, .sansSerif, .bold, .italic],

    //1D79E         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL OMICRON
    "𝞞": [.o, .capital, .greek, .sansSerif, .bold, .italic],

    //1D79F         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PI
    "𝞟": [.p, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A0         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL RHO
    "𝞠": [.r, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A1         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL THETA SYMBOL
    "𝞡": [.t, .extraH, .capital, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7A2         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL SIGMA
    "𝞢": [.s, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A3         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL TAU
    "𝞣": [.t, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A4         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL UPSILON
    "𝞤": [.u, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A5         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PHI
    "𝞥": [.p, .extraH, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A6         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL CHI
    "𝞦": [.x, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A7         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL PSI
    "𝞧": [.p, .s, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A8         ; MATHEMATICAL SANS-SERIF BOLD ITALIC CAPITAL OMEGA
    "𝞨": [.o, .o, .capital, .greek, .sansSerif, .bold, .italic],

    //1D7A9         ; MATHEMATICAL SANS-SERIF BOLD ITALIC NABLA
    "𝞩": [.d, .capital, .greek, .sansSerif, .bold, .italic, .turned],

    //1D7AA         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ALPHA
    "𝞪": [.a, .greek, .sansSerif, .bold, .italic],

    //1D7AB         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL BETA
    "𝞫": [.b, .greek, .sansSerif, .bold, .italic],

    //1D7AC         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL GAMMA
    "𝞬": [.g, .greek, .sansSerif, .bold, .italic],

    //1D7AD         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL DELTA
    "𝞭": [.d, .greek, .sansSerif, .bold, .italic],

    //1D7AE         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL EPSILON
    "𝞮": [.e, .greek, .sansSerif, .bold, .italic],

    //1D7AF         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ZETA
    "𝞯": [.z, .greek, .sansSerif, .bold, .italic],

    //1D7B0         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL ETA
    "𝞰": [.h, .greek, .sansSerif, .bold, .italic],

    //1D7B1         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL THETA
    "𝞱": [.t, .extraH, .greek, .sansSerif, .bold, .italic],

    //1D7B2         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL IOTA
    "𝞲": [.i, .greek, .sansSerif, .bold, .italic],

    //1D7B3         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL KAPPA
    "𝞳": [.k, .greek, .sansSerif, .bold, .italic],

    //1D7B4         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL LAMDA
    "𝞴": [.l, .greek, .sansSerif, .bold, .italic],

    //1D7B5         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL MU
    "𝞵": [.m, .greek, .sansSerif, .bold, .italic],

    //1D7B6         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL NU
    "𝞶": [.v, .greek, .sansSerif, .bold, .italic],

    //1D7B7         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL XI
    "𝞷": [.k, .s, .greek, .sansSerif, .bold, .italic],

    //1D7B8         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL OMICRON
    "𝞸": [.o, .greek, .sansSerif, .bold, .italic],

    //1D7B9         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PI
    "𝞹": [.p, .greek, .sansSerif, .bold, .italic],

    //1D7BA         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL RHO
    "𝞺": [.r, .greek, .sansSerif, .bold, .italic],

    //1D7BB         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL FINAL SIGMA
    "𝞻": [.s, .greek, .final, .sansSerif, .bold, .italic],

    //1D7BC         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL SIGMA
    "𝞼": [.s, .greek, .sansSerif, .bold, .italic],

    //1D7BD         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL TAU
    "𝞽": [.t, .greek, .sansSerif, .bold, .italic],

    //1D7BE         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL UPSILON
    "𝞾": [.u, .greek, .sansSerif, .bold, .italic],

    //1D7BF         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PHI
    "𝞿": [.p, .extraH, .greek, .sansSerif, .bold, .italic],

    //1D7C0         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL CHI
    "𝟀": [.x, .greek, .sansSerif, .bold, .italic],

    //1D7C1         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL PSI
    "𝟁": [.p, .s, .greek, .sansSerif, .bold, .italic],

    //1D7C2         ; MATHEMATICAL SANS-SERIF BOLD ITALIC SMALL OMEGA
    "𝟂": [.o, .o, .greek, .sansSerif, .bold, .italic],

    //1D7C3         ; MATHEMATICAL SANS-SERIF BOLD ITALIC PARTIAL DIFFERENTIAL
    "𝟃": [.d, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7C4         ; MATHEMATICAL SANS-SERIF BOLD ITALIC EPSILON SYMBOL
    "𝟄": [.e, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7C5         ; MATHEMATICAL SANS-SERIF BOLD ITALIC THETA SYMBOL
    "𝟅": [.t, .extraH, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7C6         ; MATHEMATICAL SANS-SERIF BOLD ITALIC KAPPA SYMBOL
    "𝟆": [.k, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7C7         ; MATHEMATICAL SANS-SERIF BOLD ITALIC PHI SYMBOL
    "𝟇": [.p, .extraH, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7C8         ; MATHEMATICAL SANS-SERIF BOLD ITALIC RHO SYMBOL
    "𝟈": [.r, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7C9         ; MATHEMATICAL SANS-SERIF BOLD ITALIC PI SYMBOL
    "𝟉": [.p, .greek, .symbol, .sansSerif, .bold, .italic],

    //1D7CA         ; MATHEMATICAL BOLD CAPITAL DIGAMMA
    "𝟊": [.g, .g, .capital, .greek, .bold],

    //1D7CB         ; MATHEMATICAL BOLD SMALL DIGAMMA
    "𝟋": [.g, .g, .greek, .bold],
    //1D7CE         ; MATHEMATICAL BOLD DIGIT ZERO
    "𝟎": [.zero, .bold],
    //1D7CF         ; MATHEMATICAL BOLD DIGIT ONE
    "𝟏": [.one, .bold],
    //1D7D0         ; MATHEMATICAL BOLD DIGIT TWO
    "𝟐": [.two, .bold],
    //1D7D1         ; MATHEMATICAL BOLD DIGIT THREE
    "𝟑": [.three, .bold],
    //1D7D2         ; MATHEMATICAL BOLD DIGIT FOUR
    "𝟒": [.four, .bold],

    //1D7D3         ; MATHEMATICAL BOLD DIGIT FIVE
    "𝟓": [.five, .bold],

    //1D7D4         ; MATHEMATICAL BOLD DIGIT SIX
    "𝟔": [.six, .bold],

    //1D7D5         ; MATHEMATICAL BOLD DIGIT SEVEN
    "𝟕": [.seven, .bold],

    //1D7D6         ; MATHEMATICAL BOLD DIGIT EIGHT
    "𝟖": [.eight, .bold],

    //1D7D7         ; MATHEMATICAL BOLD DIGIT NINE
    "𝟗": [.nine, .bold],

    //1D7D8         ; MATHEMATICAL DOUBLE-STRUCK DIGIT ZERO
    "𝟘": [.zero, .doubleStruck],

    //1D7D9         ; MATHEMATICAL DOUBLE-STRUCK DIGIT ONE
    "𝟙": [.one, .doubleStruck],

    //1D7DA         ; MATHEMATICAL DOUBLE-STRUCK DIGIT TWO
    "𝟚": [.two, .doubleStruck],

    //1D7DB         ; MATHEMATICAL DOUBLE-STRUCK DIGIT THREE
    "𝟛": [.three, .doubleStruck],

    //1D7DC         ; MATHEMATICAL DOUBLE-STRUCK DIGIT FOUR
    "𝟜": [.four, .doubleStruck],

    //1D7DD         ; MATHEMATICAL DOUBLE-STRUCK DIGIT FIVE
    "𝟝": [.five, .doubleStruck],

    //1D7DE         ; MATHEMATICAL DOUBLE-STRUCK DIGIT SIX
    "𝟞": [.six, .doubleStruck],

    //1D7DF         ; MATHEMATICAL DOUBLE-STRUCK DIGIT SEVEN
    "𝟟": [.seven, .doubleStruck],

    //1D7E0         ; MATHEMATICAL DOUBLE-STRUCK DIGIT EIGHT
    "𝟠": [.eight, .doubleStruck],

    //1D7E1         ; MATHEMATICAL DOUBLE-STRUCK DIGIT NINE
    "𝟡": [.nine, .doubleStruck],

    //1D7E2         ; MATHEMATICAL SANS-SERIF DIGIT ZERO
    "𝟢": [.zero, .sansSerif],

    //1D7E3         ; MATHEMATICAL SANS-SERIF DIGIT ONE
    "𝟣": [.one, .sansSerif],

    //1D7E4         ; MATHEMATICAL SANS-SERIF DIGIT TWO
    "𝟤": [.two, .sansSerif],

    //1D7E5         ; MATHEMATICAL SANS-SERIF DIGIT THREE
    "𝟥": [.three, .sansSerif],

    //1D7E6         ; MATHEMATICAL SANS-SERIF DIGIT FOUR
    "𝟦": [.four, .sansSerif],

    //1D7E7         ; MATHEMATICAL SANS-SERIF DIGIT FIVE
    "𝟧": [.five, .sansSerif],

    //1D7E8         ; MATHEMATICAL SANS-SERIF DIGIT SIX
    "𝟨": [.six, .sansSerif],

    //1D7E9         ; MATHEMATICAL SANS-SERIF DIGIT SEVEN
    "𝟩": [.seven, .sansSerif],

    //1D7EA         ; MATHEMATICAL SANS-SERIF DIGIT EIGHT
    "𝟪": [.eight, .sansSerif],

    //1D7EB         ; MATHEMATICAL SANS-SERIF DIGIT NINE
    "𝟫": [.nine, .sansSerif],

    //1D7EC         ; MATHEMATICAL SANS-SERIF BOLD DIGIT ZERO
    "𝟬": [.zero, .sansSerif, .bold],

    //1D7ED         ; MATHEMATICAL SANS-SERIF BOLD DIGIT ONE
    "𝟭": [.one, .sansSerif, .bold],

    //1D7EE         ; MATHEMATICAL SANS-SERIF BOLD DIGIT TWO
    "𝟮": [.two, .sansSerif, .bold],

    //1D7EF         ; MATHEMATICAL SANS-SERIF BOLD DIGIT THREE
    "𝟯": [.three, .sansSerif, .bold],

    //1D7F0         ; MATHEMATICAL SANS-SERIF BOLD DIGIT FOUR
    "𝟰": [.four, .sansSerif, .bold],

    //1D7F1         ; MATHEMATICAL SANS-SERIF BOLD DIGIT FIVE
    "𝟱": [.five, .sansSerif, .bold],

    //1D7F2         ; MATHEMATICAL SANS-SERIF BOLD DIGIT SIX
    "𝟲": [.six, .sansSerif, .bold],

    //1D7F3         ; MATHEMATICAL SANS-SERIF BOLD DIGIT SEVEN
    "𝟳": [.seven, .sansSerif, .bold],

    //1D7F4         ; MATHEMATICAL SANS-SERIF BOLD DIGIT EIGHT
    "𝟴": [.eight, .sansSerif, .bold],

    //1D7F5         ; MATHEMATICAL SANS-SERIF BOLD DIGIT NINE
    "𝟵": [.nine, .sansSerif, .bold],

    //1D7F6         ; MATHEMATICAL MONOSPACE DIGIT ZERO
    "𝟶": [.zero, .monospace],

    //1D7F7         ; MATHEMATICAL MONOSPACE DIGIT ONE
    "𝟷": [.one, .monospace],

    //1D7F8         ; MATHEMATICAL MONOSPACE DIGIT TWO
    "𝟸": [.two, .monospace],

    //1D7F9         ; MATHEMATICAL MONOSPACE DIGIT THREE
    "𝟹": [.three, .monospace],

    //1D7FA         ; MATHEMATICAL MONOSPACE DIGIT FOUR
    "𝟺": [.four, .monospace],

    //1D7FB         ; MATHEMATICAL MONOSPACE DIGIT FIVE
    "𝟻": [.five, .monospace],

    //1D7FC         ; MATHEMATICAL MONOSPACE DIGIT SIX
    "𝟼": [.six, .monospace],

    //1D7FD         ; MATHEMATICAL MONOSPACE DIGIT SEVEN
    "𝟽": [.seven, .monospace],

    //1D7FE         ; MATHEMATICAL MONOSPACE DIGIT EIGHT
    "𝟾": [.eight, .monospace],

    //1D7FF         ; MATHEMATICAL MONOSPACE DIGIT NINE
    "𝟿": [.nine, .monospace],

]

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
    "¨": [],

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
    "·": [],

    //00B8          ; CEDILLA
    "¸": [],

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
    "À": [.a, .graveAbove, .capital],

    //00C1          ; LATIN CAPITAL LETTER A WITH ACUTE
    "Á": [.a, .acuteAbove, .capital],

    //00C2          ; LATIN CAPITAL LETTER A WITH CIRCUMFLEX
    "Â": [.a, .circumflexAbove, .capital],

    //00C3          ; LATIN CAPITAL LETTER A WITH TILDE
    "Ã": [.a, .tildeAbove, .capital],

    //00C4          ; LATIN CAPITAL LETTER A WITH DIAERESIS
    "Ä": [.a, .diaeresisAbove, .capital],

    //00C5          ; LATIN CAPITAL LETTER A WITH RING ABOVE
    "Å": [.a, .ringAbove, .capital],

    //00C6          ; LATIN CAPITAL LETTER AE
    "Æ": [.a, .e, .capital],

    //00C7          ; LATIN CAPITAL LETTER C WITH CEDILLA
    "Ç": [.c, .cedilla, .capital],

    //00C8          ; LATIN CAPITAL LETTER E WITH GRAVE
    "È": [.e, .graveAbove, .capital],

    //00C9          ; LATIN CAPITAL LETTER E WITH ACUTE
    "É": [.e, .acuteAbove, .capital],

    //00CA          ; LATIN CAPITAL LETTER E WITH CIRCUMFLEX
    "Ê": [.e, .circumflexAbove, .capital],

    //00CB          ; LATIN CAPITAL LETTER E WITH DIAERESIS
    "Ë": [.e, .diaeresisAbove, .capital],

    //00CC          ; LATIN CAPITAL LETTER I WITH GRAVE
    "Ì": [.i, .graveAbove, .capital],

    //00CD          ; LATIN CAPITAL LETTER I WITH ACUTE
    "Í": [.i, .acuteAbove, .capital],

    //00CE          ; LATIN CAPITAL LETTER I WITH CIRCUMFLEX
    "Î": [.i, .circumflexAbove, .capital],

    //00CF          ; LATIN CAPITAL LETTER I WITH DIAERESIS
    "Ï": [.i, .diaeresisAbove, .capital],

    //00D0          ; LATIN CAPITAL LETTER ETH
    "Ð": [.d, .h, .capital],

    //00D1          ; LATIN CAPITAL LETTER N WITH TILDE
    "Ñ": [.n, .tildeAbove, .capital],

    //00D2          ; LATIN CAPITAL LETTER O WITH GRAVE
    "Ò": [.o, .graveAbove, .capital],

    //00D3          ; LATIN CAPITAL LETTER O WITH ACUTE
    "Ó": [.o, .acuteAbove, .capital],

    //00D4          ; LATIN CAPITAL LETTER O WITH CIRCUMFLEX
    "Ô": [.o, .circumflexAbove, .capital],

    //00D5          ; LATIN CAPITAL LETTER O WITH TILDE
    "Õ": [.o, .tildeAbove, .capital],

    //00D6          ; LATIN CAPITAL LETTER O WITH DIAERESIS
    "Ö": [.o, .diaeresisAbove, .capital],

    //00D7          ; MULTIPLICATION SIGN
    "×": [],

    //00D8          ; LATIN CAPITAL LETTER O WITH STROKE
    "Ø": [.o, .diagonalStroke, .capital],

    //00D9          ; LATIN CAPITAL LETTER U WITH GRAVE
    "Ù": [.u, .graveAbove, .capital],

    //00DA          ; LATIN CAPITAL LETTER U WITH ACUTE
    "Ú": [.u, .acuteAbove, .capital],

    //00DB          ; LATIN CAPITAL LETTER U WITH CIRCUMFLEX
    "Û": [.u, .circumflexAbove, .capital],

    //00DC          ; LATIN CAPITAL LETTER U WITH DIAERESIS
    "Ü": [.u, .diaeresisAbove, .capital],

    //00DD          ; LATIN CAPITAL LETTER Y WITH ACUTE
    "Ý": [.y, .acuteAbove, .capital],

    //00DE          ; LATIN CAPITAL LETTER THORN
    "Þ": [.b, .p, .capital],

    //00DF          ; LATIN SMALL LETTER SHARP S
    "ß": [.s, .s],

    //00E0          ; LATIN SMALL LETTER A WITH GRAVE
    "à": [.a, .graveAbove],

    //00E1          ; LATIN SMALL LETTER A WITH ACUTE
    "á": [.a, .acuteAbove],

    //00E2          ; LATIN SMALL LETTER A WITH CIRCUMFLEX
    "â": [.a, .circumflexAbove],

    //00E3          ; LATIN SMALL LETTER A WITH TILDE
    "ã": [.a, .tildeAbove],

    //00E4          ; LATIN SMALL LETTER A WITH DIAERESIS
    "ä": [.a, .diaeresisAbove],

    //00E5          ; LATIN SMALL LETTER A WITH RING ABOVE
    "å": [.a, .ringAbove],

    //00E6          ; LATIN SMALL LETTER AE
    "æ": [.a, .e],

    //00E7          ; LATIN SMALL LETTER C WITH CEDILLA
    "ç": [.c, .cedilla],

    //00E8          ; LATIN SMALL LETTER E WITH GRAVE
    "è": [.e, .graveAbove],

    //00E9          ; LATIN SMALL LETTER E WITH ACUTE
    "é": [.e, .acuteAbove],

    //00EA          ; LATIN SMALL LETTER E WITH CIRCUMFLEX
    "ê": [.e, .circumflexAbove],

    //00EB          ; LATIN SMALL LETTER E WITH DIAERESIS
    "ë": [.e, .diaeresisAbove],

    //00EC          ; LATIN SMALL LETTER I WITH GRAVE
    "ì": [.i, .graveAbove],

    //00ED          ; LATIN SMALL LETTER I WITH ACUTE
    "í": [.i, .acuteAbove],

    //00EE          ; LATIN SMALL LETTER I WITH CIRCUMFLEX
    "î": [.i, .circumflexAbove],

    //00EF          ; LATIN SMALL LETTER I WITH DIAERESIS
    "ï": [.i, .diaeresisAbove],

    //00F0          ; LATIN SMALL LETTER ETH
    "ð": [.d, .h],

    //00F1          ; LATIN SMALL LETTER N WITH TILDE
    "ñ": [.n, .tildeAbove],

    //00F2          ; LATIN SMALL LETTER O WITH GRAVE
    "ò": [.o, .graveAbove],

    //00F3          ; LATIN SMALL LETTER O WITH ACUTE
    "ó": [.o, .acuteAbove],

    //00F4          ; LATIN SMALL LETTER O WITH CIRCUMFLEX
    "ô": [.o, .circumflexAbove],

    //00F5          ; LATIN SMALL LETTER O WITH TILDE
    "õ": [.o, .tildeAbove],

    //00F6          ; LATIN SMALL LETTER O WITH DIAERESIS
    "ö": [.o, .diaeresisAbove],

    //00F7          ; DIVISION SIGN
    "÷": [],

    //00F8          ; LATIN SMALL LETTER O WITH STROKE
    "ø": [.o, .diagonalStroke],

    //00F9          ; LATIN SMALL LETTER U WITH GRAVE
    "ù": [.u, .graveAbove],

    //00FA          ; LATIN SMALL LETTER U WITH ACUTE
    "ú": [.u, .acuteAbove],

    //00FB          ; LATIN SMALL LETTER U WITH CIRCUMFLEX
    "û": [.u, .circumflexAbove],

    //00FC          ; LATIN SMALL LETTER U WITH DIAERESIS
    "ü": [.u, .diaeresisAbove],

    //00FD          ; LATIN SMALL LETTER Y WITH ACUTE
    "ý": [.y, .acuteAbove],

    //00FE          ; LATIN SMALL LETTER THORN
    "þ": [.b, .p],

    //00FF          ; LATIN SMALL LETTER Y WITH DIAERESIS
    "ÿ": [.y, .diaeresisAbove],

    
    // MARK: - 0100..017F; Latin Extended-A
    
    //0100          ; LATIN CAPITAL LETTER A WITH MACRON
    "Ā": [.a, .macronAbove, .capital],

    //0101          ; LATIN SMALL LETTER A WITH MACRON
    "ā": [.a, .macronAbove],

    //0102          ; LATIN CAPITAL LETTER A WITH BREVE
    "Ă": [.a, .breveAbove, .capital],

    //0103          ; LATIN SMALL LETTER A WITH BREVE
    "ă": [.a, .breveAbove],

    //0104          ; LATIN CAPITAL LETTER A WITH OGONEK
    "Ą": [.a, .ogonekBelow, .capital],

    //0105          ; LATIN SMALL LETTER A WITH OGONEK
    "ą": [.a, .ogonekBelow],

    //0106          ; LATIN CAPITAL LETTER C WITH ACUTE
    "Ć": [.c, .acuteAbove, .capital],

    //0107          ; LATIN SMALL LETTER C WITH ACUTE
    "ć": [.c, .acuteAbove],

    //0108          ; LATIN CAPITAL LETTER C WITH CIRCUMFLEX
    "Ĉ": [.c, .circumflexAbove, .capital],

    //0109          ; LATIN SMALL LETTER C WITH CIRCUMFLEX
    "ĉ": [.c, .circumflexAbove],

    //010A          ; LATIN CAPITAL LETTER C WITH DOT ABOVE
    "Ċ": [.c, .dotAbove, .capital],

    //010B          ; LATIN SMALL LETTER C WITH DOT ABOVE
    "ċ": [.c, .dotAbove],

    //010C          ; LATIN CAPITAL LETTER C WITH CARON
    "Č": [.c, .caronAbove, .capital],

    //010D          ; LATIN SMALL LETTER C WITH CARON
    "č": [.c, .caronAbove],

    //010E          ; LATIN CAPITAL LETTER D WITH CARON
    "Ď": [.d, .caronAbove, .capital],
    
    //010F          ; LATIN SMALL LETTER D WITH CARON
    "ď": [.d, .caronAbove],

    //0110          ; LATIN CAPITAL LETTER D WITH STROKE
    "Đ": [.d, .stroke, .capital],

    //0111          ; LATIN SMALL LETTER D WITH STROKE
    "đ": [.d, .stroke],

    //0112          ; LATIN CAPITAL LETTER E WITH MACRON
    "Ē": [.e, .macronAbove, .capital],

    //0113          ; LATIN SMALL LETTER E WITH MACRON
    "ē": [.e, .macronAbove],

    //0114          ; LATIN CAPITAL LETTER E WITH BREVE
    "Ĕ": [.e, .breveAbove, .capital],

    //0115          ; LATIN SMALL LETTER E WITH BREVE
    "ĕ": [.e, .breveAbove],

    //0116          ; LATIN CAPITAL LETTER E WITH DOT ABOVE
    "Ė": [.e, .dotAbove, .capital],

    //0117          ; LATIN SMALL LETTER E WITH DOT ABOVE
    "ė": [.e, .dotAbove],

    //0118          ; LATIN CAPITAL LETTER E WITH OGONEK
    "Ę": [.e, .ogonekBelow, .capital],

    //0119          ; LATIN SMALL LETTER E WITH OGONEK
    "ę": [.e, .ogonekBelow],

    //011A          ; LATIN CAPITAL LETTER E WITH CARON
    "Ě": [.e, .caronAbove, .capital],

    //011B          ; LATIN SMALL LETTER E WITH CARON
    "ě": [.e, .caronAbove],

    //011C          ; LATIN CAPITAL LETTER G WITH CIRCUMFLEX
    "Ĝ": [.g, .circumflexAbove, .capital],

    //011D          ; LATIN SMALL LETTER G WITH CIRCUMFLEX
    "ĝ": [.g, .circumflexAbove],

    //011E          ; LATIN CAPITAL LETTER G WITH BREVE
    "Ğ": [.g, .breveAbove, .capital],

    //011F          ; LATIN SMALL LETTER G WITH BREVE
    "ğ": [.g, .breveAbove],

    //0120          ; LATIN CAPITAL LETTER G WITH DOT ABOVE
    "Ġ": [.g, .dotAbove, .capital],

    //0121          ; LATIN SMALL LETTER G WITH DOT ABOVE
    "ġ": [.g, .dotAbove],

    //0122          ; LATIN CAPITAL LETTER G WITH CEDILLA
    "Ģ": [.g, .cedilla, .capital],

    //0123          ; LATIN SMALL LETTER G WITH CEDILLA
    "ģ": [.g, .cedilla],

    //0124          ; LATIN CAPITAL LETTER H WITH CIRCUMFLEX
    "Ĥ": [.h, .circumflexAbove, .capital],

    //0125          ; LATIN SMALL LETTER H WITH CIRCUMFLEX
    "ĥ": [.h, .circumflexAbove],

    //0126          ; LATIN CAPITAL LETTER H WITH STROKE
    "Ħ": [.h, .stroke, .capital],

    //0127          ; LATIN SMALL LETTER H WITH STROKE
    "ħ": [.h, .stroke],

    //0128          ; LATIN CAPITAL LETTER I WITH TILDE
    "Ĩ": [.i, .tildeAbove, .capital],

    //0129          ; LATIN SMALL LETTER I WITH TILDE
    "ĩ": [.i, .tildeAbove],

    //012A          ; LATIN CAPITAL LETTER I WITH MACRON
    "Ī": [.i, .macronAbove, .capital],

    //012B          ; LATIN SMALL LETTER I WITH MACRON
    "ī": [.i, .macronAbove],

    //012C          ; LATIN CAPITAL LETTER I WITH BREVE
    "Ĭ": [.i, .breveAbove, .capital],

    //012D          ; LATIN SMALL LETTER I WITH BREVE
    "ĭ": [.i, .breveAbove],

    //012E          ; LATIN CAPITAL LETTER I WITH OGONEK
    "Į": [.i, .ogonekAbove, .capital],

    //012F          ; LATIN SMALL LETTER I WITH OGONEK
    "į": [.i, .ogonekAbove],

    //0130          ; LATIN CAPITAL LETTER I WITH DOT ABOVE
    "İ": [.i, .dotAbove, .capital],

    //0131          ; LATIN SMALL LETTER DOTLESS I
    "ı": [.i, .dotAbove],

    //0132          ; LATIN CAPITAL LIGATURE IJ
    "Ĳ": [.i, .j, .capital],

    //0133          ; LATIN SMALL LIGATURE IJ
    "ĳ": [.i, .j],

    //0134          ; LATIN CAPITAL LETTER J WITH CIRCUMFLEX
    "Ĵ": [.j, .circumflexAbove, .capital],

    //0135          ; LATIN SMALL LETTER J WITH CIRCUMFLEX
    "ĵ": [.j, .circumflexAbove],

    //0136          ; LATIN CAPITAL LETTER K WITH CEDILLA
    "Ķ": [.k, .cedilla, .capital],

    //0137          ; LATIN SMALL LETTER K WITH CEDILLA
    "ķ": [.k, .cedilla],

    //0138          ; LATIN SMALL LETTER KRA
    "ĸ": [.k, .longLeg],

    //0139          ; LATIN CAPITAL LETTER L WITH ACUTE
    "Ĺ": [.l, .acuteAbove, .capital],

    //013A          ; LATIN SMALL LETTER L WITH ACUTE
    "ĺ": [.l, .acuteAbove],

    //013B          ; LATIN CAPITAL LETTER L WITH CEDILLA
    "Ļ": [.l, .cedilla, .capital],

    //013C          ; LATIN SMALL LETTER L WITH CEDILLA
    "ļ": [.l, .cedilla],

    //013D          ; LATIN CAPITAL LETTER L WITH CARON
    "Ľ": [.l, .caronAbove, .capital],

    //013E          ; LATIN SMALL LETTER L WITH CARON
    "ľ": [.l, .caronAbove],

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
    "Ń": [.n, .acuteAbove, .capital],

    //0144          ; LATIN SMALL LETTER N WITH ACUTE
    "ń": [.n, .acuteAbove],

    //0145          ; LATIN CAPITAL LETTER N WITH CEDILLA
    "Ņ": [.n, .cedilla, .capital],

    //0146          ; LATIN SMALL LETTER N WITH CEDILLA
    "ņ": [.n, .cedilla],

    //0147          ; LATIN CAPITAL LETTER N WITH CARON
    "Ň": [.n, .caronAbove, .capital],

    //0148          ; LATIN SMALL LETTER N WITH CARON
    "ň": [.n, .caronAbove],

    //0149          ; LATIN SMALL LETTER N PRECEDED BY APOSTROPHE
    "ŉ": [],

    //014A          ; LATIN CAPITAL LETTER ENG
    "Ŋ": [.n, .g, .capital],

    //014B          ; LATIN SMALL LETTER ENG
    "ŋ": [.n, .g],

    //014C          ; LATIN CAPITAL LETTER O WITH MACRON
    "Ō": [.o, .macronAbove, .capital],

    //014D          ; LATIN SMALL LETTER O WITH MACRON
    "ō": [.o, .macronAbove],

    //014E          ; LATIN CAPITAL LETTER O WITH BREVE
    "Ŏ": [.o, .breveAbove, .capital],

    //014F          ; LATIN SMALL LETTER O WITH BREVE
    "ŏ": [.o, .breveAbove],

    //0150          ; LATIN CAPITAL LETTER O WITH DOUBLE ACUTE
    "Ő": [.o, .doubleAcuteAbove, .capital],

    //0151          ; LATIN SMALL LETTER O WITH DOUBLE ACUTE
    "ő": [.o, .doubleAcuteAbove],

    //0152          ; LATIN CAPITAL LIGATURE OE
    "Œ": [.o, .e, .capital],
    
    //0153          ; LATIN SMALL LIGATURE OE
    "œ": [.e, .e],

    //0154          ; LATIN CAPITAL LETTER R WITH ACUTE
    "Ŕ": [.r, .acuteAbove, .capital],

    //0155          ; LATIN SMALL LETTER R WITH ACUTE
    "ŕ": [.r, .acuteAbove],

    //0156          ; LATIN CAPITAL LETTER R WITH CEDILLA
    "Ŗ": [.r, .cedilla, .capital],

    //0157          ; LATIN SMALL LETTER R WITH CEDILLA
    "ŗ": [.r, .cedilla],

    //0158          ; LATIN CAPITAL LETTER R WITH CARON
    "Ř": [.r, .caronAbove, .capital],

    //0159          ; LATIN SMALL LETTER R WITH CARON
    "ř": [.r, .caronAbove],

    //015A          ; LATIN CAPITAL LETTER S WITH ACUTE
    "Ś": [.s, .acuteAbove, .capital],

    //015B          ; LATIN SMALL LETTER S WITH ACUTE
    "ś": [.s, .acuteAbove],

    //015C          ; LATIN CAPITAL LETTER S WITH CIRCUMFLEX
    "Ŝ": [.s, .circumflexAbove, .capital],

    //015D          ; LATIN SMALL LETTER S WITH CIRCUMFLEX
    "ŝ": [.s, .circumflexAbove],

    //015E          ; LATIN CAPITAL LETTER S WITH CEDILLA
    "Ş": [.s, .cedilla, .capital],

    //015F          ; LATIN SMALL LETTER S WITH CEDILLA
    "ş": [.s, .cedilla],

    //0160          ; LATIN CAPITAL LETTER S WITH CARON
    "Š": [.s, .caronAbove, .capital],

    //0161          ; LATIN SMALL LETTER S WITH CARON
    "š": [.s, .caronAbove],

    //0162          ; LATIN CAPITAL LETTER T WITH CEDILLA
    "Ţ": [.t, .cedilla, .capital],

    //0163          ; LATIN SMALL LETTER T WITH CEDILLA
    "ţ": [.t, .cedilla],

    //0164          ; LATIN CAPITAL LETTER T WITH CARON
    "Ť": [.t, .caronAbove, .capital],

    //0165          ; LATIN SMALL LETTER T WITH CARON
    "ť": [.t, .caronAbove],

    //0166          ; LATIN CAPITAL LETTER T WITH STROKE
    "Ŧ": [.t, .stroke, .capital],

    //0167          ; LATIN SMALL LETTER T WITH STROKE
    "ŧ": [.t, .stroke],

    //0168          ; LATIN CAPITAL LETTER U WITH TILDE
    "Ũ": [.u, .tildeAbove, .capital],

    //0169          ; LATIN SMALL LETTER U WITH TILDE
    "ũ": [.u, .tildeAbove],

    //016A          ; LATIN CAPITAL LETTER U WITH MACRON
    "Ū": [.u, .macronAbove, .capital],

    //016B          ; LATIN SMALL LETTER U WITH MACRON
    "ū": [.u, .macronAbove],

    //016C          ; LATIN CAPITAL LETTER U WITH BREVE
    "Ŭ": [.u, .breveAbove, .capital],

    //016D          ; LATIN SMALL LETTER U WITH BREVE
    "ŭ": [.u, .breveAbove],

    //016E          ; LATIN CAPITAL LETTER U WITH RING ABOVE
    "Ů": [.u, .ringAbove, .capital],

    //016F          ; LATIN SMALL LETTER U WITH RING ABOVE
    "ů": [.u, .ringAbove],

    //0170          ; LATIN CAPITAL LETTER U WITH DOUBLE ACUTE
    "Ű": [.u, .doubleAcuteAbove, .capital],

    //0171          ; LATIN SMALL LETTER U WITH DOUBLE ACUTE
    "ű": [.u, .doubleAcuteAbove],

    //0172          ; LATIN CAPITAL LETTER U WITH OGONEK
    "Ų": [.u, .ogonekBelow, .capital],

    //0173          ; LATIN SMALL LETTER U WITH OGONEK
    "ų": [.u, .ogonekBelow],

    //0174          ; LATIN CAPITAL LETTER W WITH CIRCUMFLEX
    "Ŵ": [.w, .circumflexAbove, .capital],

    //0175          ; LATIN SMALL LETTER W WITH CIRCUMFLEX
    "ŵ": [.w, .circumflexAbove],

    //0176          ; LATIN CAPITAL LETTER Y WITH CIRCUMFLEX
    "Ŷ": [.y, .circumflexAbove, .capital],

    //0177          ; LATIN SMALL LETTER Y WITH CIRCUMFLEX
    "ŷ": [.y, .circumflexAbove],

    //0178          ; LATIN CAPITAL LETTER Y WITH DIAERESIS
    "Ÿ": [.y, .diaeresisAbove, .capital],

    //0179          ; LATIN CAPITAL LETTER Z WITH ACUTE
    "Ź": [.z, .acuteAbove, .capital],

    //017A          ; LATIN SMALL LETTER Z WITH ACUTE
    "ź": [.z, .acuteAbove],

    //017B          ; LATIN CAPITAL LETTER Z WITH DOT ABOVE
    "Ż": [.z, .dotAbove, .capital],

    //017C          ; LATIN SMALL LETTER Z WITH DOT ABOVE
    "ż": [.z, .dotAbove],

    //017D          ; LATIN CAPITAL LETTER Z WITH CARON
    "Ž": [.z, .caronAbove, .capital],

    //017E          ; LATIN SMALL LETTER Z WITH CARON
    "ž": [.z, .caronAbove],

    //017F          ; LATIN SMALL LETTER LONG S
    "ſ": [.s, .l],

]

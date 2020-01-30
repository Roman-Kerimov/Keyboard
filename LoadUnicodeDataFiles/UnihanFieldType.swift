//
//  UnihanFieldType.swift
//  LoadUnicodeDataFiles
//
//  Created by Roman Kerimov on 2019-12-31.
//

enum UnihanFieldType: String {
    
    // Unihan_DictionaryLikeData.txt
    case cangjie = "kCangjie"
    case cheungBauer = "kCheungBauer"
    case cihaiT = "kCihaiT"
    case fenn = "kFenn"
    case fourCornerCode = "kFourCornerCode"
    case frequency = "kFrequency"
    case gradeLevel = "kGradeLevel"
    case HDZRadBreak = "kHDZRadBreak"
    case HKGlyph = "kHKGlyph"
    case phonetic = "kPhonetic"
    case totalStrokes = "kTotalStrokes"
    
    // Unihan_Readings.txt
    case cantonese = "kCantonese"
    case definition = "kDefinition"
    case hangul = "kHangul"
    case hanyuPinlu = "kHanyuPinlu"
    case hanyuPinyin = "kHanyuPinyin"
    case japaneseKun = "kJapaneseKun"
    case japaneseOn = "kJapaneseOn"
    case korean = "kKorean"
    case mandarin = "kMandarin"
    case tang = "kTang"
    case vietnamese = "kVietnamese"
    case XHC1983 = "kXHC1983"
}

//
//  UnihanFieldType.swift
//  BuildUnicodeData
//
//  Created by Roman Kerimov on 2019-12-31.
//

enum UnihanFieldType: String {
    
    // Unihan_DictionaryLikeData.txt
    case alternateTotalStrokes = "kAlternateTotalStrokes"
    case cangjie = "kCangjie"
    case cheungBauer = "kCheungBauer"
    case fenn = "kFenn"
    case fourCornerCode = "kFourCornerCode"
    case frequency = "kFrequency"
    case gradeLevel = "kGradeLevel"
    case HDZRadBreak = "kHDZRadBreak"
    case HKGlyph = "kHKGlyph"
    case phonetic = "kPhonetic"
    case strange = "kStrange"
    case unihanCore2020 = "kUnihanCore2020"
    
    // Unihan_IRGSources.txt
    case compatibilityVariant = "kCompatibilityVariant"
    case IICore = "kIICore"
    case IRG_GSource = "kIRG_GSource"
    case IRG_HSource = "kIRG_HSource"
    case IRG_JSource = "kIRG_JSource"
    case IRG_KPSource = "kIRG_KPSource"
    case IRG_KSource = "kIRG_KSource"
    case IRG_MSource = "kIRG_MSource"
    case IRG_SSource = "kIRG_SSource"
    case IRG_TSource = "kIRG_TSource"
    case IRG_UKSource = "kIRG_UKSource"
    case IRG_USource = "kIRG_USource"
    case IRG_VSource = "kIRG_VSource"
    case RSUnicode = "kRSUnicode"
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
    case TGHZ2013 = "kTGHZ2013"
    case vietnamese = "kVietnamese"
    case XHC1983 = "kXHC1983"
}

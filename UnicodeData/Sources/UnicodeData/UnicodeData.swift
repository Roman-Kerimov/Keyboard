//
//  UnicodeData.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import CoreData
import LinguisticKit

public class UnicodeData: NSPersistentContainer {
    
    public static let `default`: UnicodeData = {
        let model = NSManagedObjectModel()
        model.entities = [
            ManagedUnicodeItem.entityDescription(),
            ManagedWord.entityDescription(),
            ManagedCharacterCollection.entityDescription(),
        ]

        return UnicodeData(name: String(describing: UnicodeData.self), managedObjectModel: model)
    }()
    
    public lazy var backgroundContext = newBackgroundContext()
    
    public func addItem(codePoints: String, name: String? = nil, language: String = "", annotation: String? = nil, ttsAnnotation: String? = nil, order: Int? = nil, totalStrokes: Int? = nil, frequency: Int? = nil) {
        
        languageScripts(fromLanguage: language).forEach { (language) in
            let item = ManagedUnicodeItem(context: backgroundContext)
            item.codePoints = codePoints
            item.name = name
            item.language = language
            
            if let annotation = annotation {
                item.annotation = text(inLanguage: language, from: annotation)
            }
            
            if let ttsAnnotation = ttsAnnotation {
                item.ttsAnnotation = text(inLanguage: language, from: ttsAnnotation)
            }
            
            if let order = order {
                item.order = .init(order)
            }
            else {
                item.order = .init(itemCount)
            }
            
            if let totalStrokes = totalStrokes {
                item.totalStrokes = .init(totalStrokes)
            }
            
            if let frequency = frequency {
                item.frequency = .init(frequency)
            }
            
            itemCount += 1
        }
    }
    
    private func languageQuery(language: String) -> String {
        let locale = Locale(identifier: language)
        
        let languageQuery: String = (locale.compatibleIdentifiers + [""]).map({"(language == '\($0)')"}).joined(separator: " OR ")
        
        return "(\(languageQuery))"
    }
    
    public func item(codePoints: String, language: String) -> UnicodeItem? {
        let fetchRequest: NSFetchRequest<ManagedUnicodeItem> = ManagedUnicodeItem.fetchRequest()
        
        fetchRequest.predicate = .init(format: "codePoints == %@ AND \(languageQuery(language: language))", codePoints)
        return try! backgroundContext.fetch(fetchRequest)
            .map {UnicodeItem(managed: $0)}
            .filter {$0.codePoints.unicodeScalars.map {$0.value} == codePoints.unicodeScalars.map {$0.value}}
            .max {$0.language!.count < $1.language!.count}
    }
    
    func item(name: String) -> UnicodeItem? {
        let fetchRequest: NSFetchRequest<ManagedUnicodeItem> = ManagedUnicodeItem.fetchRequest()
        fetchRequest.predicate = .init(format: "name == %@", name)
        return try! backgroundContext.fetch(fetchRequest).map {UnicodeItem(managed: $0)}.first
    }
    
    public func flagCodePoints(regionCode: String) -> String {
        return regionCode.count == 2
            ? regionCode.uppercased().unicodeScalars.map {Unicode.Scalar($0.value + 0x1F1A5)?.description ?? "_"} .joined()
            : "\u{1F3F4}" + regionCode.unicodeScalars.map {Unicode.Scalar($0.value + 0xE0000)?.description ?? "_"} .joined() + "\u{E007F}"
    }
    
    public func regionCode(flagCodePoints: String) -> String? {
        let unicodeScalars = flagCodePoints.unicodeScalars
        
        if unicodeScalars.count == 2, unicodeScalars.reduce(true, {$0 && CharacterSet(charactersIn: "🇦"..."🇿").contains($1)}) {
            return unicodeScalars.map {Unicode.Scalar($0.value - 0x1F1A5)!.description} .joined()
        }
        else if unicodeScalars.count > 4, unicodeScalars.first == "\u{1F3F4}", unicodeScalars.last == "\u{E007F}" {
            let subdivisionCode: String = unicodeScalars.dropFirst().dropLast().map {Unicode.Scalar($0.value - 0xE0000)?.description ?? "_"} .joined()
            
            if subdivisionCode.unicodeScalars.reduce(true, {$0 && $1.isASCII && ($1.properties.isLowercase || $1.properties.generalCategory == .decimalNumber)}) {
                return subdivisionCode
            }
        }
        
        return nil
    }
    
    public func flagItem(regionCode: String, language: String) -> UnicodeItem? {
        return item(codePoints: flagCodePoints(regionCode: regionCode), language: language)
    }
    
    public func items(language: String, regularExpression: NSRegularExpression, exclude excludeItems: [UnicodeItem], fetchLimit: Int) -> [UnicodeItem] {
        
        let fetchRequest: NSFetchRequest<ManagedUnicodeItem> = ManagedUnicodeItem.fetchRequest()
        fetchRequest.fetchLimit = fetchLimit
        fetchRequest.predicate = .init(format: "\(languageQuery(language: language)) AND !(codePoints IN %@) AND \(language.isEmpty ? "name" : "annotation") MATCHES [c] %@", excludeItems.map {$0.codePoints}, ".*\(regularExpression.pattern).*")
        fetchRequest.sortDescriptors = [
            .init(key: "frequency", ascending: true),
            .init(key: "totalStrokes", ascending: true),
            .init(key: "order", ascending: true),
        ]
        
        return (try! backgroundContext.fetch(fetchRequest)).map {.init(managed: $0)}
    }
    
    public func addWord(_ string: String, language: String) {
        languageScripts(fromLanguage: language).forEach { (language) in
            let word = ManagedWord(context:backgroundContext)
            word.string = text(inLanguage: language, from: string)
            word.language = language
        }
    }
    
    public func words(language: String) -> [String] {
        let fetchRequest: NSFetchRequest<ManagedWord> = ManagedWord.fetchRequest()
        fetchRequest.predicate = .init(format: "language == %@", language)
        
        return try! backgroundContext.fetch(fetchRequest).map {$0.string!}
    }
    
    public func languages(regularExpression: NSRegularExpression) -> Set<String> {
        let wordsFetchRequest: NSFetchRequest<ManagedWord> = ManagedWord.fetchRequest()
        wordsFetchRequest.predicate = .init(format: "string MATCHES [c] %@", ".*\(regularExpression.pattern).*")
        let words = try! backgroundContext.fetch(wordsFetchRequest)
        
        return Set(words.map {$0.language!} + [""])
    }
    
    private func languageScripts(fromLanguage language: String?) -> [String?] {
        if let language = language {
            return Locale.extendedIdentifiers(fromIdentifiers: [language])
        }
        else {
            return [nil]
        }
    }
    
    private func text(inLanguage language: String?, from text: String) -> String {
        switch language {
        case "ru-Latn":
            return text.applyingTransform(from: .Cyrl, to: .Latn, withTable: .ru)!
        default:
            return text
        }
    }
    
    public func createCharacterCollection(language: String) -> ManagedCharacterCollection {
        let characterCollection = ManagedCharacterCollection(context: backgroundContext)
        characterCollection.language = language

        return characterCollection
    }
    
    private func characterCollection(language: String) -> CharacterCollection? {
        let fetchRequest: NSFetchRequest<ManagedCharacterCollection> = ManagedCharacterCollection.fetchRequest()
        
        fetchRequest.predicate = .init(format: languageQuery(language: language))
        return try! backgroundContext.fetch(fetchRequest)
            .map {CharacterCollection(managed: $0)}
            .max {$0.id.count < $1.id.count}
    }
    
    public func characterCollections() -> [CharacterCollection] {
        let fetchRequest: NSFetchRequest<ManagedCharacterCollection> = ManagedCharacterCollection.fetchRequest()
        fetchRequest.sortDescriptors = [.init(key: "language", ascending: true)]

        return try! backgroundContext.fetch(fetchRequest).map({CharacterCollection(managed: $0)}).filter {!$0.characterSections.isEmpty}
    }
    
    public func preferredCharacterCollections(maxCount: Int = 100) -> [CharacterCollection] {

        var preferredCharacterCollections: [CharacterCollection] = []

        for language in Locale.preferredLanguages + ["es", "fr", "de"] {
            guard let characterCollection = characterCollection(language: language), !characterCollection.characterSections.isEmpty else {
                continue
            }

            if !preferredCharacterCollections.contains(characterCollection) {
                preferredCharacterCollections.append(characterCollection)
            }

            if preferredCharacterCollections.count == maxCount {
                break
            }
        }

        return preferredCharacterCollections
    }
    
    public lazy var itemCount: Int = try! backgroundContext.count(for: ManagedUnicodeItem.fetchRequest())
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    public func waitUntilLoadingIsFinished() {
        backgroudOperationQueue.waitUntilAllOperationsAreFinished()
    }
    
    private lazy var sqLiteURL = Bundle.main.url(forResource: name, withExtension: "sqlite")
    
    private override init(name: String, managedObjectModel model: NSManagedObjectModel) {
        super.init(name: name, managedObjectModel: model)
        
        loadPersistentStore()
        
        if sqLiteURL != nil && loadedVersion != currentVersion {
            resetPersistentStore()
            
            loadedVersion = currentVersion
            
            collectFileGarbage()
        }
    }
    
    private func collectFileGarbage() {
        let fileGarbageURLs: [URL] = [
            URL.applicationSupport.appendingPathComponent("DerivedName"),
            URL.applicationSupport.appendingPathComponent("emoji-test"),
            URL.applicationSupport.appendingPathComponent("UDFCache"),
        ]
        
        fileGarbageURLs.forEach {try? FileManager.default.removeItem(at: $0)}
    }
    
    public func loadIfNeeded() {}
    
    private func loadPersistentStore() {
        loadPersistentStores { description, error in
            if let _ = error {
                DispatchQueue.main.async {
                    self.resetPersistentStore()
                }
            }
        }
    }
        
    public func resetPersistentStore() {
        let wal = "-wal"
        
        let storeURLs = persistentStoreDescriptions.compactMap {$0.url}
        storeURLs.forEach { (storeURL) in
            try? persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
            try? FileManager.default.removeItem(at: storeURL)
            try? FileManager.default.removeItem(atPath: storeURL.path + wal)
        }
        
        if let sqLiteURL = sqLiteURL {
            try! FileManager.default.copyItem(at: sqLiteURL, to: storeURLs.first!)
            try! FileManager.default.copyItem(atPath: sqLiteURL.path + wal, toPath: storeURLs.first!.path + wal)
        }
        
        loadPersistentStore()
    }
    
    private var currentVersion: String {
        return Bundle.main.executableHash
    }
    
    private let loadedVersionKey = "t79Hx5H46r8PC2ftV0XUNhIDxwJXq8Y"
    var loadedVersion: String {
        get {
            return UserDefaults.standard.string(forKey: loadedVersionKey) ?? .init()
        }
        
        set {
            UserDefaults.standard.set(newValue, forKey: loadedVersionKey)
            UserDefaults.standard.synchronize()
        }
    }
}

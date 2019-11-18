//
//  UnicodeData.swift
//  Keyboard
//
//  Created by Roman Kerimov on 2017-06-01.
//
//

import CoreData

class UnicodeData: NSPersistentContainer {
    
    public static let `default`: UnicodeData = .init(name: "UnicodeData")
    
    lazy var backgroundContext = newBackgroundContext()
    
    func items(regularExpression: NSRegularExpression, exclude excludeItems: [UnicodeItem]) -> [UnicodeItem] {
        let fetchLimit = 200
        
        let wordsFetchRequest: NSFetchRequest<ManagedWord> = ManagedWord.fetchRequest()
        wordsFetchRequest.predicate = .init(format: "string MATCHES [c] %@", ".*\(regularExpression.pattern).*")
        let words = try! backgroundContext.fetch(wordsFetchRequest)
        
        let annotationsFetchRequest: NSFetchRequest<ManagedAnnotation> = ManagedAnnotation.fetchRequest()
        annotationsFetchRequest.fetchLimit = fetchLimit
        annotationsFetchRequest.predicate = .init(format: "language IN %@ AND text MATCHES [c] %@", Set(words.map {$0.language!}), ".*\(regularExpression.pattern).*")
        let annotations = try! backgroundContext.fetch(annotationsFetchRequest)
        
        let fetchRequest: NSFetchRequest<ManagedUnicodeItem> = ManagedUnicodeItem.fetchRequest()
        fetchRequest.fetchLimit = fetchLimit
        fetchRequest.predicate = .init(format: "!(codePoints IN %@) AND (name MATCHES [c] %@ OR codePoints IN %@)", excludeItems.map {$0.codePoints}, ".*\(regularExpression.pattern).*", annotations.map {$0.codePoints!})
        fetchRequest.sortDescriptors = [.init(key: "order", ascending: true)]
        
        return (try! backgroundContext.fetch(fetchRequest)).map {.init(managed: $0)}
    }
    
    func item(byCodePoints codePoints: String) -> UnicodeItem? {
        
        let fetchRequest: NSFetchRequest<ManagedUnicodeItem> = ManagedUnicodeItem.fetchRequest()
        fetchRequest.predicate = .init(format: "codePoints == %@", codePoints)
        let items = (try! backgroundContext.fetch(fetchRequest)).map {UnicodeItem(managed: $0)}
        
        return items.first(where: {$0.codePoints.unicodeScalars.map {$0.value} == codePoints.unicodeScalars.map {$0.value}})
    }
    
    func addItem(codePoints: String, name: String) {
        let item = ManagedUnicodeItem(context: backgroundContext)
        
        item.codePoints = codePoints
        item.name = name
        item.order = .init(itemCount)
        
        itemCount += 1
    }
    
    func annotation(codePoints: String, language: String) -> ManagedAnnotation? {
        let fetchRequest: NSFetchRequest<ManagedAnnotation> = ManagedAnnotation.fetchRequest()
        
        let locale = Foundation.Locale(identifier: language)
        
        let languageQuery: String = Set(
            [[locale.languageCode, locale.scriptCode, locale.regionCode],
            [locale.languageCode, locale.scriptCode],
            [locale.languageCode, locale.regionCode],
            [locale.languageCode]]
               .map({$0.compactMap({$0})})
               .map({$0.joined(separator: "_")})
        )
            .map({"(language == '\($0)')"})
            .joined(separator: " OR ")
        
        fetchRequest.predicate = .init(format: "codePoints == %@ AND (\(languageQuery))", codePoints)
        return try! backgroundContext.fetch(fetchRequest).max {$0.language!.count < $1.language!.count}
    }
    
    func addAnnotation(text: String, textToSpeech: String, language: String, codePoints: String) {
        languageScripts(fromLanguage: language).forEach { (language) in
            let annotation = ManagedAnnotation(context: backgroundContext)
            annotation.text = self.text(inLanguage: language, from: text)
            annotation.textToSpeech = self.text(inLanguage: language, from: textToSpeech)
            annotation.language = language
            annotation.codePoints = codePoints
        }
    }
    
    func addWord(_ string: String, language: String) {
        languageScripts(fromLanguage: language).forEach { (language) in
            let word = ManagedWord(context:backgroundContext)
            word.string = text(inLanguage: language, from: string)
            word.language = language
        }
    }
    
    private func languageScripts(fromLanguage language: String) -> [String] {
        switch language {
        case "ru":
            return ["ru_Cyrl", "ru_Latn"]
        default:
            return [language]
        }
    }
    
    private func text(inLanguage language: String, from text: String) -> String {
        switch language {
        case "ru_Latn":
            return text.applyingTransform(from: .Cyrl, to: .Latn, withTable: .ru)
        default:
            return text
        }
    }
    
    lazy var itemCount: Int = try! backgroundContext.count(for: ManagedUnicodeItem.fetchRequest())
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    func waitUntilLoadingIsFinished() {
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
    
    func loadIfNeeded() {}
    
    private func loadPersistentStore() {
        loadPersistentStores { description, error in
            if let _ = error {
                DispatchQueue.main.async {
                    self.resetPersistentStore()
                }
            }
        }
    }
        
    func resetPersistentStore() {
        let storeURLs = persistentStoreDescriptions.compactMap {$0.url}
        storeURLs.forEach { (storeURL) in
            try? persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
            try? FileManager.default.removeItem(at: storeURL)
        }
        
        if let sqLiteURL = sqLiteURL {
            try! FileManager.default.copyItem(at: sqLiteURL, to: storeURLs.first!)
        }
        
        loadPersistentStore()
    }
    
    private var currentVersion: String {
        return sqLiteURL!.creationDate!.description
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

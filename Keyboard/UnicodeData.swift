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
    
    func addAnnotation(text: String, textToSpeech: String, language: String, codePoints: String) {
        let annotation = ManagedAnnotation(context: backgroundContext)
        annotation.text = text
        annotation.textToSpeech = textToSpeech
        annotation.language = language
        annotation.codePoints = codePoints
    }
    
    func addWord(_ string: String, language: String) {
        let word = ManagedWord(context:backgroundContext)
        word.string = string
        word.language = language
    }
    
    lazy var itemCount: Int = try! backgroundContext.count(for: ManagedUnicodeItem.fetchRequest())
    
    private let backgroudOperationQueue: OperationQueue = .init()
    
    func waitUntilLoadingIsFinished() {
        backgroudOperationQueue.waitUntilAllOperationsAreFinished()
    }
    
    private override init(name: String, managedObjectModel model: NSManagedObjectModel) {
        super.init(name: name, managedObjectModel: model)
        
        loadPersistentStore()
        
        backgroudOperationQueue.addOperation( LoadUnicodeDataFiles.init() )
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
        let storeURLs = persistentStoreCoordinator.persistentStores.compactMap {$0.url}
        storeURLs.forEach { (storeURL) in
            try? persistentStoreCoordinator.destroyPersistentStore(at: storeURL, ofType: NSSQLiteStoreType, options: nil)
        }
        
        loadPersistentStore()
    }
}

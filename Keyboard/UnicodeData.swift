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
    
    func items(regularExpression: NSRegularExpression) -> [UnicodeItem] {
        let fetchRequest: NSFetchRequest<ManagedUnicodeItem> = ManagedUnicodeItem.fetchRequest()
        fetchRequest.fetchLimit = 200
        fetchRequest.predicate = .init(format: "isFullyQualified == YES AND  name MATCHES [c] %@", ".*\(regularExpression.pattern).*")
        fetchRequest.sortDescriptors = [.init(key: "order", ascending: true)]
        
        return (try! backgroundContext.fetch(fetchRequest)).map {.init(managed: $0)}
    }
    
    func item(byCodePoints codePoints: String) -> UnicodeItem? {
        
        let fetchRequest: NSFetchRequest<ManagedUnicodeItem> = ManagedUnicodeItem.fetchRequest()
        fetchRequest.predicate = .init(format: "codePoints == %@", codePoints)
        let items = (try! backgroundContext.fetch(fetchRequest)).map {UnicodeItem(managed: $0)}
        
        return items.first(where: {$0.codePoints.unicodeScalars.map {$0.value} == codePoints.unicodeScalars.map {$0.value}})
    }
    
    func addItem(codePoints: String, name: String, isFullyQualified: Bool = true) {
        let item = ManagedUnicodeItem(context: backgroundContext)
        
        item.codePoints = codePoints
        item.isFullyQualified = isFullyQualified
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

//
//  CoreDataManager.swift
//  GESCoreDataProject
//
//  Created by Maeva Malih on 18/04/2017.
//  Copyright © 2017 Maeva. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    
    public static let shared = CoreDataManager()
    public var context: NSManagedObjectContext?
    
    private override init() {
        super.init()
        guard let schema = Bundle.main.url(forResource: "GESCoreDataProject", withExtension: "momd") else {
            return
        }
        guard let model = NSManagedObjectModel(contentsOf: schema) else {
            return
        }
        let store = NSPersistentStoreCoordinator(managedObjectModel: model)
        do {
            let url = FileUtils.getDocumentFile(at: "gesCoreDataProject.sqlite")
            print(url)
            try store.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        }catch {
            print(error)
            return
        }
        let context = NSManagedObjectContext(concurrencyType: .privateQueueConcurrencyType)
        context.persistentStoreCoordinator = store
        self.context = context
    }

}

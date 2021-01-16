//
//  Persistence.swift
//  ToDoList+CoreData
//
//  Created by Стас Жингель on 16.01.2021.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()
    let container : NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "ToDoList")
        container.loadPersistentStores { (storeDescription, error) in
            if let error = error as NSError? {
                fatalError("Unresolved error: \(error)")
            }
        }
    }
}

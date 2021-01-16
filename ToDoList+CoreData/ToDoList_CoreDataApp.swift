//
//  ToDoList_CoreDataApp.swift
//  ToDoList+CoreData
//
//  Created by Стас Жингель on 16.01.2021.
//

import SwiftUI

@main
struct ToDoList_CoreDataApp: App {
    let persistenceContainer = PersistenceController.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceContainer.container.viewContext)
        }
    }
}

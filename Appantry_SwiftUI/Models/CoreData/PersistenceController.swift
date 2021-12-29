//
//  PersistenceController.swift
//  Appantry
//
//  Created by Jan Locher on 22.12.21.
//

import Foundation
import CoreData

struct PersistenceController {
    
    // singleton
    static let shared = PersistenceController()

    let container: NSPersistentContainer

    // initializer
    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "CoreDataModel")

        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }

        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
}

//MARK: - PersistenceController Sample Data

extension PersistenceController {
    
    static var previewData: PersistenceController = {
        let controller = PersistenceController(inMemory: true)

        // Create 10 example programming languages.
        for _ in 0..<10 {
            let groceriesLists = GroceriesListEntity(context: controller.container.viewContext)
            groceriesLists.listName = "Example Language 1"
        }

        return controller
    }()
}

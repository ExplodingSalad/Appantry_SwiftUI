//
//  AddListPopoverViewModel.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
//

import Foundation
import SwiftUI
import CoreData

class AddListPopoverViewModel: ObservableObject {
    @Published var model:Model = Model()
    
    // @Environment does not work outside of structs!
    var managedObjectContext = PersistenceController.shared.container.viewContext
    
//    @FetchRequest(sortDescriptors: []) var countries: FetchedResults<GroceriesListEntity>
    
    @Published var newListName: String = ""
    @Published var showAlert = false
    
    func saveList() {
        
        // if name is not nil saves the new product to CoreData
        if !newListName.isEmpty {
            let newList = GroceriesListEntity(context: managedObjectContext)
            newList.listName = newListName
            newList.id = UUID()
            
            
            
            //TODO: Let user select specific products
            let fetchRequest: NSFetchRequest<ProductEntity>
            fetchRequest = ProductEntity.fetchRequest()

            // Get a reference to a NSManagedObjectContext
            let context = managedObjectContext

            // Fetch all objects of one Entity type
            do {
                let objects = try context.fetch(fetchRequest)
                print(objects[0].wrappedProductName)
                newList.addToProducts(objects[0])
                PersistenceController.shared.save()
                print(newList)
            } catch {
                print(error)
            }
            
            PersistenceController.shared.save()
            
            
            
            
        } else {
            showAlert = true
        }
    }
}

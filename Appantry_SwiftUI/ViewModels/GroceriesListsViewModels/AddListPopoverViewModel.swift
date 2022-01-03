//
//  AddListPopoverViewModel.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
//

import Foundation

class AddListPopoverViewModel: ObservableObject {
    @Published var model:Model = Model()
    
    // @Environment does not work outside of structs!
    var managedObjectContext = PersistenceController.shared.container.viewContext
    
    @Published var newListName: String = ""
    @Published var showAlert = false
    
    func saveList() {
        
        // if name is not nil saves the new product to CoreData
        if !newListName.isEmpty {
            let newList = GroceriesListEntity(context: managedObjectContext)
            newList.listName = newListName
            newList.id = UUID()
            
            PersistenceController.shared.save()
            
        } else {
            showAlert = true
        }
    }
}

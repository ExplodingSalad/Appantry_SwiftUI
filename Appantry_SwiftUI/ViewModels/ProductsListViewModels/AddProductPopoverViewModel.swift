//
//  AddProductPopoverViewModel.swift
//  Appantry
//
//  Created by Jan Locher on 02.01.22.
//

import Foundation
import SwiftUI

class AddProductPopoverViewModel: ObservableObject {
    
    @Published var model:Model = Model()
    
    // @Environment does not work outside of structs!
    var managedObjectContext = PersistenceController.shared.container.viewContext
    
    @Published var newProductName: String = ""
    @Published var newProductVendor: String = ""
    @Published var newProductCategory: String = ""
    @Published var newProductStoredQuantity: Int = 0
    @Published var showAlert = false
    
    func saveProduct() {
        
        // if name is not nil saves the new product to CoreData
        if !newProductName.isEmpty {
            let newProduct = ProductEntity(context: managedObjectContext)
            newProduct.productName = newProductName
            newProduct.id = UUID()
            newProduct.productVendor = newProductVendor
            newProduct.productCategory = newProductCategory
            newProduct.productStoredQuantity = Int32(newProductStoredQuantity)
            
            PersistenceController.shared.save()
            
        } else {
            showAlert = true
        }
    }

}

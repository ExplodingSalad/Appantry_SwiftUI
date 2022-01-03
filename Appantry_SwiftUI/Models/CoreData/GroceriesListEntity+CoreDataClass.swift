//
//  GroceriesListEntity+CoreDataClass.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
//
//

import Foundation
import CoreData

@objc(GroceriesListEntity)
public class GroceriesListEntity: NSManagedObject {

    public var wrappedListName: String {
        listName ?? "Unknown List"
    }
    
    public var productArray: [ProductEntity] {
        let set = products as? Set<ProductEntity> ?? []
        return set.sorted {
            $0.wrappedProductName < $1.wrappedProductName
        }
    }
    
    
}

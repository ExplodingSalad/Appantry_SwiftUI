//
//  ProductEntity+CoreDataProperties.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
//
//

import Foundation
import CoreData


extension ProductEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ProductEntity> {
        return NSFetchRequest<ProductEntity>(entityName: "ProductEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var productCategory: String?
    @NSManaged public var productName: String?
    @NSManaged public var productStoredQuantity: Int32
    @NSManaged public var productVendor: String?
    @NSManaged public var parentGroceriesList: NSSet?

}

// MARK: Generated accessors for parentGroceriesList
extension ProductEntity {

    @objc(addParentGroceriesListObject:)
    @NSManaged public func addToParentGroceriesList(_ value: GroceriesListEntity)

    @objc(removeParentGroceriesListObject:)
    @NSManaged public func removeFromParentGroceriesList(_ value: GroceriesListEntity)

    @objc(addParentGroceriesList:)
    @NSManaged public func addToParentGroceriesList(_ values: NSSet)

    @objc(removeParentGroceriesList:)
    @NSManaged public func removeFromParentGroceriesList(_ values: NSSet)

}

extension ProductEntity : Identifiable {

}

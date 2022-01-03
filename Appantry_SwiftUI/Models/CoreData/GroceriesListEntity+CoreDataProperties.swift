//
//  GroceriesListEntity+CoreDataProperties.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
//
//

import Foundation
import CoreData


extension GroceriesListEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<GroceriesListEntity> {
        return NSFetchRequest<GroceriesListEntity>(entityName: "GroceriesListEntity")
    }

    @NSManaged public var id: UUID?
    @NSManaged public var listName: String?
    @NSManaged public var products: NSSet?

}

// MARK: Generated accessors for products
extension GroceriesListEntity {

    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: ProductEntity)

    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: ProductEntity)

    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)

    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)

}

extension GroceriesListEntity : Identifiable {

}

//
//  ProductEntity+CoreDataClass.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
//
//

import Foundation
import CoreData

@objc(ProductEntity)
public class ProductEntity: NSManagedObject {

    public var wrappedProductName: String {
        productName ?? "Unknown Name"
    }

    public var wrappedProductVendor: String {
        productVendor ?? "Unknown Vendor"
    }
    
    public var wrappedProductCategory: String {
        productCategory ?? "Unknown Category"
    }
    
    public var wrappedStoredQuantity: Int32 {
        Int32(productStoredQuantity) 
    }
}

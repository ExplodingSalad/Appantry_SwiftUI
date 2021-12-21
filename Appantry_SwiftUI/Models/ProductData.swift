//
//  ProductData.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 19.12.21.
//

import Foundation

struct ProductData: Identifiable {
    let id: UUID
    let productName: String
    let productCategory: String
    let productVendor: String
    let productStoredQuantity: Int

    init(id: UUID = UUID(), productName: String, productCategory: String, productVendor: String, productStoredQuantity: Int){
        self.id = id
        self.productName = productName
        self.productVendor = productVendor
        self.productCategory = productCategory
        self.productStoredQuantity = productStoredQuantity
    }
}

//MARK: - ProductData Sample Data

extension ProductData {
    static let sampleData: [ProductData] =
    [
        ProductData(productName: "Product1", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 2),
        ProductData(productName: "Product2", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 3)
    ]
}

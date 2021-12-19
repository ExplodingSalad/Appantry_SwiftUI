//
//  ListsProductsDataModel.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import Foundation

struct GroceriesListData: Identifiable {
    
    let id: UUID
    let listName: String
    let products: [ProductData]
    
    init(id: UUID = UUID(), listName: String, products: [ProductData]) {
        self.id = id
        self.listName = listName
        self.products = products.map({ product in
            ProductData(productName: product.productName, productCategory: product.productCategory, productVendor: product.productVendor, productStoredQuantity: product.productStoredQuantity)
        })
    }
}

//MARK: - GroceriesList Sample Data

extension GroceriesListData {
    static let sampleData: [GroceriesListData] =
    [
        GroceriesListData(listName: "List1", products:
                            [
                                ProductData(productName: "Product1", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 2),
                                ProductData(productName: "Product2", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 3)
                            ]
                         ),
        GroceriesListData(listName: "List2", products:
                            [
                                ProductData(productName: "Product1", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 22),
                                ProductData(productName: "Product2", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 12)
                            ]
                         ),
        GroceriesListData(listName: "List3", products:
                            [
                                ProductData(productName: "Product1", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 2),
                                ProductData(productName: "Product2", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 12)
                            ]
                         ),
        GroceriesListData(listName: "List4", products:
                            [
                                ProductData(productName: "Product1", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 12),
                                ProductData(productName: "Product2", productCategory: "Dairy", productVendor: "Lidl", productStoredQuantity: 1)
                            ]
                         )
    ]
}




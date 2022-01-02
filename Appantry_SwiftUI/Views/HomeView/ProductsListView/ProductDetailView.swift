//
//  ProductDetailView.swift
//  Appantry
//
//  Created by Jan Locher on 21.12.21.
//

import SwiftUI

struct ProductDetailView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var productItem: ProductEntity
    
    var body: some View {
        List {
            Section(header: Text("Product Information")) {
                Label(productItem.productName ?? "Unknown", systemImage: K.ProductIcons.name)
                    .foregroundColor(.black)
                Label(productItem.productVendor ?? "Unknown", systemImage: K.ProductIcons.vendor)
                    .foregroundColor(.black)
                Label(productItem.productCategory ?? "Unknown", systemImage: K.ProductIcons.category)
                    .foregroundColor(.black)
                Label(String(productItem.productStoredQuantity), systemImage: K.ProductIcons.quantity)
                    .foregroundColor(.black)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}

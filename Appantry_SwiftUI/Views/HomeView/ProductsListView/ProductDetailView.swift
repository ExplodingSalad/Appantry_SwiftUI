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
            Section(header: Text("List Information")) {
                Label(productItem.productName ?? "Unknown", systemImage: "pencil")
                    .font(.headline)
            }
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Text("Hello")
    }
}

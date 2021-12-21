//
//  ProductsMainView.swift
//  Appantry
//
//  Created by Jan Locher on 21.12.21.
//

import SwiftUI

struct ProductsMainView: View {
    
    let productData: [ProductData]
    
    var body: some View {
        List {
            ForEach(productData) { product in
                NavigationLink(destination: Text("test")
                                //ProductDetailView(productData: product)
                
                ) {
                    ProductCardView(productData: product)
                }
            }
        }
        .navigationBarTitle("Products")
        .toolbar {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
    }
}

struct ProductsMainView_Previews: PreviewProvider {
    static var previews: some View {
        ProductsMainView(productData: ProductData.sampleData)
    }
}

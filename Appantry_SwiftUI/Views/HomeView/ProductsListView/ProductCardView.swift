//
//  ProductCardView.swift
//  Appantry
//
//  Created by Jan Locher on 21.12.21.
//

import SwiftUI

struct ProductCardView: View {
    
    let productData: ProductData
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(productData.productName)
                    .font(.title)
                    .bold()
                HStack {
                    Image(systemName: "building")
                    Text("\(productData.productVendor)")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    Image(systemName: "list.bullet.below.rectangle")
                    Text("\(productData.productCategory)")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    Image(systemName: "shippingbox")
                    Text("\(productData.productStoredQuantity)")
                        .font(.body)
                    
                }
            }
            .padding()
        }
        .frame(alignment: .leading)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    
    static var testProductData = ProductData.sampleData[0]
    
    static var previews: some View {
        ProductCardView(productData: testProductData)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}

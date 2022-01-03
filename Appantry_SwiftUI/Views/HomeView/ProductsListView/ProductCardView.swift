//
//  ProductCardView.swift
//  Appantry
//
//  Created by Jan Locher on 21.12.21.
//

import SwiftUI

struct ProductCardView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var productItem: ProductEntity
        
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                
                //Name
                Text(productItem.wrappedProductName)
                    .font(.title)
                    .bold()
                
                //Vendor
                HStack {
                    Image(systemName: K.ProductIcons.vendor)
                    Text(productItem.wrappedProductVendor)
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    //Category
                    Image(systemName: K.ProductIcons.category)
                    Text(productItem.wrappedProductCategory)
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    //Quantity
                    Image(systemName: K.ProductIcons.quantity)
                    Text("\(productItem.wrappedStoredQuantity)")
                        .font(.body)
                    
                }
            }
            .padding()
        }
        .frame(alignment: .leading)
    }
}

struct ProductCardView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController().container.viewContext
        ProductCardView(productItem: ProductEntity(context: context))
            .environment(\.managedObjectContext, context)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}

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
                Text(productItem.productName ?? "Unknown")
                    .font(.title)
                    .bold()
                HStack {
                    Image(systemName: K.ProductIcons.vendor)
                    Text(productItem.productVendor ?? "Unknown")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    Image(systemName: K.ProductIcons.category)
                    Text(productItem.productCategory ?? "Unknown")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    Image(systemName: K.ProductIcons.quantity)
                    Text("\(productItem.productStoredQuantity)")
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

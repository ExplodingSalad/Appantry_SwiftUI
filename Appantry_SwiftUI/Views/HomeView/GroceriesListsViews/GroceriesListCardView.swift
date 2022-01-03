//
//  GroceriesListCardView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

struct GroceriesListCardView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var listItem: GroceriesListEntity
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(listItem.wrappedListName)
                    .font(.title)
                    .bold()
                HStack {
                    Image(systemName: K.ListIcons.productsNr)
                    Text("\(listItem.productArray.count)")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    //TODO: Add products in/out store logic
                    Image(systemName: K.ListIcons.productsInStore)
                    Text("2")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    Image(systemName: K.ListIcons.productsOutStore)
                    Text("0")
                        .font(.body)
                }
            }
            .padding()
        }
        .frame(alignment: .leading)        
    }
}

struct GroceriesListCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        let context = PersistenceController().container.viewContext
        GroceriesListCardView(listItem: GroceriesListEntity(context: context))
            .environment(\.managedObjectContext, context)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}

//
//  GroceriesListsDetailView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 19.12.21.
//

import SwiftUI

struct GroceriesListsDetailView: View {
    //    let groceriesListsData: GroceriesListData
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var listItem: GroceriesListEntity
    
    var body: some View {
        List {
            Section(header: Text("List Information")) {
                Label("name", systemImage: "pencil")
                    .font(.headline)
            }
            
            //            Section(header: Text("Products")) {
            //                ForEach(listItem.products) { product in
            //                    Label(product.productName, systemImage: "pencil")
            //
            //                }
            //            }
        }
    }
}

struct GroceriesListsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
        }
    }
}

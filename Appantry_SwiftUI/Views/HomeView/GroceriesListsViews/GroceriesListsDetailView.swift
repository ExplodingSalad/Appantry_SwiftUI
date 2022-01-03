//
//  GroceriesListsDetailView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 19.12.21.
//

import SwiftUI

struct GroceriesListsDetailView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var listItem: GroceriesListEntity
    
    var body: some View {
        List {
            Section(header: Text("List Information")) {
                Label("", systemImage: K.ListIcons.name)
                    .foregroundColor(.black)
                Label("", systemImage: K.ListIcons.productsInStore)
                    .foregroundColor(.black)
                Label("", systemImage: K.ListIcons.productsOutStore)
                    .foregroundColor(.black)
                Label("", systemImage: K.ListIcons.productsNr)
                    .foregroundColor(.black)
            }
        }
    }
}

struct GroceriesListsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            
        }
    }
}

//
//  GroceriesListsDetailView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 19.12.21.
//

import SwiftUI

enum ViewState {
    case DetailView
    case EditView
}

struct GroceriesListsDetailView: View {

    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @EnvironmentObject var groceriesListViewModel: GroceriesListViewModel
    @State var listItem: GroceriesListEntity
    @State var isEditable = false

    var body: some View {
        if !isEditable {
            List {
                Section(header: Text("List Information")) {
                    Label(listItem.wrappedListName, systemImage: K.ListIcons.name)
                            .foregroundColor(.black)
                    Label("\(listItem.productsInStore)", systemImage: K.ListIcons.productsInStore)
                            .foregroundColor(.black)
                    Label("\(listItem.productsOutStore)", systemImage: K.ListIcons.productsOutStore)
                            .foregroundColor(.black)
                    Label("\(listItem.productArray.count)", systemImage: K.ListIcons.productsNr)
                            .foregroundColor(.black)
                }
                Section(header: Text("Products on this List")) {
                    ForEach(listItem.productArray) {
                        (fetchedProducts: ProductEntity) in
                        NavigationLink(destination: ProductDetailView(productItem: fetchedProducts)) {
                            ProductCardView(productItem: fetchedProducts)
                        }
                    }
                }
            }.onAppear { print(groceriesListViewModel.changedListName) }
                    .toolbar {
                        Button(action: {
                            isEditable = true
                        }) {
                            Text("Edit")
                        }
                    }.navigationBarTitleDisplayMode(.inline)
        } else {

            // TODO: complete Edit Screen & Save Logic
            List {
                TextField(listItem.wrappedListName, text: $groceriesListViewModel.changedListName)
            }.toolbar {
                        Button(action: {
                            groceriesListViewModel.saveChanges(product: listItem)
                            presentationMode.wrappedValue.dismiss()

                        }) {
                            Text("Save")
                        }
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

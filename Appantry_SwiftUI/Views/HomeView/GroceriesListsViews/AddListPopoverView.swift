//
//  AddListPopoverView.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
// This View requires a Navigation View, as it disposes of a ChildView that cannot be accessed otherwhise
//

import SwiftUI

struct AddListPopoverView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var groceriesListViewModel: GroceriesListViewModel
    @State var isPopoverPresented = false

    var body: some View {
        NavigationView {
            List {
                HStack {
                    Label("", systemImage: K.ProductIcons.name)
                            .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Name", text: $groceriesListViewModel.newListName)
                            .keyboardType(.default)
                }
                NavigationLink(destination: ProductsSelectionView()) {
                    Label("Select Products", systemImage: K.ListIcons.productsNr)
                            .foregroundColor(.black)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        groceriesListViewModel.saveList()
                        // if saving fails due to an empty name, the dismissal is still called before the error is displayed
                        presentationMode.wrappedValue.dismiss()
//                        groceriesListViewModel.resetFieldValues()
                    }
                    .alert(isPresented: $groceriesListViewModel.showAlert) {
                        Alert(
                            title: Text("List Name cannot be empty!"),
                            message: Text("Please specify a name for your new List.")
                        )
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Add Product")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        groceriesListViewModel.resetFieldValues()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct AddListPopoverView_Previews: PreviewProvider {
    static var previews: some View {
        AddListPopoverView()
    }
}

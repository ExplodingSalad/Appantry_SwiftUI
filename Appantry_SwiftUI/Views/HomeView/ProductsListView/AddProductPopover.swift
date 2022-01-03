//
//  AddProductPopover.swift
//  Appantry
//
//  Created by Jan Locher on 23.12.21.
//

import SwiftUI

struct AddProductPopover: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var prodPopViewModel = AddProductPopoverViewModel()
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Label("", systemImage: K.ProductIcons.name)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Name", text: $prodPopViewModel.newProductName)
                        .keyboardType(.default)
                }
                HStack {
                    Label("", systemImage: K.ProductIcons.vendor)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Vendor", text: $prodPopViewModel.newProductVendor)
                        .keyboardType(.default)
                }
                HStack {
                    Label("", systemImage: K.ProductIcons.category)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Category", text: $prodPopViewModel.newProductCategory)
                        .keyboardType(.default)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Label("", systemImage: K.ProductIcons.quantity)
                            .foregroundColor(.black)
                        Spacer().frame(maxWidth: .infinity)
                        Text("\(prodPopViewModel.newProductStoredQuantity)")
                    }
                    HStack {
                        Spacer().frame(maxWidth: .infinity)
                        Stepper("",value: $prodPopViewModel.newProductStoredQuantity, in: 0...100)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        prodPopViewModel.saveProduct()
                        
                        //TODO: fix alert dismiss bug
                        // if saving fails due to an empty name, the dismissal is still called before the error is displayed
                        presentationMode.wrappedValue.dismiss()
                    }
                    .alert(isPresented: self.$prodPopViewModel.showAlert) {
                        Alert(
                            title: Text("Product Name cannot be empty!"),
                            message: Text("Please specify a name for your new Product.")
                        )
                    }
                }
                ToolbarItem(placement: .principal) {
                    Text("Add Product")
                        .font(.headline)
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        // TODO: Back logic (?)
                        presentationMode.wrappedValue.dismiss()
                    }
                }
            }
        }
    }
}

struct AddProductPopover_Previews: PreviewProvider {
    static var previews: some View {
        AddProductPopover()
    }
}

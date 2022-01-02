//
//  AddProductPopover.swift
//  Appantry
//
//  Created by Jan Locher on 23.12.21.
//

import SwiftUI

struct AddProductPopover: View {
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @State private var showAlert = false
    @State private var number: Int = 0
    @State var newProductName: String = ""
    @State var newProductVendor: String = ""
    @State var newProductCategory: String = ""
    @State var newProductStoredQuantity: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Label("", systemImage: K.ProductIcons.name)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Name", text: $newProductName)
                        .keyboardType(.default)
                }
                HStack {
                    Label("", systemImage: K.ProductIcons.vendor)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Vendor", text: $newProductVendor)
                        .keyboardType(.default)
                }
                HStack {
                    Label("", systemImage: K.ProductIcons.category)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Category", text: $newProductCategory)
                        .keyboardType(.default)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Label("", systemImage: K.ProductIcons.quantity)
                            .foregroundColor(.black)
                        Spacer().frame(maxWidth: .infinity)
                        Text("\(number)")
                    }
                    HStack {
                        Spacer().frame(maxWidth: .infinity)
                        Stepper("",value: $number, in: 0...100)
                    }
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        
                        // if name is not nil saves the new product to CoreData
                        if !newProductName.isEmpty {
                            let newProduct = ProductEntity(context: managedObjectContext)
                            newProduct.productName = newProductName
                            newProduct.id = UUID()
                            newProduct.productVendor = newProductVendor
                            newProduct.productCategory = newProductCategory
                            newProduct.productStoredQuantity = Int32(number)
                            
                            PersistenceController.shared.save()
                            presentationMode.wrappedValue.dismiss()
                        } else {
                            showAlert = true
                        }
                    }
                    .alert(isPresented: $showAlert) {
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

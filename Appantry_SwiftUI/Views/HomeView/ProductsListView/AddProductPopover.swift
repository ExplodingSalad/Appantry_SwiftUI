//
//  AddProductPopover.swift
//  Appantry
//
//  Created by Jan Locher on 23.12.21.
//

import SwiftUI

struct AddProductPopover: View {
    
    @Environment(\.presentationMode) var presentationMode
    @State private var number: Int = 0
    @State var newProductName: String = ""
    @State var newProductVendor: String = ""
    @State var newProductCategory: String = ""
    @State var newProductStoredQuantity: Int = 0
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Label("Name", systemImage: K.ProductIcons.name)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Name", text: $newProductName)
                }
                HStack {
                    Label("Vendor", systemImage: K.ProductIcons.vendor)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Vendor", text: $newProductVendor)
                }
                HStack {
                    Label("Category", systemImage: K.ProductIcons.category)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Category", text: $newProductCategory)
                }
                VStack(alignment: .leading) {
                    HStack {
                        Label("Quantity", systemImage: K.ProductIcons.quantity)
                            .foregroundColor(.black)
                        Spacer().frame(maxWidth: .infinity)
                        Text("\(number)")
//                        TextField("\(number)", text: Binding(
//                            get: { String(newProductStoredQuantity) },
//                            set: { newProductStoredQuantity = Int($0) ?? 0}))
//                            .keyboardType(.numberPad)
                    }
                    //TODO: Picker is laggy as shit on real devices & often crashes the app
                    Picker("", selection: $number) {
                        ForEach(0..<1000) {
                            Text("\($0)")
                        }
                    }.pickerStyle(.wheel)
                    
                }
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        // TODO: Save logic
                        presentationMode.wrappedValue.dismiss()
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

//
//  AddListPopoverView.swift
//  Appantry
//
//  Created by Jan Locher on 03.01.22.
//

import SwiftUI

struct AddListPopoverView: View {
    @Environment(\.presentationMode) var presentationMode
    @StateObject var listPopViewModel = AddListPopoverViewModel()
    
    var body: some View {
        NavigationView {
            List {
                HStack {
                    Label("", systemImage: K.ProductIcons.name)
                        .foregroundColor(.black)
                    Spacer().frame(maxWidth: .infinity)
                    TextField("Add Name", text: $listPopViewModel.newListName)
                        .keyboardType(.default)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        listPopViewModel.saveList()
                        
                        // if saving fails due to an empty name, the dismissal is still called before the error is displayed
                        presentationMode.wrappedValue.dismiss()
                    }
                    .alert(isPresented: self.$listPopViewModel.showAlert) {
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
                        // TODO: Back logic (?)
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

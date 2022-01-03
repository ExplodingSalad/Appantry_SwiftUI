//
//  GroceriesListsMainView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

struct GroceriesListsMainView: View {
    
    @State private var searchText = ""
    @State var isPopoverPresented = false
    @Environment(\.managedObjectContext) var managedObjectContext
    @FetchRequest(
        entity: GroceriesListEntity.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \GroceriesListEntity.listName, ascending: true)
        ]
    ) var fetchedGroceriesLists: FetchedResults<GroceriesListEntity>
    
    var body: some View {
        List {
            ForEach(fetchedGroceriesLists) { (fetchedList:GroceriesListEntity) in
                NavigationLink(destination: GroceriesListsDetailView(listItem: fetchedList)) {
                    GroceriesListCardView(listItem: fetchedList)
                }
            }
            .onDelete(perform: removeGroceriesList)
        }
        .searchable(text: $searchText, placement: .navigationBarDrawer(displayMode: .always))
        .navigationTitle("Groceries Lists")
        .toolbar {
            Button(action: {
                self.isPopoverPresented = true
            }) {
                Image(systemName: "plus")
            }
        }
        .popover(isPresented: $isPopoverPresented) {
            AddListPopoverView()
        }
    }
    
    func removeGroceriesList(at offsets: IndexSet) {
        for index in offsets {
            let groceriesList = fetchedGroceriesLists[index]
            managedObjectContext.delete(groceriesList)
        }
        PersistenceController.shared.save()
    }
}

struct GroceriesListsMainView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController().container.viewContext
        GroceriesListsMainView()
            .environment(\.managedObjectContext, context)
    }
}

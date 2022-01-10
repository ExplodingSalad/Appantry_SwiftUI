//
//  GroceriesListsMainView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

struct GroceriesListsMainView: View {

    @StateObject var groceriesListViewModel = GroceriesListViewModel()

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
                NavigationLink(destination: GroceriesListsDetailView(listItem: fetchedList)
                        .environmentObject(groceriesListViewModel)) {
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
        .sheet(isPresented: $isPopoverPresented) {
            AddListPopoverView()
                    .environmentObject(groceriesListViewModel)
        }
    }
}

struct GroceriesListsMainView_Previews: PreviewProvider {
    static var previews: some View {
        let context = PersistenceController().container.viewContext
        GroceriesListsMainView()
            .environment(\.managedObjectContext, context)
    }
}

// MARK: - MainView Logic
// cant be put into ViewModel, for some swiftUI-y-reason
extension GroceriesListsMainView {
    func removeGroceriesList(at offsets: IndexSet) {
        for index in offsets {
            let groceriesList = fetchedGroceriesLists[index]
            managedObjectContext.delete(groceriesList)
        }
        PersistenceController.shared.save()
    }
}
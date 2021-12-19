//
//  HomeView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 19.12.21.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        List {
            Section {
                NavigationLink(destination: GroceriesListsMainView(dataModels: GroceriesListData.sampleData)) {
                    HomeCardView(cardName: "Groceries Lists", imageName: "listsImg")
                }
            }
            Section {
                NavigationLink(destination: GroceriesListsMainView(dataModels: GroceriesListData.sampleData)) {
                    HomeCardView(cardName: "Products", imageName: "productsImg")
                }
            }
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

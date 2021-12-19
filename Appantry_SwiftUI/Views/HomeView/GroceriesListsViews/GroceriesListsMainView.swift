//
//  GroceriesListsMainView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

struct GroceriesListsMainView: View {
    
    let dataModels: [GroceriesListData]
    
    var body: some View {
        List {
            ForEach(dataModels) { dataModel in
                NavigationLink(destination: GroceriesListsDetailView(groceriesListsData: dataModel)) {
                    GroceriesListCardView(groceriesListData: dataModel)
                }
            }
        }
        .navigationBarTitle("Groceries Lists")
        .toolbar {
                    Button(action: {}) {
                        Image(systemName: "plus")
                    }
                }
    }
}

struct GroceriesListsMainView_Previews: PreviewProvider {
    static var previews: some View {
        GroceriesListsMainView(dataModels: GroceriesListData.sampleData)
    }
}

//
//  GroceriesListCardView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

struct GroceriesListCardView: View {
    
    let groceriesListData: GroceriesListData
    
    var body: some View {
        ZStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(groceriesListData.listName)
                    .font(.title)
                    .bold()
                HStack {
                    Image(systemName: "bag.circle.fill")
                    Text("\(groceriesListData.products.count)")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    Image(systemName: "checkmark.circle.fill")
                    Text("2")
                        .font(.body)
                    
                    Spacer()
                        .frame(width: 30, alignment: .leading)
                    
                    Image(systemName: "xmark.circle.fill")
                    Text("0")
                        .font(.body)
                    
                }
            }
            .padding()
        }
        .frame(alignment: .leading)
//        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        
    }
}

struct GroceriesListCardView_Previews: PreviewProvider {
    static var groceriesListData = GroceriesListData.sampleData[0]
    static var previews: some View {
        
        GroceriesListCardView(groceriesListData: groceriesListData)
            .previewLayout(.fixed(width: 400, height: 90))
    }
}

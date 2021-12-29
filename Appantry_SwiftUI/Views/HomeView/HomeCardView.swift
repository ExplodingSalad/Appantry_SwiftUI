//
//  HomeCardView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 19.12.21.
//

import SwiftUI

struct HomeCardView: View {
    
    var cardName: String
    var imageName: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            Image(imageName)
                .resizable()
                .clipped()
                .aspectRatio(contentMode: .fill)
                .opacity(0.05)
            VStack {
                Text(cardName)
                    .font(.title)
                    .bold()
                
            }.padding()
        }
        .frame(height: 90)
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView(cardName: "GroceriesList", imageName: "listsImg")
            .previewLayout(.fixed(width: 400, height: 120))
    }
}

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
        ZStack(alignment: .topLeading) {
            Image(imageName)
                .resizable()
                .scaledToFit()
                .opacity(0.1)
            VStack {
                Text(cardName)
                    .font(.title)
                    .bold()
                
            }.padding()
        }
        
    }
}

struct HomeCardView_Previews: PreviewProvider {
    static var previews: some View {
        HomeCardView(cardName: "GroceriesList", imageName: "listsImg")
            .previewLayout(.fixed(width: 400, height: 150))
    }
}

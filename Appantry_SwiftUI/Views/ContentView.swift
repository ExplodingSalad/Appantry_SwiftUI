//
//  ContentView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .navigationBarTitle("Home")
            }
            .tabItem {
                Image(systemName: "house.circle.fill")
                Text("Home")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
                Text("Add Product")
                    .navigationBarTitle("Add Product")
            }
            .tabItem {
                Image(systemName: "plus.circle")
                Text("Add Product")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
                Text("Settings")
                    .navigationBarTitle("Settings")
            }
            .tabItem {
                Image(systemName: "gear.circle.fill")
                Text("Settings")
            }
            .navigationViewStyle(.stack)
        }
        .edgesIgnoringSafeArea(.top)
        .onAppear() {
            UITabBar.appearance().backgroundColor = UIColor(Color.cust.col4)
        }
    }
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
}

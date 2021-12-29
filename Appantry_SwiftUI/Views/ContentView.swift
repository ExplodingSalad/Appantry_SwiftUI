//
//  ContentView.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

struct ContentView: View {
    
    @Environment(\.managedObjectContext) var managedObjectContext
    let navBarAppearance = UINavigationBarAppearance()
    //App-wide Navbar appearance
    init() {
        navBarAppearance.configureWithOpaqueBackground()
        navBarAppearance.backgroundColor = UIColor(Color.cust.col1)
        
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UITableView.appearance().backgroundColor = UIColor(Color.cust.col1)
        
        navBarAppearance.shadowColor = .clear
        
    }
    
    var body: some View {
        TabView {
            NavigationView {
                HomeView()
                    .navigationBarTitle("Home")
            }
            .tabItem {
                Image(systemName: K.TabViewIcons.home)
                Text("Home")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
                Text("Add Product")
                    .navigationBarTitle("Add Product")
            }
            .tabItem {
                Image(systemName: K.TabViewIcons.add)
                Text("Add Product")
            }
            .navigationViewStyle(.stack)
            
            NavigationView {
                Text("Settings")
                    .navigationBarTitle("Settings")
            }
            .tabItem {
                Image(systemName: K.TabViewIcons.settings)
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

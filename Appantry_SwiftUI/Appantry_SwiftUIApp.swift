//
//  Appantry_SwiftUIApp.swift
//  Appantry_SwiftUI
//
//  Created by Jan Locher on 18.12.21.
//

import SwiftUI

@main
struct Appantry_SwiftUIApp: App {
    
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = PersistenceController.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
        // monitors changes to the scene, i.e. moved out of the app
        .onChange(of: scenePhase) { _ in
            persistenceController.save()
        }
    }
}

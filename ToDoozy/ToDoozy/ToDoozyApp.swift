//
//  ToDoozyApp.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI
import SwiftData

@main
struct ToDoozyApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            ToDo.self,
            ToDoList.self
        ])
        
        let modelConfiguration = ModelConfiguration(
            schema: schema,
            isStoredInMemoryOnly: false
        )

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error.localizedDescription)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
        
        WindowGroup("Task") {
            Text("Form")
        }
        .windowStyle(.hiddenTitleBar)
        
        Settings {
            Text("Settings")
                .frame(minWidth: 150, minHeight: 100)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
        
        MenuBarExtra("Menu") {
            Button("Do something") {
                
            }
        }
    }
}

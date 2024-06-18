//
//  ModelContainer+Previews.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import Foundation
import SwiftData

//extension ModelContainer {
//    static func createPreviewContainer() -> ModelContainer  {
//        do {
//            let container = try ModelContainer(for: ToDo.self, configurations: ModelConfiguration(isStoredInMemoryOnly: true))
//            
//            Task { @MainActor in
//                let context = container.mainContext
//                let toDo = ToDo(title: "Get this thing done")
//                context.insert(toDo)
//            }
//            return container
//        } catch {
//            fatalError("Failed to create container with error: \(error.localizedDescription)")
//        }
//    }
//}

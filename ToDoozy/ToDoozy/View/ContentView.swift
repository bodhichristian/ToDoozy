//
//  ContentView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    
    @Query var allToDos: [ToDo]
    @Query var lists: [ToDoList]
    
    @State private var selection: Collection? = nil
    @State private var query = ""
    
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
                .toolbar {
                    ToolbarItem {
                        Button(action: newToDo) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
                .searchable(text: $query, placement: .sidebar)
        } detail: {
            
        }
    }
    
    private func newToDo() {
        withAnimation {
            if let selection {
                let newToDo = ToDo(title: "New To-Do")
            }
            
            let toDo = ToDo(title: "New To-Do")
            
            
            modelContext.insert(toDo)
        }
    }
    
    private func newList() {
        withAnimation {
            
            let newList = ToDoList(title: "New List")
            modelContext.insert(newList)
        }
    }
    
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(toDos[index])
//            }
//        }
//    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDo.self, inMemory: true)
}

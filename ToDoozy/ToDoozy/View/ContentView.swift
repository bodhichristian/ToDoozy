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
        
    @State private var selectedList: Collection? = .all
    @State private var query = ""
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selectedList)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
                .searchable(text: $query, placement: .sidebar)
        } detail: {
            ToDoListView(query: query, selectedList: selectedList)
        }
        .toolbar {
            ToolbarItem {
                Button {
                    addToDo()
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
                .keyboardShortcut(KeyEquivalent("n"), modifiers: [.command])
            }
        }
    }
    
    private func addToDo() {
        withAnimation {
            let newToDo = ToDo(title: "New To-Do")
            
            switch selectedList {
            case .all, .complete, .upcoming, nil:
                modelContext.insert(newToDo)
            case .userLists(let toDoList):
                toDoList.toDos.append(newToDo)
                
            }
        }
    }
}

#Preview {
    ContentView()
        .modelContainer(for: ToDo.self, inMemory: true)
}

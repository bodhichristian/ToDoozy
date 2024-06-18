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
    
    @Query var lists: [ToDoList]
    //@Query var allToDos: [ToDo]
    
    @State private var selectedList: Collection? = nil
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
                    newToDo()
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
                .keyboardShortcut(KeyEquivalent("n"), modifiers: [.command])
            }
        }
    }
    
    
    private func newList() {
        withAnimation {
            
            let newList = ToDoList(title: "New List")
            modelContext.insert(newList)
        }
    }
    
    private func newToDo() {
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
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            for index in offsets {
//                modelContext.delete(toDos[index])
//            }
//        }
//    }

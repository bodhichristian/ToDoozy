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
    
    //@Query var allToDos: [ToDo]
    @Query var lists: [ToDoList]
    
    @State private var selection: Collection? = nil
    @State private var query = ""
    
    private var allToDos: [ToDo] {
        var toDos: [ToDo] = []
        
        for list in lists {
            for toDo in list.toDos {
                toDos.append(toDo)
            }
        }
        return toDos
    }
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
                
                .searchable(text: $query, placement: .sidebar)
        } detail: {
            Group {
                switch selection {
                case .all:
                    SmartListView()
                case .complete:
                    Text("complete")
                case .upcoming:
                    Text("upcoming")
                case .userLists(let toDoList):
                    ToDoListView(toDoList: toDoList)
                case nil:
                    Text("select a list")
                }
            }
            
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

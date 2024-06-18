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
    
    @State private var selection: Collection? = nil
    @State private var query = ""
    
    var body: some View {
        NavigationSplitView {
            SidebarView(selection: $selection)
                .navigationSplitViewColumnWidth(min: 180, ideal: 200)
            
                .searchable(text: $query, placement: .sidebar)
        } detail: {
            switch selection {
            case .all:
                SmartListView(type: .all, query: query)
            case .complete:
                SmartListView(type: .complete, query: query)
            case .upcoming:
                SmartListView(type: .upcoming, query: query)
            case .userLists(let toDoList):
                ToDoListView(query: query, toDoList: toDoList)
            case nil:
                Text("select a list")
            }
            
        }
    }
    
    
    private func newList() {
        withAnimation {
            
            let newList = ToDoList(title: "New List")
            modelContext.insert(newList)
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

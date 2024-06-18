//
//  ToDoListView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    let query: String
    @State var toDoList: ToDoList
    
    @State private var selectedToDo: ToDo? = nil
    @State private var showingInspector = false
    
    @Query var lists: [ToDoList]
    
    private var list: ToDoList {
        return lists.first(where: {$0.id == toDoList.id})!
    }
    
    private var searchResults: [ToDo] {
        if query.isEmpty {
            return list.toDos }
        else {
            return list.toDos.filter({$0.title.lowercased().contains(query.lowercased())})
        }
    }
    
    
    var body: some View {
        List {
            ForEach(searchResults, id: \.id) { toDo in
                ToDoView(
                    toDo: toDo,
                    selectedToDo: $selectedToDo,
                    showingInspector: $showingInspector
                )
            }
        }
        .navigationTitle(toDoList.title)
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
        .inspector(isPresented: $showingInspector) {
            Group {
                if let selectedToDo {
                    Text(selectedToDo.title)
                        .font(.headline)
                } else {
                    Text("Select a task to view details.")
                        .font(.headline)
                }
            }
            .frame(minWidth: 100, maxWidth: .infinity)
        }
    }
    private func newToDo() {
        withAnimation {
            let newToDo = ToDo(title: "New To-Do")
            toDoList.toDos.append(newToDo)
        }
    }
}

#Preview {
    ToDoListView(query: "", toDoList: ToDoList(title: "To-Do's"))
}

//
//  ToDoListView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @State var toDoList: ToDoList
    
    @State private var selectedToDo: ToDo? = nil
    @State private var showingInspector = false

    var body: some View {
        List {
            ForEach(toDoList.toDos, id: \.id) { toDo in
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
    ToDoListView(toDoList: ToDoList(title: "To-Do's"))
}

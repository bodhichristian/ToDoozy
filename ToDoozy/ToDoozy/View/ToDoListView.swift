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

    var body: some View {
        List {
            ForEach(toDoList.toDos) { toDo in
                ToDoView(toDo: toDo)
            }
        }
        .toolbar {
            ToolbarItem {
                Button {
                    newToDo()
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
            }
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

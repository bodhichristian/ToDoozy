//
//  ToDoListView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI
import SwiftData

struct SmartListView: View {
    @Environment(\.modelContext) var modelContext
    @Query var toDos: [ToDo]

    var body: some View {
        List {
            ForEach(toDos) { toDo in
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
            modelContext.insert(newToDo)
        }
    }
}

#Preview {
    SmartListView()
}

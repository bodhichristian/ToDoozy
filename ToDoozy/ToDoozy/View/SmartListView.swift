//
//  ToDoListView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI
import SwiftData

struct SmartListView: View {
    let type: Collection

    @Environment(\.modelContext) var modelContext
    @Query var toDos: [ToDo]
    
    private var smartList: [ToDo] {
        switch type {

        case .complete:
            return toDos.filter({$0.isComplete})
        case .upcoming:
            return toDos.filter({$0.dueDate ?? Date() > Date()})
        default:
            return toDos
        }
    }

    var body: some View {
        List {
            ForEach(smartList) { toDo in
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
    SmartListView(type: Collection.all)
}

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
    let selectedList: Collection?
    
    //@State var toDoList: ToDoList
    
    @State private var selectedToDo: ToDo? = nil
    @State private var showingInspector = false
    
    @Query var lists: [ToDoList]
    @Query var toDos: [ToDo]
    
    private var displayToDos: [ToDo] {
        switch selectedList {
        case .all:
            return toDos
        case .complete:
            return toDos.filter({$0.isComplete})
        case .upcoming:
            return toDos.filter({$0.dueDate ?? Date() > Date()})
        case .userLists(let toDoList):
            return lists.first(where: {$0.id == toDoList.id})?.toDos ?? []
        case nil:
            return toDos
        }
    }
    var body: some View {
        List {

            ForEach(displayToDos, id: \.id) { toDo in
                ToDoView(
                    toDo: toDo,
                    selectedToDo: $selectedToDo,
                    showingInspector: $showingInspector
                )
            }
        }
        .navigationTitle(selectedList?.displayName ?? "")
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

}

#Preview {
    ToDoListView(query: "", selectedList: nil)
}

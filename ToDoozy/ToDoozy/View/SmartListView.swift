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
    let query: String
    
    @State private var selectedToDo: ToDo? = nil
    @State var showingInspector: Bool = false
    
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
    
    private var searchResults: [ToDo] {
        if query.isEmpty {
            return smartList
        } else {
            return toDos.filter {$0.title.lowercased().contains(query)}
        }
    }
    
    var body: some View {
        List {
            ForEach(searchResults, id: \.id) { toDo in
                ToDoView(toDo: toDo, selectedToDo: $selectedToDo, showingInspector: $showingInspector)
            }
        }
        .navigationTitle(type.displayName)
        .toolbar {
            ToolbarItem {
                Button {
                    newToDo()
                } label: {
                    Label("Add Item", systemImage: "plus")
                }
                .disabled(type != .all)
                .opacity(type == .all ? 1 : 0)
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
            modelContext.insert(newToDo)
        }
    }
}

#Preview {
    SmartListView(type: .all, query: "")
}

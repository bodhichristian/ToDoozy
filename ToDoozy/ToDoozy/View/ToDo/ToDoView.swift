//
//  ToDoView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI

struct ToDoView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var toDo: ToDo
    
    @Binding var selectedToDo: ToDo?
    @Binding var showingInspector: Bool
    
    @FocusState var editingToDo
    
    var body: some View {
        HStack {
            Image(
                systemName: toDo.isComplete
                ? "largecircle.fill.circle"
                : "circle"
            )
            .onTapGesture {
                toDo.isComplete.toggle()
                selectedToDo = toDo
            }
            
            TextField("New To-Do", text: $toDo.title)
                .focused($editingToDo)
            
            
            Button {
                if selectedToDo == toDo {
                    showingInspector.toggle()
                } else {
                    showingInspector = true
                    selectedToDo = toDo
                }
            } label: {
                Image(systemName: "info.circle")
            }
            .buttonStyle(.plain)
        }
        .contextMenu {
            Button("Delete \"\(toDo.title)\"") {
                modelContext.delete(toDo)
            }
        }
    }
}

#Preview {
    ToDoView(toDo: ToDo(title: "to Do"), selectedToDo: .constant(nil), showingInspector: .constant(false))
    
}

//
//  ToDoView.swift
//  ToDoozy
//
//  Created by christian on 6/17/24.
//

import SwiftUI

struct ToDoView: View {
    @State var toDo: ToDo
//    @Binding var selectedToDo: ToDo?
//    @Binding var showingInspector: Bool
    
    var body: some View {
        HStack {
            Image(
                systemName: toDo.isComplete
                ? "largecircle.fill.circle"
                : "circle"
            )
            .onTapGesture {
                toDo.isComplete.toggle()
            }
            
            TextField("New ToDo", text: $toDo.title)
            
            Button {
//                showingInspector = true
//                selectedToDo = toDo
                
                
            } label: {
                Image(systemName: "ellipsis.circle")
            }
            .buttonStyle(.plain)
        }
    }
}

#Preview {
    ToDoView(toDo: ToDo(title: "Thing 1"))
      //  .modelContainer(for: ToDo.self, inMemory: true)
    
}

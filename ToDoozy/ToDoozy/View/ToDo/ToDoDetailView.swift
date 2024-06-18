//
//  ToDoDetailview.siwft.swift
//  ToDoozy
//
//  Created by christian on 6/18/24.
//

import SwiftUI

struct ToDoDetailView: View {
    @Bindable var toDo: ToDoozy
    
    @State private var showingDeleteAlert = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            
            ScrollView{
                TextField("To-Do Title", text: $toDo.title, axis: .vertical)
                    .textFieldStyle(.plain)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                
                if let dueDate = toDo.dueDate {
                    Text("Due: \(dueDate.formatted())")
                        .foregroundStyle(.secondary)
                    
                }
                
                TextField("Details", text: $toDo.details, axis: .vertical)
                    .textFieldStyle(.plain)
                
                
            }
            .alert("Delete To-Do", isPresented: $showingDeleteAlert, actions: {
                
            })
            .frame(maxHeight: .infinity, alignment: .top)
            .padding()
        }
        
        HStack {
            Button {
                toDo.isComplete.toggle()
            } label: {
                TDButtonLabel(
                    symbolName: toDo.isComplete ? "circle" : "largecircle.fill.circle",
                    label: toDo.isComplete ? "Mark Incomplete" : "Mark Complete",
                    iconColor: toDo.isComplete ? .yellow : .green
                )
                
            }
            .buttonStyle(.borderless)

            Button {
                showingDeleteAlert = true
            } label: {
                TDButtonLabel(
                    symbolName: "trash",
                    label: "Delete",
                    iconColor: Color.red
                )
            }
            .buttonStyle(.borderless)
        }
        .frame(maxWidth: .infinity, alignment: .center)
        .padding(.bottom, 8)

    }
}

#Preview {
    NavigationSplitView {
        
    } detail: {
        
    }
    .inspector(isPresented: .constant(true)){
        ToDoDetailView(
            toDo: ToDoozy(
                title: "Unload the dishwasher",
                dueDate: Date() + 2000,
                details: "Don't forget this time, you silly goose.",
                list: ToDoList(title: "Funky List")
            )
        )
    }
}

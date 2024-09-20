//
//  NewItemView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented : Bool
    var body: some View {
        VStack{
            Text("New Item").font(.system(size: 32)).bold().padding(.top,100)
            
            Form{
                
                TextField("Titre",text: $viewModel.titre)
                    .textFieldStyle(DefaultTextFieldStyle())
                DatePicker("Due date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(titre: "Enregister", bgColor: .pink){
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false

                    }else{
                        viewModel.showAlert = true
                    }
                }
            }.alert(isPresented: $viewModel.showAlert){
                Alert(title: Text("Erreur"),message: Text("Champs invalides"))
            }
        }
    }
}

#Preview {
    NewItemView(newItemPresented : Binding(get: {
        return true
    }, set: { _ in
        
    }))
}

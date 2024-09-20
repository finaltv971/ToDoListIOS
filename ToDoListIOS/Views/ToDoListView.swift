//
//  ToDoListView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI
import FirebaseFirestore


struct ToDoListView: View {
    @StateObject var viewModel : ToDoListViewModel
    @FirestoreQuery var items : [ToDoListItem]
    private var userId:String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: ToDoListViewModel(userId: userId))
    }
    var body: some View {
        NavigationView{
            VStack{
                List(items){ element in
                    
                    ToDoListItemView(item:element)
                        .padding()
                        .swipeActions{
                            Button("Supprimer"){
                                viewModel.supprimer(id: element.id)
                            }.tint(.red)

                        }
                }.listStyle(PlainListStyle())
                
            }.navigationTitle("To Do list")
                .toolbar{
                    Button {
                        viewModel.showingNewItemView=true
                    }label: {
                        Image(systemName: "plus")
                    }
                }.sheet(isPresented: $viewModel.showingNewItemView, content: {
                    NewItemView(newItemPresented: $viewModel.showingNewItemView)
                })
        }
    }
}

#Preview {
    ToDoListView(userId: "")
}

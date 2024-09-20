//
//  ToDoListViewModel.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import Foundation
import FirebaseFirestore

class ToDoListViewModel : ObservableObject{
    
    @Published var showingNewItemView: Bool = false
    private let userId:String
    
    init(userId : String){
        self.userId = userId
    }
    
    /// Suppression d'un element de la liste
    /// - Parameter id: id de l'element a supprimer
    func supprimer(id:String){
        
        print("\(id) : supprimer")
        let db = Firestore.firestore()
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
    
    }
    
}

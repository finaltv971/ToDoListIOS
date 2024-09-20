//
//  NewItemViewModel.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//
import FirebaseAuth
import FirebaseFirestore
import Foundation
class NewItemViewModel : ObservableObject{
    @Published var titre = ""
    @Published var dueDate = Date()
    @Published var showAlert = false

    init(){
        
    }
    func save()  {
        guard canSave else{
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
        
        
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
           titre: titre,
           dueDate: dueDate.timeIntervalSince1970,
           createdDate: Date().timeIntervalSince1970,
           isDone: false
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary() )
    }
    
    var canSave:Bool{
        guard !titre.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else{
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}

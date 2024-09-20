//
//  ToDoListItemViewModel.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ToDoListItemViewModel : ObservableObject{
    
    init(){
        
    }
    
    func toggleIsDone(item:ToDoListItem){
        var newItem = item
        newItem.setDone(!item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else{
            return
        }
         
        self.update(item:newItem,uid:uid)
    }
    
     func update(item : ToDoListItem, uid : String){
        
        print("\(item.id) : mis a jour")
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .updateData(item.asDictionary())
    }
}

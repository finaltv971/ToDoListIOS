//
//  ProfileViewModel.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ProfileViewModel : ObservableObject{
    
    init(){
        
    }
    @Published var user : User? =  nil

    func getUserInfo(){
        guard let userId = Auth.auth().currentUser?.uid else{
            return
        }
        let db = Firestore.firestore()
        
        db.collection("users").document(userId)
            .getDocument { [weak self] snapshot, error in
                
                guard let data = snapshot?.data() , error == nil else {
                    return
                }
                
                DispatchQueue.main.async {
                    self?.user = User(
                         id: data["id"] as? String ??  "introuvable",
                         name: data["name"] as? String ??  "introuvable",
                         email: data["email"] as? String ??  "introuvable",
                         joined: data["joined"] as? TimeInterval ??  0
                     )
                     
                }
            }
        
    }
    func deconnexion(){
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
    }
}

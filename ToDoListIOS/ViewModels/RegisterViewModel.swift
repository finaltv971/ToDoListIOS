//
//  RegisterViewModel.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//
//


import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject{
    @Published var email = ""
    @Published var nomComplet = ""
    @Published var mdp = ""
    @Published var errorMessage : String = ""

     init(){}
    
    func inscription(){
        guard validation() else {
            return
        }
        
        Auth.auth().createUser(withEmail: email, password: mdp) { [weak self] result, error
            in guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId )
        }
    }
    
    private func insertUserRecord(id: String){
        let newUser = User(id: id, name: nomComplet, email: email, joined: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
    }
    
    func validation() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty ,
              !mdp.trimmingCharacters(in: .whitespaces).isEmpty,
              !nomComplet.trimmingCharacters(in: .whitespaces).isEmpty else{
            errorMessage = "Completez tous les champs"
            
            return false
        }
        //
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Saisissez une adresse valide"
            return false
        }
        guard mdp.count >= 6  else{
            errorMessage = "Votre mot de passe doit etre plus long"
            return false
        }
        
        return true
    }
}

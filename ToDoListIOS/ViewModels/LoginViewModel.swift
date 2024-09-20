//
//  LoginViewModel.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject{
    @Published var email = ""
    @Published var mdp = ""
    @Published var errorMessage : String = ""

    init(){
         
    }
    
    func login(){
        guard validation() else {
            return
        }
        
        Auth.auth().signIn(withEmail: email, password: mdp)
    }
    
    
    func validation() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty ,
                !mdp.trimmingCharacters(in: .whitespaces).isEmpty  else{
            errorMessage = "Completez tous les champs"
            
            return false
        }
        //
        guard email.contains("@") && email.contains(".") else{
            errorMessage = "Saisissez une adresse valide"
            return false
        }
        return true
    }
}

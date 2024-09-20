//
//  MainViewViewModel.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import Foundation
import FirebaseAuth
class MainViewViewModel : ObservableObject{
    private var handler : AuthStateDidChangeListenerHandle?
    @Published var currentUserId : String = ""

    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener{
            [weak self] _,user in DispatchQueue.main.async{
                self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn : Bool{
        return Auth.auth().currentUser != nil
    }
}

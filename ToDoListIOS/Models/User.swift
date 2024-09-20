//
//  User.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import Foundation

struct User: Codable{
    let id : String
    let name : String
    let email : String
    let joined : TimeInterval
}

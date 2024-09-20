//
//  ToDoListItem.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import Foundation
struct ToDoListItem: Codable,Identifiable{
    let id : String
    let titre : String
    let dueDate : TimeInterval
    let createdDate : TimeInterval
    var isDone : Bool
    
    mutating func setDone(_ state:Bool){
        isDone = state
    }
}

//
//  CustomTabView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct CustomTabView: View {
    var userId : String
    var body: some View {
        ToDoListView(userId: userId).tabItem {
          Label("Accueil",systemImage: "house")
        }
        Profile().tabItem {
            Label("Profile",systemImage: "person.circle")
        }    }
}

#Preview {
    CustomTabView(userId: "")
}

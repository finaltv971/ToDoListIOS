 //
//  ContentView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currentUserId.isEmpty{
            TabView{
                CustomTabView(userId: viewModel.currentUserId)
            }
        }else{
            LoginView()
        }
    }
}

#Preview {
    MainView()
}

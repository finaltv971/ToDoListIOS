//
//  Profile.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct Profile: View {
    @StateObject var viewModel = ProfileViewModel()

    var body: some View {
        NavigationView{
            
            
            VStack{
                if let user = viewModel.user {
                    
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundStyle(.blue)
                        .frame(width:125,height:125)
                        .padding()
                    
                    
                    // Info : Nom complet Email, Date crea
                    VStack{
                        HStack{
                            Text("Nom Complet : ").bold()
                            Text(user.name)
                        }.padding()
                        HStack{
                            Text("Email : ").bold()
                            Text(user.name)
                        }.padding()
                        HStack{
                            Text("Depuis le : ").bold()
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }.padding()
                    }.padding()
                    // sign out
                    Button("Se deconnecter"){
                        viewModel.deconnexion()
                    }.tint(.red)
                        .padding()
                }else{
                    Text("Chargement...").bold().font(.title3)
                }
                
                
                
                Spacer()
            }.navigationTitle("Profile")
        }.onAppear{
            viewModel.getUserInfo()
        }
    }
}

#Preview {
    Profile()
}

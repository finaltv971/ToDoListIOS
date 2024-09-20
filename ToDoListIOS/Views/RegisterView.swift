//
//  RegisterView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()

    
    var body: some View {
        
        
            VStack{
                HeaderView(titre:"Inscription",sousTitre: "Debut on", angle: -15,bgColor: .orange)

                Form{
                    if !viewModel.errorMessage.isEmpty {
                        Text(viewModel.errorMessage).foregroundColor(.red)
                    }
                    TextField("Nom complet ", text: $viewModel.nomComplet)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)

                    TextField("Adresse e-mail", text: $viewModel.email)
                        .textFieldStyle(DefaultTextFieldStyle())
                        .autocorrectionDisabled()
                        .autocapitalization(.none)

                    SecureField("Mot de passe", text: $viewModel.mdp)
                        .textFieldStyle(DefaultTextFieldStyle())

                    TLButton(titre:"Creer compte", bgColor: .green,action:{
                        viewModel.inscription()
                    })
                }.offset(y:-50)
                
                Spacer()
            }
        
    }
}

#Preview {
    RegisterView()
}

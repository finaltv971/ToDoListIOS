//
//  LoginView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct LoginView: View {
	@StateObject var viewModel = LoginViewModel()

    var body: some View {
		NavigationView{
			VStack{
				//Header
				HeaderView(titre:"To Do List",sousTitre: "Just Do It", angle: 15,bgColor: .pink)
				
				//Login Form

				
				Form{
					if !viewModel.errorMessage.isEmpty {
						Text(viewModel.errorMessage).foregroundColor(.red)
					}
					TextField("Adresse e-mail", text: $viewModel.email)
						.textFieldStyle(DefaultTextFieldStyle())
						.autocorrectionDisabled()
						.autocapitalization(.none)
					SecureField("Mot de passe", text: $viewModel.mdp)
						.textFieldStyle(DefaultTextFieldStyle())

					TLButton(titre:"Connexion", bgColor: .blue,action: {
						viewModel.login()
					}).padding()

				}.offset(y:-50)
			
				VStack{
					Text("S'inscrire ?")
					NavigationLink("Creer un compte", destination: RegisterView())

				}.padding(.bottom,50)
				//Create Account
				Spacer()

			}
		}
        
    }
}

#Preview {
    LoginView()
}

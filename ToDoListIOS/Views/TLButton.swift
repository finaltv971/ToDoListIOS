//
//  TLButton.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct TLButton: View {
    let titre : String
    let bgColor : Color
    let action :() -> Void
    var body: some View {
        Button{
            action()
        }label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(bgColor)
                Text(titre).bold().foregroundColor(.white)
            }
        }.padding()
    }
}

#Preview {
    TLButton(titre: "Connexion",bgColor: .red){
        
    }
}

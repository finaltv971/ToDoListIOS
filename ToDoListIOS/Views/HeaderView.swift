//
//  HeaderView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct HeaderView: View {
    let titre : String
    let sousTitre : String
    let angle : Double
    let bgColor : Color

    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(bgColor)
                .rotationEffect(Angle(degrees: angle))
                
            VStack{

                Text(titre).font(.system(size: 50)).foregroundStyle(Color.white).bold()
                Text(sousTitre).font(.system(size:30)).foregroundStyle(Color.white)
            }
            .padding(.top,80)
            
        }.frame(width: UIScreen.main.bounds.width * 3, height: 350 )
            .offset(y:-150)
    }
}

#Preview {
    HeaderView(titre:"Titre",sousTitre: "Sous titre", angle: 15,bgColor: .blue)
}

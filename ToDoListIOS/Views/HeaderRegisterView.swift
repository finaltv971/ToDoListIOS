//
//  HeaderRegisterView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct HeaderRegisterView: View {
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(Color.orange)
                .rotationEffect(Angle(degrees: -15))
            
            VStack{
                
                Text("To Do List").font(.system(size: 50)).foregroundStyle(Color.white).bold()
                Text("Just Do It").font(.system(size:30)).foregroundStyle(Color.white)
            }
            .padding(.top,30)
            
        }.frame(width: UIScreen.main.bounds.width * 3, height: 300 )
            .offset(y:-100)
    }
    
}

#Preview {
    HeaderRegisterView()
}

//
//  ToDolistItemView.swift
//  ToDoListIOS
//
//  Created by Anthony Baucal on 19/09/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    let item : ToDoListItem
    @StateObject var viewModel = ToDoListItemViewModel()

    var body: some View {
        
        HStack{
            VStack(alignment:.leading){
                Text(item.titre).bold()
                    .font(.body)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundStyle(.secondary )
                
            }
            
            Spacer()
            
            Button{
                viewModel.toggleIsDone(item:item)
            }label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle" )
                    .foregroundColor(.blue)
            }
        }
    }
}

#Preview {
    ToDoListItemView(item:.init(
        id: "\(UUID().uuidString)",
        titre: "test",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false)
    )
}

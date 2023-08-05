//
//  TLButton.swift
//  ToDoList
//
//  Created by Hoàng Lương on 04/08/2023.
//

import SwiftUI

struct TLButton: View {
    let title: String
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(.purple)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        }
    }
}

struct TLButton_Previews: PreviewProvider {
    static var previews: some View {
        TLButton(title: "value") {
            // action
        }
    }
}

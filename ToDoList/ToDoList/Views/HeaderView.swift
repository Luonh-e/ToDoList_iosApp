//
//  HeaderView.swift
//  ToDoList
//
//  Created by Hoàng Lương on 03/08/2023.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .foregroundColor(.purple)
                .rotationEffect(Angle(degrees: 15))
                
            
            VStack {
                Text("To Do List")
                    .foregroundColor(.white)
                    .font(.system(size: 40))
                    .bold()
                
                Text("Tạo ra những việc cần hoàn thành")
                    .foregroundColor(.white)
                    .font(.system(size: 20))
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 370)
        .offset(y: -100)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView()
    }
}

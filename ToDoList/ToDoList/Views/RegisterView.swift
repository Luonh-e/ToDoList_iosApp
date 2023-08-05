//
//  RegisterView.swift
//  ToDoList
//
//  Created by Hoàng Lương on 03/08/2023.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterViewModel()
    
    var body: some View {
        VStack {
            // Header
            HeaderView()
                .frame(height: 300)
            // Register form
            Form {
                TextField("Họ & tên", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocapitalization(.none)
                TextField("Email", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                SecureField("Mật khẩu", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                TLButton(title: "Tạo tài khoản") {
                    viewModel.register()
                }
            }
            
            VStack {
                 
            }
            
            Spacer()
        }
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}

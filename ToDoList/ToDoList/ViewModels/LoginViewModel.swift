//
//  LoginViewModel.swift
//  ToDoList
//
//  Created by Hoàng Lương on 03/08/2023.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login() {
        guard validate() else {
            return
        }
        
        // Truy log in
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    
    func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Vui lòng điền email và mật khẩu"
            return false
        }
        return true
    }
}

//
//  ContentViewModel.swift
//  ToDoList
//
//  Created by Hoàng Lương on 03/08/2023.
//

import Foundation
import FirebaseAuth

class ContentViewModel: ObservableObject {
    @Published var currentUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in DispatchQueue.main.async {
            self?.currentUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSigedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

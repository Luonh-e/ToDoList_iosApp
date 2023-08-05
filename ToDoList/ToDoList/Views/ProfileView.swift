//
//  ProfileView.swift
//  ToDoList
//
//  Created by Hoàng Lương on 03/08/2023.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    // Avatar
                    profile(user: user)
                    
                    // Info
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Tên: ")
                                .bold()
                            
                            Text(user.name)
                        }
                        .padding()
                        HStack {
                            Text("Email: ")
                                .bold()
                            
                            Text(user.email)
                        }
                        .padding()
                        HStack {
                            Text("Tham gia: ")
                                .bold()
                            
                            Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
                        }
                        .padding()
                    }
                    
                    // Sign out
                    Button("Thoát") {
                        viewModel.logOut()
                    }
                    .tint(.red)
                    
                    Spacer()
                } else {
                    Text("Loading profile...")
                }
            }
            .navigationTitle("Tài Khoản")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(user: User) -> some View {
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(.blue)
            .frame(width: 125, height: 125)
            .padding()
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}

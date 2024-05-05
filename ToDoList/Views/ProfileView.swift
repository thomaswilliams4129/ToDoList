//
//  ProfileView.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    profile(user)
                } else {
                    Text("Loading Profile....")
                }
            }
            .navigationTitle("Profile")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
    
    @ViewBuilder
    func profile(_ user: User) -> some View {
        // avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundStyle(.blue)
            .frame(width: 125, height: 135)
        
        // info: name, email, member since
        VStackLayout(alignment: .leading) {
            HStack {
                Text("Name: ")
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
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
        }
        
        
        TLButton(title: "Sign out", background: .red) {
            withAnimation {
                viewModel.logout()
            }
        }
        .frame(width: 300, height: 100)
        .padding()
    }
}

#Preview {
    ProfileView()
}

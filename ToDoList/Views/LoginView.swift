//
//  LoginView.swift
//  ToDoList
//
//  Created by Thomas Williams on 4/25/24.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack {
                //  Header
                HeaderView()
                
                Spacer()
                
                // Login Form
                
                Form {
                    TextField("Email Address", text: $email)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    SecureField("Password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button {
                        // login
                    } label: {
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                                .foregroundColor(.blue)
                            
                            Text("Log In")
                                .foregroundColor(.white)
                                .bold()
                        }
                    }
                }
                .frame(height: 300)
                
                VStack {
                    // Create Account
                    Text("New around here?")
                    NavigationLink("Create An Account", destination: RegisterView())
                }
                .padding(.bottom, 50)
                
                
                Spacer()
                
            }
        }
    }
}

#Preview {
    LoginView()
}

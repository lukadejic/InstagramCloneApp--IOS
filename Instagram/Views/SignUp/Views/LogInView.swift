//
//  SignInView.swift
//  Instagram
//
//  Created by MacBook on 7/31/24.
//

import SwiftUI

struct LogInView: View {
    @State private var email : String = ""
    @State private var password : String = ""
    @State private var error : String = ""
    @State private var showAlert : Bool = false
    @State private var alertTitle : String = "Oh no :("
    
    func errorCheck() -> String? {
        if  email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty{
            
            return "Please fill all the fields"
        }
        
        return nil
    }
    
    func clear() {
        self.email = ""
        self.password = ""
    }
    
    func signIn() {
        if let error = errorCheck() {
            self.error = error
            self.showAlert = true
            return
        }
        
        AuthService.signIn( email: email, password: password,  onSucess: { user in
            self.clear()
        }, onError: { errorMessage in
            self.error = errorMessage
            self.showAlert = true
        })
        
        
    }
    
    
    var body: some View {
        NavigationStack {
            VStack() {
            
                Image("instagram-logo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 120, height: 100)
                
                Spacer()
                
                VStack(alignment: .leading){
                    Text("Welcome back")
                        .font(.title)
                    
                    Text("Sign in to continue")
                        .font(.subheadline)
                }
                .fontWeight(.light)
                
                
                FormField(value: $email, placeholder: "Email", icon: "mail")
                
                FormField(value: $password, placeholder: "Password", icon: "lock", isSecure: true)
                
             
                Button{
                    signIn()
                }label: {
                    Text("Log In")
                        .modifier(ButtonModifier())
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text(alertTitle),
                          message: Text(error),
                          dismissButton: .default(Text("OK")) )
                }
                
                Spacer()
                
                HStack{
                    Text("New?")
                    
                    NavigationLink(destination: {
                        SignUpView()
                    }, label: {
                        Text("Create new account")
                            .font(.title3)
                            .fontWeight(.semibold)
                    })

                    
                }
                .frame(height: 50)
                
            }
            .padding()
        }
        
    }
}


#Preview {
    LogInView()
}

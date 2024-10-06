//
//  SignUpView.swift
//  Instagram
//
//  Created by MacBook on 7/31/24.
//

import SwiftUI
import PhotosUI


struct SignUpView: View {
    
    @State private var email : String = ""
    @State private var username : String = ""
    @State private var password : String = ""
    @State private var profileItem : PhotosPickerItem?
    @State private var profileImage : Image?
    @State private var profileImageData : Data?
    @State private var error : String = ""
    @State private var showAlert : Bool = false
    @State private var alertTitle : String = "Oh no :("
    
    func errorCheck() -> String? {
        if  email.trimmingCharacters(in: .whitespaces).isEmpty ||
            password.trimmingCharacters(in: .whitespaces).isEmpty ||
            username.trimmingCharacters(in: .whitespaces).isEmpty ||
            profileImage == nil {
            
            return "Please fill all the fields and provide an image"
        }
        
        return nil
    }
    
    func clear() {
        self.email = ""
        self.username = ""
        self.password = ""
        self.profileImage = nil
    }
    
    func signUp() {
        if let error = errorCheck() {
            self.error = error
            self.showAlert = true
            return
        }
        
        if let imageData = profileImageData {
            
            AuthService.signUp(username: username, email: email, password: password, imageData: imageData, onSucess: { user in
                self.clear()
            }, onError: { errorMessage in
                self.error = errorMessage
                self.showAlert = true
            })
        }

    }
    

    var body: some View {
        VStack {
        
            Image("instagram-logo")
                .resizable()
                .scaledToFill()
                .frame(width: 120, height: 100)
            
            Spacer()
            
            VStack(alignment: .leading){
                Text("Welcome back")
                    .font(.title)
                
                Text("Sign up to start")
                    .font(.subheadline)
            }
            .fontWeight(.light)
            .padding()
            
            VStack(alignment: .leading){


                VStack(alignment: .leading, spacing: -5){
                    Text("Select your profile picture")
                        .font(.footnote)
                        .fontWeight(.medium)
                    
                    Group{
                        if profileImage != nil{
                            
                            PhotosPicker(selection: $profileItem) {
                                profileImage?
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                    .padding()
                            }
                        }else{
                            
                            PhotosPicker(selection: $profileItem) {
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .clipShape(Circle())
                                    .frame(width: 100, height: 100)
                                    .padding()
                                    .foregroundStyle(ColorExt.lightBlueColor)
                            }
                            
                        }
                    }
                }
                .padding(.horizontal, 15)
                
                FormField(value: $username, placeholder: "Username", icon: "person")
                
                FormField(value: $email, placeholder: "Email", icon: "mail")
                
                FormField(value: $password, placeholder: "Password", icon: "lock", isSecure: true)
            }
    
            Button{
               signUp()
            }label: {
                Text("Sign up")
                    .modifier(ButtonModifier())
            }
            .alert(isPresented: $showAlert) {
                Alert(title: Text(alertTitle),
                      message: Text(error),
                      dismissButton: .default(Text("OK")) )
            }
            
            Spacer()
            
            HStack{
                Text("Got an account?")
                
                Text("Sign in")
                    .font(.title3)
                    .fontWeight(.semibold)
            }
            .frame(height: 50)
            
        }
        .onChange(of: profileItem) {
            Task {
                if let data = try? await profileItem?.loadTransferable(type: Data.self) {
                    profileImageData = data
                    
                    if let uiImage = UIImage(data: data) {
                        profileImage = Image(uiImage: uiImage)
                    }
                    
                } else {
                    print("DEBUG: Failed to upload image...")
                }
            }
        }
        .padding()
        
    }

}


#Preview {
    SignUpView()
}

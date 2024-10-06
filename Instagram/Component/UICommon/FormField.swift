//
//  FormFieldView.swift
//  Instagram
//
//  Created by MacBook on 7/31/24.
//

import SwiftUI

struct FormField: View {
    
    @Binding var value : String
    var placeholder : String
    var icon : String
    var isSecure = false
    
    
    var body: some View {
        
        Group{
            HStack{
                
                Image(systemName: icon)
                    .imageScale(.large)
                    .fontWeight(.light)
                    .offset(x: 5, y: -1)
                
                Group{
                    if isSecure {
                        SecureField(placeholder, text: $value)
                    }else{
                        TextField(placeholder, text: $value)
                    }
                }
                .padding()
                .cornerRadius(5.0)
                .multilineTextAlignment(.leading)
                .autocorrectionDisabled(true)
                .textInputAutocapitalization(.never)
            }
            .background{
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(ColorExt.lightGreyColor), lineWidth: 0.2)
                    .padding(2)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(.gray), lineWidth: 0.4)
                    .padding(2)
            }
            .padding(10)

        }
        
    }
}


#Preview {
    FormField(value: .constant(""), 
              placeholder: "Email",
              icon: "mail")
}


import Foundation
import SwiftUI

struct LogInButtonModifier : ViewModifier {

    func body(content: Content) -> some View {
        content
            .font(.headline)
            .foregroundColor(.white)
            .padding()
            .frame(width: 220, height: 60)
            .background(ColorExt.lightBlueColor)
            .cornerRadius(15.0)
    }
    
}


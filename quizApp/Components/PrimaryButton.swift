//
//  PrimaryButton.swift
//  quizApp
//
//  Created by Murat Haktanır on 18.04.2023.
//

import SwiftUI

struct PrimaryButton: View {
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundColor(.white)
            .padding()
            .padding(.horizontal)
            .background(.blue)
            .cornerRadius(30)
            .shadow(radius: 10)
    }
}

struct PrimaryButton_Previews: PreviewProvider {
    static var previews: some View {
        PrimaryButton(text: "Next")
    }
}

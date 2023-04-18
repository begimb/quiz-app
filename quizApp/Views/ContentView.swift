//
//  ContentView.swift
//  quizApp
//
//  Created by Murat Haktanır on 18.04.2023.
//

import SwiftUI

struct ContentView: View {
    @StateObject var questionManager = QuestionManager()
    
    var body: some View {
        NavigationView {
            VStack(spacing: 40) {
                VStack(spacing: 20) {
                    Text("Quiz App")
                        .lilacTitle()
                    
                    Text("Are you ready to start?")
                        .fontWeight(.heavy)
                        .foregroundColor(.black)
                }
                
                NavigationLink {
                    HomeView()
                        .environmentObject(questionManager)
                } label: {
                    PrimaryButton(text: "Let'start")
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
        .background(.gray.opacity(0.2))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

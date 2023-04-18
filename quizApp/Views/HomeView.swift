//
//  HomeView.swift
//  quizApp
//
//  Created by Murat Haktanır on 18.04.2023.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var questionManager: QuestionManager
    var body: some View {
        if questionManager.reachedEnd {
            VStack(spacing: 20) {
                Text("Quiz App")
                    .lilacTitle()
                
                Text("Congratulations, you completed the game! :-) ")
                
                Text("You scored \(questionManager.score) out of \(questionManager.length)")
                
                Button {
                    Task.init {
                        await questionManager.fetchQuestion()
                    }
                } label: {
                    PrimaryButton(text: "Play Again")
                }

            }
            .padding()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .environmentObject(questionManager)
        }else {
            QuestionView()
                .environmentObject(questionManager)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
            .environmentObject(QuestionManager())
    }
}

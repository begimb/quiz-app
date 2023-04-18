//
//  QuestionView.swift
//  quizApp
//
//  Created by Murat Haktanır on 18.04.2023.
//

import SwiftUI

struct QuestionView: View {
    @EnvironmentObject var questionManager: QuestionManager
    var body: some View {
        VStack(spacing: 40) {
            HStack {
                Text("Quiz App")
                    .lilacTitle()
                Spacer()
                Text("\(questionManager.index + 1) out of \(questionManager.length)")
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
            }.padding()
            
//            ProgressBar(progress: questionManager.progress)
            
            VStack(alignment: .leading, spacing: 20) {
                HStack {
                    Text("Question")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                }.padding()
                
                Text(questionManager.question).padding()
                
                ForEach(questionManager.answerChoices, id: \.id) { answer in
                    AnswerRow(answer: answer)
                        .environmentObject(questionManager)
                }
            }
        
            Button {
                questionManager.goToNextQuestion()
            } label: {
                PrimaryButton(text: "Next")
            }
            .disabled(!questionManager.answerSelected)

            Spacer()
        }
        .padding( )
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.2))
        .navigationBarHidden(true)
    }
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView()
            .environmentObject(QuestionManager())
    }
}

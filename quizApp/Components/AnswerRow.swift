//
//  AsnwerRow.swift
//  quizApp
//
//  Created by Murat Haktanır on 18.04.2023.
//

import SwiftUI

struct AnswerRow: View {
    @EnvironmentObject var questionManager: QuestionManager
    var answer: Answer
    @State private var isSelected = false
    var body: some View {
        HStack(spacing: 20) {
            Image(systemName: "circle.fill")
                .font(.caption)
            
            Text(answer.option1)
                .bold()
                .minimumScaleFactor(0.7)
            
            if isSelected {
                Spacer()
                
                Image(systemName: answer.isCorrect ? "checkmark.cricle.fill" : "xmark.circle.fill" )
                    .foregroundColor(answer.isCorrect ? Color.green : Color.red)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(questionManager.answerSelected ? (isSelected ?
            .black.opacity(0.7) : .gray) : .black)
        .background(.white)
        .cornerRadius(10)
        .shadow(color: isSelected ? (answer.isCorrect ? .green : .red) : .gray, radius: 5, x: 0.5, y: 0.5)
        .onTapGesture {
            if !questionManager.answerSelected {
                isSelected = true
                questionManager.selectAnswer(answer: answer)
            }
        }
    }
}

struct AsnwerRow_Previews: PreviewProvider {
    static var previews: some View {
        AnswerRow(answer: Answer(option1: "Option 1", isCorrect: false))
            .environmentObject(QuestionManager())
    }
}

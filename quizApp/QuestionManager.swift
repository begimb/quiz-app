//
//  QuestionManager.swift
//  quizApp
//
//  Created by Murat Haktanır on 18.04.2023.
//

import Foundation

class QuestionManager: ObservableObject {
    private(set) var quiz: [Quiz.Result] = []
    @Published private(set) var length = 0
    @Published private(set) var index = 0
    @Published private(set) var reachedEnd = false
    @Published private(set) var answerSelected = false
    @Published private(set) var question: AttributedString = ""
    @Published private(set) var answerChoices: [Answer] = []
    @Published private(set) var progress: CGFloat = 0.00
    @Published private(set) var score = 0
    init() {
        Task.init {
            await fetchQuestion()
        }
    }
    
    func fetchQuestion() async {
        guard let url = URL(string: "https://murat.haktanir.com.tr/quiz-app.json") else { fatalError("Missing URL") }
        
        let urlRequest = URLRequest(url: url)
        
        do {
            let (data, response) = try await URLSession.shared.data(for: urlRequest)
            
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { fatalError("Error while fetching data") }
            
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let decodeData = try decoder.decode(Quiz.self, from: data)
            
            DispatchQueue.main.async {
                self.index = 0
                self.score = 0
                self.progress = 0.00
                self.reachedEnd = false
                
                self.quiz = decodeData.results
                self.length = self.quiz.count
                self.setQuestion()
            }
        } catch {
            print("Error fetching question: \(error)")
        }
    }
    
    func goToNextQuestion() {
        if index + 1 < length {
            index += 1
            setQuestion()
        }else {
            reachedEnd = true
        }
    }
    
    func setQuestion() {
        answerSelected = false
        progress = CGFloat(Double(index + 1) / Double(length * 350))
        
        if index < length {
            let currentQuestion = quiz[index]
            question = currentQuestion.formattedQuestion
            answerChoices = currentQuestion.answers
        }
    }
    
    func selectAnswer(answer: Answer) {
        answerSelected = true
        if answer.isCorrect {
            score += 1
        }
    }
}

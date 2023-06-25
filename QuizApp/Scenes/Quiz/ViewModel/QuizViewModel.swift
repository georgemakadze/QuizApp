//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 24.06.2023.
//

import Foundation

class QuizViewModel {
    
    private(set) var currentQuestionIndex: Int = 0 //private set var
    private(set) var correctAnswer: Int = 0
    var progress: Float {
        Float((currentQuestionIndex + 1)) / Float(questions.count)
    }
    
    var questionNumberLabel: String {
        "\(currentQuestionIndex + 1)\(questions.count)"
    }
    var currentQuestion: Question {
        questions[currentQuestionIndex]
    }
    
    var shouldFinishQuiz: Bool {
        currentQuestionIndex == questions.count
    }
    
    var currentScoreText: String {
      return  "მიმდინარე ქულა - \(correctAnswer)⭐️"
    }
    
    
    
    let questions: [Question] = [
        Question (text: "რომელია ყველაზე პოპულარული პროგრამირების ენა?",
                  answers: [
                    Answer(text: "Python"),
                    Answer(text: "Java"),
                    Answer(text: "C++", isCorrect: true),
                    Answer(text: "Kotlin")
                  ]),
        
        Question (text: "რომელი პროგრამირების ენა გამოიყენება iOS-ში?",
                  answers: [
                    Answer(text: "Objective-C"),
                    Answer(text: "Swift", isCorrect: true),
                    Answer(text: "Java"),
                    Answer(text: "Kotlin")
                  ]),
        
        Question (text: "რომელი პროგრამირების ენა გამოიყენება Android-ში?",
                  answers: [
                    Answer(text: "Objective-C"),
                    Answer(text: "Swift"),
                    Answer(text: "Java"),
                    Answer(text: "Kotlin", isCorrect: true)
                  ]),
        
        Question (text: "რომელი პროგრამირების ენა გამოიყენება Web-ში?",
                  answers: [
                    Answer(text: "Objective-C"),
                    Answer(text: "Swift"),
                    Answer(text: "JavaScript", isCorrect: true),
                    Answer(text: "Kotlin")
                  ])
    ]
    
    func loadNextQuestion() {
        guard currentQuestionIndex >= 0 && currentQuestionIndex < questions.count else {
            return
        }
        
        currentQuestionIndex += 1
    }
    
    func isCorrectAnswer(index: Int) -> Bool {
        return questions[currentQuestionIndex].answers[index].isCorrect
    }
    
    func incressScore() {
       correctAnswer += 1
    }
}

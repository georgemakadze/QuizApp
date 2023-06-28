//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 24.06.2023.
//

import Foundation

class QuizViewModel {
    
    private(set) var currentQuestionIndex: Int = 0
    private(set) var correctAnswer: Int = 0
    private(set) var questions: [Question]
    
    init(questions: [Question]) {
        self.questions = questions
    }
    
    var progress: Float {
        Float((currentQuestionIndex + 1)) / Float(questions.count)
    }
    
    var questionNumberLabel: String {
        "\(currentQuestionIndex + 1)/\(questions.count)"
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
    
    func loadNextQuestion() {
        guard currentQuestionIndex >= 0 && currentQuestionIndex < questions.count else {
            return
        }
        currentQuestionIndex += 1
    }
    
    func isCorrectAnswer(index: Int) -> Bool {
        let selectedAnswer = questions[currentQuestionIndex].answers[index]
          let correctAnswer = questions[currentQuestionIndex].correctAnswer
          return selectedAnswer == correctAnswer
    }
    
    func increaseScore() {
        correctAnswer += 1
    }
}

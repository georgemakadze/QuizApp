//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 24.06.2023.
//

import Foundation

class QuizViewModel {
    
    private(set) var subject: Subject
    private(set) var currentQuestionIndex: Int = 0
    private(set) var correctAnswer: Int = 0
    private(set) var lastPreviousQuestionIndex: Int = -1
    
    init(subject: Subject) {
        
        self.subject = subject
    }
    
    var lastQuestion: Bool {
        (currentQuestionIndex + 1) == subject.questionsCount
    }
    
    var progress: Float {
        Float((currentQuestionIndex + 1)) / Float(subject.questionsCount)
    }
    
    var questionNumberLabel: String {
        "\(currentQuestionIndex + 1)/\(subject.questionsCount)"
    }
    var currentQuestion: Question {
        subject.questions[currentQuestionIndex]
    }
    
    var shouldFinishQuiz: Bool {
        currentQuestionIndex == subject.questionsCount
    }
    
    var currentScoreText: String {
        "მიმდინარე ქულა - \(correctAnswer)⭐️"
    }
    
    func loadNextQuestion() {
        guard currentQuestionIndex >= 0 && currentQuestionIndex < subject.questionsCount else {
            return
        }
        currentQuestionIndex += 1
    }
    
    func isCorrectAnswer(index: Int) -> Bool {
        let selectedAnswer = subject.questions[currentQuestionIndex].answers[index]
        let correctAnswer = subject.questions[currentQuestionIndex].correctAnswer
        return selectedAnswer == correctAnswer
    }
    
    func increaseScore() {
        correctAnswer += 1
    }
}

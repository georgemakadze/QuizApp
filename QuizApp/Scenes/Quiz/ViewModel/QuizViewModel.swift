//
//  QuizViewModel.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 24.06.2023.
//

import Foundation

class QuizViewModel {
    
       var currentQuestionIndex: Int = 0
       var correctAnswer: Int = 0
    
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
    
    
}

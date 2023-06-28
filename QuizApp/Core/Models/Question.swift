//
//  QuestionItem.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation

struct Question: Hashable {
    let questionTitle : String
    let answers: [String]
    let correctAnswer: String
    let questionIndex: Int
}

//
//  Subject.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 05.06.2023.
//

import Foundation

struct Subject: Decodable {
    var id: String
    var quizTitle: String
    var quizDescription: String
    var questionsCount: Int
    var questions: [Question]
}

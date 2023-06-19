//
//  QuestionItem.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//

import Foundation

struct Question: Hashable {
    let text : String
    let answers: [Answer]
}

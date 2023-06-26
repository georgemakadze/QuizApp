//
//  Subject.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 05.06.2023.
//

import Foundation

struct Subject: Hashable {
    var icon: String
    var name: String
    var description: String
    var question: [Question]
}

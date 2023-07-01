//
//  JSONLoader.swift
//  QuizApp
//
//  Created by giorgi makadze on 01.07.23.
//

import Foundation

struct JSONLoader {
    
    static func loadSubjectsFromJSONFile() -> [Subject] {
        var subjects: [Subject] = []
        
        if let url = Bundle.main.url(forResource: "quizzes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                subjects = try decoder.decode([Subject].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("JSON file not found")
        }
        
        return subjects
    }
}

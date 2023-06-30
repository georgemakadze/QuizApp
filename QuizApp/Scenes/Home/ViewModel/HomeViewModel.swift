//
//  HomeViewModel.swift
//  QuizApp
//
//  Created by giorgi makadze on 26.06.23.
//

import Foundation

class HomeViewModel {
    
    var subjects: [Subject] = []
    
    func readJSONFile() {
        if let url = Bundle.main.url(forResource: "quizzes", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                self.subjects = try decoder.decode([Subject].self, from: data)
            } catch {
                print("Error decoding JSON: \(error)")
            }
        } else {
            print("JSON file not found")
        }
    }
}

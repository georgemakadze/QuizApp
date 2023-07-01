//
//  HomeViewModel.swift
//  QuizApp
//
//  Created by giorgi makadze on 26.06.23.
//

import Foundation

class HomeViewModel {
    
    var subjects: [Subject] = []
    func loadJSONFile() {
        self.subjects = JSONLoader.loadSubjectsFromJSONFile()
    }
}

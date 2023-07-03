//
//  HomeViewModel.swift
//  QuizApp
//
//  Created by giorgi makadze on 26.06.23.
//

import Foundation

class HomeViewModel {
    var subjects: [Subject] = []
    
    func loadJSONFile(completion: (() -> Void)? = nil) {
        JSONLoader.loadJSONData { [weak self] (data) in
            guard let data = data else {
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let subjects = try decoder.decode([Subject].self, from: data)
                DispatchQueue.main.async {
                    self?.subjects = subjects
                    completion?()
                }
            } catch {
                
            }
        }
    }
}

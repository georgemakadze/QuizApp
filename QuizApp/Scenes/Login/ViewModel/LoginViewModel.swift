//
//  LoginViewModel.swift
//  QuizApp
//
//  Created by giorgi makadze on 04.07.23.
//

import Foundation

class LoginViewModel {
    
    func validateUsername(_ username: String) -> Bool {
        if username.count < 8 || username.count > 20 {
            return false
        }
        
        let disallowedStartingCharacters: [Character] = ["_", "."]
        if disallowedStartingCharacters.contains(username.first ?? Character("")) {
            return false
        }
        
        let additionalValidationRegex = "^[A-Za-z0-9]+$"
        let additionalValidationPredicate = NSPredicate(format: "SELF MATCHES %@", additionalValidationRegex)
        if !additionalValidationPredicate.evaluate(with: username) {
            return false
        }
        
        return true
    }
}

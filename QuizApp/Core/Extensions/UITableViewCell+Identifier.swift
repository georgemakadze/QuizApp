//
//  UITableViewCell+Identifier.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 06.06.2023.
//


import UIKit

extension UIView  {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
}

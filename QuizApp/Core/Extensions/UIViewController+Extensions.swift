//
//  UIViewController+Extensions.swift
//  QuizApp
//
//  Created by Giorgi Makadze on 15.06.2023.
//

import Foundation
import UIKit

extension UIViewController {
    var window: UIWindow? {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
            let sceneDelegate = windowScene.delegate as? SceneDelegate
          else {
            return nil
          }
        return sceneDelegate.window
    }
}

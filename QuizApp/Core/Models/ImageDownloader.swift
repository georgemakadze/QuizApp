//
//  ImageDownloader.swift
//  QuizApp
//
//  Created by giorgi makadze on 03.07.23.
//

import Foundation
import UIKit

class ImageDownloader {
    static func downloadImage(from url: URL, completion: @escaping (UIImage?) -> Void) {
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                print("Error downloading image: \(error)")
                completion(nil)
                return
            }
            guard let data = data, let image = UIImage(data: data) else {
                print("Invalid image data")
                completion(nil)
                return
            }
            completion(image)
        }.resume()
    }
}

//
//  JSONLoader.swift
//  QuizApp
//
//  Created by giorgi makadze on 01.07.23.
//

import Foundation

struct JSONLoader {
    static func loadJSONData(completion: @escaping (Data?) -> Void) {
        let mockyURLString = "https://run.mocky.io/v3/8ade4e0b-bee1-4eae-a98b-47edeea68324"
        guard let url = URL(string: mockyURLString) else {
            completion(nil)
            return
        }
        
        let session = URLSession.shared
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            completion(data)
        }
        
        task.resume()
    }
}

//
//  JSONSerialization.swift
//  Navigation
//
//  Created by Юлия Филиппова on 01.07.2023.
//

import Foundation


class NeetworkJSONSerialization {
    
    func infoVCLabel(complition:@escaping(_ text:String?) ->() ) {
        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/todos/")!
        let task = session.dataTask(with: url) { data, responce, error in
            if let error {
                print(error.localizedDescription)
                complition(nil)
                return
            }
            
            let code = (responce as? HTTPURLResponse)?.statusCode
            if code != 200 {
                print("Error status code \(String(describing: code))")
                complition(nil)
                return
            }
            guard let data else {
                print("data is nil")
                complition(nil)
                return
            }
            
            do {
                let answer = try JSONSerialization.jsonObject(with: data, options: []) as? [[String: Any]]
                let index = 5
                let textArrey = answer?[index]
                let textTitle = textArrey?["title"] as? String
                complition(textTitle)
            } catch {
                print(error.localizedDescription)
                complition(nil)
            }
            
        }
        task.resume()
    }
}

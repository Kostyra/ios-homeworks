//
//  JSONDecoder.swift
//  Navigation
//
//  Created by Юлия Филиппова on 01.07.2023.
//

struct Answer: Codable {
    let namePlanet:String
    let orbitalPeriod:String
    
    enum CodingKeys:String, CodingKey {
        case namePlanet = "name"
        case orbitalPeriod = "orbital_period"
    }
}


import Foundation

class NetworkJSONDecoder {
    
    func infoPlanetTatuin(complition:@escaping (_ text:String?,_ name:String?) ->()?) {
        let session = URLSession.shared
        let url = URL(string: "https://swapi.dev/api/planets/1")!
        let task = session.dataTask(with: url) { data, responce, error in
            if let error {
                print(error.localizedDescription)
                complition(nil,nil)
                return
            }
            
            let code = (responce as? HTTPURLResponse)?.statusCode
            if code != 200 {
                print("Error status code \(String(describing: data))")
                complition(nil,nil)
                return
            }
            
            guard let  data else {
                print("Data is nil")
                complition(nil,nil)
                return
            }
            
            do {
                let answer = try JSONDecoder().decode(Answer.self, from: data)
                let planetPeriod = answer.orbitalPeriod
                let namePlanet = answer.namePlanet
                complition(planetPeriod, namePlanet)
            }catch {
                complition(nil,nil)
                print(error.localizedDescription)
            }
            
        }
        task.resume()
        
    }
}

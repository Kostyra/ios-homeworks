

import Foundation

enum AppConfiguration {
    case one(URL)
    case two(URL)
    case free(URL)
    
    static func randomConfig()  -> AppConfiguration {
        let urls = [
            URL(string: "https://swapi.dev/api/people/8")!,
            URL(string: "https://swapi.dev/api/starships/3")!,
            URL(string: "https://swapi.dev/api/planets/5")!
        ]

        let index = Int.random(in: 0..<urls.count)
        switch index {
        case 0:
            return .one(urls[0])
        case 1:
            return .two(urls[1])
        case 2:
            return .free(urls[2])
            
        default:
            fatalError("Oopps")
        }
    }
}


struct NetworkManager {
    static func request(for configuration: AppConfiguration,completion:@escaping (_ messegeText: String?) -> ()) {
        let session = URLSession.shared
        var request:String
        
        switch configuration {
        case .one(let url):
            request = url.absoluteString
        case .two(let url):
            request = url.absoluteString
        case .free(let url):
            request = url.absoluteString
        }

        guard let url = URL(string: request)  else {
            print("Error invalid url")
            completion(nil)
            return
        }
        
        let task = session.dataTask(with: url) { data, response, error in
            
            if let error {
                print(error.localizedDescription)
                completion(nil)
                return
            }
            
            let code = (response as? HTTPURLResponse)?.statusCode
            let codeAllHeaderFields = (response as? HTTPURLResponse)?.allHeaderFields
            if code != 200 {
                print("ERROR status code \(String(describing: code))")
                return
            }
            
            guard let data else {
                print("Nil")
                completion(nil)
                return
            }
            
            do {
                let answer = try JSONSerialization.jsonObject(with: data) as? [String:Any]
                
                print("*****Данные \(data)")
                print("*****Responce all Header Fields\(String(describing: codeAllHeaderFields))")
                print("*****Responce status Code\(String(describing: code))")
                print("*****Error \(String(describing: error?.localizedDescription))")
                let messegeText = answer?["name"] as? String
                completion(messegeText)
            } catch {
                print(error.localizedDescription)
                completion(nil)
            }
            
        }
        task.resume()
    }
}

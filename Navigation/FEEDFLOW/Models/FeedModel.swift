
import Foundation
enum FeedModelError:Error {
    case notWorld
    case unnCorrect
    
    var errorDescription: String {
        switch self {
        case .notWorld:
            return "Нету слова"
        case .unnCorrect:
            return "Не правильный пароль"
        }
    }
}


protocol FeedModelProtocol {
    func check(_ pass:String?, complition: @escaping(Result<Bool, FeedModelError>) -> Void)
}

final class FeedModel {
    //MARK: - 
    private let passFeedModel = "Secret"
}

extension FeedModel:FeedModelProtocol {
    func check(_ pass:String?, complition: @escaping(Result<Bool, FeedModelError>) -> Void) {
        guard let pass = pass,
              pass.isEmpty
        else {
            guard pass == passFeedModel else {
                return complition(.failure(.unnCorrect))
            }
            return complition(.success(true))
        }
        return complition(.failure(.notWorld))
    }
}


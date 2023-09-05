
import Foundation

//MARK: - enum
enum FeedModelError:Error {
    case notWorld
    case unnCorrect
    
    var errorDescription: String {
        switch self {
        case .notWorld:
            let localize = NSLocalizedString("DoNotWord", comment: "")
            return localize
        case .unnCorrect:
            let localize = NSLocalizedString("NotGoodPass", comment: "")
            return localize
        }
    }
}

//MARK: - protocol
protocol FeedModelProtocol {
    func check(_ pass:String?, complition: @escaping(Result<Bool, FeedModelError>) -> Void)
}

//MARK: - class
final class FeedModel {
    private let passFeedModel = "Secret"
}

//MARK: - extension
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


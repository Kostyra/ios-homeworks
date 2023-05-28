

import Foundation

protocol FeedViewModelProtocol: AnyObject {
    var stateChanged: ((FeedViewModel.State) -> Void)? { get set }
    func wordSecret(_ action: String?)
    var post:Post{get}
}

final class FeedViewModel {
 
    //MARK: - Enum
    enum State {
        case wrong(text: String)
        case correct
        case uncorrect
    }
    
    var stateChanged: ((State) -> Void)?
    var post = Post(title:"PostView")
    
    private var state: State = .uncorrect {
        didSet {
            stateChanged?(state)
        }
    }
    
    private let feedModel: FeedModel
    
    init(feedModel: FeedModel) {
        self.feedModel = feedModel
    }

}

//MARK: - extension

extension FeedViewModel: FeedViewModelProtocol {
    func wordSecret(_ action: String?) {
        feedModel.check(action) { result in
            switch result {
            case .success(_):
                self.state = .correct
            case .failure(let error):
                switch error {
                case .notWorld:
                    self.state = .wrong(text: error.errorDescription)
                case .unnCorrect:
                    self.state = .uncorrect
                    self.state = .wrong(text: error.errorDescription)
                }
            }
        }
    }
}



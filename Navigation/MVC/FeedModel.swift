
import Foundation

final class FeedModel {
    let passFeedModel = "secret"
    func check(passFeed:String) ->Bool {
        return passFeed.lowercased() == passFeedModel.lowercased()
    }
}



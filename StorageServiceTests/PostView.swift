
import Foundation


public struct PostView {
    public var author:String
    public var description: String
    public var image: String
    public var likes: Int
    public var view: Int
    
    public init(author: String, description: String, image: String, likes: Int, view: Int) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.view = view
    }
}


import Foundation


public struct PostView {
    public var author:String
    public var description: String
    public var image: String
    public var likes: Int
    public var view: Int
    public var id: String
    
    public init(author: String, description: String, image: String, likes: Int, view: Int,id: String ) {
        self.author = author
        self.description = description
        self.image = image
        self.likes = likes
        self.view = view
        self.id = id
    }
}

extension PostView {
    static func make() -> [PostView] {
        [
            PostView(author: "Jeck",
                     description: "All tasks are required to complete to receive credit, except for tasks with an asterisk. You can send each detection mask or all tasks together for verification. During the Partial Review, your homework will have the status In Progress. Ask any questions about the tasks in the study group chat. Homework to be completed in the same project where you are doing part of the first task. Task number 1 Your application must be fully compliant with the samples. Do not do anything extra, it will complicate the verification of your work.",
                     image: "veidor",
                     likes: 1000,
                     view: 1_044_000,
                     id: UUID().uuidString),
            PostView(author: "Sindi",
                     description: "All tasks are required to complete to receive credit, except for tasks with an asterisk. You can send each detection mask or all tasks together for verification. During the Partial Review, your homework will have the status In Progress. Ask any questions about the tasks in the study group chat. Homework to be completed in the same project where you are doing part of the first task. Task number 1 Your application must be fully compliant with the samples. Do not do anything extra, it will complicate the verification of your work.",
                     image:  "doctor",
                     likes: 2000,
                     view: 2_439_534,
                     id: UUID().uuidString),
            PostView(author: "Anton", description: "Three Beer more text more text more text more text more text more text more text more text",
                     image:  "joker",
                     likes: 3000,
                     view: 4_436_785,
                     id: UUID().uuidString),
            PostView(author: "Nina", description: "Ork Ork Ork Ork Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork Ork",
                     image:  "mega",
                     likes: 4000,
                     view: 6_432_423,
                     id: UUID().uuidString)
        ]
    }
    
}

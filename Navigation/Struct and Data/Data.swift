
import StorageService
import UIKit

 var arrayTable = [
    PostView(author: "Jeck",
             description: "All tasks are required to complete to receive credit, except for tasks with an asterisk. You can send each detection mask or all tasks together for verification. During the Partial Review, your homework will have the status In Progress. Ask any questions about the tasks in the study group chat. Homework to be completed in the same project where you are doing part of the first task. Task number 1 Your application must be fully compliant with the samples. Do not do anything extra, it will complicate the verification of your work.",
             image: "veidor",
             likes: 1000,
             view: 1_044_000),
    PostView(author: "Sindi",
             description: "All tasks are required to complete to receive credit, except for tasks with an asterisk. You can send each detection mask or all tasks together for verification. During the Partial Review, your homework will have the status In Progress. Ask any questions about the tasks in the study group chat. Homework to be completed in the same project where you are doing part of the first task. Task number 1 Your application must be fully compliant with the samples. Do not do anything extra, it will complicate the verification of your work.",
             image:  "doctor",
             likes: 2000,
             view: 2_439_534),
    PostView(author: "Anton", description: "Three Beer more text more text more text more text more text more text more text more text",
             image:  "joker",
             likes: 3000,
             view: 4_436_785),
    PostView(author: "Nina", description: "Ork Ork Ork Ork Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork OrkOrk Ork Ork",
             image:  "mega",
             likes: 4000,
             view: 6_432_423)
]

var arrayStark = [imageStark (imageStarks:"stark0"),
                  imageStark (imageStarks:"stark1"),
                  imageStark (imageStarks:"stark2"),
                  imageStark (imageStarks:"stark3"),
                  imageStark (imageStarks:"stark4"),
                  imageStark (imageStarks:"stark5"),
                  imageStark (imageStarks:"stark6"),
                  imageStark (imageStarks:"stark7"),
                  imageStark (imageStarks:"stark8"),
                  imageStark (imageStarks:"stark9"),
]


extension imageStark {
    static func make() -> [imageStark] {
        [
        imageStark (imageStarks:"stark0"),
        imageStark (imageStarks:"stark1"),
        imageStark (imageStarks:"stark2"),
        imageStark (imageStarks:"stark3"),
        imageStark (imageStarks:"stark4"),
        imageStark (imageStarks:"stark5"),
        imageStark (imageStarks:"stark6"),
        imageStark (imageStarks:"stark7"),
        imageStark (imageStarks:"stark8"),
        imageStark (imageStarks:"stark9"),
        ]
    }
}


var newImageLibrary:[UIImage] = []

func createArray() {
    newImageLibrary = (0...9).compactMap{UIImage(named: "stark\($0)")}
}




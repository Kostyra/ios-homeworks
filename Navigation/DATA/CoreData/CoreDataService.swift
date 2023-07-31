
import Foundation
import CoreData
import StorageService


final class CoreDataService {

        static let shared = CoreDataService()
        
        var likePosts: [CoreModel] {
            fetchLikePost()
        }
        
        lazy var persistentContainer: NSPersistentContainer = {
            let container = NSPersistentContainer(name: "CoreDataProject")
            container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                if let error = error as NSError? {
                    fatalError("Unresolved error \(error), \(error.userInfo)")
                }
            })
            return container
        }()
    
        func fetchLikePost() -> [CoreModel] {
            let request = CoreModel.fetchRequest()
            return (try? persistentContainer.viewContext.fetch(request)) ?? []
        }
    
        
        func deleteLike(post: CoreModel) {
            let context = post.managedObjectContext
            context?.delete(post)
            try? context?.save()
        }
        
        private func getPost(post: PostView) -> CoreModel? {
            let request = CoreModel.fetchRequest()
            request.predicate = NSPredicate(format: "id == %@", post.id)
            return (try? persistentContainer.viewContext.fetch(request))?.first
        }

        func addLikePost(postOrigin: PostView) {
            guard getPost(post: postOrigin) == nil else { return }
            let post = CoreModel(context: persistentContainer.viewContext)
            post.author = postOrigin.author
            post.image = postOrigin.image
            post.descriptions = postOrigin.description
            post.likes = Int32(postOrigin.likes)
            post.view = Int32(postOrigin.view)
            post.id = postOrigin.id
            post.dateAdd = Date()
            try? persistentContainer.viewContext.save()
        }
    }



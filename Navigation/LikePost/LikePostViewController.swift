import UIKit
import StorageService


class LikePostViewController:UIViewController {
    
    var currentPost:[PostView] = []
    
    private lazy var tableView: UITableView = {
           let tableView = UITableView.init(frame: .zero, style: .plain)
           tableView.translatesAutoresizingMaskIntoConstraints = false
           tableView.dataSource = self
           tableView.delegate = self
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
           return tableView
       }()
       
       override func viewWillAppear(_ animated: Bool) {
           super.viewWillAppear(animated)
           tableView.reloadData()
       }
       
       override func viewDidLoad() {
           super.viewDidLoad()
           title = "Favorites"
           view.backgroundColor = UIColor.createColor(lightMode: .white, darkMode: .black)
           view.addSubview(tableView)
           
           NSLayoutConstraint.activate([
               tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
               tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
               tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
               tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor)

           ])
       }
       

   }
extension LikePostViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            CoreDataService.shared.deleteLike(post: CoreDataService.shared.likePosts[indexPath.row])
            tableView.reloadData()
//            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
}

extension LikePostViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        CoreDataService.shared.likePosts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath) as? PostTableViewCell else { return UITableViewCell()
        }
        let model = CoreDataService.shared.likePosts[indexPath.row]
        let modelForCell = PostView(
            author: model.author ?? "",
            description: model.descriptions ?? "",
            image: model.image ?? "",
            likes: Int(model.likes),
            view: Int(model.view),
            id: model.id ?? ""
        )
        let doubleTapDeleteGesture = UITapGestureRecognizer(target: self, action: #selector(deleteDoubleTapDeleteGesture(_:)))
        doubleTapDeleteGesture.numberOfTapsRequired = 2
        cell.addGestureRecognizer(doubleTapDeleteGesture)
        
        cell.tableItem(with: modelForCell)
        return cell
    }
    
    
    @objc func deleteDoubleTapDeleteGesture(_ gesture: UITapGestureRecognizer) {
//        if gesture.state == .ended {
//            let tapLocation = gesture.location(in: tableView)
////            guard let cell = gesture.view as? UITableViewCell else { return }
////            guard let indexPath = tableView.indexPath(for: cell) else { return }
////            let postToDelete = CoreDataService.shared.likePosts[indexPath.row]
////            CoreDataService.shared.deleteLike(post: postToDelete)
//
//            if let tappedIndexPath = tableView.indexPathForRow(at: tapLocation) {
//                currentPost.remove(at: tappedIndexPath.row)
//                tableView.deleteRows(at: [tappedIndexPath], with: .fade)
//                guard let cell = gesture.view as? UITableViewCell else { return }
//                guard let indexPath = tableView.indexPath(for: cell) else { return }
//                let postToDelete = CoreDataService.shared.likePosts[indexPath.row]
//                CoreDataService.shared.deleteLike(post: postToDelete)
////                currentPost.remove(at: tappedIndexPath.row)
////                tableView.deleteRows(at: [tappedIndexPath], with: .fade)
//            }
//        }
        
        
        if gesture.state == .ended {
             let tapLocation = gesture.location(in: tableView)
            guard let cell = gesture.view as? UITableViewCell else { return }
            guard let indexPath = tableView.indexPath(for: cell) else { return }
            let postToDelete = CoreDataService.shared.likePosts[indexPath.row]
            CoreDataService.shared.deleteLike(post: postToDelete)
            if let tappedIndexPath = tableView.indexPathForRow(at: tapLocation) {
                tableView.reloadData()
                if tappedIndexPath.row < currentPost.count {
                    currentPost.remove(at: tappedIndexPath.row)
                    tableView.deleteRows(at: [tappedIndexPath], with: .fade)
                }
            }
         }
    }
}

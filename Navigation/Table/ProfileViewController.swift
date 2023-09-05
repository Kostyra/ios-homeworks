

import UIKit
import StorageService

final class ProfileViewController: UIViewController {

    var seconds = 0
    var timer = Timer()
    var originIndex = Int()
    
     private let tableView: UITableView = {
        let tableView = UITableView.init(
            frame: .zero,
            style: .plain
        )
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        return tableView
        
    }()

     private func tableViewCell() {
        
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id1)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        
    }
    
     func headerView() {
        let headerView = ProfileHeaderView()
         headerView.label.text = userInfo.name
         headerView.photo.image = userInfo.avatar
//         let a = LogInViewController()
//         headerView.label.text =  a.temp
        tableView.setAndLayout(headerView: headerView)
        //tableView.tableFooterView = UIView()//UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
        tableView.backgroundColor = UIColor(named: "TabBar")
        
    }
    
    private func table() {
        view.addSubview(tableView)
        NSLayoutConstraint.activate([
            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dragInteractionEnabled = true
        tableView.dragDelegate = self
        tableView.dropDelegate = self
        table()
        tableViewCell()
        headerView()
        #if DEBUG
        view.backgroundColor = UIColor(named: "TabBar")
        #else
        view.backgroundColor = UIColor(named: "TabBar")//.green
        #endif
        
//        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCancel), userInfo: nil, repeats: true)
//
//        let tap = UITapGestureRecognizer(target: self, action: #selector(resetTimer))
//        view.addGestureRecognizer(tap)
    }
    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
        
    }
    
    @objc func timerCancel() {
         
//        seconds += 1
//        if seconds == 20 {
//            let alert = UIAlertController(title: "Вниманиe", message: "Вы бездействовали больше 10 секунд, вы вернетесь на начадьный экран", preferredStyle: .alert)
//            alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
//            present(alert, animated: true)
//        } else if seconds >= 10 {
//            timer.invalidate()
//            navigationController?.popToRootViewController(animated: true)
//
//        }
    }

    @objc func resetTimer() {
  //      navigationController?.pushViewController(PhotosViewController(), animated: true) //не совсем правильно работает
//        seconds = 0
    }
}


extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
     func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else {
            return  arrayTable.count
        }
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.section == 0 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id1, for: indexPath)
                    as? PhotosTableViewCell else { return UITableViewCell() }
            return cell
        } else {
            
            
            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath)
                    as? PostTableViewCell else { return UITableViewCell() }
            
            let arrayNew = arrayTable[indexPath.row]
            cell.tableItem(with: arrayNew)
            return cell
        }
    }
//    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
//       if section == 0 {
//           return 10
//       } else {
//           return 0
//       }
//   }
//
//     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        nil
//    }

     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        nil
    }
    
     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
         if section == 0 {
             return 10
         } else {
             return 0
         }
        
    }
    
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {

        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {

        if indexPath.section == 0 {
            print("Did select cell at \(indexPath)")
            let photosViewController = PhotosViewController()
            navigationController?.pushViewController(photosViewController,animated: true)
           
        }
    }
      
}


protocol DidMoveToLikeDelegate: AnyObject {
    func didMoveToLike(post: PostView)
}

extension ProfileViewController: DidMoveToLikeDelegate {
    func didMoveToLike(post: PostView) {
//       viewModel.didMoveToLike(post: PostView)
    }
}

extension ProfileViewController: UITableViewDragDelegate, UITableViewDropDelegate {
    
    func tableView(_ tableView: UITableView, canHandle session: UIDropSession) -> Bool {
        return session.canLoadObjects(ofClass: NSString.self) && session.canLoadObjects(ofClass: NSString.self)
    }
    
    func tableView(_ tableView: UITableView, dropSessionDidUpdate session: UIDropSession, withDestinationIndexPath destinationIndexPath: IndexPath?) -> UITableViewDropProposal {
        if tableView.hasActiveDrag {
                    return UITableViewDropProposal(operation: .move, intent: .insertAtDestinationIndexPath)
                } else {
                    return UITableViewDropProposal(operation: .copy, intent: .insertAtDestinationIndexPath)
                }
    }
   
    func dragItems(for indexPath: IndexPath) -> [UIDragItem] {
        let post = arrayTable[indexPath.row]
        let titleProvider = NSItemProvider(object: post.author as NSString)
        let imageProvider = NSItemProvider(object: post.image)
        return [UIDragItem(itemProvider: titleProvider), UIDragItem(itemProvider: imageProvider)]
    }
    
    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
        originIndex = indexPath.row
        return dragItems(for: indexPath)
    }
    
    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
       
        let destinationIndexPath: IndexPath
               if let indexPath = coordinator.destinationIndexPath {
                   destinationIndexPath = indexPath
               } else {
                   let section = tableView.numberOfSections - 1
                   let row = tableView.numberOfRows(inSection: section)
                   destinationIndexPath = IndexPath(row: row, section: section)
               }
                       
               let rowInd = destinationIndexPath.row
               let group = DispatchGroup()
               
               var postDescription = String()
               group.enter()
               coordinator.session.loadObjects(ofClass: NSString.self) { objects in
                   let uStrings = objects as! [String]
                   for uString in uStrings {
                       postDescription = uString
                       break
                   }
                   group.leave()
               }
               
               var postImage = UIImage()
               group.enter()
               coordinator.session.loadObjects(ofClass: UIImage.self) { objects in
                   let uImages = objects as! [UIImage]
                   for uImage in uImages {
                       postImage = uImage
                       break
                   }
                   group.leave()
               }
               
               group.notify(queue: .main) {

                   if coordinator.proposal.operation == .move {
                       arrayTable.remove(at: self.originIndex)
                   }
                   let newPost = Posts(author: postDescription, description: "new", image: postImage, likes: 0, view: 0, id: UUID().uuidString)
                   
                   arrayTable.insert(newPost, at: rowInd - 1)
                   
                   tableView.reloadData()
               }
        
    }
}

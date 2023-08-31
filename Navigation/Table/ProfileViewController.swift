

import UIKit
import StorageService

final class ProfileViewController: UIViewController {

    var seconds = 0
    var timer = Timer()
    var posts:[Posts] = []
    
    
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
//        tableView.dragDelegate = self
//        tableView.dropDelegate = self
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


//extension ProfileViewController: UITableViewDragDelegate {
//    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
//        let post = posts[indexPath.row]
//        let imageItem = NSItemProvider(object: post.image!)
//
//    }
//}
//
//extension ProfileViewController: UITableViewDropDelegate {
//    func tableView(_ tableView: UITableView, performDropWith coordinator: UITableViewDropCoordinator) {
//        return
//    }
//
//
//}

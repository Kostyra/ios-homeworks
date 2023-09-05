//
//
//import UIKit
//import StorageService
//
//final class ProfileViewController: UIViewController, UITableViewDelegate {
//
//    var seconds = 0
//    var timer = Timer()
//    var posts:[Posts] = []
//    
//    
//    private lazy var backdrop: UIView = {
//      let backdrop = UIView()
//      backdrop.backgroundColor = .systemBlue.withAlphaComponent(0.7)
//      backdrop.isHidden = true
//      return backdrop
//    }()
//        
//     private let tableView: UITableView = {
//        let tableView = UITableView.init(
//            frame: .zero,
//            style: .plain
//        )
//        tableView.translatesAutoresizingMaskIntoConstraints = false
//        tableView.backgroundColor = .white
//        return tableView
//        
//    }()
//
//     private func tableViewCell() {
//        
//        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.id)
//        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: PhotosTableViewCell.id1)
//        tableView.delegate = self
//        tableView.dataSource = self
//        tableView.rowHeight = UITableView.automaticDimension
//        tableView.estimatedRowHeight = 44
//        
//    }
//    
//     func headerView() {
//        let headerView = ProfileHeaderView()
//         headerView.label.text = userInfo.name
//         headerView.photo.image = userInfo.avatar
////         let a = LogInViewController()
////         headerView.label.text =  a.temp
//        tableView.setAndLayout(headerView: headerView)
//        //tableView.tableFooterView = UIView()//UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 50))
//        tableView.backgroundColor = UIColor(named: "TabBar")
//        
//    }
//    
//    func getTeam(by indexPath: IndexPath) -> Team {
//      return groups[indexPath.section].teams[indexPath.row]
//    }
//
//    // MARK: - Interaction
//
//    func move(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//      tableView.performBatchUpdates({
//        tableView.moveRow(at: sourceIndexPath, to: destinationIndexPath)
//      }) { [weak self] _ in
//        guard let self = self else { return }
//        let team = self.groups[sourceIndexPath.section].teams.remove(at: sourceIndexPath.row)
//        self.groups[destinationIndexPath.section].teams.insert(team, at: destinationIndexPath.row)
//      }
//    }
//    func interact(from sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let from = getTeam(by: sourceIndexPath)
//        let to = getTeam(by: destinationIndexPath)
//        let alert = UIAlertController(
//            title: "Ineraction",
//            message: "\(from.name) vs  \(to.name)",
//            preferredStyle: .alert
//        )
//        alert.addAction(.init(title: "Ok", style: .cancel))
//        self.present(alert, animated: true)
//        
//    }
//
//    
//    
//    private func table() {
//        view.addSubview(tableView)
//        NSLayoutConstraint.activate([
//            tableView.topAnchor.constraint(equalTo:view.safeAreaLayoutGuide.topAnchor),
//            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
//            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
//            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
//        ])
//    }
//    
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dragInteractionEnabled = true
//        tableView.dragDelegate = self
//        tableView.dropDelegate = self
//        table()
//        tableViewCell()
//        headerView()
//        #if DEBUG
//        view.backgroundColor = UIColor(named: "TabBar")
//        #else
//        view.backgroundColor = UIColor(named: "TabBar")//.green
//        #endif
//        
////        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCancel), userInfo: nil, repeats: true)
////
////        let tap = UITapGestureRecognizer(target: self, action: #selector(resetTimer))
////        view.addGestureRecognizer(tap)
//    }
//    override func viewWillAppear(_ animated: Bool)  {
//        super.viewWillAppear(animated)
//        navigationController?.navigationBar.isHidden = true
//        
//    }
//    
//    @objc func timerCancel() {
//         
////        seconds += 1
////        if seconds == 20 {
////            let alert = UIAlertController(title: "Вниманиe", message: "Вы бездействовали больше 10 секунд, вы вернетесь на начадьный экран", preferredStyle: .alert)
////            alert.addAction(UIAlertAction(title: "Ok", style: .destructive))
////            present(alert, animated: true)
////        } else if seconds >= 10 {
////            timer.invalidate()
////            navigationController?.popToRootViewController(animated: true)
////
////        }
//    }
//
//    @objc func resetTimer() {
//  //      navigationController?.pushViewController(PhotosViewController(), animated: true) //не совсем правильно работает
////        seconds = 0
//    }
//}
//
//
//extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
//    
//     func numberOfSections(in tableView: UITableView) -> Int {
//        return 2
//    }
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        if section == 0 {
//            return 1
//        } else {
//            return  arrayTable.count
//        }
//    }
//        
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        
//        if indexPath.section == 0 {
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: PhotosTableViewCell.id1, for: indexPath)
//                    as? PhotosTableViewCell else { return UITableViewCell() }
//            return cell
//        } else {
//            
//            
//            guard let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.id, for: indexPath)
//                    as? PostTableViewCell else { return UITableViewCell() }
//            
//            let arrayNew = arrayTable[indexPath.row]
//            cell.tableItem(with: arrayNew)
//            return cell
//        }
//    }
////    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
////       if section == 0 {
////           return 10
////       } else {
////           return 0
////       }
////   }
////
////     func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
////        nil
////    }
//
//     func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
//        nil
//    }
//    
//     func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
//         if section == 0 {
//             return 10
//         } else {
//             return 0
//         }
//        
//    }
//    
//    
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//
//        return UITableView.automaticDimension
//    }
//    
//    func tableView(_ tableView: UITableView,didSelectRowAt indexPath: IndexPath) {
//
//        if indexPath.section == 0 {
//            print("Did select cell at \(indexPath)")
//            let photosViewController = PhotosViewController()
//            navigationController?.pushViewController(photosViewController,animated: true)
//           
//        }
//    }
//      
//}
//
//
//protocol DidMoveToLikeDelegate: AnyObject {
//    func didMoveToLike(post: PostView)
//}
//
//extension ProfileViewController: DidMoveToLikeDelegate {
//    func didMoveToLike(post: PostView) {
////       viewModel.didMoveToLike(post: PostView)
//    }
//}
//
//
////extension ProfileViewController: UITableViewDragDelegate {
////    func tableView(_ tableView: UITableView, itemsForBeginning session: UIDragSession, at indexPath: IndexPath) -> [UIDragItem] {
//////        let post = posts[indexPath.row]
//////        let imageItem = NSItemProvider(object: post.image!)
////        let item = UIDragItem(itemProvider: NSItemProvider())
////         item.localObject = indexPath
////         return [item]
////
////    }
////}
////
////extension ProfileViewController: UITableViewDropDelegate {
////    func tableView(
////      _ tableView: UITableView,
////      performDropWith coordinator: UITableViewDropCoordinator
////    ) {
////      guard
////        let item = coordinator.session.items.first,
////        let sourceIndexPath = item.localObject as? IndexPath,
////        let destinationIndexPath = coordinator.destinationIndexPath
////      else {
////        return
////      }
////
////      switch coordinator.proposal.intent {
////        case .insertAtDestinationIndexPath:
////          move(from: sourceIndexPath, to: destinationIndexPath)
////          coordinator.drop(item, toRowAt: destinationIndexPath)
////
////        case .insertIntoDestinationIndexPath:
////          interact(from: sourceIndexPath, to: destinationIndexPath)
////          coordinator.drop(item, toRowAt: sourceIndexPath)
////
////        default:
////          break
////      }
////
////      // Backdrop
////
////      backdrop.isHidden = true
////      backdrop.frame = .zero
////    }
////  }
////
////    func tableView(
////      _ tableView: UITableView,
////      dropSessionDidUpdate session: UIDropSession,
////      withDestinationIndexPath destinationIndexPath: IndexPath?
////    ) -> UITableViewDropProposal {
////      guard
////        let item = session.items.first,
////        let fromIndexPath = item.localObject as? IndexPath,
////        let toIndexPath = destinationIndexPath
////      else {
////        backdrop.frame = .zero
////        return UITableViewDropProposal(operation: .forbidden)
////      }
////
////        if fromIndexPath.section == toIndexPath.section {
////        return UITableViewDropProposal(
////                operation: .move,
////                intent: .automatic
////            )
////      }
////      return UITableViewDropProposal(
////        operation: .move,
////        intent: .insertIntoDestinationIndexPath
////      )
////    }
////}
//
//extension ProfileViewController: UITableViewDragDelegate {
//  func tableView(
//    _ tableView: UITableView,
//    itemsForBeginning session: UIDragSession,
//    at indexPath: IndexPath
//  ) -> [UIDragItem] {
//    backdrop.isHidden = false
//
//    let item = UIDragItem(itemProvider: NSItemProvider())
//    item.localObject = indexPath
//    return [item]
//  }
//
//  func tableView(
//    _ tableView: UITableView,
//    dragPreviewParametersForRowAt indexPath: IndexPath
//  ) -> UIDragPreviewParameters? {
//    guard
//      let cell = tableView.cellForRow(at: indexPath)
//    else {
//      return nil
//    }
//    let preview = UIDragPreviewParameters()
//    preview.visiblePath = UIBezierPath(roundedRect: cell.bounds.insetBy(dx: 5, dy: 5), cornerRadius: 12)
//    return preview
//  }
//
//}
//
//// MARK: - UITableViewDragDelegate
//
//extension ProfileViewController: UITableViewDropDelegate {
//
//  func tableView(
//    _ tableView: UITableView,
//    dropSessionDidUpdate session: UIDropSession,
//    withDestinationIndexPath destinationIndexPath: IndexPath?
//  ) -> UITableViewDropProposal {
//    guard
//      let item = session.items.first,
//      let fromIndexPath = item.localObject as? IndexPath,
//      let toIndexPath = destinationIndexPath
//    else {
//      backdrop.frame = .zero
//      return UITableViewDropProposal(operation: .forbidden)
//    }
//
//    // Backdrop
//    
//    if let firstCell = tableView.cellForRow(at: toIndexPath) {
//      let headerFrame = tableView.rectForHeader(inSection: toIndexPath.section)
//      let newFrame = CGRect(
//        x: headerFrame.minX,
//        y: headerFrame.maxY + (CGFloat(toIndexPath.row) * firstCell.frame.height),
//        width: firstCell.frame.width,
//        height: firstCell.frame.height
//      )
//
//      if backdrop.frame == .zero {
//        backdrop.frame = newFrame
//      } else {
//        UIView.animate(withDuration: 0.15) { [backdrop] in
//          backdrop.frame = newFrame
//        }
//      }
//    } else {
//      backdrop.frame = .zero
//    }
//
//    if fromIndexPath.section == toIndexPath.section {
//      return .init(operation: .move, intent: .automatic)
//    }
//    return UITableViewDropProposal(
//      operation: .move,
//      intent: .insertIntoDestinationIndexPath
//    )
//  }
//
//  func tableView(
//    _ tableView: UITableView,
//    performDropWith coordinator: UITableViewDropCoordinator
//  ) {
//    guard
//      let item = coordinator.session.items.first,
//      let sourceIndexPath = item.localObject as? IndexPath,
//      let destinationIndexPath = coordinator.destinationIndexPath
//    else {
//      return
//    }
//
//    switch coordinator.proposal.intent {
//      case .insertAtDestinationIndexPath:
//        move(from: sourceIndexPath, to: destinationIndexPath)
//        coordinator.drop(item, toRowAt: destinationIndexPath)
//
//      case .insertIntoDestinationIndexPath:
//        interact(from: sourceIndexPath, to: destinationIndexPath)
//        coordinator.drop(item, toRowAt: sourceIndexPath)
//
//      default:
//        break
//    }
//
//    // Backdrop
//
//    backdrop.isHidden = true
//    backdrop.frame = .zero
//  }
//}

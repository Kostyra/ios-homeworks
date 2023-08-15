import UIKit


//MARK: - protocol

protocol MapCoordinatorProtocol:AnyObject {
    var navigationController: UINavigationController? {get set}
    func showDetail()
    func pop()
}

//MARK: - class
class MapCoordinator:MapCoordinatorProtocol {
    var navigationController: UINavigationController?
    
    //MARK: - Method
    func showDetail() {
        let postVC = UIViewController()
        navigationController?.pushViewController(postVC, animated: true)
    }
    
    //MARK: - Proportis
    func pop() {
        navigationController?.popViewController(animated: true)
    }
}

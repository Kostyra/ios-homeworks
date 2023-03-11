//
//  FeedViewController.swift
//  Navigation
//
//  Created by  Konstantin Filippov on 08.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
 
    
    var post = Post(title:"PostView")
    
    private lazy var button: UIButton = {
        let button = UIButton()
        button.setTitle("Button", for: .normal)
        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
      
    override func viewDidLoad() {
        super.viewDidLoad()


        view.addSubview(button)
   }
    @objc func buttonAction(sender: UIButton!) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }


   
}

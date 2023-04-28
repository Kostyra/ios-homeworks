//
//  PostViewController.swift
//  Navigation
//
//  Created by  Konstantin Filippov on 09.03.2023.
//

import UIKit

class PostViewController: UIViewController {
    
    
    var titlePost: String = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = titlePost
        view.backgroundColor = .systemRed

        
        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonItem))
        navigationItem.rightBarButtonItem = barButtonItem
       
   }
    @objc func buttonItem() {
        let infoViewController = InfoViewController()
        infoViewController.modalTransitionStyle = .crossDissolve
        infoViewController.modalPresentationStyle = .formSheet
        present(infoViewController, animated:true)
    }



}

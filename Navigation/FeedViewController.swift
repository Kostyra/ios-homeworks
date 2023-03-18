//
//  FeedViewController.swift
//  Navigation
//
//  Created by  Konstantin Filippov on 08.03.2023.
//

import UIKit

class FeedViewController: UIViewController {
    
 
    
    var post = Post(title:"PostView")
    
    private lazy var buttonGreen: UIButton = {
        let button = UIButton()
        button.setTitle("Button Green", for: .normal)
//        button.frame = CGRect(x: 100, y: 100, width: 200, height: 50)
        button.backgroundColor = .green
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var buttonPink: UIButton = {
        let button = UIButton()
        button.setTitle("Button Pink", for: .normal)
        button.backgroundColor = .systemPink
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
        stackView.spacing = 10
        
        
        stackView.addArrangedSubview(self.buttonPink)
        stackView.addArrangedSubview(self.buttonGreen)
        
        return stackView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(stackView)
        stackViewConstraint()
        
   }
    @objc func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = post.title
    }
    private func stackViewConstraint() {
        NSLayoutConstraint.activate([
            
 //           stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 10),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            stackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor , constant: -100),
//            stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 10),
//            stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -10),
            stackView.heightAnchor.constraint(equalToConstant: 100),
            stackView.widthAnchor.constraint(equalToConstant: 300)
        ])
    }

   
}

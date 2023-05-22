//
//  FeedViewController.swift
//  Navigation
//
//  Created by  Konstantin Filippov on 08.03.2023.
//

import UIKit


class FeedViewController: UIViewController {
    
    let passFeedModel = FeedModel()
    
    var post = Post(title:"PostView")
    
    private lazy var buttonGreen: CustomButton = {
        let button = CustomButton(title: "Button Green",
                                  titleColor: .white,
                                  backgroundColor: .green,
                                  action: buttonAction)
        return button
    }()
    
    private lazy var buttonPink: CustomButton = {
        let button = CustomButton(title: "Button Pink",
                                  titleColor: .white,
                                  backgroundColor: .systemPink,
                                  action: buttonAction)
        return button
    }()
    
    private lazy var checkGuessButton: CustomButton = {
        let button = CustomButton(title: "checkGuessButton",
                                  titleColor: .white,
                                  backgroundColor: .systemBlue,
                                  action: buttonAFieldText)
        return button
    }()
    
    private lazy var labelCheck: UILabel = {
        let colorLabrl = UILabel()
        colorLabrl.translatesAutoresizingMaskIntoConstraints = false
        colorLabrl.backgroundColor = .white
        return colorLabrl
    
    }()
    
    
    private lazy var textPassword: UITextField = {
        let text = UITextField()
        text.backgroundColor = .cyan
        text.translatesAutoresizingMaskIntoConstraints = false
        text.placeholder = "secret"
        text.text = ""
        
        return text
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
        stackView.addArrangedSubview(self.textPassword)
        stackView.addArrangedSubview(self.checkGuessButton)
        stackView.addArrangedSubview(self.labelCheck)
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
    @objc func buttonAFieldText() {
        guard let check = textPassword.text , !check.isEmpty  else {return labelCheck.backgroundColor = .red}
        let isCorrect = passFeedModel.check(passFeed: check)
        if isCorrect == true {
            labelCheck.backgroundColor = .green
        } else   {
            labelCheck.backgroundColor = .red
            
        }
    }
    
    private func stackViewConstraint() {
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 260),
            stackView.widthAnchor.constraint(equalToConstant: 300),
            

        ])
    }

   
}

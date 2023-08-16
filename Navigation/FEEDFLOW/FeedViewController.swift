//
//  FeedViewController.swift
//  Navigation
//
//  Created by  Konstantin Filippov on 08.03.2023.
//

import UIKit


class FeedViewController: UIViewController {
    
    //let passFeedModel = FeedModel()
    //MARK: - MVC
//    private let feedViewModel:FeedViewModel?
//    init(feedViewModel: FeedViewModel?) {
//        self.feedViewModel = feedViewModel
//        super.init(nibName: nil, bundle: nil)
//    }
    
    //MARK: - Private Proportis
    
    
    private let viewModel:FeedViewModelProtocol
            
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
                                  action: buttonFieldText)
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
    
    //MARK: - lifecycle
    
    init(feedViewModel: FeedViewModelProtocol) {
        self.viewModel = feedViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        setupViewConstraint()
        bindViewModel()
   }
    
    //MARK: - private method
    
    private func setupView() { //rename
        view.addSubview(stackView)
    }
    
    private func bindViewModel() {
        viewModel.stateChanged = { [weak self] state in
            switch state {

            case .wrong(let text):
                let localize = NSLocalizedString("Error", comment: "")
                let localizeAction = NSLocalizedString("Ok", comment: "")
                let alert = UIAlertController(title: localize, message: "\(text)", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: localizeAction, style: .default))
                self!.present(alert, animated: true)
                print(1)
                self?.labelCheck.backgroundColor = .red
            case .correct:
                print(2)
                self?.labelCheck.backgroundColor = .green
            case .uncorrect:
    
                self?.labelCheck.backgroundColor = .red

            }
        }
    }
    
    private func setupViewConstraint() { // rename
        NSLayoutConstraint.activate([
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.heightAnchor.constraint(equalToConstant: 260),
            stackView.widthAnchor.constraint(equalToConstant: 300),
        ])
    }
    
    //MARK: - OBJC
    
    @objc func buttonAction() {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
        postViewController.titlePost = viewModel.post.title
    }
    
    @objc func buttonFieldText() {
        viewModel.wordSecret(textPassword.text)
        //MARK: - MVC
//        guard let check = textPassword.text , !check.isEmpty  else {return labelCheck.backgroundColor = .red}
//
//        let isCorrect = feedViewModel?.feedModel!.check(passFeed: check)
//        if isCorrect == true {
//            labelCheck.backgroundColor = .green
//        } else   {
//            labelCheck.backgroundColor = .red
//        }
        
        //MARK: - MVVM
//        feedViewModel.stateChanged = { [weak self] result in
//            switch result {
//            case .correct:
//                print(1)
//                self?.labelCheck.backgroundColor = .green
//            case .uncorrect:
//                print(2)
//                self?.labelCheck.backgroundColor = .red
//            }
//        }
    }
    
    
}

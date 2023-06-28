

import UIKit

class LogInViewController: UIViewController  {
    
    var loginDelegate:LoginViewControllerDelegate?
    
    var networkManager = NetworkManager()
    
//    private lazy var delimiter:DelimiterView = {
//        let delimiter = DelimiterView()
//        delimiter.translatesAutoresizingMaskIntoConstraints = false
//        delimiter.backgroundColor = .systemBlue
//        return delimiter
//    }()
    
    private lazy var imageVK: UIImageView = {
        let image  = UIImage(named: "logo")
        let imageView = UIImageView(image: image!)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var login: UITextField = { [unowned self] in
        let textField = UITextField()
        textField.layer.borderColor  = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor(named: "Color")
        textField.autocapitalizationType = .none
        textField.backgroundColor = .systemGray6
        textField.placeholder = "Pop"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        return textField
    }()
    
    private lazy var pass: UITextField = { [unowned self] in
        let textField = UITextField()
        textField.layer.borderColor  = UIColor.lightGray.cgColor
        textField.layer.borderWidth = 0.5
        textField.layer.cornerRadius = 10
        textField.layer.maskedCorners = [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textField.tintColor = UIColor(named: "Color")
        textField.autocapitalizationType = .none
        textField.isSecureTextEntry = true
        textField.backgroundColor = .systemGray6
        textField.placeholder = "123"
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.clipsToBounds = true
        textField.autocorrectionType = UITextAutocorrectionType.no
        textField.keyboardType = UIKeyboardType.default
        textField.returnKeyType = UIReturnKeyType.done
        textField.clearButtonMode = UITextField.ViewMode.whileEditing
        textField.contentVerticalAlignment = UIControl.ContentVerticalAlignment.center
        textField.delegate = self
        return textField
    }()
    
    
    private lazy var buttonEnter: CustomButton = {
        let button = CustomButton(title: "Log in",
                                  titleColor: .white,
                                  backgroundColor: UIColor(named: "Color") ,
                                  action: buttonActionProfile)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.setTitle("Log in", for: .normal)
        //button.backgroundColor = UIColor(named: "Color")
        //button.addTarget(self, action: #selector(buttonActionProfile), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var buttonBrutForce: CustomButton = {
        let button = CustomButton(title: "Brut",
                                  titleColor: .white,
                                  backgroundColor: UIColor(named: "Color") ,
                                  action: buttonActionBrutForce)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(buttonActionBrutForce), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var buttonLogResult: CustomButton = {
        let button = CustomButton(title: "LogResult",
                                  titleColor: .white,
                                  backgroundColor: UIColor(named: "Color") ,
                                  action: buttonActionLogResult)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        //button.addTarget(self, action: #selector(buttonActionBrutForce), for: .touchUpInside)
        return button
        
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contantView: UIView = {
        let contantView = UIView()
        contantView.translatesAutoresizingMaskIntoConstraints = false
        contantView.backgroundColor = .systemBackground
        return contantView
    }()
    
    private lazy var stackViewLoginPass: UIStackView = { [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.alignment = .fill
//        stackView.spacing = 0.2
        
        stackView.addArrangedSubview(self.login)
//        stackView.addArrangedSubview(delimiter)
        stackView.addArrangedSubview(self.pass)
        
        return stackView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let indicator = UIActivityIndicatorView(style: .medium)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        return indicator
    }()
    
    
    private func viewLogin() {
        view.addSubview(scrollView)
        scrollView.addSubview(contantView)
        contantView.addSubview(imageVK)
        contantView.addSubview(stackViewLoginPass)
        contantView.addSubview(buttonEnter)
        contantView.addSubview(buttonBrutForce)
        contantView.addSubview(activityIndicator)
        contantView.addSubview(buttonLogResult)
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            scrollView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            
            contantView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contantView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contantView.leftAnchor.constraint(equalTo: scrollView.leftAnchor),
            contantView.rightAnchor.constraint(equalTo: scrollView.rightAnchor),
            contantView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            imageVK.topAnchor.constraint(equalTo: contantView.topAnchor, constant: 120),
            imageVK.heightAnchor.constraint(equalToConstant: 100),
            imageVK.widthAnchor.constraint(equalToConstant: 100),
            imageVK.centerXAnchor.constraint(equalTo: contantView.centerXAnchor),
            
            stackViewLoginPass.topAnchor.constraint(equalTo: imageVK.bottomAnchor ,constant: 120),
            stackViewLoginPass.leftAnchor.constraint(equalTo: contantView.leftAnchor, constant: 16),
            stackViewLoginPass.rightAnchor.constraint(equalTo: contantView.rightAnchor , constant:-16),
            stackViewLoginPass.heightAnchor.constraint(equalToConstant: 100.5),
            
            buttonEnter.topAnchor.constraint(equalTo: stackViewLoginPass.bottomAnchor, constant: 16),
            buttonEnter.leftAnchor.constraint(equalTo: contantView.leftAnchor, constant: 16),
            buttonEnter.rightAnchor.constraint(equalTo: contantView.rightAnchor, constant: -16),
            buttonEnter.heightAnchor.constraint(equalToConstant: 50),
//            buttonEnter.bottomAnchor.constraint(equalTo: contantView.safeAreaLayoutGuide.bottomAnchor),
            
            buttonBrutForce.topAnchor.constraint(equalTo: buttonEnter.bottomAnchor, constant: 16),
            buttonBrutForce.leftAnchor.constraint(equalTo: contantView.leftAnchor, constant: 16),
            buttonBrutForce.rightAnchor.constraint(equalTo: contantView.rightAnchor, constant: -16),
            buttonBrutForce.heightAnchor.constraint(equalToConstant: 50),
//            buttonBrutForce.bottomAnchor.constraint(equalTo: contantView.safeAreaLayoutGuide.bottomAnchor),
            
            buttonLogResult.topAnchor.constraint(equalTo: buttonBrutForce.bottomAnchor, constant: 16),
            buttonLogResult.leftAnchor.constraint(equalTo: contantView.leftAnchor, constant: 16),
            buttonLogResult.rightAnchor.constraint(equalTo: contantView.rightAnchor, constant: -16),
            buttonLogResult.heightAnchor.constraint(equalToConstant: 50),
            buttonLogResult.bottomAnchor.constraint(equalTo: contantView.safeAreaLayoutGuide.bottomAnchor),
            
            activityIndicator.centerXAnchor.constraint(equalTo: contantView.centerXAnchor),
            activityIndicator.bottomAnchor.constraint(equalTo: stackViewLoginPass.topAnchor,constant: -16)
        ])
        
    }
    
    private func setupView() {
        //view.backgroundColor = .systemPink
        navigationItem.title = ""
        navigationController?.navigationBar.prefersLargeTitles = false
        
    }
    
    
    private func setupKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willShowKeyboard(_:)),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        notificationCenter.addObserver(
            self,
            selector: #selector(self.willHideKeyboard(_:)),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    private func removeKeyboardObservers() {
        let notificationCenter = NotificationCenter.default
        notificationCenter.removeObserver(self)
    }
    
    @objc func willShowKeyboard(_ notification: NSNotification) {
        guard let keyboardHeight = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue.height
        else { return }
        let buttonEnterBottomPointY = (buttonEnter.frame.maxY + scrollView.frame.origin.y)
        let keyboardHeightPointY = view.frame.height - keyboardHeight
        let yOffSet = keyboardHeightPointY < buttonEnterBottomPointY ? buttonEnterBottomPointY - keyboardHeightPointY + 10 : 0
        scrollView.setContentOffset(CGPoint(x: 0, y: yOffSet), animated: true)
    }
        
    
    @objc func willHideKeyboard(_ notification: NSNotification) {
        scrollView.setContentOffset(CGPoint(x: 0, y: 0), animated: true)
    }
    
     var textLogin:String { return login.text ?? ""}
    
     @objc func buttonActionProfile() {
        #if DEBUG
         let myLogin = TestUserService(user: userInfo)
        #else
         let myLogin = CurrentUserService(user: userInfo)
        #endif
         
         guard let userName = login.text , let password = pass.text else {return}
         
//         let inspector = LoginInspector()
//         let valid = inspector.validate(userName: userName, password: password)

         let valid = loginDelegate?.check(userName: userName, password: password)
         if valid == true {
            let profileViewController = ProfileViewController()
            self.navigationController?.pushViewController(profileViewController, animated: true)
         } else if let userIndefication =  myLogin.pass(login: textLogin), myLogin.pass(login: textLogin) != nil {
            let profileViewController = ProfileViewController()
            self.navigationController?.pushViewController(profileViewController, animated: true)
             print(userIndefication.name)
         } else {
             let alert = UIAlertController(title: "Ошибка", message: "Проверьте введенный логин и пароль", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            present(alert, animated: true)
         }
    }
    
    @objc private func  buttonActionLogResult() {
        guard let userName = login.text , let password = pass.text else {return}
        let inspector = LoginInspector()
        _ = inspector.validate(userName: userName, password: password) { result in
             switch result {
             case .success(_):
                 print("good")
             case .failure(_):
                 print("bad")
             }
         }
    }
    
    
   @objc private func buttonActionBrutForce(){
       
//       NetworkManager.request(for: AppConfiguration.randomConfig(), completion: { massegeText in
//           DispatchQueue.main.async {
//               print (massegeText as Any)
//               
//           }
//       })
           

        self.activityIndicator.startAnimating()
        let bruteForce = BruteForce()
        let randomPassword = bruteForce.getRandomPassword(lenght: 4)
       // let randomPassword = "123" //original pass
       print(randomPassword)
       DispatchQueue(label: "BrutForce", qos: .userInteractive).async {
           let stolenPassword = bruteForce.bruteForce(passwordToUnlock: randomPassword)
           DispatchQueue.main.async {
               self.activityIndicator.stopAnimating()
               self.succesHacking(stolenPassword: stolenPassword)
           }
       }
    }
    
    private func succesHacking(stolenPassword: String){
         self.pass.text = stolenPassword
         self.pass.isSecureTextEntry = false
     }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewLogin()
        setupView()
//        delimitreFunk()
    }

    override func viewWillAppear(_ animated: Bool)  {
        super.viewWillAppear(animated)
        setupKeyboardObservers()
        self.navigationController?.navigationBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        removeKeyboardObservers()
    }
   
}

extension LogInViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(
        _ textField: UITextField
    ) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
    
}

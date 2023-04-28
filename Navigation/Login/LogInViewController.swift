

import UIKit

class LogInViewController: UIViewController  {
    
    
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
        textField.placeholder = "Email of phone"
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
        textField.placeholder = "Password"
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
        let button = CustomButton()
        button.setTitle("Log in", for: .normal)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "Color")
        button.addTarget(self, action: #selector(buttonActionProfile), for: .touchUpInside)
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
        stackView.spacing = 0.2
        
        stackView.addArrangedSubview(self.login)
//        stackView.addArrangedSubview(delimiter)
        stackView.addArrangedSubview(self.pass)
        
        return stackView
    }()
    
    
    private func viewLogin() {
        view.addSubview(scrollView)
        scrollView.addSubview(contantView)
        contantView.addSubview(imageVK)
        contantView.addSubview(stackViewLoginPass)
        contantView.addSubview(buttonEnter)
        
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
            buttonEnter.bottomAnchor.constraint(equalTo: contantView.safeAreaLayoutGuide.bottomAnchor),
        ])
        
    }
    
    private func setupView() {
        view.backgroundColor = .systemPink
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
    
    @objc func buttonActionProfile() {
        let profileViewController = ProfileViewController()
        self.navigationController?.pushViewController(profileViewController, animated: true)
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



import Foundation
import UIKit

class RealmViewController:UIViewController {
    
    
    var loginsModel: [LoginModel] = []
    var realmSevice: IRealmSevice = RealmSevice()
    
    
    private lazy var buttonBAck: CustomButton = {
        let button = CustomButton(title: "  Sing Out  ",
                                  titleColor: .white,
                                  backgroundColor: UIColor(named: "Color") ,
                                  action: buttonActionBack)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    private lazy var buttonSingOut: CustomButton = {
        let button = CustomButton(title: "  Sing up Realm  ",
                                  titleColor: .white,
                                  backgroundColor: UIColor(named: "Color") ,
                                  action: buttonActionSingOut)
        button.layer.cornerRadius = 10
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
        
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        setupView()
    }
    
    @objc func buttonActionBack() {

        dismiss(animated: true)
    }
    
    @objc func buttonActionSingOut() {
        let deltete = self.realmSevice.delete()
        if deltete {
            print("delete")
        }
    }
    
    private func setupView() {
        view.addSubview(buttonBAck)
        view.addSubview(buttonSingOut)
        
        NSLayoutConstraint.activate([
            buttonBAck.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 20),
            buttonBAck.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            buttonSingOut.topAnchor.constraint(equalTo: buttonBAck.bottomAnchor, constant: 20),
            buttonSingOut.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}


//
//  Profile.swift
//  Navigation
//
//  Created by Юлия Филиппова on 14.03.2023.
//

import UIKit

class ProfileHeaderView: UIView {
        
        //    let myImage = UIImage(name:"images")
        //    let imageView = UIImageView(myImage: myImage!)
        //    imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        //    self.view.addSubview(imageView)
 
//    override func draw(_ rect: CGRect) {
//        view.translatesAutoresizingMaskIntoConstraints = false
//        let image = UIImage(named: "images")
//        let imageView = UIImageView(image: image!)
//        imageView.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
//        addSubview(imageView)
//
//    }

    
    
    private lazy var photo: UIImageView = {
        let image = UIImage(named: "images")
        let imageView = UIImageView(image: image!)
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        //imageView.layer.cornerRadius = imageView.frame.height/2.5
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
    }()
    private lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Old Castle"
//        label.font = label.font.withSize(18)
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelGrey: UILabel = {
        let labelGrey = UILabel()
        labelGrey.text = "The Castle was buld in 1898. First owner"
        labelGrey.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelGrey.textColor = .gray
        labelGrey.translatesAutoresizingMaskIntoConstraints = false
        
        return labelGrey
    }()
    
    private lazy var textField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.layer.cornerRadius = 12
        textField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor.black.cgColor
        textField.placeholder = "Write Status"
        textField.textAlignment  = .center
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return textField
    }()
    
    private lazy var buttonStatus: UIButton = {
        let button = UIButton()
        button.backgroundColor = .systemBlue
        button.setTitle("Show status", for: .normal)
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowOpacity = 0.7
        button.layer.shadowColor = UIColor.black.cgColor
        button.translatesAutoresizingMaskIntoConstraints = false
//        button.clipsToBounds = false
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return button
    }()
    
    private var statusText:  String { return textField.text ?? ""}
    
    @objc private  func buttonPress(sender: UIButton) {
        if statusText != "" {
            sender.setTitle(statusText, for: .normal)
        } else { sender.setTitle("Write new status", for: .normal)
        }
        print(sender.currentTitle!)
    }
    
    @objc private func statusTextChanged(_ textField: UITextField) {
        print(textField.text ?? "")
    }
    
    private func size() {
        addSubview(photo)
        addSubview(label)
        addSubview(buttonStatus)
        addSubview(labelGrey)
        addSubview(textField)
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            photo.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            photo.widthAnchor.constraint(equalToConstant: 150),
            photo.heightAnchor.constraint(equalToConstant: 150),
            
            label.topAnchor.constraint(equalTo: topAnchor, constant: 27),
            label.leftAnchor.constraint(equalTo: photo.rightAnchor, constant: 20),
            label.rightAnchor.constraint(equalTo: rightAnchor , constant: -20),
    
            buttonStatus.topAnchor.constraint(equalTo: photo.bottomAnchor,constant:16),
            buttonStatus.leftAnchor.constraint(equalTo: leftAnchor , constant: 16),
            buttonStatus.rightAnchor.constraint(equalTo: rightAnchor, constant:-16),
            buttonStatus.heightAnchor.constraint(equalToConstant: 50),
            
            labelGrey.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10),
            labelGrey.leftAnchor.constraint(equalTo: photo.rightAnchor,constant: 20),
            labelGrey.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
        
            textField.bottomAnchor.constraint(equalTo: buttonStatus.topAnchor, constant: -10),
            textField.leftAnchor.constraint(equalTo: photo.rightAnchor, constant: 20),
            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
            textField.heightAnchor.constraint(equalToConstant: 40)
        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        size()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

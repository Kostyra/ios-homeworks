

import UIKit

class PhotosViewCell: UIView  {
    
    
    
    private lazy var labelPhoto: UILabel = {
        let label = UILabel()
        label.text = "Photos"
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private lazy var photo: UIImageView = {
        let image = UIImage(named: arrayStark[0].imageStarks)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var photo1: UIImageView = {
        let image = UIImage(named: arrayStark[1].imageStarks)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var photo2: UIImageView = {
        let image = UIImage(named: arrayStark[2].imageStarks)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var photo3: UIImageView = {
        let image = UIImage(named: arrayStark[3].imageStarks)
        let imageView = UIImageView(image: image!)
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.layer.cornerRadius = 6
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var stackViewPhoto: UIStackView = {  [unowned self] in
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.clipsToBounds = true
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        stackView.alignment = .fill
        stackView.spacing = 8
        
        stackView.addArrangedSubview(photo)
        stackView.addArrangedSubview(photo1)
        stackView.addArrangedSubview(photo2)
        stackView.addArrangedSubview(photo3)
        
        return stackView
    }()
    
    let imageArrow = UIImage(systemName: "arrow.right")
    
    
    private lazy var buttonPhoto: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(imageArrow, for: UIControl.State.normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
        
        return button
    }()
    
    
    @objc private  func buttonAction(sender: UIButton){
//        let photosViewController = PhotosViewController()
//        navigationController?.pushViewController(photosViewController, animated: true)
        print("My image button tapped")
    }
    
    
//
//    private lazy var barButtonItem:UIBarButtonItem = {
//        let barButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(buttonItemPhoto))
//
//        navigationItem.rightBarButtonItem = barButtonItem
//        return barButtonItem
//    }()
//
//
//    @objc func buttonItemPhoto() {
//        let infoViewController = InfoViewController()
//        infoViewController.modalTransitionStyle = .crossDissolve
//        infoViewController.modalPresentationStyle = .formSheet
//        present(infoViewController, animated:true)
//    }
    
    func imageS() {
        addSubview(labelPhoto)
        addSubview(stackViewPhoto)
        addSubview(buttonPhoto)
        NSLayoutConstraint.activate([
            labelPhoto.topAnchor.constraint(equalTo: topAnchor,constant: 12),
            labelPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            
            buttonPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            buttonPhoto.centerYAnchor.constraint(equalTo: labelPhoto.centerYAnchor),
            buttonPhoto.widthAnchor.constraint(equalToConstant: 30),
            buttonPhoto.heightAnchor.constraint(equalToConstant: 30),
            
            stackViewPhoto.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 12),
            stackViewPhoto.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            stackViewPhoto.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12),
            stackViewPhoto.heightAnchor.constraint(equalToConstant: 60),
            stackViewPhoto.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),
            
            
//            photo.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 12),
//            photo.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 16),
//            photo.heightAnchor.constraint(equalToConstant: 100),
//            photo.widthAnchor.constraint(equalToConstant: 60),
//            photo.bottomAnchor.constraint(equalTo: bottomAnchor, constant:12),
//
//
//            photo1.topAnchor.constraint(equalTo: labelPhoto.bottomAnchor, constant: 12),
//            photo1.leadingAnchor.constraint(equalTo: photo.trailingAnchor,constant: 16),
//            photo1.heightAnchor.constraint(equalToConstant: 100),
//            photo1.widthAnchor.constraint(equalToConstant: 60),
//            photo1.bottomAnchor.constraint(equalTo: bottomAnchor, constant:12)
            
        ])
    }
    
    
    
    
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        imageS()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    
}



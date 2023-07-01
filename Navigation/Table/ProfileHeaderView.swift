import UIKit
import SnapKit

class ProfileHeaderView: UIView {
    
    let neetworkJSONSerialization = NeetworkJSONSerialization()
    let networkJSONDecoder = NetworkJSONDecoder()
    
    static let id2  = "ProfileHeaderView"
    private var animatePhoto = CGPoint()
//    private let myPhoto = userInfo.avatar
//    private let myInfo = userInfo.name
    
     lazy var photo: UIImageView = {
//        let image = myPhoto                              //UIImage(named: "images")
//        let imageView = UIImageView(image: image)
        let imageView = UIImageView()
        imageView.layer.borderWidth = 3.0
        imageView.layer.borderColor = UIColor.white.cgColor
        imageView.layer.cornerRadius = 75
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
//        imageView.contentMode = .scaleAspectFit
        let pressPhoto = UITapGestureRecognizer(target: self, action:#selector(pressImage))
        imageView.isUserInteractionEnabled = true
        imageView.addGestureRecognizer(pressPhoto)
        
        return imageView
    }()
     lazy var label: UILabel = {
        let label = UILabel()
        //label.text = myInfo                                       //"Old Castle"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var labelGrey: UILabel = {
        let labelGrey = UILabel()
        //labelGrey.text = "The Castle was buld in 1898. First owner"
        labelGrey.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        labelGrey.textColor = .gray
        labelGrey.translatesAutoresizingMaskIntoConstraints = false
        return labelGrey
    }()
    
    private lazy var labelGreyTwo: UILabel = {
        let labelGrey = UILabel()
//        labelGrey.text = "The Castle was buld in 1898. First owner"
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
        button.addTarget(self, action: #selector(buttonPress), for: .touchUpInside)
        return button
    }()
    
    private lazy var uiview: UIView = {
        let uiview = UIView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        uiview.alpha = 0
        uiview.isHidden = true
        uiview.backgroundColor = .systemGray
        return uiview
    }()
    
    private lazy var buttonX: UIButton = {
       let button = UIButton()
        button.alpha = 0
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setImage(.remove, for: .normal)
        button.addTarget(self, action: #selector(buttonX(_:)), for: .touchUpInside)
        return button
    }()
    
    private var statusText:  String { return textField.text ?? ""}
    
    private func urlSession() {
        neetworkJSONSerialization.infoVCLabel { [weak self] textTitle in
            DispatchQueue.main.async{
                self?.labelGrey.text = textTitle
            }
        }
    }
    
    private func urlSessionDecoder() {
        networkJSONDecoder.infoPlanetTatuin { [weak self] text, name  in
            DispatchQueue.main.async {
                self?.labelGreyTwo.text = "Planet \(String(describing:name ?? "")) \(String(describing: text ?? "")) hour"
                
            }
        }
    }
    
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
    
    @objc private func pressImage(gesture: UIGestureRecognizer){
        if gesture.state == .ended {
            print("Press end")
        }
        photo.isUserInteractionEnabled = false
        
        animatePhoto = photo.center
        print(animatePhoto)
        let screen = UIScreen.main.bounds.width / photo.bounds.width
        UIImageView.animate(withDuration: 0.5, delay: 0.3, options: .curveLinear){
            self.photo.transform = CGAffineTransform(scaleX: screen, y: screen)
            self.photo.layer.cornerRadius = 0
            self.photo.layer.borderColor = UIColor.green.cgColor
            self.photo.center =  CGPoint(x: UIScreen.main.bounds.midX, y: UIScreen.main.bounds.midY )
            self.uiview.isHidden = false
            self.uiview.alpha = 0.7
        } completion: { finished in UIImageView.animate(withDuration: 0.3) {
                print("finish_1")
                self.buttonX.alpha = 1
            }
        }
    }
        
    @objc private func buttonX(_ sender: UIButton) {
        print("press")
        photo.isUserInteractionEnabled = true
               UIImageView.animate(withDuration: 0.5){
                   print(self.animatePhoto)
                   self.photo.center = self.animatePhoto
                   self.photo.transform = CGAffineTransform(scaleX: 1, y: 1)
                   self.photo.layer.cornerRadius = 75
                   self.photo.layer.borderColor = UIColor.white.cgColor
                   self.uiview.isHidden = true
                   self.uiview.alpha = 0
                   self.buttonX.alpha = 0
               } completion: { finished in UIImageView.animate(withDuration: 0.3) {
                   print("finish_2")
               }
           }
    }

    private lazy var box: UIView = {
       let box = UIView()
        return box
    }()
    
    private func size() {
        
       
        addSubview(box)
        addSubview(label)
        addSubview(buttonStatus)
        addSubview(labelGrey)
        addSubview(labelGreyTwo)
        addSubview(textField)
        
        addSubview(uiview)
        addSubview(photo)
        addSubview(buttonX)
        
     
        box.snp.makeConstraints{ make in
            make.height.equalToSuperview().inset(130)
        }

        photo.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(16)
            make.left.equalToSuperview().inset(16)
            make.height.width.equalTo(150)
        }

        buttonStatus.snp.makeConstraints{ make in
            make.top.equalTo(photo.snp.bottom).inset(-27)
            make.left.right.equalToSuperview().inset(16)
            make.height.equalTo(50)
        }

        buttonX.snp.makeConstraints{ make in
            make.top.equalToSuperview().inset(16)
            make.right.equalToSuperview().inset(16)
            make.width.height.equalTo(30)
        }

        label.snp.makeConstraints { make in
            make.top.equalTo(27)
            make.left.equalTo(photo.snp.right).inset(-20)
            make.right.equalToSuperview().inset(20)
        }

        labelGrey.snp.makeConstraints{ make in
            make.bottom.equalTo(textField.snp.top).inset(-10)
            make.left.equalTo(photo.snp.right).inset(-20)
            make.right.equalToSuperview().inset(20)
        }
        
        labelGreyTwo.snp.makeConstraints{ make in
            make.bottom.equalTo(labelGrey.snp.top).inset(-5)
            make.left.equalTo(photo.snp.right).inset(-20)
            make.right.equalToSuperview().inset(20)
        }

        textField.snp.makeConstraints{ make in
            make.bottom.equalTo(buttonStatus.snp.top).inset(-10)
            make.left.equalTo(photo.snp.right).inset(-20)
            make.right.equalToSuperview().inset(20)
            make.height.equalTo(40)
        }
            
//        NSLayoutConstraint.activate([
//            photo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            photo.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
//            photo.widthAnchor.constraint(equalToConstant: 150),
//            photo.heightAnchor.constraint(equalToConstant: 150),
//
//            buttonX.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 16),
//            buttonX.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
//            buttonX.widthAnchor.constraint(equalToConstant: 30),
//            buttonX.heightAnchor.constraint(equalToConstant: 30),
//
//            label.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 27),
//            label.leftAnchor.constraint(equalTo: photo.rightAnchor, constant: 20),
//            label.rightAnchor.constraint(equalTo: rightAnchor , constant: -20),
//
//            buttonStatus.topAnchor.constraint(equalTo: photo.bottomAnchor,constant:16),
//            buttonStatus.leftAnchor.constraint(equalTo: leftAnchor , constant: 16),
//            buttonStatus.rightAnchor.constraint(equalTo: rightAnchor, constant:-16),
//            buttonStatus.heightAnchor.constraint(equalToConstant: 50),
//            buttonStatus.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
//
//            labelGrey.bottomAnchor.constraint(equalTo: textField.topAnchor, constant: -10),
//            labelGrey.leftAnchor.constraint(equalTo: photo.rightAnchor,constant: 20),
//            labelGrey.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
//
//            textField.bottomAnchor.constraint(equalTo: buttonStatus.topAnchor, constant: -10),
//            textField.leftAnchor.constraint(equalTo: photo.rightAnchor, constant: 20),
//            textField.rightAnchor.constraint(equalTo: rightAnchor, constant: -20),
//            textField.heightAnchor.constraint(equalToConstant: 40)
//        ])
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        size()
        urlSession()
        urlSessionDecoder()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

    
}


import UIKit
import StorageService
import iOSIntPackage

class PostTableViewCell: UITableViewCell {
    
    static let id = "PostTableViewCell"
     let filterImage = ImageProcessor()
 //   filterImage.processImage(sourceImage: T##UIImage, filter: T##ColorFilter, completion: T##(UIImage?) -> Void)
//    filterImage.processImage(sourceImage: UIImage, filter: ColorFilter, completion: (UIImage?) -> Void)
    var currentPost:PostView?
    
    var profileHeaderView: ProfileHeaderView = {
         let profileHeaderView = ProfileHeaderView()
        profileHeaderView.backgroundColor = UIColor.createColor(lightMode: .lightGray, darkMode: .darkGray)
         profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
         return profileHeaderView
     }()
    
    private let authorLabel: UILabel = {
       let author = UILabel()
        author.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        author.textColor = UIColor.createColor(lightMode: .black, darkMode: .white)
        author.numberOfLines = 2
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    private let descriptionText: UILabel  = {
        let text = UILabel()
        text.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        text.textColor = .systemGray
        text.numberOfLines = 0
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
    }()
    
    private let likesLabel: UILabel = {
       let author = UILabel()
        author.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        //author.text = "Likes: "
        author.textColor = UIColor.createColor(lightMode: .black, darkMode: .white)
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    private let viewsLabel: UILabel = {
       let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = UIColor.createColor(lightMode: .black, darkMode: .white)
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    private let imageEvil: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black//UIColor.createColor(lightMode: .black, darkMode: .white)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        
        return imageView
        
    }()
    
  
    
    
    private func tableViewCell() {
        
        addSubview(authorLabel)
        addSubview(imageEvil)
        addSubview(descriptionText)
        addSubview(likesLabel)
        addSubview(viewsLabel)
        NSLayoutConstraint.activate([

            
            authorLabel.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            authorLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            authorLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            imageEvil.topAnchor.constraint(equalTo: authorLabel.bottomAnchor, constant: 16),
            imageEvil.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageEvil.trailingAnchor.constraint(equalTo: trailingAnchor),
//            imageEvil.heightAnchor.constraint(equalTo: imageEvil.widthAnchor),
            imageEvil.heightAnchor.constraint(equalToConstant: 100),
            
            descriptionText.topAnchor.constraint(equalTo: imageEvil.bottomAnchor, constant: 16),
            descriptionText.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            descriptionText.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            
            likesLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            likesLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            
            viewsLabel.topAnchor.constraint(equalTo: descriptionText.bottomAnchor, constant: 16),
            viewsLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            viewsLabel.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
    }
    
    func tableItem(with news: Posts)  {
//        self.currentPost = news
        authorLabel.text = news.author
        imageEvil.image = news.image
//        let images  = imageEvil.image
//        filterImage.processImage(sourceImage:images, filter: .noir) {(processedImage) in
//            if let images = processedImage {
//                imageEvil.image = images
//            }
//        }
        //filterImage.processImage(sourceImage: test!, filter: .colorInvert, completion: (UIImage?) -> Void) in
        descriptionText.text = news.description

        let likesFormater = NSLocalizedString("LikesKey", comment: "")
        let finalFormat = String(format: likesFormater, news.likes)
        likesLabel.text = "Likes: " + finalFormat
        viewsLabel.text = "Views: " + String(news.view)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        tableViewCell()
        setupGestureRecognizer()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupGestureRecognizer() {
        let doubleTapOnViewCell = UITapGestureRecognizer(target: self, action: #selector(doubleTap))
        doubleTapOnViewCell.numberOfTapsRequired = 2
        self.addGestureRecognizer(doubleTapOnViewCell)
    }

    @objc private func doubleTap() {
        guard let currentPost else {return}
        CoreDataService.shared.addLikePost(postOrigin: currentPost)
    }
}




import UIKit

class PostTableViewCell: UITableViewCell {
    
    static let id = "PostTableViewCell"
    
    
    var profileHeaderView: ProfileHeaderView = {
         let profileHeaderView = ProfileHeaderView()
         profileHeaderView.backgroundColor = .lightGray
         profileHeaderView.translatesAutoresizingMaskIntoConstraints = false
         return profileHeaderView
     }()
    
    private let authorLabel: UILabel = {
       let author = UILabel()
        author.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        author.textColor = .black
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
        author.textColor = .black
        author.translatesAutoresizingMaskIntoConstraints = false
        return author
    }()
    
    private let viewsLabel: UILabel = {
       let views = UILabel()
        views.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        views.textColor = .black
        views.translatesAutoresizingMaskIntoConstraints = false
        return views
    }()
    
    private let imageEvil: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.backgroundColor = .black
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
            imageEvil.heightAnchor.constraint(equalTo: imageEvil.widthAnchor),
            
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
    
    func tableItem(with news: PostView)  {
        authorLabel.text = news.author
        imageEvil.image = UIImage(named: news.image)
        descriptionText.text = news.description
        likesLabel.text = "Likes: " + String(news.likes)
        viewsLabel.text = "Views: " + String(news.view)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        tableViewCell()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}



import UIKit


class PhotosTableViewCell: UITableViewCell {

    static let id1 = "PhotosTableViewCell"
    
    var photosViewCell: PhotosViewCell = {
         let photosViewCell = PhotosViewCell()
        photosViewCell.backgroundColor = UIColor.createColor(lightMode: .white, darkMode: .black)
        photosViewCell.translatesAutoresizingMaskIntoConstraints = false
         return photosViewCell
     }()
    
        private var imagePeople: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor.createColor(lightMode: .blue, darkMode: .green)
        image.contentMode = .scaleAspectFit
        return image
    }()


    private func imageCell() {

        addSubview(photosViewCell)
        NSLayoutConstraint.activate ([
            photosViewCell.topAnchor.constraint(equalTo:  topAnchor),
            photosViewCell.bottomAnchor.constraint(equalTo:  bottomAnchor),
            photosViewCell.leadingAnchor.constraint(equalTo:  safeAreaLayoutGuide.leadingAnchor),
            photosViewCell.trailingAnchor.constraint(equalTo:  safeAreaLayoutGuide.trailingAnchor)
        ])

    }
    func tableCell(with news:imageStark) {
        imagePeople.image = UIImage(named: news.imageStarks)
    }

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        imageCell()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }




}

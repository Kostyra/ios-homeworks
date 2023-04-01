import UIKit

class PhotosTableViewCell: UITableViewCell {

    static let id1 = "PhotosTableViewCell"

//    var photosCollectionViewCell: PhotosCollectionViewCell = {
//         let photosCollectionViewCell = PhotosCollectionViewCell()
//        photosCollectionViewCell.backgroundColor = .lightGray
//        photosCollectionViewCell.translatesAutoresizingMaskIntoConstraints = false
//         return photosCollectionViewCell
//     }()
    
    var photosViewCell: PhotosViewCell = {
         let photosViewCell = PhotosViewCell()
        photosViewCell.backgroundColor = .white
        photosViewCell.translatesAutoresizingMaskIntoConstraints = false
         return photosViewCell
     }()
    
        private var imagePeople: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .blue //.systemBackground
        image.contentMode = .scaleAspectFit
        return image
    }()


    private func imageCell() {
//        addSubview(imagePeople)
        addSubview(photosViewCell)
        NSLayoutConstraint.activate ([
//            imagePeople.topAnchor.constraint(equalTo:  topAnchor),
//            imagePeople.bottomAnchor.constraint(equalTo:  safeAreaLayoutGuide.bottomAnchor),
//            imagePeople.leadingAnchor.constraint(equalTo:  safeAreaLayoutGuide.leadingAnchor),
//            imagePeople.trailingAnchor.constraint(equalTo:  trailingAnchor),
            
            photosViewCell.topAnchor.constraint(equalTo:  topAnchor),
//            photosCollectionViewCell.topAnchor.constraint(equalTo:  imagePeople.bottomAnchor),
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

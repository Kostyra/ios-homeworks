

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let id1 = "PhotosCollectionViewCell"


    private var imagePeople: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = UIColor(named: "TabBar")
        image.contentMode = .scaleAspectFit //Больше нравится fit
        //image.contentMode = .scaleToFill //Растянутся, но будет не красиво
    return image
}()


private func imageCell() {
    contentView.addSubview(imagePeople)
    NSLayoutConstraint.activate ([
        imagePeople.topAnchor.constraint(equalTo:  contentView.topAnchor),
        imagePeople.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor),
        imagePeople.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor),
        imagePeople.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor),
//       imagePeople.heightAnchor.constraint(equalToConstant: 60),
//        imagePeople.widthAnchor.constraint(equalToConstant: 60)
    ])

}
func tableCell(with news:imageStark) {
    imagePeople.image = UIImage(named: news.imageStarks)
}

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        imageCell()
    }
}


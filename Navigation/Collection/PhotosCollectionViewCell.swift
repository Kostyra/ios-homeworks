

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let id1 = "PhotosCollectionViewCell"


    private var imagePeople: UIImageView = {
    let image = UIImageView()
    image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor =  UIColor.createColor(lightMode: UIColor(named: "TabBar")!, darkMode: .black)
        image.contentMode = .scaleAspectFit //Больше нравится fit
        //image.contentMode = .scaleToFill //Растянутся, но будет не красиво
    return image
}()



    
//MARK: - lifecycle
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override init(frame: CGRect) {
        super.init(frame: .zero)
        imageCell()
        contentView.backgroundColor = UIColor.createColor(lightMode: .green, darkMode: .blue)
    }
    

    //MARK: - method
    private func imageCell() {
        contentView.addSubview(imagePeople)
        NSLayoutConstraint.activate ([
            imagePeople.topAnchor.constraint(equalTo:  contentView.topAnchor),
            imagePeople.bottomAnchor.constraint(equalTo:  contentView.bottomAnchor),
            imagePeople.leadingAnchor.constraint(equalTo:  contentView.leadingAnchor),
            imagePeople.trailingAnchor.constraint(equalTo:  contentView.trailingAnchor),
        ])
    }
    
    //    func tableCell(with news:UIImage) {
    //        imagePeople.image = news
    //    }
    
    func tableCell(with news:UIImage) {
        imagePeople.image = news
    }
}


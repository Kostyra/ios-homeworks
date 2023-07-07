
import UIKit
import iOSIntPackage



class PhotosViewController:  UIViewController {

    let imagePublisherFacade = ImagePublisherFacade()
//    lazy var arrayOfImages = [UIImage]()

    
    private let collectionView: UICollectionView = {
       let viewLayOut = UICollectionViewFlowLayout()
        
        let collectionView  = UICollectionView(
            frame: .zero,
            collectionViewLayout: viewLayOut
        )
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .white
        
        collectionView.register(
            PhotosCollectionViewCell.self,
            forCellWithReuseIdentifier: PhotosCollectionViewCell.id1)
        return collectionView
    }()
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func collectionViewLayOut() {
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewLayOut()
        setupCollectionView()
        applyImageFilter()
        title = "Photos Gallery"
       view.backgroundColor = UIColor(named: "TabBar")
        navigationController?.navigationBar.isHidden = false
//        imagePublisherFacade.subscribe(self)
//        imagePublisherFacade.addImagesWithTimer(time: 0.5, repeat: 10, userImages: newImageLibrary)
    }
       
//    override func viewWillDisappear(_ animated: Bool) {
//            super.viewWillDisappear(true)
//            imagePublisherFacade.rechargeImageLibrary()
//            imagePublisherFacade.removeSubscription(for: self)
//        }
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
        static let itemHeight: CGFloat = 100.0
    }
}

//MARK: - extension
extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
 //       arrayOfImages.count
        photoStark.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.id1, for: indexPath) as! PhotosCollectionViewCell
        let arrayCollection = photoStark[indexPath.row]
//        let arrayCollection = arrayOfImages[indexPath.item]
        cell.tableCell(with: arrayCollection)
        return cell
    }
}

extension PhotosViewController:UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 3
        
        let totalSpacing: CGFloat = 2 * spacing + (itemsInRow - 1) * spacing
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return floor(finalWidth)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = itemWidth(
            for: view.frame.width,
            spacing: LayoutConstant.spacing)
        return CGSize(width: width, height: LayoutConstant.itemHeight)
    }

    func collectionView(_ collectionView: UICollectionView,layout collectionViewLayout: UICollectionViewLayout,insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(
            top: LayoutConstant.spacing,
            left: LayoutConstant.spacing,
            bottom: LayoutConstant.spacing,
            right: LayoutConstant.spacing
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        willDisplay cell: UICollectionViewCell,
        forItemAt indexPath: IndexPath
    ) {
        cell.contentView.backgroundColor = .green
    }
}

//extension PhotosViewController: ImageLibrarySubscriber {
//    func receive(images: [UIImage]) {
//        arrayOfImages = images
//        collectionView.reloadData()
//    }
//}
//MARK: - extention

extension PhotosViewController {
    private func applyImageFilter() {
        let startDefault = CFAbsoluteTimeGetCurrent()
        ImageProcessor().processImagesOnThread(sourceImages: photoStark,
                                               filter: .noir,
                                               qos: .utility) { result in
            photoStark = result.compactMap { UIImage(cgImage: $0!) }
            let end = CFAbsoluteTimeGetCurrent()
            let time = end - startDefault
            print("userInteractive time evaluated: \(time)")
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        }
    }
    // 0.18758296966552734 qos: .default
    // 0.17167294025421143 qos: .userInitiated
    // 0.44238603115081787 qos: .background
    // 0.15764105319976807 qos: .userInteractive
    // 0.16431808471679688 qos: .utility

}

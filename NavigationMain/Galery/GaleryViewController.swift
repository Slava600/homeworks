//
//  PhotosViewController.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 09.03.2022.
//

import UIKit
import StorageService
import iOSIntPackage



class GaleryViewController: UIViewController {
    var imageProcessor = ImageProcessor()

    var imagePublisherFacade = ImagePublisherFacade()
    var contentPhotoData: [UIImage] = []
    {
        didSet {
            if contentPhotoData.count == galeryPhotos.count {
                imagePublisherFacade.removeSubscription(for: self)
            }
        }
    }

    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        layout.scrollDirection = .vertical
        return layout
    }()
    
    lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Фото галлерея"
        view.addSubview(collectionView)
        collectionView.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifire)
        collectionView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        imagePublisherFacade.subscribe(self)
        imagePublisherFacade.addImagesWithTimer(time: 0.3, repeat: galeryPhotos.count*2, userImages: galeryPhotos)
    }

    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
}

extension GaleryViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {


   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contentPhotoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifire, for: indexPath) as? PhotosCollectionViewCell else { return UICollectionViewCell() }
        cell.setupImage(contentPhotoData[indexPath.item])
        return cell
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: (collectionView.frame.width - 40) / 3, height: (collectionView.frame.width - 40) / 3)
    }
}


extension GaleryViewController: ImageLibrarySubscriber {

    func receive(images: [UIImage]) {
        images.forEach({ image in
            if contentPhotoData.contains(where: {image == $0}) {
                return
            } else {
                contentPhotoData.append(image)
            }
        })
        collectionView.reloadData()
    }

}


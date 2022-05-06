//
//  PhotosCollectionViewCell.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 09.03.2022.
//

import UIKit
import iOSIntPackage


class PhotosCollectionViewCell: UICollectionViewCell {
    
   //  свойство с массивом филтров которые будут применяться для фото
    let imageProcessor = ImageProcessor()
    private let filtersSet: [ColorFilter] = [.colorInvert, .noir, .chrome, .fade, .posterize, .tonal, .process, .transfer, .sepia(intensity: 80)]
    
    
    static let identifire = "PhotosCollectionViewCell"
    
    let photo: UIImageView = {
        let photo = UIImageView()
        return photo
    }()


    func setupImage(_ image: UIImage) {
        photo.image = image
        imageProcessor.processImage(sourceImage: photo.image ?? UIImage(), filter: getRandomFilter(set: filtersSet)){
            filteredImage  in photo.image = filteredImage
        }
    }
    
    func getRandomFilter (set: [ColorFilter]) -> ColorFilter {
        let randomFilterNumber = Int.random(in: 0..<set.count)
        return set[randomFilterNumber]
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        contentView.addSubview(photo)
        
        photo.snp.makeConstraints { make in
            make.edges.equalTo(contentView)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

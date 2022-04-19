//
//  PhotosCollectionViewCell.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 09.03.2022.
//

import UIKit

class PhotosCollectionViewCell: UICollectionViewCell {

    static let identifire = "PhotosCollectionViewCell"
    
    let photo: UIImageView = {
        let photo = UIImageView()
        return photo
    }()
    
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
    
    func setupImage(_ name: String) {
        photo.image = UIImage(named: name)
    }
    
}

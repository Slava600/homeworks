//
//  PhotosTableViewCell.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 06.03.2022.
//

import UIKit
import StorageService
import SnapKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifire = "PhotosTableViewCell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.alignment = .center
        stackView.distribution = .fillEqually
        stackView.backgroundColor = .white
        
        return stackView
    }()
    
    let titleLabel: UILabel = {
        let photosLabel = UILabel()
        photosLabel.text = "Фотографии"
        photosLabel.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        photosLabel.textColor = .black
        return photosLabel
    }()
    
    let titleButton: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        return arrowImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews(titleLabel, titleButton, stackView)
        contentView.backgroundColor = .white
        
        for i in 0...3 {
            if i < constPhotoArray.count  {
                let photo = UIImageView(image: UIImage(named: constPhotoArray[i] ))
                photo.layer.cornerRadius = 6
                photo.clipsToBounds = true
                stackView.addArrangedSubview(photo)
            } else {
                let photo = UIImageView(image: UIImage(named: "basePhoto"))
                photo.layer.cornerRadius = 6
                photo.clipsToBounds = true
                stackView.addArrangedSubview(photo)
            }
        }
        useConstraint()
        
        titleLabel.snp.makeConstraints { make in
            make.left.top.equalTo(contentView).inset(12)
        }
        titleButton.snp.makeConstraints { make in
            make.right.equalTo(contentView).inset(12)
            make.centerY.equalTo(titleLabel)
            make.size.equalTo(CGSize(width: 30, height: 30))
        }
        stackView.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).inset(-12)
            make.right.bottom.left.equalTo(contentView).inset(12)
        }
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useConstraint() {
        stackView.arrangedSubviews.forEach({
            [$0.widthAnchor.constraint(greaterThanOrEqualToConstant: (contentView.frame.width - 16) / 4),
             $0.heightAnchor.constraint(equalTo: $0.widthAnchor)]
                .forEach({$0.isActive = true})
        })
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}

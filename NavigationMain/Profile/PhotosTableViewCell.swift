//
//  PhotosTableViewCell.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 06.03.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    static let identifire = "PhotosTableViewCell"
    
    let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
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
        photosLabel.toAutoLayout()
        return photosLabel
    }()
    
    let titleButton: UIImageView = {
        let arrowImage = UIImageView()
        arrowImage.image = UIImage(systemName: "arrow.right", withConfiguration: UIImage.SymbolConfiguration(pointSize: 30))?.withTintColor(.black, renderingMode: .alwaysOriginal)
        arrowImage.toAutoLayout()
        return arrowImage
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super .init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(titleLabel, titleButton, stackView)
        
        for i in 0...3 {
            let photo = UIImageView(image: UIImage(named: constPhotoArray[i]))
            photo.toAutoLayout()
            photo.layer.cornerRadius = 6
            photo.clipsToBounds = true
            stackView.addArrangedSubview(photo)
        }
        useConstraint()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func useConstraint() {
        
        [titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
         titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
         
         titleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
         titleButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
         titleButton.heightAnchor.constraint(equalToConstant: 30),
         titleButton.widthAnchor.constraint(equalToConstant: 30),
         
         stackView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 12),
         stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
         stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
         stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
         
        ].forEach({$0.isActive = true})
    
        stackView.arrangedSubviews.forEach(
            {
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
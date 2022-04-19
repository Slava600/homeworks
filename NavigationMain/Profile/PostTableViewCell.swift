//
//  PostTableViewCell.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 03.03.2022.
//

import UIKit
import StorageService
import SnapKit

class PostTableViewCell: UITableViewCell {
    
    static let identifire = "PostTableViewCell"
    
    var authorView: UILabel = {
        let authorView = UILabel()
        authorView.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        authorView.textColor = .black
        authorView.numberOfLines = 2
        return authorView
    }()
    
    var descriptionView: UILabel = {
        let descriptionView = UILabel()
        descriptionView.font = UIFont.systemFont(ofSize: 14)
        descriptionView.textColor = UIColor.systemGray
        descriptionView.numberOfLines = 0
        return descriptionView
    }()
    
    var image: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.backgroundColor = .black
        return image
    }()
    
    var likesView: UILabel = {
        let likesView = UILabel()
        likesView.font = UIFont.systemFont(ofSize: 16)
        likesView.textColor = .black
        return likesView
    }()
    
    var viewsView: UILabel = {
        let viewsView = UILabel()
        viewsView.font = UIFont.systemFont(ofSize: 16)
        viewsView.textColor = .black
        return viewsView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(authorView, descriptionView, image, likesView, viewsView)
        contentView.backgroundColor = .white
      
        authorView.snp.makeConstraints { make in
            make.left.right.top.equalTo(contentView).inset(16)
            make.height.equalTo(20)
        }
        image.snp.makeConstraints { make in
            make.top.equalTo(authorView.snp.bottom).inset(-16)
            make.width.equalTo(contentView)
            make.height.equalTo(contentView.snp.width)
        }
        descriptionView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.equalTo(image.snp.bottom).inset(-16)
            make.bottom.equalTo(contentView.snp.bottom).inset(40)
        }
        likesView.snp.makeConstraints { make in
            make.top.equalTo(descriptionView.snp.bottom).inset(-16)
            make.left.equalTo(contentView).inset(16)
            make.height.equalTo(16)
        }
        viewsView.snp.makeConstraints { make in
            make.right.equalTo(contentView).inset(16)
            make.top.equalTo(descriptionView.snp.bottom).inset(-16)
            make.height.equalTo(16)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func specifyFields(post: Post) {
        authorView.text = post.author
        descriptionView.text = post.description
        image.image = UIImage(named: post.image)
        likesView.text = "Лайк: \(post.likes)"
        viewsView.text = "Просмотры: \(post.views)"
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

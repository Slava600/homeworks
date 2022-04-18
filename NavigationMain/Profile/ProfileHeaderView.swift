
import UIKit
import SnapKit


class ProfileHeaderView: UITableViewHeaderFooterView {
    
    var delegate:ImageZoomable?
    
    let userNameLable: UILabel = {
        let label = UILabel ()
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = .black
        label.text = "Amber Richard"
        label.numberOfLines = 0
        label.toAutoLayout()
        label.textAlignment = .left
        return label
    }()
    
    lazy var avatarImage: UIImageView = {
        let avatar = UIImageView (image: UIImage(named: "avatarImage"))
        avatar.toAutoLayout()
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 50
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        avatar.isUserInteractionEnabled = true
        avatar.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleZoomTap)))
        return avatar
    }()
    
    @objc func handleZoomTap(_ gestureRecognizer: UITapGestureRecognizer) {
        if let imageView = gestureRecognizer.view as? UIImageView {
            delegate?.performZoomInForImageView(imageView)
        }
    }
    
    let statusLable: UILabel = {
        let status = UILabel()
        status.toAutoLayout()
        status.text = "статус не установлен"
        status.textAlignment = .natural
        status.textColor = .gray
        status.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        status.isUserInteractionEnabled = true
        return status
    }()
    
    let statusBatton: UIButton = {
        let statusBatton = UIButton()
        statusBatton.toAutoLayout()
        statusBatton.backgroundColor = UIColor(named: "battonColor")
        statusBatton.layer.cornerRadius = 4
        statusBatton.layer.shadowColor = UIColor.black.cgColor
        statusBatton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusBatton.layer.shadowOpacity = 0.7
        statusBatton.layer.shadowRadius = 4
        statusBatton.setTitle("Установить статус", for: .normal)
        statusBatton.setTitleColor(.white, for: .highlighted)
        statusBatton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        return statusBatton
    }()
    
    let statusSetField: UITextField = {
        let setField = UITextField()
        setField.toAutoLayout()
        setField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        setField.placeholder = "Ввести статус"
        setField.textColor = .black
        setField.backgroundColor = .white
        setField.textAlignment = .left
        setField.layer.cornerRadius = 12
        setField.layer.borderWidth = 1
        setField.layer.borderColor = UIColor.black.cgColor
        setField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: setField.frame.height))
        setField.leftViewMode = .always
        setField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
        return setField
    }()
    
    private var statusText = ""
    static let identifire = "ProfileHeaderView"
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        
        contentView.addSubviews(avatarImage, userNameLable, statusLable, statusBatton, statusSetField)
        contentView.backgroundColor = .white

        avatarImage.snp.makeConstraints { make in
            make.width.equalTo(100)
            make.height.equalTo(100)
            make.left.equalTo(contentView).offset(Const.leadingMargin)
            make.top.equalTo(contentView).offset(Const.indent)
        }

        userNameLable.snp.makeConstraints { make in
            make.left.equalTo(avatarImage.snp.right).offset(20)
            make.top.right.equalTo(contentView).offset(27)
        }
        statusLable.snp.makeConstraints { make in
            make.left.equalTo(avatarImage.snp.right).offset(20)
            make.right.equalTo(contentView.snp.right).offset(-16)
            make.height.equalTo(20)
            make.top.equalTo(userNameLable.snp.bottom).offset(10)
        }
        statusSetField.snp.makeConstraints { make in
            make.height.equalTo(40)
            make.left.equalTo(avatarImage.snp.right).offset(20)
            make.right.equalTo(contentView).offset(-20)
            make.top.equalTo(statusLable).offset(22)

        }
        statusBatton.snp.makeConstraints { make in
            make.height.equalTo(50)
            make.left.equalTo(contentView).offset(16)
            make.right.equalTo(contentView).offset(-16)
            make.top.equalTo(contentView).offset(133)
        }

//              useConstraint()

    }
//    private func useConstraint() {
//        NSLayoutConstraint.activate ([
         
//         statusSetField.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 20),
//         statusSetField.bottomAnchor.constraint(equalTo: statusBatton.topAnchor, constant: -10),
//         statusSetField.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: -16),
//         statusSetField.heightAnchor.constraint(equalToConstant: 40),

//         avatarImage.widthAnchor.constraint(equalToConstant: 100),
//         avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
//         avatarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: -16),
//         avatarImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16),

//         userNameLable.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 20),
//         userNameLable.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 27),
//         userNameLable.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: -16),

//         statusLable.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 20),
//         statusLable.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: -16),
//         statusLable.bottomAnchor.constraint(equalTo: statusSetField.topAnchor, constant: -6),
         
//         statusBatton.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 16),
//         statusBatton.rightAnchor.constraint(greaterThanOrEqualTo: contentView.rightAnchor, constant: -16),
//         statusBatton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
//         statusBatton.heightAnchor.constraint(equalToConstant: 50)
//        ])
//    }
    
    
    @objc func pressButton() {
        print(statusLable.text ?? "---")
        statusLable.text = statusText
        statusText = ""
        statusSetField.text = ""
        statusSetField.resignFirstResponder()
    }
    
    @objc func statusTextChanged(_ textField: UITextField) {
        if let text = textField.text {
            statusText = text
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

}

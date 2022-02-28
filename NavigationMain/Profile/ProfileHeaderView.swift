
import UIKit

class ProfileHeaderView: UIView {
   
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

    
    let avatarImage: UIImageView = {
        let avatar = UIImageView (image: UIImage(named: "avatarImage"))
        avatar.toAutoLayout()
        avatar.clipsToBounds = true
        avatar.layer.cornerRadius = 50
        avatar.layer.borderWidth = 3
        avatar.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        return avatar
    }()
    
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

 
    init() {
        super.init(frame: CGRect())
        self.addSubview(userNameLable)
        self.addSubview(avatarImage)
        self.addSubview(statusLable)
        self.addSubview(statusBatton)
        self.addSubview(statusSetField)
    }
    
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
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        
        NSLayoutConstraint.activate([
            self.leftAnchor.constraint(equalTo: superview!.leftAnchor),
            self.rightAnchor.constraint(equalTo: superview!.rightAnchor),
            self.topAnchor.constraint(equalTo: superview!.safeAreaLayoutGuide.topAnchor),
            self.heightAnchor.constraint(equalToConstant: 220),

            avatarImage.widthAnchor.constraint(equalToConstant: 100),
            avatarImage.heightAnchor.constraint(equalTo: avatarImage.widthAnchor),
            avatarImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            avatarImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 16),

            userNameLable.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 20),
            userNameLable.topAnchor.constraint(equalTo: self.topAnchor, constant: 27),
            userNameLable.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),

            statusLable.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 20),
            statusLable.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusLable.bottomAnchor.constraint(equalTo: statusSetField.topAnchor, constant: -6),

            statusBatton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 16),
            statusBatton.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusBatton.topAnchor.constraint(equalTo: avatarImage.bottomAnchor, constant: 16),
            statusBatton.heightAnchor.constraint(equalToConstant: 50),

            statusSetField.leftAnchor.constraint(equalTo: avatarImage.rightAnchor, constant: 20),
            statusSetField.bottomAnchor.constraint(equalTo: statusBatton.topAnchor, constant: -10),
            statusSetField.rightAnchor.constraint(greaterThanOrEqualTo: self.rightAnchor, constant: -16),
            statusSetField.heightAnchor.constraint(equalToConstant: 40)
 ])
        
    }
    

}

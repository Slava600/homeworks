
import UIKit

class ProfileHeaderView: UIView {
    
    let userNameLable: UILabel
    let avatarImage: UIImageView
    let statusLable: UILabel
    let statusBatton: UIButton
    let statusSetField: UITextField
    private var statusText = ""
    
    init() {
        userNameLable = UILabel()
        avatarImage = UIImageView(image: UIImage(named: "avatarImage"))
        statusLable = UILabel()
        statusBatton = UIButton()
        statusSetField = UITextField()
        super.init(frame: CGRect())
        
        userNameLable.translatesAutoresizingMaskIntoConstraints = false
        userNameLable.text = "Amber Richard"
        userNameLable.textAlignment = .left
        userNameLable.textColor = .black
        userNameLable.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        self.addSubview(userNameLable)
        
        avatarImage.translatesAutoresizingMaskIntoConstraints = false
        avatarImage.clipsToBounds = true
        avatarImage.layer.cornerRadius = 50
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
        self.addSubview(avatarImage)
        
        statusLable.translatesAutoresizingMaskIntoConstraints = false
        statusLable.text = "заполнить статус..."
        statusLable.textAlignment = .natural
        statusLable.textColor = .gray
        statusLable.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        statusLable.isUserInteractionEnabled = true
        self.addSubview(statusLable)
        
        statusBatton.translatesAutoresizingMaskIntoConstraints = false
        statusBatton.backgroundColor = #colorLiteral(red: 0.05408742279, green: 0.4763534069, blue: 0.9996182323, alpha: 1)
        statusBatton.layer.cornerRadius = 4
        statusBatton.layer.shadowColor = UIColor.black.cgColor
        statusBatton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusBatton.layer.shadowOpacity = 0.7
        statusBatton.layer.shadowRadius = 4
        statusBatton.setTitle("Установить статус", for: .normal)
        statusBatton.setTitleColor(.white, for: .highlighted)
        statusBatton.addTarget(self, action: #selector(pressButton), for: .touchUpInside)
        self.addSubview(statusBatton)
        
        statusSetField.translatesAutoresizingMaskIntoConstraints = false
        statusSetField.font = UIFont.systemFont(ofSize: 15, weight: .regular)
        statusSetField.placeholder = "Ввести статус"
        statusSetField.textColor = .black
        statusSetField.backgroundColor = .white
        statusSetField.textAlignment = .natural
        statusSetField.layer.cornerRadius = 12
        statusSetField.layer.borderWidth = 1
        statusSetField.layer.borderColor = CGColor(red: 0, green: 0, blue: 0, alpha: 1)
        statusSetField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: statusSetField.frame.height))
        statusSetField.leftViewMode = .always
        statusSetField.addTarget(self, action: #selector(statusTextChanged), for: .editingChanged)
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

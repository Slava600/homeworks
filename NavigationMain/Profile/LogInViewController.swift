//
//  LogInViewController.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 28.02.2022.
//

import UIKit

class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        scrollView.toAutoLayout()
        return scrollView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        contentView.toAutoLayout()
        return contentView
    }()
    
    var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        logo.toAutoLayout()
        return logo
    }()
    
    var userName: UITextField = {
        let userName = UITextField()
        userName.toAutoLayout()
        userName.textColor = .black
        userName.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        userName.tintColor = UIColor(named: "AccentColor")
        userName.autocapitalizationType = .none
        userName.layer.borderColor = UIColor.lightGray.cgColor
        userName.layer.borderWidth = 0.5
        userName.placeholder = "Почта или телефон"
        userName.keyboardType = .emailAddress
        userName.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: userName.frame.height))
        userName.leftViewMode = .always
        userName.returnKeyType = .done
        return userName
    }()
    
    var password: UITextField = {
        let password = UITextField()
        password.toAutoLayout()
        password.textColor = .black
        password.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        password.tintColor = UIColor(named: "AccentColor")
        password.autocapitalizationType = .none
        password.layer.borderColor = UIColor.lightGray.cgColor
        password.layer.borderWidth = 0.5
        password.isSecureTextEntry = true
        password.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: password.frame.height))
        password.leftViewMode = .always
        password.placeholder = "Пароль"
        password.returnKeyType = UIReturnKeyType.default
        return password
    }()
    
    var logIn: UIButton = {
        let logIn = UIButton()
        logIn.toAutoLayout()
        logIn.setTitle("Войти", for: .normal)
        
        if let image = UIImage(named: "blue_pixel") {
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 1), for: .normal)
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.8), for: .selected)
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.8), for: .highlighted)
            logIn.setBackgroundImage(image.imageWithAlpha(alpha: 0.8), for: .disabled)
        }
        
        logIn.imageView?.contentMode = .scaleAspectFill
        logIn.titleLabel?.textColor = .white
        logIn.layer.cornerRadius = 10
        logIn.addTarget(self, action: #selector(login), for: .touchUpInside)
        logIn.clipsToBounds = true
        return logIn
    }()
    
    var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.toAutoLayout()
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.systemGray6.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        return stackView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: view.frame.width, height: max(view.frame.width, view.frame.height))
        
        contentView.addSubviews(logo, stackView, logIn)
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(password)
        
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        
        useConstraint()
        
//        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(tap))
//        view.addGestureRecognizer(tapGesture)

    }
    
    private func useConstraint() {
        
        [scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
         scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
         scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
         scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
         
         contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
         contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
         contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
         contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
         contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
         contentView.centerYAnchor.constraint(equalTo: scrollView.centerYAnchor),
         
         logo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 120),
         logo.widthAnchor.constraint(equalToConstant: 100),
         logo.heightAnchor.constraint(equalToConstant: 100),
         logo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
         
         stackView.topAnchor.constraint(equalTo: logo.bottomAnchor, constant: 120),
         stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
         stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
         stackView.heightAnchor.constraint(equalToConstant: 100),
         
         logIn.topAnchor.constraint(equalTo: password.bottomAnchor, constant: Const.indent),
         logIn.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: Const.leadingMargin),
         logIn.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: Const.trailingMargin),
         logIn.heightAnchor.constraint(equalToConstant: 50)].forEach({$0.isActive = true})
    }
    
    
    @objc func tap() {
        password.resignFirstResponder()
        userName.resignFirstResponder()
    }

    
    @objc func login() {
        navigationController?.popViewController(animated: true)
    }

}






















extension UIImage {
    func imageWithAlpha(alpha: CGFloat) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, scale)
        draw(at: .zero, blendMode: .normal, alpha: alpha)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage
    }
}

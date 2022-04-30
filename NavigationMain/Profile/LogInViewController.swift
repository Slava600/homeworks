//
//  LogInViewController.swift
//  NavigationMain
//
//  Created by Архипов Вячеслав on 28.02.2022.
//

import UIKit
import SnapKit

protocol LoginViewControllerDelegate {
    func userAuthorization (log: String, pswd: String) -> Bool
}


class LogInViewController: UIViewController, UITextFieldDelegate {
    
    var isLogined = false
    
    var delegate: LoginViewControllerDelegate!
    
    var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .white
        scrollView.isScrollEnabled = true
        return scrollView
    }()
    
    var contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .white
        return contentView
    }()
    
    var logo: UIImageView = {
        let logo = UIImageView(image: UIImage(named: "logo"))
        return logo
    }()
    
    var userName: UITextField = {
        let userName = UITextField()
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
        userName.addTarget(self, action: #selector (loginButtonAlfa), for: .editingChanged)
        return userName
    }()
    
    var password: UITextField = {
        let password = UITextField()
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
        password.addTarget(self, action: #selector (loginButtonAlfa), for: .editingChanged)

        return password
    }()
    
    var logInButton: UIButton = {
        let logIn = UIButton()
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
        stackView.axis = .vertical
        stackView.layer.borderColor = UIColor.systemGray6.cgColor
        stackView.layer.borderWidth = 0.5
        stackView.layer.cornerRadius = 10
        stackView.distribution = .fillProportionally
        stackView.backgroundColor = .systemGray6
        stackView.clipsToBounds = true
        return stackView
    }()
    
    private var authorizationAlertController: UIAlertController = {
        let alert = UIAlertController(
            title: "Ошибка авторизации",
            message: "Логин или пароль не верны",
            preferredStyle: .alert)
        let acceptActoin = UIAlertAction(title: "Попробую снова", style: .default) {(_) -> Void in
        }
        alert.addAction(acceptActoin)
        return alert
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        scrollView.contentSize = CGSize(width: view.frame.width, height: max(view.frame.width, view.frame.height))
        stackView.addArrangedSubview(userName)
        stackView.addArrangedSubview(password)
        contentView.addSubviews(logo, stackView, logInButton)
        scrollView.addSubview(contentView)
        view.addSubview(scrollView)
        

        
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self,selector: #selector(keyboardWillShow),name: UIResponder.keyboardWillShowNotification,object: nil)
        notificationCenter.addObserver(self,selector: #selector(keyboardWillHide),name: UIResponder.keyboardWillHideNotification,object: nil)
        self.scrollView.keyboardDismissMode = .onDrag
        

        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        contentView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
        logo.snp.makeConstraints { make in
            make.top.equalTo(contentView).inset(120)
            make.centerX.equalTo(contentView)
            make.height.width.equalTo(100)
        }
        stackView.snp.makeConstraints { make in
            make.left.right.equalTo(contentView).inset(16)
            make.top.equalTo(logo).inset(120)
            make.height.equalTo(100)
        }
        logInButton.snp.makeConstraints { make in
            make.top.equalTo(password.snp.bottom).offset(16)
            make.left.right.equalTo(contentView).inset(16)
            make.height.equalTo(50)
        }

        
//#if release
//        userName.text = ""
//#elseif DEBUG
        userName.text = ""
//#endif
        
    }
    
    @objc func loginButtonAlfa(){
        if userName.text?.isEmpty == false {
            logInButton.alpha = 1.0
            logInButton.isEnabled = true
        } else {
            logInButton.alpha = 0.5
            logInButton.isEnabled = false
        }
    }
    
    
    @objc private func keyboardWillShow(notification: NSNotification) {
        if let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollView.contentInset.bottom = keyboardFrame.height
            scrollView.verticalScrollIndicatorInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardFrame.height, right: 0)
        }
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        scrollView.contentInset.bottom = .zero
        scrollView.verticalScrollIndicatorInsets = .zero
    }
    

    override func viewDidDisappear(_ animated: Bool) {
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification,object: nil)
        NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification,object: nil)
    }
    
    
   

    @objc func login() {
        
        var userService: UserService
//#if release
//        userService = CurrentUserService()
//#elseif DEBUG
        userService = TestUserService()
//#endif
        let profileVC = ProfileViewController(userService: userService, name: userName.text!)
        
        if delegate?.userAuthorization(log: userName.text!, pswd: password.text!) == true {
            isLogined = true
            navigationController?.pushViewController(profileVC, animated: true)
            navigationController?.setViewControllers([profileVC], animated: true)
        } else {
            print ("Ошибка авторизации")
            present(authorizationAlertController, animated: true, completion: nil)
        }
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

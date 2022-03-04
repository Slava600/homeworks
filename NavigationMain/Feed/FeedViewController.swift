
import UIKit

class FeedViewController: UIViewController {
    let post = Post(title: "Пост")
    let stackView: UIStackView
    
    init (){
        stackView = UIStackView()
        super.init(nibName: nil, bundle: nil)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tap () {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        postViewController.postTitle = post.title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Лента"
//        view.backgroundColor = .systemGray5
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.backgroundColor = .gray
        
        let firstButton = UIButton()
        firstButton.translatesAutoresizingMaskIntoConstraints = false
        firstButton.backgroundColor = .systemGreen
        firstButton.layer.cornerRadius = 4
        firstButton.layer.shadowColor = UIColor.black.cgColor
        firstButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        firstButton.layer.shadowOpacity = 0.7
        firstButton.layer.shadowRadius = 4
        firstButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        stackView.addArrangedSubview(firstButton)
        
        let secondButton = UIButton()
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.backgroundColor = .systemGreen
        secondButton.layer.cornerRadius = 4
        secondButton.layer.shadowColor = UIColor.black.cgColor
        secondButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        secondButton.layer.shadowOpacity = 0.7
        secondButton.layer.shadowRadius = 4
        secondButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        stackView.addArrangedSubview(secondButton)
        
        view.addSubview(stackView)
        
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -16).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: view.bounds.height / 1.5).isActive = true
        

    }
    @objc func showPost(sender: UIButton) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}


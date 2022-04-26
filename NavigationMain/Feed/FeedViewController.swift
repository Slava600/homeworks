
import UIKit

class FeedViewController: UIViewController {
    let stackView: UIStackView
    init (){
        stackView = UIStackView()
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Лента"
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.backgroundColor = .gray
        
        let firstButton = UIButton()
        firstButton.backgroundColor = .systemGreen
        firstButton.layer.cornerRadius = 4
        firstButton.layer.shadowColor = UIColor.black.cgColor
        firstButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        firstButton.layer.shadowOpacity = 0.7
        firstButton.layer.shadowRadius = 4
        firstButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        stackView.addArrangedSubview(firstButton)
        
        let secondButton = UIButton()
        secondButton.backgroundColor = .systemGreen
        secondButton.layer.cornerRadius = 4
        secondButton.layer.shadowColor = UIColor.black.cgColor
        secondButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        secondButton.layer.shadowOpacity = 0.7
        secondButton.layer.shadowRadius = 4
        secondButton.addTarget(self, action: #selector(showPost), for: .touchUpInside)
        stackView.addArrangedSubview(secondButton)
        
        view.addSubviews(stackView)
    
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalTo(view)
            make.width.equalTo(view).inset(16)
            make.height.equalTo(view).inset(view.bounds.height / 3)
        }
 
    }
    @objc func showPost(sender: UIButton) {
        let postViewController = PostViewController()
        self.navigationController?.pushViewController(postViewController, animated: true)
    }
}

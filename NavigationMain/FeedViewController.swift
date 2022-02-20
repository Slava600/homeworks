
import UIKit

class FeedViewController: UIViewController {
    let post = Post(title: "Мой пост")
    var button = UIButton()
    
    @objc func tap () {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        postViewController.postTitle = post.title
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemGray5
        self.title = "Feed"
        
        button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        button.center = view.center
        button.autoresizingMask = .init(arrayLiteral: [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin])
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        button.backgroundColor = .systemBlue
        button.setTitle("Show post", for: .normal)
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        view.addSubview(button)
    }
}



//       tabBarController?.tabBar.isHidden = true

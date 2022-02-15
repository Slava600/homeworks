
import UIKit

class FeedViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let button = UIButton(frame: CGRect(x: 100, y: 300, width: 200, height: 50))
        button.setTitle("Show", for: .normal)
        view.addSubview(button)
        button.backgroundColor = .systemBlue
        button.center = view.center
        button.layer.cornerRadius = 5
        button.layer.masksToBounds = true
        
        button.autoresizingMask = .init(arrayLiteral: [.flexibleTopMargin, .flexibleLeftMargin, .flexibleBottomMargin, .flexibleRightMargin])
        
        button.addTarget(self, action: #selector(tap), for: .touchUpInside)
        self.view.addSubview(button)
    }
    
    @objc func tap () {
        let postViewController = UIViewController()
        postViewController.title = "Post"
        postViewController.view.backgroundColor = .systemGray2
        self.navigationController?.pushViewController(postViewController, animated: true)
 //       tabBarController?.tabBar.isHidden = true
    }
    
}




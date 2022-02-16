
import UIKit

class FeedViewController: UIViewController {
    
    // создал объект cтруктуры Post с названием поста
    let post = Post(title: "Мой пост")
    
    //  создал кнопку
    var button = UIButton()
    
    // метод для кнопки
    @objc func tap () {
        let postViewController = PostViewController()
        navigationController?.pushViewController(postViewController, animated: true)
        postViewController.postTitle = post.title
    }
    
    // реализация фона, заголовка, кнопок и метода страницы Feed
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // основной фон и title
        view.backgroundColor = .systemGray4
        self.title = "Feed"
        
        // создал отцентровал кнопку + autoresizingMask
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

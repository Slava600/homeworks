import UIKit

class PostViewController: UIViewController {
    var postTitle: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        title = postTitle
        view.backgroundColor = .systemGray2
        let infoBarItem: UIBarButtonItem = UIBarButtonItem(title: "Info", style: .plain, target: self, action: #selector(tapInfo))
        navigationItem.rightBarButtonItem = infoBarItem
    }
    @objc func tapInfo() {
        let infoViewController = InfoViewController()
        navigationController?.present(infoViewController, animated: true)
    }
}

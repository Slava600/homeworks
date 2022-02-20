import UIKit

class ProfileViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        title = "Profile"
        let profileHeaderView = ProfileHeaderView()
        self.view.addSubview(profileHeaderView)
        

        let nickName = UILabel(frame: CGRect(x: 100, y: 100, width: 100, height: 21))
//       nickName.center = CGPoint(x: 160, y: 285)
        nickName.textAlignment = .center
        nickName.text = "I'm a test label"

        self.view.addSubview(nickName)
        
       
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.view.subviews.first?.frame = self.view.frame
       
    }
    
}

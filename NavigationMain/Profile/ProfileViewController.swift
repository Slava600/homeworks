import UIKit
import StorageService
import SnapKit
import iOSIntPackage


class ProfileViewController: UIViewController, ImageZoomable {
    var imageProcessor = ImageProcessor()
    
    var postTable: UITableView = {
        let postTable = UITableView(frame: .zero, style: .grouped)
        postTable.refreshControl = UIRefreshControl()
        postTable.isScrollEnabled = true
        postTable.separatorInset = .zero
        postTable.refreshControl?.addTarget(ProfileViewController.self, action: #selector(updatePostArray), for: .valueChanged)
        postTable.rowHeight = UITableView.automaticDimension
        postTable.sectionHeaderHeight = UITableView.automaticDimension
        return postTable
    }()
    
    var posts = postsArray
    
    private let userService: UserService
    private let userName: String
    
    init(userService: UserService, name: String){
        self.userService = userService
        self.userName = name
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad (){
        super.viewDidLoad()
        view.backgroundColor = .systemGray6

        #if DEBUG
        view.backgroundColor = .systemOrange
        #endif
        postTable.dataSource = self
        postTable.delegate = self
        postTable.register(ProfileHeaderView.self, forHeaderFooterViewReuseIdentifier: ProfileHeaderView.identifire)
        postTable.register(MiniPhotosTableViewCell.self, forCellReuseIdentifier: MiniPhotosTableViewCell.identifire)
        postTable.register(PostTableViewCell.self, forCellReuseIdentifier: PostTableViewCell.identifire)
        view.addSubview(postTable)
        postTable.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.navigationBar.isHidden = true
    }
    
    @objc func updatePostArray() {
        postTable.reloadData()
        postTable.refreshControl?.endRefreshing()
    }
    
    var startingFrame: CGRect?
    var backgroundView: UIView?
    var startingImageView: UIImageView?
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        section == 1 ? self.posts.count : 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if section == 0 {
            let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: ProfileHeaderView.identifire) as! ProfileHeaderView
            headerView.delegate = self
            
            if let user = userService.getUser(name: userName){
                headerView.initUser(user: user)
            }
            
            return headerView
        } else
        { return nil }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 1 {
            let cell = tableView.dequeueReusableCell(withIdentifier: PostTableViewCell.identifire, for: indexPath) as! PostTableViewCell
            cell.specifyFields(post: posts[indexPath.row])
        
            return cell
        }
        let cell = tableView.dequeueReusableCell(withIdentifier: MiniPhotosTableViewCell.identifire, for: indexPath) as! MiniPhotosTableViewCell
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 220
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 0 {
            navigationController?.pushViewController(GaleryViewController(), animated: true)
        }
    }
    
    func performZoomInForImageView(_ imageView: UIImageView) {
        startingImageView = imageView
        startingImageView?.isHidden = true
        startingFrame = imageView.superview?.convert(imageView.frame, to: nil)
        
        let zoomingImegeView = UIImageView(image: imageView.image)
        zoomingImegeView.isUserInteractionEnabled = true
        zoomingImegeView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(handleZoomOut)))
        
        if let keyWindow = UIApplication.shared.windows.filter({$0.isKeyWindow}).first {
            backgroundView = UIView(frame: keyWindow.frame)
            backgroundView?.backgroundColor = .black

            keyWindow.addSubview(backgroundView!)
            keyWindow.addSubview(zoomingImegeView)
            
            UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseInOut, animations: {
                self.backgroundView?.alpha = 0.8
                let hight = self.startingFrame!.height / self.startingFrame!.width * keyWindow.frame.width
                zoomingImegeView.frame = CGRect(x: 0, y: 0, width: keyWindow.frame.width - 10, height: hight)
                zoomingImegeView.center = keyWindow.center
                zoomingImegeView.layer.borderWidth = 3
                zoomingImegeView.layer.borderColor = CGColor(red: 255, green: 255, blue: 255, alpha: 1)
      
            }, completion: nil)
        }
    }
    
        @objc func handleZoomOut(_ tapGesture: UITapGestureRecognizer){
            if let zoomOutImageView = tapGesture.view as? UIImageView{
                zoomOutImageView.layer.cornerRadius = 50
                zoomOutImageView.clipsToBounds = true
                
                UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut , animations: {
                    zoomOutImageView.frame = self.startingFrame!
                    self.backgroundView?.alpha = 0
                    
                    
                }) { (complete) in
                    zoomOutImageView.removeFromSuperview()
                    self.startingImageView?.isHidden = false
                    
                }
            }
        }
    }









import UIKit

class InfoViewController: UIViewController {
    var alertButton = UIButton()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemOrange
        alertButton = UIButton(frame: CGRect(x: view.frame.width/2-100, y: view.frame.height/2-25, width: 200, height: 50))
        alertButton.layer.cornerRadius = 5
        alertButton.backgroundColor = .orange
        alertButton.setTitle("Alert", for: .normal)
        alertButton.addTarget(self, action: #selector(alert), for: .touchUpInside)
        view.addSubview(alertButton)
    }
    
    @objc func alert() {
        let alert = UIAlertController(title: "Предупреждение", message: "Важное сообщение...", preferredStyle: .alert)
        let firstAlertAction = UIAlertAction(title: "Кнопка 1", style: .default) { _ in
            print("Пользователь нажал кнопку 1")
        }
        let secondAlertAction = UIAlertAction(title: "Кнопка 2", style: .default) { _ in
            print("Пользователь нажал кнопку 2")
        }
        alert.addAction(firstAlertAction)
        alert.addAction(secondAlertAction)
        self.present(alert, animated: true, completion: nil)
    }
    
}

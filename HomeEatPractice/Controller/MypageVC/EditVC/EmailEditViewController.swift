//
//  EmailEditViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/02/07.
//

import UIKit
import Then

class EmailEditViewController: UIViewController {
    private let EmailLabel = UILabel().then {
        $0.text = "이메일"
        $0.textColor = UIColor.init(named: "green")
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let EmailInput = UITextField().then {
        $0.placeholder = "이메일을 입력해주세요."
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    private let AuthenticationButton = UIButton().then {
        $0.setTitle("인증", for: .normal)
        $0.setTitleColor(UIColor.black, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor.init(named: "searchfont")
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private let EmailAuthenticationLabel = UILabel().then {
        $0.text = "이메일 인증"
        $0.textColor = UIColor.init(named: "green")
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray2")
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        navigationControl()
        addSubviews()
        configUI()
    }
    // MARK: - 탭바제거
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 커스텀 탭바를 숨깁니다.
        if let tabBarController = self.tabBarController as? MainTabBarController {
            tabBarController.customTabBar.isHidden = true
        }
    }
    // MARK: - 네비게이션
    func navigationControl() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.title = "이메일 변경"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    func addSubviews() {
        view.addSubview(EmailLabel)
        view.addSubview(EmailInput)
        view.addSubview(AuthenticationButton)
        
    }
    func configUI() {
        NSLayoutConstraint.activate([
            EmailLabel.topAnchor.constraint(equalTo: view.topAnchor,constant: 127),
            EmailLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            EmailLabel.widthAnchor.constraint(equalToConstant: 50),
            EmailLabel.heightAnchor.constraint(equalToConstant: 26),
        ])
        NSLayoutConstraint.activate([
            EmailInput.topAnchor.constraint(equalTo: EmailLabel.bottomAnchor,constant: 11),
            EmailInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            EmailInput.widthAnchor.constraint(equalToConstant: 263),
            EmailInput.heightAnchor.constraint(equalToConstant: 57),
        ])
        NSLayoutConstraint.activate([
            AuthenticationButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 164),
            AuthenticationButton.leadingAnchor.constraint(equalTo: EmailInput.trailingAnchor,constant: 11),
            AuthenticationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            AuthenticationButton.heightAnchor.constraint(equalToConstant: 57),
        ])
    }
    func isValidEmail(_ email: String) -> Bool {
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        let emailPredicate = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailPredicate.evaluate(with: email)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 다른 화면으로 넘어갈 때 커스텀 탭바를 다시 보이게 합니다.
        if let tabBarController = self.tabBarController as? MainTabBarController {
            tabBarController.customTabBar.isHidden = false
        }
    }
    //뒤로가기
    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }
}

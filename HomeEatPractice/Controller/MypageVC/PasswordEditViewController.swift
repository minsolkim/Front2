//
//  PasswordEditViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/27.
//

import UIKit
import Then
 //비밀번호 변경 뷰컨트롤러
class PasswordEditViewController: UIViewController {
    private let IngPassword = UILabel().then {
        $0.text = "현재 비밀번호"
        $0.textColor = UIColor.init(named: "green")
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let IngPasswordInput = UITextField().then {
        $0.placeholder = "현재 비밀번호를 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "현재 비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    private let newPassword = UILabel().then {
        $0.text = "새 비밀번호"
        $0.textColor = UIColor.init(named: "green")
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let NewPasswordInput = UITextField().then {
        $0.placeholder = "새 비밀번호를 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "현재 비밀번호를 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    private let PasswordCheck = UILabel().then {
        $0.text = "비밀번호 확인"
        $0.textColor = UIColor.init(named: "green")
        $0.textAlignment = .center
        $0.font = UIFont.boldSystemFont(ofSize: 18)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let PasswordCheckInput = UITextField().then {
        $0.placeholder = "비밀번호를 한 번 더 입력해주세요"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "비밀번호를 한 번 더 입력해주세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: $0.frame.height))
        $0.leftViewMode = .always
    }
    override func viewDidLoad() {
        view.backgroundColor = UIColor(named: "gray2")
        super.viewDidLoad()
        navigationControl()
        addSubviews()
        configUI()
        
    }
    func navigationControl() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        let rightBarButton = UIBarButtonItem(title: "수정", style: .plain, target: self, action: #selector(save(_:)))
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.title = "비밀번호 변경"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    func addSubviews() {
        view.addSubview(IngPassword)
        view.addSubview(IngPasswordInput)
        view.addSubview(newPassword)
        view.addSubview(NewPasswordInput)
        view.addSubview(PasswordCheck)
        view.addSubview(PasswordCheckInput)
    }
    func configUI() {
        NSLayoutConstraint.activate([
            IngPassword.topAnchor.constraint(equalTo: view.topAnchor,constant: 125),
            IngPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            IngPassword.widthAnchor.constraint(equalToConstant: 104),
            IngPassword.heightAnchor.constraint(equalToConstant: 26),
        ])
        NSLayoutConstraint.activate([
            IngPasswordInput.topAnchor.constraint(equalTo: IngPassword.bottomAnchor,constant: 10),
            IngPasswordInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            IngPasswordInput.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            IngPasswordInput.heightAnchor.constraint(equalToConstant: 57),
        ])
        NSLayoutConstraint.activate([
            newPassword.topAnchor.constraint(equalTo: IngPasswordInput.bottomAnchor,constant: 44),
            newPassword.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            newPassword.widthAnchor.constraint(equalToConstant: 87),
            newPassword.heightAnchor.constraint(equalToConstant: 26),
        ])
        NSLayoutConstraint.activate([
            NewPasswordInput.topAnchor.constraint(equalTo: newPassword.bottomAnchor,constant: 10),
            NewPasswordInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            NewPasswordInput.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            NewPasswordInput.heightAnchor.constraint(equalToConstant: 57),
        ])
        NSLayoutConstraint.activate([
            PasswordCheck.topAnchor.constraint(equalTo: NewPasswordInput.bottomAnchor,constant: 44),
            PasswordCheck.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 21),
            PasswordCheck.widthAnchor.constraint(equalToConstant: 104),
            PasswordCheck.heightAnchor.constraint(equalToConstant: 26),
        ])
        NSLayoutConstraint.activate([
            PasswordCheckInput.topAnchor.constraint(equalTo: PasswordCheck.bottomAnchor,constant: 10),
            PasswordCheckInput.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            PasswordCheckInput.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            PasswordCheckInput.heightAnchor.constraint(equalToConstant: 57),
        ])
    }
    //뒤로가기
    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }
    //저장
    @objc func save(_ sender: UIBarButtonItem) {
        
    }
    
}

    

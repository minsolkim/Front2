//
//  RegisterSelectViewController.swift
//  HomeEatPractice
//
//  Created by 강삼고 on 1/14/24.
//

import Foundation
import UIKit

class RegisterSelectViewController : UIViewController {
    
    private let registerContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 17
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private let tagLabel1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "1인 가구를 위한 식비 챌린지 커뮤니티"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = .green
        label.textAlignment = .center
        return label
    }()
    
    private let tagLabel2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "가입하기를 누르면 이용약관 동의로 간주합니다."
        label.font = UIFont.systemFont(ofSize: 18, weight: .medium)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()
    
    private let registerButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("가입하기", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.backgroundColor = UIColor(named: "green")
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)

        return button
    }()
    
    private let existButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("계정이 이미 있어요", for: .normal)
        button.setTitleColor(UIColor(named: "green"), for: .normal)
        button.backgroundColor = UIColor(named: "gray2")
        //테두리 넣기
        button.layer.borderColor = UIColor(named: "green")?.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
//        button.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "gray2")
        self.view.addSubview(registerContainer)
        let registerButton1 = makeCustomButton(viewController: self ,nextVC: RegisterViewController() )
        registerButton1.setTitle("가입하기", for: .normal)
//        registerButton1.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        self.registerContainer.addArrangedSubview(tagLabel1)
        self.registerContainer.addArrangedSubview(tagLabel2)
        self.registerContainer.addArrangedSubview(registerButton1)
        self.registerContainer.addArrangedSubview(existButton)
        
        
        
        
        
        NSLayoutConstraint.activate([
            self.registerContainer.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            self.registerContainer.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
    }
    
    @objc func registerButtonTapped(){
        let nextVC = RegisterViewController()
        self.navigationController?.pushViewController(nextVC, animated: true)
        
    }
    @objc func tabAddButton(_ sender: Any) {
        let nextVC = PayAddViewController()
        present(nextVC, animated: true, completion: nil)
        

    }
    
}


func makeCustomButton(viewController : UIViewController, nextVC : UIViewController) -> UIButton {
    var config = UIButton.Configuration.plain()
    var attributedTitle = AttributedString("계속하기")
    attributedTitle.font = .systemFont(ofSize: 18, weight: .medium)
    config.attributedTitle = attributedTitle

    config.imagePlacement = .top
    config.background.backgroundColor = UIColor(named: "green")
    config.baseForegroundColor = .black
    config.cornerStyle = .small

    let buttonAction = UIAction{ _ in
        viewController.navigationController?.pushViewController(nextVC, animated: true)
        print("hello")
    }
    let customButton = UIButton(configuration: config, primaryAction: buttonAction)
    customButton.heightAnchor.constraint(equalToConstant: 57).isActive = true
    
    return customButton
}


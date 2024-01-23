//
//  RegisterViewController.swift
//  HomeEatPractice
//
//  Created by 강삼고 on 1/14/24.
//

import Foundation
import UIKit

class RegisterViewController : UIViewController {
    
    private let registerContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 11
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private let tagLabel1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = UIColor(named: "green")
        label.textAlignment = .left
        return label
    }()
    
    private let tagLabel2 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "이메일 인증"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = UIColor(named: "green")
        label.textAlignment = .left
        return label
    }()
    
    private let tagLabel3 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = UIColor(named: "green")
        label.textAlignment = .left
        return label
    }()
    
    private let tagLabel4 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "비밀번호 확인"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = UIColor(named: "green")
        label.textAlignment = .left
        return label
    }()
    
    private let tagLabel5 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "닉네임"
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = UIColor(named: "green")
        label.textAlignment = .left
        return label
    }()
//    private let continueButton : UIButton = {
//        let button = UIButton()
//        button.translatesAutoresizingMaskIntoConstraints = false
//        button.setTitle("계속하기", for: .normal)
//        button.setTitleColor(.black, for: .normal)
//        button.backgroundColor = UIColor(named: "green")
//        button.layer.cornerRadius = 10
//        button.clipsToBounds = true
//        button.heightAnchor.constraint(equalToConstant: 57).isActive = true
//
//
//        return button
//    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "gray2")
        self.view.addSubview(registerContainer)
        let emailTextField = makeTextField()
        emailTextField.attributedPlaceholder = NSAttributedString(string: "이메일을 입력해 주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "searchfont") ?? .white])
        let emailCheckTextField = makeTextField()
        emailCheckTextField.attributedPlaceholder = NSAttributedString(string: "이메일에 전송된 번호를 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "searchfont") ?? .white])
        let pwTextField = makeTextField()
        pwTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호는 8~20자로 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "searchfont") ?? .white])
        let pwCheckTextField = makeTextField()
        pwCheckTextField.attributedPlaceholder = NSAttributedString(string: "비밀번호를 한 번 더 입력해주세요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "searchfont") ?? .white])
        let nickNameTextField = makeTextField()
        nickNameTextField.attributedPlaceholder = NSAttributedString(string: "한국어, 영어 모두 가능해요.", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "searchfont") ?? .white])
        let continueButton = makeCustomButton(viewController: self, nextVC: RegisterDoneViewController())
        continueButton.configuration?.background.backgroundColor = UIColor(named: "searchfont")
        
        self.registerContainer.addArrangedSubview(tagLabel1)
        self.registerContainer.addArrangedSubview(emailTextField)
        self.registerContainer.addArrangedSubview(tagLabel2)
        self.registerContainer.addArrangedSubview(emailCheckTextField)
        self.registerContainer.addArrangedSubview(tagLabel3)
        self.registerContainer.addArrangedSubview(pwTextField)
        self.registerContainer.addArrangedSubview(tagLabel4)
        self.registerContainer.addArrangedSubview(pwCheckTextField)
        self.registerContainer.addArrangedSubview(tagLabel5)
        self.registerContainer.addArrangedSubview(nickNameTextField)
        self.registerContainer.addArrangedSubview(continueButton)
        registerContainer.setCustomSpacing(21, after: emailTextField)
        registerContainer.setCustomSpacing(21, after: emailCheckTextField)
        registerContainer.setCustomSpacing(21, after: pwTextField)
        registerContainer.setCustomSpacing(21, after: pwCheckTextField)
        registerContainer.setCustomSpacing(38, after: nickNameTextField)


        
        
        
        
        NSLayoutConstraint.activate([
            self.registerContainer.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
            self.registerContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.registerContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.registerContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -76)
            
        ])
    }
    
    @objc func buttonTapped(){
        print("hi")
    }
    
    func setupSpacing() {
        registerContainer.setCustomSpacing(11, after: tagLabel1)
        registerContainer.setCustomSpacing(11, after: tagLabel2)
        registerContainer.setCustomSpacing(11, after: tagLabel3)
        registerContainer.setCustomSpacing(11, after: tagLabel4)
        registerContainer.setCustomSpacing(11, after: tagLabel5)
        
    }
}

func makeTextField() -> UITextField {
    let textField = UITextField()
    textField.translatesAutoresizingMaskIntoConstraints = false
    textField.backgroundColor = UIColor(named: "gray4")
    textField.font = UIFont.systemFont(ofSize: 16, weight: .bold)
    textField.layer.cornerRadius = 10
    textField.layer.masksToBounds = true
    textField.textColor = .white
    textField.heightAnchor.constraint(equalToConstant: 57).isActive = true
    
    let leftPaddingView = UIView(frame: CGRect(x: 0, y: 0, width: 18, height: textField.frame.height))
    textField.leftView = leftPaddingView
    textField.leftViewMode = .always
    return textField
}



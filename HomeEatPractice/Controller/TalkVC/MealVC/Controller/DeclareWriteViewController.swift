//
//  DeclareWriteViewController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/24.
//

import UIKit


class DeclareWriteViewController: UIViewController {
    
    var optionLabel: String?
    
    private let declareTitle: UILabel = {
        let title = UILabel()
        title.text = "신고하는 이유가 무엇인가요?"
        title.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        title.textColor = .white
        title.numberOfLines = 1
        title.textAlignment = .center
        title.translatesAutoresizingMaskIntoConstraints = false
        return title
    }()
    
    lazy var reasonButton: UIButton = {
        let button = UIButton()
        button.setTitle(optionLabel, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(r: 54, g: 56, b: 57)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.layer.borderColor = UIColor(r: 187, g: 187, b: 187).cgColor
        button.contentHorizontalAlignment = .left
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 18, bottom: 0, right: 0)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let textViewPlaceHolder = "신고 내용을 입력해주세요."
    
    lazy var declareTextField: UITextView = {
        let textField = UITextView()
        textField.backgroundColor = UIColor(r: 54, g: 56, b: 57)
        textField.text = textViewPlaceHolder
        textField.textColor = UIColor(r: 216, g: 216, b: 216)
        textField.font = .systemFont(ofSize: 16, weight: .medium)
        textField.textContainerInset = UIEdgeInsets(top: 15.0, left: 15.0, bottom: 0, right: 0)
        textField.layer.cornerRadius = 10
        textField.clipsToBounds = true
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    lazy var textLength: UILabel = {
        let label = UILabel()
        label.text = "300자 이내"
        label.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        label.textColor = UIColor(r: 216, g: 216, b: 216)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    lazy var declareSendButton: UIButton = {
        let button = UIButton()
        button.setTitle("신고하기", for: .normal)
        button.backgroundColor = UIColor(named: "green")
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .medium)
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.translatesAutoresizingMaskIntoConstraints = false
        button.addTarget(self, action: #selector(declareSendAction), for: .touchUpInside)
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray2")
        setAddViews()
        setConstraints()
        navigationcontrol()
    }
    
    private func setAddViews() {
        self.view.addSubview(self.declareTitle)
        self.view.addSubview(self.reasonButton)
        self.view.addSubview(self.declareTextField)
        self.view.addSubview(self.textLength)
        self.view.addSubview(self.declareSendButton)
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            self.declareTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 52),
            self.declareTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -52),
            self.declareTitle.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 139),
            
            self.reasonButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
            self.reasonButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21),
            self.reasonButton.topAnchor.constraint(equalTo: self.declareTitle.bottomAnchor, constant: 50),
            self.reasonButton.heightAnchor.constraint(equalToConstant: 47),
            
            self.declareTextField.leadingAnchor.constraint(equalTo: self.reasonButton.leadingAnchor),
            self.declareTextField.trailingAnchor.constraint(equalTo: self.reasonButton.trailingAnchor),
            self.declareTextField.topAnchor.constraint(equalTo: self.reasonButton.bottomAnchor, constant: 30),
            self.declareTextField.heightAnchor.constraint(equalToConstant: 144),
            
            self.textLength.trailingAnchor.constraint(equalTo: declareTextField.trailingAnchor),
            self.textLength.topAnchor.constraint(equalTo: declareTextField.bottomAnchor, constant: 10),
            self.textLength.heightAnchor.constraint(equalToConstant: 14),
            
            self.declareSendButton.leadingAnchor.constraint(equalTo: reasonButton.leadingAnchor),
            self.declareSendButton.trailingAnchor.constraint(equalTo: reasonButton.trailingAnchor),
            self.declareSendButton.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor, constant: -19),
            self.declareSendButton.heightAnchor.constraint(equalToConstant: 57),
        ])
        
    }
    
    private func navigationcontrol() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.title = "게시글 신고하기"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        }
    }
    
    // 신고하기 버튼을 눌렀을 떄 발생하는 메서드
    @objc func declareSendAction() {
        
    }
    
    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }

}

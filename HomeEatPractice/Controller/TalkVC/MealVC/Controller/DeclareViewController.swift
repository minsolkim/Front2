//
//  DeclareViewController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/24.
//

import UIKit

class DeclareViewController: UIViewController {
    
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
    
    private let optionButton1: UIButton = {
        let button = UIButton()
        button.setTitle("음란물입니다.", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(r: 187, g: 187, b: 187).cgColor
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(optionActtion), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let optionButton2: UIButton = {
        let button = UIButton()
        button.setTitle("욕설/생명경시/혐오/차별적 표현입니다.", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(r: 187, g: 187, b: 187).cgColor
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(optionActtion), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let optionButton3: UIButton = {
        let button = UIButton()
        button.setTitle("불쾌한 표현이 있습니다.", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(r: 187, g: 187, b: 187).cgColor
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(optionActtion), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let optionButton4: UIButton = {
        let button = UIButton()
        button.setTitle("개인정보 노출 게시물입니다.", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(r: 187, g: 187, b: 187).cgColor
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(optionActtion), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    private let optionButton5: UIButton = {
        let button = UIButton()
        button.setTitle("불법정보를 표현하고 있습니다.", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 10
        button.clipsToBounds = true
        button.layer.borderColor = UIColor(r: 187, g: 187, b: 187).cgColor
        button.contentHorizontalAlignment = .left
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        button.addTarget(self, action: #selector(optionActtion), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private let container: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 30
        stackView.distribution = .fillEqually
        stackView.translatesAutoresizingMaskIntoConstraints = false
        return stackView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "gray2")
        navigationcontrol()
        setAddViews()
        setConstraints()
    }
    
    private func setAddViews(){
        self.view.addSubview(self.declareTitle)
        self.view.addSubview(self.container)
        self.container.addArrangedSubview(self.optionButton1)
        self.container.addArrangedSubview(self.optionButton2)
        self.container.addArrangedSubview(self.optionButton3)
        self.container.addArrangedSubview(self.optionButton4)
        self.container.addArrangedSubview(self.optionButton5)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            self.declareTitle.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 51),
            self.declareTitle.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 52),
            self.declareTitle.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -52),
            self.declareTitle.heightAnchor.constraint(equalToConstant: 28),
            
            self.container.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21),
            self.container.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -22),
            self.container.topAnchor.constraint(equalTo: self.declareTitle.bottomAnchor, constant: 50),
            self.container.heightAnchor.constraint(equalToConstant: 355),
            
            self.optionButton1.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.optionButton1.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            
            self.optionButton2.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.optionButton2.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            
            self.optionButton3.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.optionButton3.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            
            self.optionButton4.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.optionButton4.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            
            self.optionButton5.leadingAnchor.constraint(equalTo: self.container.leadingAnchor),
            self.optionButton5.trailingAnchor.constraint(equalTo: self.container.trailingAnchor),
            self.optionButton5.bottomAnchor.constraint(equalTo: self.container.bottomAnchor),
            
        ])
    }
    
    
    @objc func optionActtion(_ sender: UIButton) {
        switch sender {
        case optionButton1:
            let declareWriteVC = DeclareWriteViewController()
            declareWriteVC.optionLabel = optionButton1.titleLabel?.text
            navigationController?.pushViewController(declareWriteVC, animated: true)
        case optionButton2:
            let declareWriteVC = DeclareWriteViewController()
            declareWriteVC.optionLabel = optionButton2.titleLabel?.text
            navigationController?.pushViewController(declareWriteVC, animated: true)
        case optionButton3:
            let declareWriteVC = DeclareWriteViewController()
            declareWriteVC.optionLabel = optionButton3.titleLabel?.text
            navigationController?.pushViewController(declareWriteVC, animated: true)
        case optionButton4:
            let declareWriteVC = DeclareWriteViewController()
            declareWriteVC.optionLabel = optionButton4.titleLabel?.text
            navigationController?.pushViewController(declareWriteVC, animated: true)
        case optionButton5:
            let declareWriteVC = DeclareWriteViewController()
            declareWriteVC.optionLabel = optionButton5.titleLabel?.text
            navigationController?.pushViewController(declareWriteVC, animated: true)
        default:
            fatalError("Error")
        }
    }
    
    
    //네비게이션 바 설정
    func navigationcontrol() {
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
    @objc func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        print("back click")
    }
    
}




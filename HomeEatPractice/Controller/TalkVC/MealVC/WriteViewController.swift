//
//  WriteViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/10.
//

import UIKit

class WriteViewController: UIViewController {
    
    //검색 뷰
    lazy var searchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "searchtf")
        if let borderColor = UIColor(named: "font3")?.cgColor {
            view.layer.borderColor = borderColor
        }
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        
        return view
    } ()
    
    // 텍스트 필드
    lazy var searchTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = "관심있는 집밥을 검색해보세요"
        textField.font = UIFont.systemFont(ofSize: 13)
        textField.textColor = UIColor(named: "searchfont")
        textField.attributedPlaceholder = NSAttributedString(string: "관심있는 집밥을 검색해보세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "searchfont") ?? UIColor.gray])

        return textField
    }()
    
    // 검색 이미지
    lazy var searchImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Group 5064"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    // 순서버튼
    lazy var listButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("최신순", for: .normal)
        button.setTitleColor(UIColor(named: "green"), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.setImage(UIImage(named: "Rectangle 2993"), for: .normal)
        button.semanticContentAttribute = .forceRightToLeft
        button.contentVerticalAlignment = .center
        button.contentHorizontalAlignment = .leading

        return button
    }()
    
    lazy var scrollView: UIScrollView = {
        var view = UIScrollView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.alwaysBounceVertical = false
        view.isDirectionalLockEnabled = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    lazy var widthBaseView: UIView = {
            var view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
    
    lazy var widthStackView: UIStackView = {
            var view = UIStackView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.axis = .horizontal
            view.distribution = .fill
            view.alignment = .fill
        view.spacing = 8
            return view
        }()
    
    lazy var contentbutton: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "gray2")
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.layer.borderWidth = 1.56
        button.layer.borderColor = UIColor(named: "green")?.cgColor
        button.setTitle("#전체글", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont(name: "폰트", size: 13) ?? .systemFont(ofSize: 13, weight: .medium)
        button.isSelected = true
        button.setTitleColor(UIColor(named: "green"), for: .selected)
        return button
    }()
    
    lazy var contentbutton2: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "gray2")
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.layer.borderWidth = 1.56
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("#주간_BEST", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont(name: "폰트", size: 13) ?? .systemFont(ofSize: 13, weight: .medium)
        button.setTitleColor(UIColor(named: "green"), for: .selected)
        return button
    }()
    
    lazy var contentbutton3: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "gray2")
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.layer.borderWidth = 1.56
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("#아침", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont(name: "폰트", size: 13) ?? .systemFont(ofSize: 13, weight: .medium)
        button.setTitleColor(UIColor(named: "green"), for: .selected)
        return button
    }()
    
    lazy var contentbutton4: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "gray2")
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.layer.borderWidth = 1.56
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("#점심", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont(name: "폰트", size: 13) ?? .systemFont(ofSize: 13, weight: .medium)
        button.setTitleColor(UIColor(named: "green"), for: .selected)
        return button
    }()
    
    lazy var contentbutton5: UIButton = {
        var button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = UIColor(named: "gray2")
        button.layer.cornerRadius = 15
        button.clipsToBounds = true
        button.layer.borderWidth = 1.56
        button.layer.borderColor = UIColor.gray.cgColor
        button.setTitle("#저녁", for: .normal)
        button.setTitleColor(UIColor.gray, for: .normal)
        button.titleLabel?.font = UIFont(name: "폰트", size: 13) ?? .systemFont(ofSize: 13, weight: .medium)
        button.setTitleColor(UIColor(named: "green"), for: .selected)
        return button
    }()
    
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addViews()
        setConstraints()
    }
    
    func addViews() {
        self.view.addSubview(searchView)
        self.searchView.addSubview(searchTextField)
        self.searchView.addSubview(searchImageView)
        self.view.addSubview(self.listButton)
        
        self.view.addSubview(self.scrollView)
        self.scrollView.addSubview(self.widthBaseView)
        self.widthBaseView.addSubview(self.widthStackView)
        self.widthStackView.addArrangedSubview(contentbutton)
        self.widthStackView.addArrangedSubview(contentbutton2)
        self.widthStackView.addArrangedSubview(contentbutton3)
        self.widthStackView.addArrangedSubview(contentbutton4)
        self.widthStackView.addArrangedSubview(contentbutton5)
        
    }
    
    
    func setConstraints() {
        
        
        self.searchView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        self.searchView.widthAnchor.constraint(equalToConstant: 351).isActive = true
        
        NSLayoutConstraint.activate([
            searchView.topAnchor.constraint(equalTo: view.topAnchor, constant: 164),
            searchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 21),
            searchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -21),
            
            searchTextField.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 10),
            searchTextField.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchImageView.leadingAnchor, constant: -10),

            searchImageView.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -10),
            searchImageView.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: 14.95),
            searchImageView.heightAnchor.constraint(equalToConstant: 14.95),
            
            self.listButton.topAnchor.constraint(equalTo: searchView.bottomAnchor, constant: 16),
            self.listButton.leadingAnchor.constraint(equalTo: searchView.leadingAnchor),
            
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            scrollView.topAnchor.constraint(equalTo: listButton.bottomAnchor, constant: 12),
            scrollView.heightAnchor.constraint(equalToConstant: 31),
            
            widthBaseView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            widthBaseView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            widthBaseView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            widthBaseView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            widthStackView.leadingAnchor.constraint(equalTo: widthBaseView.leadingAnchor),
            widthStackView.trailingAnchor.constraint(equalTo: widthBaseView.trailingAnchor),
            widthStackView.topAnchor.constraint(equalTo: widthBaseView.topAnchor),
            widthStackView.bottomAnchor.constraint(equalTo: widthBaseView.bottomAnchor),
            
            contentbutton.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentbutton.widthAnchor.constraint(equalToConstant: 68),
            contentbutton.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentbutton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentbutton2.widthAnchor.constraint(equalToConstant: 95),
            contentbutton2.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentbutton2.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentbutton3.widthAnchor.constraint(equalToConstant: 56),
            contentbutton3.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentbutton3.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
            contentbutton4.widthAnchor.constraint(equalToConstant: 56),
            contentbutton4.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentbutton4.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
         
            contentbutton5.widthAnchor.constraint(equalToConstant: 56),
            contentbutton5.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentbutton5.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            
           
        ])
    }
}

//
//  InfoViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/10.
//

import UIKit

class InfoViewController: UIViewController {
    //검색 뷰
    lazy var SearchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "searchtf")
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
        let imageView = UIImageView(image: UIImage(named: "search"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
//정보토크
    override func viewDidLoad() {
        super.viewDidLoad()
        configUI()
        
        
    }
    func configUI() {
        view.addSubview(SearchView)
        SearchView.addSubview(searchTextField)
        SearchView.addSubview(searchImageView)
        SearchView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        SearchView.widthAnchor.constraint(equalToConstant: 351).isActive = true
        NSLayoutConstraint.activate([
            SearchView.topAnchor.constraint(equalTo: view.topAnchor, constant: 10),
            SearchView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            
            searchTextField.leadingAnchor.constraint(equalTo: SearchView.leadingAnchor, constant: 10),
            searchTextField.centerYAnchor.constraint(equalTo: SearchView.centerYAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchImageView.leadingAnchor, constant: -10),

            searchImageView.trailingAnchor.constraint(equalTo: SearchView.trailingAnchor, constant: -10),
            searchImageView.centerYAnchor.constraint(equalTo: SearchView.centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: 14.95), // Adjust the width as needed
            searchImageView.heightAnchor.constraint(equalToConstant: 14.95) // Adjust the height as needed
            ])
    }

}
    

    



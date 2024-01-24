//
//  TagPlusViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/20.
//

import UIKit
import Then

class TagPlusViewController: UIViewController {
    //해시태그 수동 추가 필드
    private let tagplusField = UITextField().then {
        $0.placeholder = "다양한 해시태그를 추가해보세요!"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "     다양한 해시태그를 추가해보세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    //해시태그 vertical 스택 뷰
    //해시태그 horizontal 스택 뷰
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationControl()
        addSubviews()
        configUI()
        view.backgroundColor = UIColor(named: "gray2")
    }
    func navigationControl() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.title = "해시태그 추가"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    func addSubviews() {
        view.addSubview(tagplusField)
    }
    func configUI() {
        NSLayoutConstraint.activate([
            tagplusField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            tagplusField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tagplusField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tagplusField.heightAnchor.constraint(equalToConstant: 50),
           // tagplusField.widthAnchor.constraint(equalToConstant: 353)
        ])
    }
    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }
    

    

}

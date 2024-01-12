//
//  MyPageViewController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/02.
//

import Foundation
import UIKit

class MyPageViewController: UIViewController {
    lazy var borderView: UIView = {
        let borderView = UIView()
        borderView.backgroundColor = UIColor(named: "gray1")
        borderView.translatesAutoresizingMaskIntoConstraints = false
        return borderView
    } ()
    lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 43
        view.layer.borderWidth = 3.0 // 흰 테두리 두께 조절
        view.layer.borderColor = UIColor.white.cgColor // 흰 테두리 색상 설정
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "green")
        return view
    }()
    
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile") // 실제 프로필 이미지의 이름으로 변경
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    //프로필 이름
    lazy var profileName : UILabel = {
        let label = UILabel()
        label.text = "예진 님"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.systemFont(ofSize: 24)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    } ()
    //프로필 아이디 뷰
    
    //프로필 아이디 label
    
    //회원 정보 수정 버튼
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        navigationController?.navigationBar.shadowImage = UIImage()
        self.title = "마이페이지"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        addSubView()
        configUI()
    }
    func addSubView() {
        view.addSubview(borderView)
        view.addSubview(circleView)
        circleView.addSubview(profileImageView)
    }
    func configUI() {
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            borderView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            borderView.heightAnchor.constraint(equalToConstant: 1)
        ])
        NSLayoutConstraint.activate([
           circleView.widthAnchor.constraint(equalToConstant: 86), // 원형 뷰의 크기 설정
           circleView.heightAnchor.constraint(equalToConstant: 86), // 원형 뷰의 크기 설정
           circleView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 32),
           circleView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor,constant: 22),
           
           profileImageView.topAnchor.constraint(equalTo: circleView.topAnchor,constant: 16.5),
           profileImageView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor,constant: 9),
           
            ])
        }
}

//
//  PostViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/12.
//

import UIKit
//게시글 화면
class PostViewController: UIViewController {
    // 프로필 원형뷰
    lazy var circleView: UIView = {
        let view = UIView()
        // 원형 뷰 설정
        view.layer.cornerRadius = 10 // 또는 다른 크기로 원형 뷰 설정
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .green
        return view
    }()
    // 프로필 사진
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "character") // 실제 프로필 이미지의 이름으로 변경
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    // 프로필 이름
    // 게시 날짜
    // 신고하기
    // 제목
    // 내용
    // 게시글 사진
    // 좋아요
    // 댓글
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        navigationcontrol()
        configUI()
        view.backgroundColor = .black
    }
    func addSubView() {
        view.addSubview(circleView)
        circleView.addSubview(profileImageView)
    }
    func configUI() {
        // 제약 조건 설정
        NSLayoutConstraint.activate([
            // 서클 뷰의 크기와 위치 설정
            circleView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20),
            circleView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            circleView.widthAnchor.constraint(equalToConstant: 37.8),
            circleView.heightAnchor.constraint(equalToConstant: 37.8),
            

            // 이미지뷰가 서클 뷰의 가운데에 위치하도록 설정
            profileImageView.centerXAnchor.constraint(equalTo: circleView.centerXAnchor),
            profileImageView.centerYAnchor.constraint(equalTo: circleView.centerYAnchor),
            profileImageView.widthAnchor.constraint(equalTo: circleView.widthAnchor),
            profileImageView.heightAnchor.constraint(equalTo: circleView.heightAnchor)
        ])
    }
    //네비게이션 바 설정
    func navigationcontrol() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.title = "정보토크"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
     }
    }

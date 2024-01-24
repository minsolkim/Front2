//
//  InfoWritingViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/16.
//

import UIKit
import Then
class InfoWritingViewController: UIViewController {
    //MARK: - container 파트
    
    private let hashContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    
    
    //MARK: - UIButton 파트
    private let addImageButton : UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        let image = UIImage(systemName: "camera.fill", withConfiguration: imageConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("사진 추가", for: .normal)
        button.setImage(image, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.backgroundColor = UIColor(named: "searchtf")
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        return button
    }()
    //#해시태그
    private let tagImage = UIButton().then {
        $0.setImage(UIImage(named: "Talk11"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(navigateToTagPlusViewController), for: .touchUpInside)

    }
   
    //태그 문구
    private let tagButton = UIButton().then {
        $0.setTitle("#해시태그를 추가해 보세요!", for: .normal)
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.init(named: "green")?.cgColor
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //제목
    private let titleLabel = UILabel().then {
        $0.text = "제목"
        $0.textColor = UIColor.init(named: "green")
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //제목 입력 텍스트 필드
    private let titleField = UITextField().then {
        $0.placeholder = "제목을 입력하세요!"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "     제목을 입력하세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private let contentLabel = UILabel().then {
        $0.text = "내용"
        $0.textColor = UIColor.init(named: "green")
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let contentField = UITextField().then {
        $0.placeholder = "질문이나 이야기를 해 보세요!"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "     질문이나 이야기를 해 보세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray3")
        
        navigationControl()
        configUI()
        
    }
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            tabBarController?.tabBar.isHidden = false
            tabBarController?.tabBar.isTranslucent = false
    }
    func navigationControl() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        let rightBarButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(save(_:)))
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.title = "정보토크 글쓰기"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    
    func configUI() {
        let customButton = makeCustomButton()
        customButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(tagButton)
        self.view.addSubview(tagImage)
        self.view.addSubview(titleLabel)
        self.view.addSubview(titleField)
        self.view.addSubview(contentLabel)
        self.view.addSubview(contentField)
        self.view.addSubview(customButton)
        NSLayoutConstraint.activate([
                tagButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 267),
                tagButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
                tagButton.heightAnchor.constraint(equalToConstant: 40),
                tagButton.widthAnchor.constraint(equalToConstant: 214)
                //tagButton.trailingAnchor.constraint(equalTo: self.tagImage.leadingAnchor,constant: 95),
                
        ])
        NSLayoutConstraint.activate([
                tagImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 265),
                tagImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                tagImage.heightAnchor.constraint(equalToConstant: 42),
                tagImage.widthAnchor.constraint(equalToConstant: 42)
        ])
        NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: tagButton.bottomAnchor, constant: 41),
                titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21),
                titleLabel.heightAnchor.constraint(equalToConstant: 34),
                titleLabel.widthAnchor.constraint(equalToConstant: 34)
        ])
        NSLayoutConstraint.activate([
                titleField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                titleField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                titleField.heightAnchor.constraint(equalToConstant: 50),
                titleField.widthAnchor.constraint(equalToConstant: 353)
        ])
        NSLayoutConstraint.activate([
                contentLabel.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 27),
                contentLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                contentLabel.heightAnchor.constraint(equalToConstant: 50),
                contentLabel.widthAnchor.constraint(equalToConstant: 353)
        ])
        NSLayoutConstraint.activate([
                contentField.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 5),
                contentField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                contentField.heightAnchor.constraint(equalToConstant: 50),
                contentField.widthAnchor.constraint(equalToConstant: 353)
        ])
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 48),
            customButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 108),
            customButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -109),
            customButton.heightAnchor.constraint(equalToConstant: 176),
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
    @objc func navigateToTagPlusViewController(_ sender: Any) {
        let tagplusVC = TagPlusViewController()

        self.navigationController?.pushViewController(tagplusVC, animated: true)
        print("tagplus click")
    }
    func makeCustomButton() -> UIButton {
        var config = UIButton.Configuration.plain()
        var attributedTitle = AttributedString("사진 추가")
        attributedTitle.font = .systemFont(ofSize: 18, weight: .bold)
        config.attributedTitle = attributedTitle
        let pointSize = CGFloat(30)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize)
        config.image = UIImage.init(named: "Talk1")
        config.preferredSymbolConfigurationForImage = imageConfig

        config.imagePlacement = .top
        config.background.backgroundColor = .darkGray
        config.baseForegroundColor = .lightGray
        config.cornerStyle = .small

        // 이미지와 텍스트 간격 조절
        config.imagePadding = 12.7
        config.titlePadding = 10

        let customButton = UIButton(configuration: config)
        customButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)

        return customButton
    }
    
    @objc func buttonTapped(){
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        let firstAction = UIAlertAction(title: "사진 촬영", style: .default)
        let secondAction = UIAlertAction(title: "앨범에서 사진 선택", style: .default)
        let cancleAction = UIAlertAction(title: "취소", style: .cancel , handler: nil)
        firstAction.setValue(UIColor.white, forKey: "titleTextColor")
        secondAction.setValue(UIColor.white, forKey: "titleTextColor")
        cancleAction.setValue(UIColor.red, forKey: "titleTextColor")
        
        
        actionSheetController.addAction(firstAction)
        actionSheetController.addAction(secondAction)
        actionSheetController.addAction(cancleAction)
        self.present(actionSheetController, animated: true, completion: nil)
        
        
    }
    
}

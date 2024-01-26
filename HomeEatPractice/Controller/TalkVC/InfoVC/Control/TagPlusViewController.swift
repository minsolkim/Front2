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
    private let verticalStackView = UIStackView().then {
        $0.axis = .vertical
        $0.spacing = 17
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //해시태그 horizontal 스택 뷰
    private let horizontalStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //해시태그 horizontal 스택 뷰 2
    private let additionalHorizontalStackView = UIStackView().then {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .fillEqually
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
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
        view.addSubview(verticalStackView)
        // Vertical Stack View에 추가적인 Horizontal Stack View를 추가
        verticalStackView.addArrangedSubview(horizontalStackView)
        verticalStackView.addArrangedSubview(additionalHorizontalStackView)
        // 각 Horizontal Stack View에 버튼 추가
        addTagButtonsToHorizontalStackView()
        addAdditionalTagButtonsToHorizontalStackView()
    }
    func configUI() {
        NSLayoutConstraint.activate([
            tagplusField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            tagplusField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tagplusField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tagplusField.heightAnchor.constraint(equalToConstant: 50),
        ])
        NSLayoutConstraint.activate([
            verticalStackView.topAnchor.constraint(equalTo: tagplusField.bottomAnchor, constant: 33),
            verticalStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            verticalStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
        ])
        
    }
    // 해시태그 버튼을 수동으로 추가하는 함수
    private func addTagButtonsToHorizontalStackView() {
        let tag1Button = createTagButton(title: "#할인")
        let tag2Button = createTagButton(title: "#마트")
        let tag3Button = createTagButton(title: "#과일")
        let tag4Button = createTagButton(title: "#음료")

        // 버튼을 가로 스택뷰에 추가
        horizontalStackView.addArrangedSubview(tag1Button)
        horizontalStackView.addArrangedSubview(tag2Button)
        horizontalStackView.addArrangedSubview(tag3Button)
        horizontalStackView.addArrangedSubview(tag4Button)
    }
    // 2번째 스택 뷰
    private func addAdditionalTagButtonsToHorizontalStackView() {
        let additionalTag1Button = createTagButton(title: "#고기")
        let additionalTag2Button = createTagButton(title: "#튀김")
        let additionalTag3Button = createTagButton(title: "#야식")
        let additionalTag4Button = createTagButton(title: "#공구")
        
        additionalHorizontalStackView.addArrangedSubview(additionalTag1Button)
        additionalHorizontalStackView.addArrangedSubview(additionalTag2Button)
        additionalHorizontalStackView.addArrangedSubview(additionalTag3Button)
        additionalHorizontalStackView.addArrangedSubview(additionalTag4Button)

    }
    // 해시태그 버튼 생성 함수
    private func createTagButton(title: String) -> UIButton {
        let button = UIButton(type: .system)
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        // 버튼의 원래 border 색상 및 title 색상
        let normalBorderColor = UIColor(named: "font5")?.cgColor ?? UIColor.gray.cgColor
        let normalTitleColor = UIColor(named: "font5") ?? UIColor.gray
        button.setTitleColor(normalTitleColor, for: .normal)
        
        button.layer.cornerRadius = 22.5
        button.clipsToBounds = true
        button.layer.borderColor = normalBorderColor
        button.layer.borderWidth = 2
        
        // 버튼이 선택되었을 때의 border 색상 및 title 색상
        let selectedBorderColor = UIColor(named: "green")?.cgColor ?? UIColor.red.cgColor
        let selectedTitleColor = UIColor(named: "green") ?? UIColor.red
        button.setTitleColor(selectedTitleColor, for: .selected)
        
        button.backgroundColor = UIColor(named: "gray4") ?? UIColor.gray
        button.addTarget(self, action: #selector(tagButtonTapped(_:)), for: .touchUpInside)
        button.heightAnchor.constraint(equalToConstant: 44).isActive = true

        return button
    }

    @objc private func tagButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        // 버튼의 선택 여부에 따라 border 색상 및 title 색상을 변경
        if sender.isSelected {
            sender.layer.borderColor = UIColor(named: "green")?.cgColor ?? UIColor.red.cgColor
            sender.setTitleColor(UIColor(named: "green") ?? UIColor.red, for: .selected)
        } else {
            sender.layer.borderColor = UIColor(named: "font5")?.cgColor ?? UIColor.gray.cgColor
            sender.setTitleColor(UIColor(named: "font5") ?? UIColor.gray, for: .normal)
        }
        
        print("Tag Button Tapped: \(sender.currentTitle ?? "")")
    }

    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }
    

    

}

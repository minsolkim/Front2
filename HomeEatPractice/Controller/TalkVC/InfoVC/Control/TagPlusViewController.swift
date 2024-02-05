//
//  TagPlusViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/20.
//

import UIKit
import Then

class TagPlusViewController: UIViewController {
    var selectedTags: [String] = []
    var tags: [TagItem] = defaultTags
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
    private let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor(named: "gray2")
        return collectionView
    }()
    //저장 버튼
    private let saveButton = UIButton().then {
        $0.setTitle("저장", for: .normal)
        $0.setTitleColor(UIColor.white, for: .normal)
        $0.layer.cornerRadius = 10
        $0.layer.masksToBounds = true
        $0.backgroundColor = UIColor.init(named: "gray4")
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(navigatetToInfoWritingViewController), for: .touchUpInside)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //기본 태그 데이터를 초기화
        tags = defaultTags
        navigationControl()
        addSubviews()
        configUI()
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(TagPlusCollectionViewCell.self, forCellWithReuseIdentifier: TagPlusCollectionViewCell.reuseIdentifier)
        
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        view.backgroundColor = UIColor(named: "gray2")
    }
    // MARK: - 탭바제거
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 커스텀 탭바를 숨깁니다.
        if let tabBarController = self.tabBarController as? MainTabBarController {
            tabBarController.customTabBar.isHidden = true
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 다른 화면으로 넘어갈 때 커스텀 탭바를 다시 보이게 합니다.
        if let tabBarController = self.tabBarController as? MainTabBarController {
            tabBarController.customTabBar.isHidden = false
        }
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
        view.addSubview(collectionView)
        view.addSubview(saveButton)
    }
    func configUI() {
        NSLayoutConstraint.activate([
            tagplusField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 23),
            tagplusField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            tagplusField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            tagplusField.heightAnchor.constraint(equalToConstant: 50),
        ])
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: tagplusField.bottomAnchor, constant: 20),
            collectionView.leadingAnchor.constraint(equalTo: tagplusField.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: tagplusField.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: saveButton.topAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            saveButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -76),
            saveButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            saveButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            saveButton.heightAnchor.constraint(equalToConstant: 57)
        ])
        
    }
    
    
    @objc private func tagButtonTapped(_ sender: UIButton) {
        sender.isSelected.toggle()
        
        // 버튼의 선택 여부에 따라 border 색상 및 title 색상을 변경
        if sender.isSelected {
            sender.layer.borderColor = UIColor(named: "green")?.cgColor ?? UIColor.red.cgColor
            sender.tintColor = .clear
            sender.setTitleColor(UIColor(named: "green") ?? UIColor.red, for: .selected)
            // 선택된 경우, 저장 버튼의 배경색을 변경
            saveButton.backgroundColor = UIColor(named: "green") ?? UIColor.red
            saveButton.setTitleColor(UIColor.black, for: .selected)
            selectedTags.append(sender.currentTitle ?? "")
            print(selectedTags)
        } else {
            sender.layer.borderColor = UIColor(named: "font5")?.cgColor ?? UIColor.gray.cgColor
            sender.setTitleColor(UIColor(named: "font5") ?? UIColor.gray, for: .normal)
            // 선택이 해제되면 해당 타이틀을 배열에서 제거
            if let index = selectedTags.firstIndex(of: sender.currentTitle ?? "") {
                selectedTags.remove(at: index)
            }
            // 다른 버튼이 선택되지 않은 경우, 저장 버튼의 배경색을 원래대로 변경
//            if !horizontalStackView.arrangedSubviews.contains(where: { ($0 as? UIButton)?.isSelected == true }) &&
//               !additionalHorizontalStackView.arrangedSubviews.contains(where: { ($0 as? UIButton)?.isSelected == true }) {
//                saveButton.backgroundColor = UIColor(named: "gray4") ?? UIColor.gray
//                saveButton.setTitleColor(UIColor.white, for: .normal)
//            }
        }
        
        print("Tag Button Tapped: \(sender.currentTitle ?? "")")
    }


    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }
    //게시글 작성으로 넘어감
    @objc func navigatetToInfoWritingViewController(_ sender: Any) {
        let InfoWriteVC = InfoWritingViewController()
        InfoWriteVC.selectedTags = selectedTags
        tabBarController?.tabBar.isHidden = true //하단 탭바 안보이게 전환
        print("Selected Tags: \(selectedTags)")
        self.navigationController?.pushViewController(InfoWriteVC, animated: true)
        print("present click")
    }
    
    

}
extension TagPlusViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagPlusCollectionViewCell.reuseIdentifier, for: indexPath) as? TagPlusCollectionViewCell else {
            return UICollectionViewCell()
        }
        
        let tagItem = tags[indexPath.item]
        cell.configure(with: tagItem.tagTitle)
        return cell
    }
}
extension TagPlusViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let tagItem = tags[indexPath.item]
        let titleSize = NSString(string: tagItem.tagTitle).size(withAttributes: [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
        ])
        let cellWidth = titleSize.width + 50 // 여유 공간을 더해 원하는 여백을 확보합니다.
        
        return CGSize(width: cellWidth, height: 45)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }

    

}

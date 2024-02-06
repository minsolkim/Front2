//
//  TagPlusCollectionViewCell.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/02/04.
//

import UIKit

class TagPlusCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "TagPlusCell"
    let talk12Image = UIImage(named: "Talk12")
    var onSelectStatusChange: ((Bool) -> Void)?

    private let tagButton =  UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("#할인", for: .normal)
        $0.layer.cornerRadius = 22.5
        $0.clipsToBounds = true
        // 버튼의 원래 border 색상 및 title 색상
        let normalBorderColor = UIColor(named: "font5")?.cgColor ?? UIColor.gray.cgColor
        let normalTitleColor = UIColor(named: "font5") ?? UIColor.gray
        $0.setTitleColor(normalTitleColor, for: .normal)
        $0.backgroundColor = UIColor(named: "gray4")
        $0.layer.borderColor = normalBorderColor
        $0.layer.borderWidth = 2
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
    override var isSelected: Bool {
        didSet {
            setSelected(isSelected)
            onSelectStatusChange?(isSelected)

        }
    }
    func setSelected(_ selected: Bool) {
        if isSelected {
            // 선택된 상태일 때의 스타일
            tagButton.layer.borderColor = UIColor(named: "green")?.cgColor ?? UIColor.red.cgColor
            tagButton.tintColor = .clear
            tagButton.setTitleColor(UIColor(named: "green") ?? UIColor.red, for: .selected)
            tagButton.isSelected = true // tagButton의 isSelected 속성 설정
            print("셀 선택 ")
        } else {
            // 선택이 해제된 상태일 때의 스타일
            tagButton.layer.borderColor = UIColor(named: "font5")?.cgColor ?? UIColor.gray.cgColor
            tagButton.setTitleColor(UIColor(named: "font5") ?? UIColor.gray, for: .normal)
            tagButton.isSelected = false // tagButton의 isSelected 속성 설정
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagButton)
        tagButton.isUserInteractionEnabled = true
        NSLayoutConstraint.activate([
            tagButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            tagButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tagButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tagButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
        tagButton.addTarget(self, action: #selector(tagButtonTapped), for: .touchUpInside)

    }
    @objc private func tagButtonTapped() {
        // 현재 선택 상태를 확인하여 반대로 변경합니다.
        isSelected = !isSelected
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with tag: String, image: UIImage? = nil) {
            tagButton.setTitle("\(tag)", for: .normal)
            
            // 동적으로 셀 크기를 조정하기 위해 태그 문자열 길이에 따라 버튼의 크기를 조정합니다.
            let titleSize = NSString(string: tag).size(withAttributes: [
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 15)
            ])
            let buttonWidth = titleSize.width + 20 // 여유 공간을 더해 원하는 여백을 확보합니다.

            tagButton.widthAnchor.constraint(equalToConstant: buttonWidth).isActive = true
        }
}

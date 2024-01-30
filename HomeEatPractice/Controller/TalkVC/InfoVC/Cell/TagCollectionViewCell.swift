//
//  TagCollectionViewCell.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/30.
//

import UIKit
import Then

class TagCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "TagCell"
    private let tagButton =  UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("#할인", for: .normal)
        $0.layer.cornerRadius = 18
        $0.clipsToBounds = true
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.backgroundColor = UIColor(named: "gray4")
        $0.layer.borderColor = UIColor.init(named: "green")?.cgColor
        $0.layer.borderWidth = 2
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 15)
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(tagButton)

        NSLayoutConstraint.activate([
            tagButton.topAnchor.constraint(equalTo: contentView.topAnchor),
            tagButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            tagButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            tagButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func configure(with tag: String) {
        tagButton.setTitle("\(tag)", for: .normal)
    }
}

//
//  PhotoCollectionViewCell.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/29.
//

import UIKit
//MARK: - 앨범 사진 셀 
class PhotoCollectionViewCell: UICollectionViewCell {
    static let reuseIdentifier = "PhotoCell"

    let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.layer.cornerRadius = 14
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)

        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor,constant: 25),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

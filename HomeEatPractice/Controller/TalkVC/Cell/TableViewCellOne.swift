//
//  TableViewCellOne.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/11.
//

import UIKit

final class TableViewCellOne: UITableViewCell {
    static let identifier = "TableViewCell"
    //게시글 사진
    var PostImageView: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = 10
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    //게시글 제목
    var titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.textColor = .white
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //게시글 날짜
    var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //게시글 내용
    var contentLabel: UILabel = {
        let label = UILabel()
        label.textColor = .gray
        label.font = .systemFont(ofSize: 10)
        label.numberOfLines = 4
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //좋아요 이미지
    var heartImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    //좋아요 개수
    var heartLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "locationfont")
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    //댓글 이미지
    var chatImage: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    //댓글 개수
    var chatLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "locationfont")
        label.font = .systemFont(ofSize: 10)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(dateLabel)
        contentView.addSubview(contentLabel)
        contentView.addSubview(PostImageView)
        contentView.addSubview(heartImage)
        contentView.addSubview(heartLabel)
        contentView.addSubview(chatImage)
        contentView.addSubview(chatLabel)
        contentView.layer.borderColor = UIColor.lightGray.cgColor
        contentView.backgroundColor = UIColor(named: "searchtf")
        contentView.layer.borderWidth = 1.0
        contentView.layer.cornerRadius = 10.0
        contentView.layer.masksToBounds = true
        
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 40),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
            
            dateLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10),
            dateLabel.topAnchor.constraint(equalTo: titleLabel.topAnchor),
            dateLabel.trailingAnchor.constraint(lessThanOrEqualTo: contentView.trailingAnchor, constant: -10),
            dateLabel.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor),
            
        ])
        NSLayoutConstraint.activate([
            PostImageView.leadingAnchor.constraint(equalTo: contentLabel.trailingAnchor, constant: 10),
            PostImageView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            PostImageView.widthAnchor.constraint(equalToConstant: 78),
            PostImageView.heightAnchor.constraint(equalToConstant: 73),
            ])
            
        NSLayoutConstraint.activate([
            contentLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            contentLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 6),
            contentLabel.widthAnchor.constraint(equalToConstant: 233),
            contentLabel.heightAnchor.constraint(equalToConstant: 56),
        ])
        NSLayoutConstraint.activate([
            heartImage.leadingAnchor.constraint(equalTo: contentLabel.leadingAnchor),
            heartImage.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 10),
            heartImage.widthAnchor.constraint(equalToConstant: 11.9),
            heartImage.heightAnchor.constraint(equalToConstant: 11),
            heartLabel.leadingAnchor.constraint(equalTo: heartImage.trailingAnchor, constant: 5),
            heartLabel.centerYAnchor.constraint(equalTo: heartImage.centerYAnchor),
            
            chatImage.leadingAnchor.constraint(equalTo: heartLabel.trailingAnchor, constant: 10),
            chatImage.centerYAnchor.constraint(equalTo: heartImage.centerYAnchor),
            chatImage.widthAnchor.constraint(equalToConstant: 11.9),
            chatImage.heightAnchor.constraint(equalToConstant:11),
            
            chatLabel.leadingAnchor.constraint(equalTo: chatImage.trailingAnchor, constant: 5),
            chatLabel.centerYAnchor.constraint(equalTo: heartImage.centerYAnchor),
            ])
        
        }
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
       
    }

}

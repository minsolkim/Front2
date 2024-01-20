//
//  WriteViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/10.
//

import UIKit
//집밥토크
class WriteViewController: UIViewController {
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = "집밥토크"
        label.textColor = .black
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold) 
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray2")
        view.addSubview(titleLabel)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
    }
    
}

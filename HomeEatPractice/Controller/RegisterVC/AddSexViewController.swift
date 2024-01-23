//
//  AddSexViewController.swift
//  HomeEatPractice
//
//  Created by 강삼고 on 1/23/24.
//

import Foundation
import UIKit

class AddSexViewController : UIViewController {
    
    private let registerContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillProportionally
        stackView.spacing = 93
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private let selectContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fill
        stackView.spacing = 21
        stackView.axis = .horizontal
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private let label1 : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "성별을\n선택해주세요."
        label.numberOfLines = 2
        label.font = UIFont.systemFont(ofSize: 28, weight: .medium)
        label.backgroundColor = UIColor(named: "gray2")
        label.textColor = .white
        label.textAlignment = .left
        return label
    }()
    
    private let maleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("남", for: .normal)
        button.setTitleColor(UIColor(named: "green"), for: .normal)
        button.backgroundColor = UIColor(named: "gray4")
        //테두리 넣기
        button.layer.borderColor = UIColor(named: "green")?.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.clipsToBounds = true


        return button
    }()
    
    private let femaleButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("여", for: .normal)
        button.setTitleColor(UIColor(named: "green"), for: .normal)
        button.backgroundColor = UIColor(named: "gray4")
        //테두리 넣기
        button.layer.borderColor = UIColor(named: "green")?.cgColor
        button.layer.borderWidth = 2
        button.layer.cornerRadius = 10
        button.clipsToBounds = true


        return button
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "gray2")
        self.view.addSubview(registerContainer)
        self.view.addSubview(selectContainer)
        self.registerContainer.addArrangedSubview(label1)
        
        self.registerContainer.addArrangedSubview(selectContainer)
        self.selectContainer.addArrangedSubview(maleButton)
        self.selectContainer.addArrangedSubview(femaleButton)
        
        let continueButton = makeCustomButton(viewController: self, nextVC: AddLocationInfromViewController())

        self.registerContainer.addArrangedSubview(continueButton)
        registerContainer.setCustomSpacing(279, after: selectContainer)
        
        NSLayoutConstraint.activate([
            
            self.registerContainer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 178),
            self.registerContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.registerContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.registerContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -76),
        ])
    }
    
    
}

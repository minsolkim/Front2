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
        stackView.distribution = .fill
        stackView.spacing = 468
        stackView.axis = .vertical
        stackView.alignment = .fill
        
        return stackView
    }()
    
    private let selectContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
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
    private lazy var maleButton : UIButton = {
        var config = UIButton.Configuration.plain()
        var attributedTitle = AttributedString("남")
        attributedTitle.font = .systemFont(ofSize: 24, weight: .bold)
        config.attributedTitle = attributedTitle
        config.cornerStyle = .small
        config.background.backgroundColor = UIColor(named: "gray4")
        config.baseForegroundColor = .white
        config.background.strokeColor = UIColor(r: 83, g: 85, b: 86)
        config.background.strokeWidth = 2
        
        //테두리 변경
        let buttonAction = UIAction{ _ in
            if config.background.strokeColor == UIColor(r: 83, g: 85, b: 86) {
                config.background.strokeColor = UIColor(named: "green")
                config.baseForegroundColor = UIColor(named: "green")
            }
            else
            {
                config.background.strokeColor = UIColor(r: 83, g: 85, b: 86)
                config.baseForegroundColor = .white
            }
            
            self.maleButton.configuration = config
        }
        
        let button = UIButton(configuration: config, primaryAction: buttonAction )

    
<<<<<<< HEAD
=======
    private lazy var maleButton : UIButton = {
        var config = UIButton.Configuration.plain()
        var attributedTitle = AttributedString("남")
        attributedTitle.font = .systemFont(ofSize: 24, weight: .bold)
        config.attributedTitle = attributedTitle
        config.cornerStyle = .small
        config.background.backgroundColor = UIColor(named: "gray4")
        config.baseForegroundColor = .white
        config.background.strokeColor = UIColor(r: 83, g: 85, b: 86)
        config.background.strokeWidth = 2
        
        //테두리 변경
        let buttonAction = UIAction{ _ in
            if config.background.strokeColor == UIColor(r: 83, g: 85, b: 86) {
                config.background.strokeColor = UIColor(named: "green")
                config.baseForegroundColor = UIColor(named: "green")
            }
            else
            {
                config.background.strokeColor = UIColor(r: 83, g: 85, b: 86)
                config.baseForegroundColor = .white
            }
            
            self.maleButton.configuration = config
        }
        
        let button = UIButton(configuration: config, primaryAction: buttonAction )

    
>>>>>>> 197acce5cc70835a7bc26a2d685c94690ca90af0
        return button
    }()
    
    private lazy var femaleButton : UIButton = {
        var config = UIButton.Configuration.plain()
        var attributedTitle = AttributedString("여")
        attributedTitle.font = .systemFont(ofSize: 24, weight: .bold)
        config.attributedTitle = attributedTitle
        config.cornerStyle = .small
        config.background.backgroundColor = UIColor(named: "gray4")
        config.baseForegroundColor = .white
        config.background.strokeColor = UIColor(r: 83, g: 85, b: 86)
        config.background.strokeWidth = 2
        
        //테두리 변경
        let buttonAction = UIAction{ _ in
            if config.background.strokeColor == UIColor(r: 83, g: 85, b: 86) {
                config.background.strokeColor = UIColor(named: "green")
                config.baseForegroundColor = UIColor(named: "green")
            }
            else
            {
                config.background.strokeColor = UIColor(r: 83, g: 85, b: 86)
                config.baseForegroundColor = .white
            }
            
            self.femaleButton.configuration = config
        }
        
        let button = UIButton(configuration: config, primaryAction: buttonAction )

    
<<<<<<< HEAD
>>>>>>> KMS
=======
>>>>>>> 197acce5cc70835a7bc26a2d685c94690ca90af0
        return button
    }()
    
    
<<<<<<< HEAD
<<<<<<< HEAD
    
=======
>>>>>>> KMS
=======
>>>>>>> 197acce5cc70835a7bc26a2d685c94690ca90af0
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor(named: "gray2")
        self.view.addSubview(registerContainer)
        self.view.addSubview(selectContainer)
        self.registerContainer.addArrangedSubview(label1)
<<<<<<< HEAD
//        self.registerContainer.addArrangedSubview(selectContainer)
        self.view.addSubview(selectContainer)
>>>>>>> KMS
=======
        
//        self.registerContainer.addArrangedSubview(selectContainer)
        self.view.addSubview(selectContainer)
>>>>>>> 197acce5cc70835a7bc26a2d685c94690ca90af0
        self.selectContainer.addArrangedSubview(maleButton)
        self.selectContainer.addArrangedSubview(femaleButton)
        
        let continueButton = makeCustomButton(viewController: self, nextVC: AddLocationInfromViewController())

        self.registerContainer.addArrangedSubview(continueButton)
<<<<<<< HEAD

//        registerContainer.setCustomSpacing(279, after: selectContainer)
>>>>>>> KMS
=======
//        registerContainer.setCustomSpacing(279, after: selectContainer)
>>>>>>> 197acce5cc70835a7bc26a2d685c94690ca90af0
        
        NSLayoutConstraint.activate([
            
            self.registerContainer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 178),
            self.registerContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.registerContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
<<<<<<< HEAD
            self.registerContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -76),  
=======
            self.registerContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -76),
            
>>>>>>> 197acce5cc70835a7bc26a2d685c94690ca90af0
            self.selectContainer.topAnchor.constraint(equalTo: self.view.topAnchor, constant: 344),
            self.selectContainer.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
            self.selectContainer.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
            self.selectContainer.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -412),
<<<<<<< HEAD
>>>>>>> KMS
=======
>>>>>>> 197acce5cc70835a7bc26a2d685c94690ca90af0
        ])
    }
    
    
}

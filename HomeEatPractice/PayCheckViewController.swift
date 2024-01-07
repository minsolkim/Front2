//
//  PatAddViewController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/04.
//

import UIKit

class PayCheckViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "지출 확인"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = .black
    }
}


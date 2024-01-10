//
//  PayCheckViewController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/03.
//

import Foundation
import UIKit

class PayAddViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "지출 추가"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = .black
    }
    
}

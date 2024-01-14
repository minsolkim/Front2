//
//  MainTabBarController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/02.
//

import Foundation
import UIKit

class MainTabBarController: UITabBarController, UITabBarControllerDelegate {
    // 플로팅 버튼
    private let floatingButton: UIButton = {
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: 0, y: 0, width: 100, height: 57) // 버튼의 크기를 원하는 값으로 수정
        let buttonImage = UIImage(named: "writebtn")
        button.setImage(buttonImage, for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(floatingButton)
        self.delegate = self
        setupTabBar()
    }
    
    // 탭바의 각각의 탭마다 네비게이션뷰 생성.
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // 홈
        let navigationHome = UINavigationController(rootViewController: HomeViewController())
        let homeTabBarItem = UITabBarItem(title: "홈", image: UIImage(systemName: "house.fill"), tag: 0)
        navigationHome.tabBarItem = homeTabBarItem
        
        // 홈잇캐시
        let navigationCash = UINavigationController(rootViewController: CashViewController())
        let cashTabBarItem = UITabBarItem(title: "홈잇캐시", image: UIImage(systemName: "medal.fill"), tag: 1)
        navigationCash.tabBarItem = cashTabBarItem
        
        // 홈잇토크
        let navigationTalk = UINavigationController(rootViewController: TalkViewController())
        let talkTabBarItem = UITabBarItem(title: "홈잇토크", image: UIImage(systemName: "book.closed.fill"), tag: 2)
        navigationTalk.tabBarItem = talkTabBarItem
        //집밥토크
        //정보토크
        
        // 마이페이지
        let navigationMyPage = UINavigationController(rootViewController: MyPageViewController())
        let mypageTabBar = UITabBarItem(title: "마이페이지", image: UIImage(systemName: "person.fill"), tag: 3)
        navigationMyPage.tabBarItem = mypageTabBar
        
        self.viewControllers = [navigationHome, navigationCash, navigationTalk, navigationMyPage]
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        if let selectedViewController = selectedViewController as? UINavigationController,
           let topViewController = selectedViewController.topViewController {
                
            if let talkViewController = topViewController as? TalkViewController {
                // 현재 선택된 뷰 컨트롤러가 TalkViewController이고, 최상위 뷰 컨트롤러가 TalkViewController인 경우에만 플로팅 버튼을 보이게 함
                   
                    print("floating button")
                    floatingButton.isHidden = false
                } else {
                    floatingButton.removeFromSuperview()
                    floatingButton.isHidden = true
                }
            } else {
                floatingButton.removeFromSuperview()
                floatingButton.isHidden = true
            }

        // 플로팅 버튼의 위치 조정
        let buttonYPosition = view.frame.size.height - 60 - 80 - 35
        floatingButton.frame = CGRect(x: view.frame.size.width - 120, y: buttonYPosition, width: 100, height: 57)
    }

    
    
    // 탭바 설정. 커스텀탭바 생성해야될듯.
    private func setupTabBar() {
        self.tabBar.tintColor = .green
        self.tabBar.isTranslucent = false
        self.tabBar.barTintColor = .white
        self.tabBar.unselectedItemTintColor = .lightGray
        self.tabBar.layer.cornerRadius = tabBar.frame.height * 0.15
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
    }
}


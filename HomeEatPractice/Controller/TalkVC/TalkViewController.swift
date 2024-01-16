//
//  TalkViewController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/02.
//
import UIKit
import Tabman
import Pageboy

class TalkViewController: TabmanViewController {
    var talkNavigationBarHiddenState: Bool = false
    private lazy var tabbar: TMBar.ButtonBar = {
        let bar = TMBar.ButtonBar()
        bar.backgroundView.style = .clear
        bar.layout.transitionStyle = .snap
        bar.layout.contentMode = .fit
        bar.buttons.customize { (button) in
            button.selectedTintColor = .white
            button.tintColor = .gray
        }
        bar.indicator.weight = .custom(value: 2)
        bar.indicator.tintColor = .white
            
            
        return bar
    }()
    var viewcontrollers: [UIViewController] = []
    private lazy var containerView: UIView = {
            let container = UIView()
            container.backgroundColor = .clear
            container.translatesAutoresizingMaskIntoConstraints = false
            return container
        }()
    //집밥토크
    private lazy var firstViewController: UIViewController = {
        let writeViewController = WriteViewController()
        let navigationWrite = UINavigationController(rootViewController: writeViewController)
        return navigationWrite
    }()

    //정보토크
    private lazy var secondViewController: UIViewController = {
        let infoViewController = InfoViewController()
        let navigationInfo = UINavigationController(rootViewController: infoViewController)
        return navigationInfo
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "홈잇토크"
        
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = .purple
        viewcontrollers = [firstViewController, secondViewController]

        setConstraints()
        tabbar.dataSource = self
        dataSource = self
    }
    
    func setConstraints() {
        // Tabman 라이브러리에서 제공하는 bar.layout을 사용하여 레이아웃을 설정합니다.
                // custom(view:layout:)를 사용하여 탭바를 설정합니다.
        addBar(tabbar, dataSource: self, at: .custom(view: containerView, layout: nil))
                
        view.addSubview(containerView)
        NSLayoutConstraint.activate([
            containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            containerView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            containerView.heightAnchor.constraint(equalToConstant: 40)

        ])
        
//        for viewController in viewcontrollers {
//
//                addChild(viewController)
//                containerView.addSubview(viewController.view)
//                viewController.didMove(toParent: self)
//                viewController.view.translatesAutoresizingMaskIntoConstraints = false
//                NSLayoutConstraint.activate([
//                    viewController.view.topAnchor.constraint(equalTo: containerView.topAnchor),
//                    viewController.view.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
//                    viewController.view.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
//                    viewController.view.bottomAnchor.constraint(equalTo: containerView.bottomAnchor)
//                ])
//            }

    }
}
extension TalkViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        return viewcontrollers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController, at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewcontrollers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        let title = index == 0 ? "집밥토크" : "정보토크"
        return TMBarItem(title: title)
    }
    
}

    



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
    // 탭바를 담을 컨테이너
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
        self.view.backgroundColor = .black
        viewcontrollers = [firstViewController, secondViewController]

        setConstraints()
        tabbar.dataSource = self
       
        dataSource = self
    }
    
    func setConstraints() {
        addBar(tabbar, dataSource: self, at: .top)
        NSLayoutConstraint.activate([
                
        ])

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
    



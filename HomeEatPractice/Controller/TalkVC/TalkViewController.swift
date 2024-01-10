//
//  TalkViewController.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/02.
//

import Foundation
import UIKit

class TalkViewController: UIViewController {
    
    // 탭바를 담을 컨테이너
    private lazy var containerView: UIView = {
            let container = UIView()
            container.backgroundColor = .clear
            container.translatesAutoresizingMaskIntoConstraints = false
            return container
        }()
    //집밥토크
    private lazy var firstViewController: WriteViewController = {
            let viewController = WriteViewController() // 첫 번째 뷰 컨트롤러의 인스턴스 생성
            return viewController
        }()
    //정보토크
    private lazy var secondViewController: InfoViewController = {
            let viewController = InfoViewController() // 두 번째 뷰 컨트롤러의 인스턴스 생성
            return viewController
        }()
    //페이지 뷰 컨트롤러
    private lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        vc.setViewControllers([dataViewControllers[0]], direction: .forward, animated: true)
        vc.delegate = self
        vc.dataSource = self
        vc.view.translatesAutoresizingMaskIntoConstraints = false
        return vc
    }()
    //데이터로 사용될 뷰 컨트롤러 배열
    var dataViewControllers: [UIViewController] {
        [firstViewController, secondViewController]
    }
    //현재 페이지 인덱스
    var currentPage: Int = 0 {
       didSet {
         // 페이지가 변경되면 segmentedControl -> pageViewController 업데이트
         print(oldValue, self.currentPage)
         let direction: UIPageViewController.NavigationDirection = oldValue <= self.currentPage ? .forward : .reverse
         self.pageViewController.setViewControllers(
           [dataViewControllers[self.currentPage]],
           direction: direction,
           animated: true,
           completion: nil
         )
       }
     }
    private lazy var segmentControl: UISegmentedControl = {
            let segment = UISegmentedControl()
            segment.selectedSegmentTintColor = .clear
        
            // 배경 색 제거
            segment.setBackgroundImage(UIImage(), for: .normal, barMetrics: .default)
            // Segment 구분 라인 제거
            segment.setDividerImage(UIImage(), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
            
            segment.insertSegment(withTitle: "집밥토크", at: 0, animated: true)
            segment.insertSegment(withTitle: "정보토크", at: 1, animated: true)
            
            segment.selectedSegmentIndex = 0
            
            // 선택 되어 있지 않을때 폰트 및 폰트컬러
            segment.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ], for: .normal)
            
            // 선택 되었을때 폰트 및 폰트컬러
            segment.setTitleTextAttributes([
                NSAttributedString.Key.foregroundColor: UIColor.white,
                NSAttributedString.Key.font: UIFont.systemFont(ofSize: 16, weight: .bold)
            ], for: .selected)
            
            segment.addTarget(self, action: #selector(changeSegmentedControlLinePosition), for: .valueChanged)
            
            segment.translatesAutoresizingMaskIntoConstraints = false
            return segment
        }()

    private lazy var underLineView: UIView = {
            let view = UIView()
            view.backgroundColor = .white
            view.translatesAutoresizingMaskIntoConstraints = false
            return view
        }()
        
        // 움직일 underLineView의 leadingAnchor 따로 작성
    private lazy var leadingDistance: NSLayoutConstraint = {
        return underLineView.leadingAnchor.constraint(equalTo: segmentControl.leadingAnchor)
        }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "홈잇토크"
        self.navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        self.view.backgroundColor = .black
        setConstraints()
    }
    func setConstraints() {
        self.view.addSubview(self.containerView)
        self.containerView.addSubview(self.segmentControl)
        self.view.addSubview(self.pageViewController.view)
        self.containerView.addSubview(self.underLineView)
        NSLayoutConstraint.activate([
            self.containerView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.containerView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            self.containerView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            self.containerView.heightAnchor.constraint(equalToConstant: 40),
            
            self.segmentControl.topAnchor.constraint(equalTo: containerView.topAnchor),
            self.segmentControl.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            self.segmentControl.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            self.segmentControl.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            self.segmentControl.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
            
            self.underLineView.bottomAnchor.constraint(equalTo: segmentControl.bottomAnchor),
            self.underLineView.heightAnchor.constraint(equalToConstant: 5),
            leadingDistance,
            self.underLineView.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments)),
            
          self.pageViewController.view.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 4),
          self.pageViewController.view.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: -4),
          self.pageViewController.view.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: -4),
          self.pageViewController.view.topAnchor.constraint(equalTo: self.segmentControl.bottomAnchor, constant: 5),
            
                
        ])
        self.segmentControl.addTarget(self, action: #selector(changeValue(control: )), for: .valueChanged)
        self.segmentControl.selectedSegmentIndex = 0
        self.changeValue(control: self.segmentControl)
    }
    @objc private func changeValue(control: UISegmentedControl) {
        // 코드로 값을 변경하면 해당 메소드 호출 x
        self.currentPage = control.selectedSegmentIndex
      }
    @objc private func changeSegmentedControlLinePosition() {
        let segmentIndex = CGFloat(segmentControl.selectedSegmentIndex)
        let segmentWidth = segmentControl.frame.width / CGFloat(segmentControl.numberOfSegments)
        let leadingDistance = segmentWidth * segmentIndex
        UIView.animate(withDuration: 0.2, animations: { [weak self] in
            self?.leadingDistance.constant = leadingDistance
            self?.view.layoutIfNeeded()
        })

    }


}
extension TalkViewController : UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    //이전 뷰 컨트롤러 반환
    func pageViewController(
       _ pageViewController: UIPageViewController,
       viewControllerBefore viewController: UIViewController
     ) -> UIViewController? {
       guard
         let index = self.dataViewControllers.firstIndex(of: secondViewController),
         index - 1 >= 0
       else { return nil }
       return self.dataViewControllers[index - 1]
     }
    //다음 뷰 컨트롤러 반환
     func pageViewController(
       _ pageViewController: UIPageViewController,
       viewControllerAfter viewController: UIViewController
     ) -> UIViewController? {
       guard
         let index = self.dataViewControllers.firstIndex(of: firstViewController),
         index + 1 < self.dataViewControllers.count
       else { return nil }
       return self.dataViewControllers[index + 1]
     }
    //페이지 전환 완료 시 호출되는 메서드
     func pageViewController(
       _ pageViewController: UIPageViewController,
       didFinishAnimating finished: Bool,
       previousViewControllers: [UIViewController],
       transitionCompleted completed: Bool
     ) {
       guard let viewController = pageViewController.viewControllers?[0],
             let index = self.dataViewControllers.firstIndex(of: viewController)
           else { return }
           self.currentPage = index
           self.segmentControl.selectedSegmentIndex = index
         }
    }
    




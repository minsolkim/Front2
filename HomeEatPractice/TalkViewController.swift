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
            self.underLineView.widthAnchor.constraint(equalTo: segmentControl.widthAnchor, multiplier: 1 / CGFloat(segmentControl.numberOfSegments))
        ])
        
    }
    
    // 탭바를 선택하면 탭바 컨트롤러 아래의 라인을 바꾸는 메서드.
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

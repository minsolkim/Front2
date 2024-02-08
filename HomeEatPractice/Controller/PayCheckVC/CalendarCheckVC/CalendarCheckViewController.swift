//
//  CalendarCheckViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/20.
//

import UIKit
import FSCalendar

class CalendarCheckViewController: UIViewController {
    
    //MARK: - 안내 프로퍼티 생성
    private let guideImage1: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Calender1")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let guideImage2: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(named: "Calender3")
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private let guidelabel1: UILabel = {
        let label = UILabel()
        label.text = "외식/배달"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(r: 30, g: 32, b: 33)
        label.textAlignment = .center
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.backgroundColor = UIColor(r: 157, g: 110, b: 255)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let guidelabel2: UILabel = {
        let label = UILabel()
        label.text = "집밥"
        label.font = .systemFont(ofSize: 10, weight: .bold)
        label.textColor = UIColor(r: 30, g: 32, b: 33)
        label.textAlignment = .center
        label.layer.cornerRadius = 2
        label.clipsToBounds = true
        label.backgroundColor = UIColor(named: "green")
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    
    //MARK: - 캘린더 프로퍼티 생성
    
    lazy var dateView: FSCalendar = {
        var view = FSCalendar()
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = UIColor(r: 42, g: 42, b: 44)
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        
        // 달력의 년월 글자 바꾸기
        view.appearance.headerDateFormat = "YYYY년 M월"
        // 달력의 요일 글자 바꾸기
        view.locale = Locale(identifier: "ko_KR")
        
        
        // 헤더 폰트 설정
        view.appearance.headerTitleFont = .systemFont(ofSize: 18, weight: .bold)
        view.appearance.headerTitleColor = .white
        view.appearance.headerMinimumDissolvedAlpha = 0
        view.headerHeight = 43
        view.appearance.headerTitleOffset = CGPoint(x: 0, y: 8)

        
        // 요일 폰트 설정
        view.appearance.weekdayFont = .systemFont(ofSize: 18, weight: .bold)
        view.appearance.weekdayTextColor = .white
        view.weekdayHeight = 43

        // 각각의 일 폰트 설정 (ex. 1 2 3 4 5 6 ...)
        view.appearance.titleFont = .systemFont(ofSize: 18, weight: .bold)
        view.appearance.titleDefaultColor = .white
        
        view.appearance.selectionColor = .white //선택 된 날의 동그라미 색
        view.appearance.titleSelectionColor = UIColor(r: 30, g: 32, b: 33)
        
        
        
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // 이전 달로 이동 버튼
    private let prevButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "Statistics7"), for: .normal)
        button.tintColor = UIColor(r: 221, g: 221, b: 221)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
        
    // 다음 달로 이동 버튼
    private let nextButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "Statistics6"), for: .normal)
        button.tintColor = UIColor(r: 221, g: 221, b: 221)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    //MARK: - ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray2")
        setAddViews()
        setConstraints()
    }
    
    private func setAddViews(){
        self.view.addSubview(self.guideImage1)
        self.view.addSubview(self.guideImage2)
        self.view.addSubview(self.guidelabel1)
        self.view.addSubview(self.guidelabel2)
        self.view.addSubview(self.dateView)
        self.dateView.addSubview(self.prevButton)
        self.dateView.addSubview(self.nextButton)
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            self.guidelabel1.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 60),
            self.guidelabel1.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -21),
            self.guidelabel1.heightAnchor.constraint(equalToConstant: 15),
            
            self.guideImage1.topAnchor.constraint(equalTo: self.guidelabel1.topAnchor),
            self.guideImage1.heightAnchor.constraint(equalToConstant: 12),
            self.guideImage1.widthAnchor.constraint(equalToConstant: 14),
            self.guideImage1.trailingAnchor.constraint(equalTo: self.guidelabel1.leadingAnchor, constant: -6)
        ])
        
        NSLayoutConstraint.activate([
            self.guidelabel2.topAnchor.constraint(equalTo: self.guidelabel1.bottomAnchor, constant: 4),
            self.guidelabel2.leadingAnchor.constraint(equalTo: self.guidelabel1.leadingAnchor),
            self.guidelabel2.trailingAnchor.constraint(equalTo: self.guidelabel1.trailingAnchor),
            
            self.guideImage2.topAnchor.constraint(equalTo: self.guidelabel2.topAnchor),
            self.guideImage2.heightAnchor.constraint(equalToConstant: 13),
            self.guideImage2.widthAnchor.constraint(equalToConstant: 12),
            self.guideImage2.trailingAnchor.constraint(equalTo: self.guideImage1.trailingAnchor)
        ])
        
        NSLayoutConstraint.activate([
            self.dateView.topAnchor.constraint(equalTo: self.guidelabel2.bottomAnchor, constant: 16),
            self.dateView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 19),
            self.dateView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -19),
            self.dateView.heightAnchor.constraint(equalToConstant: 345),
        ])
        
        prevButton.snp.makeConstraints { make in
                   make.centerY.equalTo(dateView.calendarHeaderView).multipliedBy(1.1)
                   make.leading.equalTo(dateView.calendarHeaderView.snp.leading).inset(140)
               }
               
               nextButton.snp.makeConstraints { make in
                   make.centerY.equalTo(dateView.calendarHeaderView).multipliedBy(1.1)
                   make.trailing.equalTo(dateView.calendarHeaderView.snp.trailing).inset(140)
               }
    }

}

//MARK: - 캘린더 delegate extension
extension CalendarCheckViewController: FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {
    
}

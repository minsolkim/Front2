//
//  WriteViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/10.
//

import UIKit
class WriteViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        navigationcontrol()
        configUI()
        
        
                
    }
    //네비게이션 바 설정
    func navigationcontrol() {
        let button = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(button1Tapped))
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(button1Tapped))
        
        button.tintColor = UIColor(named: "Systemcolor")
        backbutton.tintColor = UIColor(named: "Systemcolor")
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        
        navigationItem.rightBarButtonItem = button
        navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.title = "집밥토크 글쓰기"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
        
    }
    func configUI() {
        //Vertical StackView 설정
        lazy var CameraViewContainer: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            
            return view
        }()
        lazy var CameraView: UIView = {
            let view = UIView()
            view.translatesAutoresizingMaskIntoConstraints = false
            view.backgroundColor = .gray
            view.layer.cornerRadius = 10
            view.layer.masksToBounds = true
            
            return view
        } ()
        lazy var ChoiceView: UIView = {
            let view = UIView()
            view.backgroundColor = .gray
            return view
        } ()
        lazy var stackView: UIStackView = {
            let stackView = UIStackView(arrangedSubviews: [CameraViewContainer, ChoiceView])
            stackView.translatesAutoresizingMaskIntoConstraints = false
            stackView.axis = .vertical
            stackView.alignment = .fill
            stackView.distribution = .equalSpacing
            stackView.spacing = 8
            view.addSubview(stackView)
            return stackView
        } ()
        
            // CameraViewContainer에 세로 크기 제약조건과 ChoiceView에 세로 크기 제약조건 추가
        CameraViewContainer.heightAnchor.constraint(equalToConstant: 190).isActive = true
        CameraViewContainer.addSubview(CameraView)
        ChoiceView.heightAnchor.constraint(equalToConstant: 150).isActive = true
//            let cameraWidthConstraint = CameraView.widthAnchor.constraint(equalToConstant: 50)
//            cameraWidthConstraint.isActive = true
        

                // Add constraints for stackView
        NSLayoutConstraint.activate([
                CameraView.topAnchor.constraint(equalTo: CameraViewContainer.topAnchor, constant: 10),
                CameraView.leadingAnchor.constraint(equalTo: CameraViewContainer.leadingAnchor,constant: 80),
                CameraView.trailingAnchor.constraint(equalTo: CameraViewContainer.trailingAnchor,constant: -80),
                CameraView.bottomAnchor.constraint(equalTo: CameraViewContainer.bottomAnchor)
            ])
//        NSLayoutConstraint.activate([
//            ChoiceView.topAnchor.constraint(equalTo: CameraViewContainer.topAnchor, constant: 10),
//            ChoiceView.leadingAnchor.constraint(equalTo: CameraViewContainer.leadingAnchor),
//            ChoiceView.trailingAnchor.constraint(equalTo: CameraViewContainer.trailingAnchor),
//            ChoiceView.bottomAnchor.constraint(equalTo: CameraViewContainer.bottomAnchor)
//            ])
        

            // stackView에 대한 제약조건 추가
        NSLayoutConstraint.activate([
                stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
                stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20)
            ])
       
    }
    func resizeImage(image: UIImage?, targetSize: CGSize) -> UIImage? {
        guard let image = image else {
            return nil
        }

        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { (context) in
            image.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
    @objc func button1Tapped() {
        // 첫 번째 버튼이 탭되었을 때 실행되는 코드
        print("Button 1 tapped")
    }

}
extension UIImage {
    func resizeImage(targetSize: CGSize) -> UIImage? {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}


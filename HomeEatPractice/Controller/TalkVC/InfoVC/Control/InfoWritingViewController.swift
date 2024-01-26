//
//  InfoWritingViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/16.
//

import UIKit
import Then
import AVFoundation
import Photos

class InfoWritingViewController: UIViewController {
    //MARK: - container 파트
  //  let imagePicker = UIImagePickerController()
    private let hashContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    
    
    //MARK: - UIButton 파트
    private let addImageButton : UIButton = {
        let button = UIButton()
        let imageConfig = UIImage.SymbolConfiguration(pointSize: 50, weight: .light)
        let image = UIImage(systemName: "camera.fill", withConfiguration: imageConfig)?.withTintColor(.white, renderingMode: .alwaysOriginal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("사진 추가", for: .normal)
        button.setImage(image, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        button.setTitleColor(UIColor.lightGray, for: .normal)
        button.backgroundColor = UIColor(named: "searchtf")
        button.layer.cornerRadius = 14
        button.clipsToBounds = true
        return button
    }()
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    //#해시태그
    private let tagImage = UIButton().then {
        $0.setImage(UIImage(named: "Talk11"), for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(navigateToTagPlusViewController), for: .touchUpInside)
        
    }
    
    //태그 문구
    private let tagButton = UIButton().then {
        $0.setTitle("#해시태그를 추가해 보세요!", for: .normal)
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1
        $0.layer.borderColor = UIColor.init(named: "green")?.cgColor
        $0.titleLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //제목
    private let titleLabel = UILabel().then {
        $0.text = "제목"
        $0.textColor = UIColor.init(named: "green")
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //제목 입력 텍스트 필드
    private let titleField = UITextField().then {
        $0.placeholder = "제목을 입력하세요!"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "     제목을 입력하세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private let contentLabel = UILabel().then {
        $0.text = "내용"
        $0.textColor = UIColor.init(named: "green")
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    private let contentField = UITextField().then {
        $0.placeholder = "질문이나 이야기를 해 보세요!"
        $0.font = UIFont.systemFont(ofSize: 16)
        $0.textColor = UIColor(named: "font5")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(named: "gray4")
        $0.attributedPlaceholder = NSAttributedString(string: "     질문이나 이야기를 해 보세요!", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "font5") ?? UIColor.gray])
        $0.translatesAutoresizingMaskIntoConstraints = false
        
    }
    private var isCameraAuthorized: Bool {
       AVCaptureDevice.authorizationStatus(for: .video) == .authorized
     }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(named: "gray3")
        tabBarController?.tabBar.isHidden = true
        tabBarController?.tabBar.isTranslucent = true
        navigationControl()
        configUI()
        
    }
    // MARK: - 탭바제거
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 커스텀 탭바를 숨깁니다.
        if let tabBarController = self.tabBarController as? MainTabBarController {
            tabBarController.customTabBar.isHidden = true
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // 다른 화면으로 넘어갈 때 커스텀 탭바를 다시 보이게 합니다.
        if let tabBarController = self.tabBarController as? MainTabBarController {
            tabBarController.customTabBar.isHidden = false
        }
    }
    
//    func albumAuth() {
//        switch PHPhotoLibrary.authorizationStatus() {
//        case .denied:
//            print("거부")
//            self.showAlertAuth("앨범")
//        case .authorized:
//            print("허용")
//            self.openPhotoLibrary()
//        case .notDetermined, .restricted:
//            print("아직 결정하지 않은 상태")
//            PHPhotoLibrary.requestAuthorization { state in
//                if state == .authorized {
//                    self.openPhotoLibrary()
//                } else {
//                    self.dismiss(animated: true, completion: nil)
//                }
//            }
//        default:
//            break
//        }
//    }
//    private func openPhotoLibrary() {
//        if (UIImagePickerController.isSourceTypeAvailable(.photoLibrary)) {
//            self.imagePicker.sourceType = .photoLibrary
//            self.imagePicker.modalPresentationStyle = .currentContext
//            self.present(self.imagePicker, animated: true, completion: nil)
//        } else {
//            print("앨범에 접근할 수 없습니다.")
//        }
//    }
//    func imagePickerController(
//        _ picker: UIImagePickerController,
//        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
//    ) {
//        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
//            print("image_info = \(image)")
//        }
//        dismiss(animated: true, completion: nil)
//    }
   
    func navigationControl() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        let rightBarButton = UIBarButtonItem(title: "저장", style: .plain, target: self, action: #selector(save(_:)))
        rightBarButton.setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.white], for: .normal)
        navigationItem.rightBarButtonItem = rightBarButton
        self.navigationItem.title = "정보토크 글쓰기"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    
    func configUI() {
        let customButton = makeCustomButton()
        customButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.imageView)
        view.bringSubviewToFront(self.imageView)
        self.view.addSubview(tagButton)
        self.view.addSubview(tagImage)
        self.view.addSubview(titleLabel)
        self.view.addSubview(titleField)
        self.view.addSubview(contentLabel)
        self.view.addSubview(contentField)
        self.view.addSubview(customButton)
        NSLayoutConstraint.activate([
              self.imageView.topAnchor.constraint(equalTo: self.view.topAnchor),
              self.imageView.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
              self.imageView.heightAnchor.constraint(equalToConstant: 300),
              self.imageView.widthAnchor.constraint(equalToConstant: 300),
            ])
        NSLayoutConstraint.activate([
                tagButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 267),
                tagButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
                tagButton.heightAnchor.constraint(equalToConstant: 40),
                tagButton.widthAnchor.constraint(equalToConstant: 214)
                //tagButton.trailingAnchor.constraint(equalTo: self.tagImage.leadingAnchor,constant: 95),
                
        ])
        NSLayoutConstraint.activate([
                tagImage.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 265),
                tagImage.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -20),
                tagImage.heightAnchor.constraint(equalToConstant: 42),
                tagImage.widthAnchor.constraint(equalToConstant: 42)
        ])
        NSLayoutConstraint.activate([
                titleLabel.topAnchor.constraint(equalTo: tagButton.bottomAnchor, constant: 41),
                titleLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 21),
                titleLabel.heightAnchor.constraint(equalToConstant: 34),
                titleLabel.widthAnchor.constraint(equalToConstant: 34)
        ])
        NSLayoutConstraint.activate([
                titleField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 5),
                titleField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                titleField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
                titleField.heightAnchor.constraint(equalToConstant: 50),
        ])
        NSLayoutConstraint.activate([
                contentLabel.topAnchor.constraint(equalTo: titleField.bottomAnchor, constant: 27),
                contentLabel.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                contentLabel.heightAnchor.constraint(equalToConstant: 50),
                contentLabel.widthAnchor.constraint(equalToConstant: 353)
        ])
        NSLayoutConstraint.activate([
                contentField.topAnchor.constraint(equalTo: contentLabel.bottomAnchor, constant: 5),
                contentField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 20),
                contentField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor,constant: -20),
                contentField.heightAnchor.constraint(equalToConstant: 50),
        ])
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 48),
            customButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 108),
            customButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -109),
            customButton.heightAnchor.constraint(equalToConstant: 176),
        ])
    }
    //뒤로가기
    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }
    //저장
    @objc func save(_ sender: UIBarButtonItem) {
        
    }
    func makeCustomButton() -> UIButton {
        var config = UIButton.Configuration.plain()
        var attributedTitle = AttributedString("사진 추가")
        attributedTitle.font = .systemFont(ofSize: 18, weight: .bold)
        config.attributedTitle = attributedTitle
        let pointSize = CGFloat(30)
        let imageConfig = UIImage.SymbolConfiguration(pointSize: pointSize)
        config.image = UIImage.init(named: "Talk1")
        config.preferredSymbolConfigurationForImage = imageConfig

        config.imagePlacement = .top
        config.background.backgroundColor = .darkGray
        config.baseForegroundColor = .lightGray
        config.cornerStyle = .small

        // 이미지와 텍스트 간격 조절
        config.imagePadding = 12.7
        config.titlePadding = 10

        let customButton = UIButton(configuration: config)
        customButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        customButton.translatesAutoresizingMaskIntoConstraints = false  // Add this line to set constraints programmatically

        return customButton
    }
    @objc func buttonTapped() {
        let actionSheetController = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

        let takePhotoAction = UIAlertAction(title: "사진 촬영", style: .default) { _ in
            self.openCamera()
        }

        let chooseFromLibraryAction = UIAlertAction(title: "앨범에서 사진 선택", style: .default) { _ in
           // self.albumAuth()
        }

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        takePhotoAction.setValue(UIColor.white, forKey: "titleTextColor")
        chooseFromLibraryAction.setValue(UIColor.white, forKey: "titleTextColor")
        cancelAction.setValue(UIColor.red, forKey: "titleTextColor")

        actionSheetController.addAction(takePhotoAction)
        actionSheetController.addAction(chooseFromLibraryAction)
        actionSheetController.addAction(cancelAction)

        self.present(actionSheetController, animated: true, completion: nil)
    }
    @objc func navigateToTagPlusViewController(_ sender: Any) {
        let tagplusVC = TagPlusViewController()

        self.navigationController?.pushViewController(tagplusVC, animated: true)
        print("tagplus click")
    }
    @objc private func openCamera() {
       #if targetEnvironment(simulator)
       fatalError()
       #endif
       
       AVCaptureDevice.requestAccess(for: .video) { [weak self] isAuthorized in
         guard isAuthorized else {
           self?.showAlertGoToSetting()
           return
         }
           
         
         DispatchQueue.main.async {
           let pickerController = UIImagePickerController()
           pickerController.sourceType = .camera
           pickerController.allowsEditing = false
           pickerController.mediaTypes = ["public.image"]
           pickerController.delegate = self
           self?.present(pickerController, animated: true)
         }
       }
     }
    func showAlertGoToSetting() {
        let alertController = UIAlertController(
          title: "현재 카메라 사용에 대한 접근 권한이 없습니다.",
          message: "설정 > {앱 이름}탭에서 접근을 활성화 할 수 있습니다.",
          preferredStyle: .alert
        )
        let cancelAlert = UIAlertAction(
          title: "취소",
          style: .cancel
        ) { _ in
            alertController.dismiss(animated: true, completion: nil)
          }
        let goToSettingAlert = UIAlertAction(
          title: "설정으로 이동하기",
          style: .default) { _ in
            guard
              let settingURL = URL(string: UIApplication.openSettingsURLString),
              UIApplication.shared.canOpenURL(settingURL)
            else { return }
            UIApplication.shared.open(settingURL, options: [:])
          }
        [cancelAlert, goToSettingAlert]
          .forEach(alertController.addAction(_:))
        DispatchQueue.main.async {
          self.present(alertController, animated: true) // must be used from main thread only
        }
      }
    }

extension InfoWritingViewController: UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    func imagePickerController(
        _ picker: UIImagePickerController,
        didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]
    ) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            picker.dismiss(animated: true)
            return
        }
        
        // 버튼을 숨기고 이미지 뷰를 표시하도록 설정
        addImageButton.isHidden = true
        imageView.isHidden = false
        
        self.imageView.image = image
        picker.dismiss(animated: true, completion: nil)
    }
}



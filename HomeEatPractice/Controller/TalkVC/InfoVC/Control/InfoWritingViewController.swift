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
import PhotosUI

class InfoWritingViewController: UIViewController {
    //MARK: - container 파트
  //  let imagePicker = UIImagePickerController()
    var selectedTags : [String] = []
    private lazy var customButton: UIButton = makeCustomButton()
    
    private let hashContainer : UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.distribution = .fillEqually
        stackView.spacing = 20
        stackView.axis = .horizontal
        stackView.alignment = .fill
        return stackView
    }()
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
                scrollView.translatesAutoresizingMaskIntoConstraints = false
                return scrollView
    }()
    // 태그 버튼들을 담을 수평 스택 뷰
    private let horizontalStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fill
        stackView.translatesAutoresizingMaskIntoConstraints = false
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
    //MARK: - UIImage 파트
    //첫번째 이미지 뷰
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    //두번째 이미지 뷰
    private let imageView2: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
      }()
    //세번째 이미지 뷰
    private let imageView3: UIImageView = {
        let view = UIImageView()
        view.layer.cornerRadius = 14
        view.clipsToBounds = true
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
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
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
        //let customButton = makeCustomButton()
        customButton.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.imageView)
        view.bringSubviewToFront(self.imageView)
        view.addSubview(scrollView)
        scrollView.addSubview(horizontalStackView)
        self.view.addSubview(tagButton)
        self.view.addSubview(tagImage)
        self.view.addSubview(titleLabel)
        self.view.addSubview(titleField)
        self.view.addSubview(contentLabel)
        self.view.addSubview(contentField)
        self.view.addSubview(customButton)
        NSLayoutConstraint.activate([
            self.imageView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,constant: 51),
            self.imageView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 108),
            self.imageView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -109),
            self.imageView.heightAnchor.constraint(equalToConstant: 176),
            
        ])
        NSLayoutConstraint.activate([
                tagButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 267),
                tagButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
                tagButton.heightAnchor.constraint(equalToConstant: 40),
                tagButton.widthAnchor.constraint(equalToConstant: 214)
                
        ])
        NSLayoutConstraint.activate([
                   scrollView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 267),
                   scrollView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 22),
                   scrollView.trailingAnchor.constraint(equalTo: tagImage.leadingAnchor,constant: 10),
                   scrollView.heightAnchor.constraint(equalToConstant: 40),
                   
                   horizontalStackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
                   horizontalStackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
                   horizontalStackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
                   horizontalStackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
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
        guard let title = titleField.text, let content = contentField.text else {
            // title 또는 content가 nil이라면 에러 처리 또는 사용자에게 알림
            return
        }

        GeneralAPI.saveInfoTalk(title: title, content: content) { result in
            switch result {
            case .success:
                print("API 호출 성공")
                // 성공 시 처리할 내용 추가
            case .failure(let error):
                print("API 호출 실패: \(error.localizedDescription)")
                // 실패 시 처리할 내용 추가
            }
        }
    }
    // 버튼 액션 함수
    @objc func touchUpImageAddButton(button: UIButton) {
        // 갤러리 접근 권한 허용 여부 체크
        PHPhotoLibrary.requestAuthorization(for: .readWrite) { status in
            switch status {
            case .notDetermined:
                DispatchQueue.main.async {
                    self.showAlert(message: "갤러리를 불러올 수 없습니다. 핸드폰 설정에서 사진 접근 허용을 모든 사진으로 변경해주세요.")
                }
            case .denied, .restricted:
                DispatchQueue.main.async {
                    self.showAlert(message: "갤러리를 불러올 수 없습니다. 핸드폰 설정에서 사진 접근 허용을 모든 사진으로 변경해주세요.")
                }
            case .authorized, .limited: // 모두 허용, 일부 허용
                self.pickImage() // 갤러리 불러오는 동작을 할 함수
            @unknown default:
                print("PHPhotoLibrary::execute - \"Unknown case\"")
            }
        }
    }
    // 갤러리 불러오기
    func pickImage(){
        let photoLibrary = PHPhotoLibrary.shared()
        var configuration = PHPickerConfiguration(photoLibrary: photoLibrary)

        configuration.selectionLimit = 3 //한번에 가지고 올 이미지 갯수 제한
        configuration.filter = .any(of: [.images]) // 이미지, 비디오 등의 옵션

        DispatchQueue.main.async { // 메인 스레드에서 코드를 실행시켜야함
            let picker = PHPickerViewController(configuration: configuration)
            picker.delegate = self
            picker.isEditing = true
            self.present(picker, animated: true, completion: nil) // 갤러리뷰 프리젠트
        }
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
            self.touchUpImageAddButton(button: self.customButton)
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
        tabBarController?.tabBar.isHidden = true //하단 탭바 안보이게 전환

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
          self.present(alertController, animated: true)
        }
      }
//    private func addTagButtonsToHorizontalStackView() {
//        for tag in selectedTags {
//            let tagButton = createTagButton(title: tag)
//            horizontalStackView.addArrangedSubview(tagButton)
//        }
//    }
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
        //addImageButton.isHidden = true
        imageView.isHidden = false
        customButton.isHidden = true // customButton도 함께 숨김

        self.imageView.image = image
        picker.dismiss(animated: true, completion: nil)
        
        NSLayoutConstraint.activate([
            customButton.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: -200), //화면 밖으로 이동시킬려고 밖으로 빼냄
            customButton.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 108),
            customButton.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -109),
            customButton.heightAnchor.constraint(equalToConstant: 176),
        ])
    }
}
extension InfoWritingViewController: PHPickerViewControllerDelegate {
    // 사진 선택이 끝났을때 들어오는 함수
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        let identifiers = results.compactMap(\.assetIdentifier)
        let fetchResult = PHAsset.fetchAssets(withLocalIdentifiers: identifiers, options: nil)
        
        // asset - 메타데이터 들어있음
        fetchResult.enumerateObjects { asset, index, pointer in
            // 사진 위치 정보
            print("위도: \(asset.location?.coordinate.latitude)")
            print("경도: \(asset.location?.coordinate.longitude)")
            // 위도, 경도를 CLGeocoder를 사용하여 주소로 바꿀 수 있다. (이건 생략)
            
            // 사진 시간 정보
            print("시간: \(asset.location?.timestamp)")
        }
        
        let itemProvider = results.first?.itemProvider
        
        // UIImage로 추출
        if let itemProvider = itemProvider,
           itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                guard let image = image as? UIImage else { return }
                // code...
            }
        }
        
        // 갤러리뷰 닫기
        picker.dismiss(animated: true, completion: nil)
    }
}
extension InfoWritingViewController {
    func showAlert(message: String) {
        let alertController = UIAlertController(title: nil, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}


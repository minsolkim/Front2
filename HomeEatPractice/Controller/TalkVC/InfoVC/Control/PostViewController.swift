//
//  PostViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/12.
//

import UIKit
import Then
//게시글 화면
class PostViewController: UIViewController {
    
    //프로필이미지 넣을 원형뷰
    lazy var circleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 18
        view.layer.borderWidth = 1.3 // 흰 테두리 두께 조절
        view.layer.borderColor = UIColor.white.cgColor // 흰 테두리 색상 설정
        view.layer.masksToBounds = true
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "green")
        return view
    }()
    // 프로필 사진
    lazy var profileImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "character") // 실제 프로필 이미지의 이름으로 변경
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    //프로필 이름
    lazy var profileName : UILabel = {
        let label = UILabel()
        label.text = "우예진"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
        
    } ()
    // 게시 날짜
    lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 10)
        label.text = "11월 20일 24:08"
        label.textColor = UIColor(named: "font4")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    // 신고하기
    private let complainLabel = UIButton().then {
        $0.setTitle("신고하기", for: .normal)
        $0.setTitleColor(UIColor(r: 165, g: 165, b: 165), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 10, weight: .medium)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addTarget(self, action: #selector(delcareAction), for: .touchUpInside)
    }
    
    private let hashtagCategoty =  UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(named: "gray2")
        $0.layer.cornerRadius = 10
        $0.clipsToBounds = true
        $0.layer.borderWidth = 1.18
        $0.layer.borderColor = UIColor(named: "green")?.cgColor
        $0.setTitle("#할인", for: .normal)
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.titleLabel?.font = UIFont(name: "폰트", size: 10) ?? .systemFont(ofSize: 10, weight: .medium)
        
    }
    // 제목
    lazy var postTitleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.text = "홈잇마트 할인"
        label.textColor = UIColor(named: "green")
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    // 내용
    lazy var postContentLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 15)
        label.text = "성북구 월곡동 홈잇마트 복숭아 할인 행사 하네요!\n관심있는 분들 구매하시면 좋을 것 같아요"
        label.numberOfLines = 2
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    } ()
    // 게시글 사진
    lazy var imageScrollView: UIScrollView = {
            let scrollView = UIScrollView()
            scrollView.isPagingEnabled = true
            scrollView.showsHorizontalScrollIndicator = false
            scrollView.delegate = self
            scrollView.translatesAutoresizingMaskIntoConstraints = false
            return scrollView
        }()

        // Page control for images
        lazy var pageControl: UIPageControl = {
            let pageControl = UIPageControl()
            pageControl.currentPage = 0
            pageControl.pageIndicatorTintColor = UIColor.gray
            pageControl.currentPageIndicatorTintColor = UIColor(named: "green")
            pageControl.translatesAutoresizingMaskIntoConstraints = false
            return pageControl
        }()
    // 좋아요
    // 댓글
    let imageNames = ["example1", "example1", "example1"] 
    override func viewDidLoad() {
        super.viewDidLoad()
        addSubView()
        navigationcontrol()
        configUI()
        setupImageScrollView()
        view.backgroundColor = UIColor(named: "gray3")
    }
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//        self.navigationController?.setNavigationBarHidden(false, animated: animated)
//    }
    func setupImageScrollView() {
        for (index, imageName) in imageNames.enumerated() {
                    let imageView = UIImageView()
                    imageView.image = UIImage(named: imageName)
                    imageView.contentMode = .scaleAspectFit
                    imageView.frame = CGRect(x: CGFloat(index) * view.frame.width, y: 0, width: view.frame.width, height: imageScrollView.frame.height)
                    imageScrollView.addSubview(imageView)
                }
        // Set content size of scroll view
                imageScrollView.contentSize = CGSize(width: CGFloat(imageNames.count) * view.frame.width, height: imageScrollView.frame.height)

                // Set up page control
                pageControl.numberOfPages = imageNames.count

                // Add scroll view and page control to the view
                view.addSubview(imageScrollView)
                view.addSubview(pageControl)
                
                // Set constraints for scroll view and page control
                NSLayoutConstraint.activate([
                    imageScrollView.topAnchor.constraint(equalTo: postContentLabel.bottomAnchor, constant: 20),
                    imageScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                    imageScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                    imageScrollView.heightAnchor.constraint(equalToConstant: 200),

                    pageControl.topAnchor.constraint(equalTo: imageScrollView.bottomAnchor, constant: 10),
                    pageControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                ])
            }
    func addSubView() {
        view.addSubview(circleView)
        circleView.addSubview(profileImageView)
        view.addSubview(profileName)
        view.addSubview(dateLabel)
        view.addSubview(complainLabel)
        view.addSubview(hashtagCategoty)
        view.addSubview(postTitleLabel)
        view.addSubview(postContentLabel)
    }
    func configUI() {
        // 제약 조건 설정
        NSLayoutConstraint.activate([
            // 서클 뷰의 크기와 위치 설정
            circleView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            circleView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 20),
            circleView.widthAnchor.constraint(equalToConstant: 37.8),
            circleView.heightAnchor.constraint(equalToConstant: 37.8),


            // 이미지뷰가 서클 뷰의 가운데에 위치하도록 설정
            profileImageView.topAnchor.constraint(equalTo: circleView.topAnchor,constant: 6.8),
            profileImageView.leadingAnchor.constraint(equalTo: circleView.leadingAnchor,constant: 6),
            
            profileName.topAnchor.constraint(equalTo: circleView.topAnchor),
            profileName.leadingAnchor.constraint(equalTo: circleView.trailingAnchor, constant: 13),
            
            dateLabel.topAnchor.constraint(equalTo: profileName.bottomAnchor,constant: 3),
            dateLabel.leadingAnchor.constraint(equalTo: profileName.leadingAnchor),
            
            complainLabel.topAnchor.constraint(equalTo: dateLabel.topAnchor),
            complainLabel.leadingAnchor.constraint(equalTo:dateLabel.trailingAnchor,constant: 195),
            
            hashtagCategoty.topAnchor.constraint(equalTo: circleView.bottomAnchor,constant: 20.2),
            hashtagCategoty.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            hashtagCategoty.widthAnchor.constraint(equalToConstant: 41),
            hashtagCategoty.heightAnchor.constraint(equalToConstant: 20),
            
            postTitleLabel.topAnchor.constraint(equalTo: hashtagCategoty.bottomAnchor,constant: 15.2),
            postTitleLabel.leadingAnchor.constraint(equalTo: circleView.leadingAnchor),
            
            postContentLabel.topAnchor.constraint(equalTo: postTitleLabel.bottomAnchor,constant: 8),
            postContentLabel.leadingAnchor.constraint(equalTo: postTitleLabel.leadingAnchor)
            
        ])
    }
    //네비게이션 바 설정
    func navigationcontrol() {
        let backbutton = UIBarButtonItem(image: UIImage(named: "back2"), style: .plain, target: self, action: #selector(back(_:)))
        //간격을 배열로 설정
        let flexibleSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        flexibleSpace.width = 5.0
        navigationItem.leftBarButtonItem = backbutton
        self.navigationItem.title = "정보토크"
        //title 흰색으로 설정
        if let navigationBar = navigationController?.navigationBar {
            navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
            }
    }
    @objc func delcareAction() {
        let declareVC = DeclareViewController()
        navigationController?.pushViewController(declareVC, animated: true)
    }
    @objc func back(_ sender: Any) {
         self.navigationController?.popViewController(animated: true)
        print("back click")
     }
    }
extension PostViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageIndex = round(scrollView.contentOffset.x / view.frame.width)
        pageControl.currentPage = Int(pageIndex)
    }
}

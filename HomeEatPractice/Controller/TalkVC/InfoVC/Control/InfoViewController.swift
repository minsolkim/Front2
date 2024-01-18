//
//  InfoViewController.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/10.
//

import UIKit
import Then
import SnapKit
class InfoViewController: UIViewController {
    var talkNavigationBarHiddenState: Bool = false
    //검색 뷰
    lazy var SearchView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor(named: "searchtf")
        if let borderColor = UIColor(named: "font3")?.cgColor {
            view.layer.borderColor = borderColor
        }
        view.layer.borderWidth = 1
        view.layer.cornerRadius = 7
        view.layer.masksToBounds = true
        
        return view
    } ()
    // 텍스트 필드
    private let searchTextField =  UITextField().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.placeholder = "관심있는 집밥을 검색해보세요"
        $0.font = UIFont.systemFont(ofSize: 13)
        $0.textColor = UIColor(named: "searchfont")
        $0.attributedPlaceholder = NSAttributedString(string: "관심있는 집밥을 검색해보세요", attributes: [NSAttributedString.Key.foregroundColor: UIColor(named: "searchfont") ?? UIColor.gray])
    }
    // 검색 이미지
    lazy var searchImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "Group 5064"))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    // 순서버튼
    private let procedureButton =  UIButton().then {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.setTitle("최신순", for: .normal)
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        $0.setImage(UIImage(named: "Rectangle 2993"), for: .normal)
        $0.semanticContentAttribute = .forceRightToLeft
        $0.contentVerticalAlignment = .center
        $0.contentHorizontalAlignment = .leading
    }
    //위치 버튼
    private let locationButton =  UIButton().then {
        $0.setTitle("성북구 월복동", for: .normal)
        $0.setTitleColor(UIColor(named: "green"), for: .normal)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        $0.setImage(UIImage(named: "Group 5049"), for: .normal)
        let spacing: CGFloat = 3.6
        $0.imageEdgeInsets = UIEdgeInsets(top: 0, left: -spacing, bottom: 0, right: spacing)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //테이블 뷰
    private let tableView =  UITableView().then {
        $0.allowsSelection = true //셀 클릭이 가능하게 하는거
        $0.showsVerticalScrollIndicator = true
        $0.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        $0.register(TableViewCellOne.self, forCellReuseIdentifier: TableViewCellOne.identifier)
        $0.translatesAutoresizingMaskIntoConstraints = false
    }
    //플로팅버튼
    private let floatingButton = UIButton().then {
        $0.setImage(UIImage(named: "writebtn"), for: .normal)
        $0.addTarget(self, action: #selector(floatingButtonAction(_:)), for: .touchUpInside)
    }
    var items: [MyItem] = [
        MyItem(title: "게시글 제목", date: "11월 20일 24:08",content: "게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다.  게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. ",postImage: UIImage(named: "example1"),heartImage: UIImage(named: "heart"),heartLabel: "8",chatImage: UIImage(named: "chat"),chatLabel: "15"),
        MyItem(title: "게시글 제목", date: "11월 20일 24:08",content: "게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다.  게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. ",postImage: UIImage(named: "example1"),heartImage: UIImage(named: "heart"),heartLabel: "8",chatImage: UIImage(named: "chat"),chatLabel: "15"),
        MyItem(title: "게시글 제목", date: "11월 20일 24:08",content: "게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다.  게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. ",postImage: UIImage(named: "example1"),heartImage: UIImage(named: "heart"),heartLabel: "8",chatImage: UIImage(named: "chat"),chatLabel: "15"),
        MyItem(title: "게시글 제목", date: "11월 20일 24:08",content: "게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다.  게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. ",postImage: UIImage(named: "example1"),heartImage: UIImage(named: "heart"),heartLabel: "8",chatImage: UIImage(named: "chat"),chatLabel: "15"),
        MyItem(title: "게시글 제목", date: "11월 20일 24:08",content: "게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다.  게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. 게시글 내용이 들어갈 자리입니다. ",postImage: UIImage(named: "example1"),heartImage: UIImage(named: "heart"),heartLabel: "8",chatImage: UIImage(named: "chat"),chatLabel: "15"),

        ]
 //정보토크
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        addSubView()
        configUI()
        tableView.reloadData()
        
        
    }
   
    func addSubView() {
        view.addSubview(SearchView)
        
        SearchView.addSubview(searchTextField)
        SearchView.addSubview(searchImageView)
        view.addSubview(locationButton)
        view.addSubview(procedureButton)
        view.addSubview(tableView)
        view.addSubview(floatingButton)
    }
    func configUI() {
        tableView.backgroundColor = UIColor.black
        SearchView.heightAnchor.constraint(equalToConstant: 35).isActive = true
        SearchView.widthAnchor.constraint(equalToConstant: 351).isActive = true
        
        NSLayoutConstraint.activate([
            SearchView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 59),
            SearchView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 21),
            SearchView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -21),
            
            searchTextField.leadingAnchor.constraint(equalTo: SearchView.leadingAnchor, constant: 10),
            searchTextField.centerYAnchor.constraint(equalTo: SearchView.centerYAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: searchImageView.leadingAnchor, constant: -10),

            searchImageView.trailingAnchor.constraint(equalTo: SearchView.trailingAnchor, constant: -10),
            searchImageView.centerYAnchor.constraint(equalTo: SearchView.centerYAnchor),
            searchImageView.widthAnchor.constraint(equalToConstant: 14.95), // Adjust the width as needed
            searchImageView.heightAnchor.constraint(equalToConstant: 14.95) // Adjust the height as needed
            ])
        NSLayoutConstraint.activate([
            locationButton.topAnchor.constraint(equalTo: SearchView.bottomAnchor, constant: 16),
            locationButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            procedureButton.topAnchor.constraint(equalTo: SearchView.bottomAnchor, constant: 16),
            procedureButton.leadingAnchor.constraint(equalTo:view.leadingAnchor,constant: 21),
            //procedureButton.trailingAnchor.constraint(equalTo: locationButton.leadingAnchor, constant: -210),
            
            tableView.topAnchor.constraint(equalTo: locationButton.bottomAnchor, constant: 10),
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            //floatingButton.topAnchor.constraint
            ])
        
        
        
    }
    func configure() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100 // 예상되는 높이를 설정합니다.
        
        procedureButton.addTarget(self, action: #selector(showActionSheet), for: .touchUpInside)
        }
    //'최신순'버튼 눌렀을 때 액션 리스너
    @objc func showActionSheet() {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)

       
        let newestAction = UIAlertAction(title: "최신순", style: .default) { _ in
            print("최신순 selected")
        }
        let likesAction = UIAlertAction(title: "공감순", style: .default) { _ in
            print("공감순 selected")
        }
        let viewsAction = UIAlertAction(title: "조회순", style: .default) { _ in
            print("조회순 selected")
        }
        let oldestAction = UIAlertAction(title: "오래된 순", style: .default) { _ in
            print("오래된 순 selected")
        }

        let cancelAction = UIAlertAction(title: "취소", style: .cancel, handler: nil)

        actionSheet.addAction(newestAction)
        actionSheet.addAction(likesAction)
        actionSheet.addAction(viewsAction)
        actionSheet.addAction(oldestAction)
        actionSheet.addAction(cancelAction)

        present(actionSheet, animated: true, completion: nil)
    }
    
    //셀 각 인덱스 클릭시 게시물 화면으로 넘어가짐
    //InfoViewController - > PostViewController
    @objc func navigateToPostViewController() {
        
        let postVC = PostViewController()
        tabBarController?.tabBar.isHidden = true //하단 탭바 안보이게 전환
        
        navigationController?.pushViewController(postVC, animated: true)
        
        print("present click")
    }
    
    

}

extension InfoViewController {
    //글쓰기 버튼 
    @objc private func floatingButtonAction(_ sender: UIButton) {
        let nextVC = InfoWritingViewController()
        navigationController?.pushViewController(nextVC, animated: true)
        
    }
    
}
extension InfoViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView,
                  numberOfRowsInSection section: Int) -> Int {
      return items.count
  }
   
  func tableView(_ tableView: UITableView,
                  cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
      guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellOne.identifier, for: indexPath) as? TableViewCellOne else {
                  return UITableViewCell()
              }
      //셀 클릭 시 배경색 바뀌는거 방지
      cell.selectionStyle = .none
      let item = items[indexPath.row]
          cell.titleLabel.text = item.title
          cell.dateLabel.text = item.date
          cell.contentLabel.text = item.content
          cell.PostImageView.image = item.postImage
          cell.heartImage.image = item.heartImage
          cell.heartLabel.text = item.heartLabel
          cell.chatImage.image = item.chatImage
          cell.chatLabel.text = item.chatLabel
          return cell
  }
}
extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            print("cell click")
            //셀을 선택된 후에 셀의 선택상태를 즉시해제 !
            tableView.deselectRow(at: indexPath, animated: true)
            navigateToPostViewController()
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }
}
    

    



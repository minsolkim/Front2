//
//  MyItem.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/11.
//

import Foundation
import UIKit

struct MyItem {
    let title: String //게시글 제목
    let date: String //게시글 날짜
    let content: String //게시글 내용
    let postImage : UIImage? //게시글 사진
    let heartImage : UIImage? //좋아요 이미지
    let heartLabel : String //좋아요 개수
    let chatImage : UIImage? //댓글 이미지
    let chatLabel : String //댓글 개수 
    
    //초기화
    init(title: String, date: String,content: String,postImage: UIImage?,heartImage: UIImage?, heartLabel: String, chatImage: UIImage?, chatLabel: String) {
        self.title = title
        self.date = date
        self.content = content
        self.postImage = postImage
        self.heartImage = heartImage
        self.heartLabel = heartLabel
        self.chatImage = chatImage
        self.chatLabel = chatLabel
    }
}

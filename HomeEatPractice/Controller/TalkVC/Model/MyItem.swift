//
//  MyItem.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/11.
//

import Foundation
import UIKit

struct MyItem {
    let title: String
    let date: String
    let content: String
    let postImage : UIImage?
    let heartImage : UIImage?
    let heartLabel : String
    let chatImage : UIImage?
    let chatLabel : String
    
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

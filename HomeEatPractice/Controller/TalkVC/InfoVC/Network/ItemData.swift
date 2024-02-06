//
//  ItemData.swift
//  HomeEatPractice
//
//  Created by 김민솔 on 2024/01/28.
//

import Foundation

struct ItemData: Encodable {
    let title: String
    let content: String
    let tags: [String]?
    let imgUrl: [URL]?
}


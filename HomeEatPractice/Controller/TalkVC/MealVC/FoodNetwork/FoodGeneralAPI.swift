//
//  FoodGeneralAPI.swift
//  HomeEatPractice
//
//  Created by 이지우 on 2024/01/28.
//

import Alamofire

class FoodGeneralAPI {
    static let baseURL = "https://dev.homeat.site/"

    static func saveFoodTalk(name: String, memo: String, tag: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = "v1/foofTalk/save"
        let url = baseURL + endpoint

        let MealItem = FoodItemData(name: name, memo: memo, tag: tag)
        //post요청 생성
        AF.request(url, method: .post, parameters: MealItem, encoder: JSONParameterEncoder.default)
            .response { response in
                //api호출에 대한 응답처리
                switch response.result {
                
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

//  Created by 김민솔 on 2024/02/06.
// GeneralAPI.swift

import Alamofire

class GeneralAPI {
    static let baseURL = "https://dev.homeat.site/"

    static func saveInfoTalk(title: String, content: String, tags: [String]?, imgUrl: [URL]?, completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = "v1/infoTalk/save"
        let url = baseURL + endpoint

        let parameters = ItemData(title: title, content: content, tags: tags, imgUrl: imgUrl)

        // POST 요청 생성
        AF.request(url, method: .post, parameters: parameters, encoder: JSONParameterEncoder.default)
            .response { response in
                // API 호출에 대한 응답 처리
                switch response.result {
                case .success:
                    completion(.success(()))
                case .failure(let error):
                    completion(.failure(error))
                }
            }
    }
}

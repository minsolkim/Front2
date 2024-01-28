// GeneralAPI.swift

import Alamofire

class GeneralAPI {
    static let baseURL = "https://dev.homeat.site/"

    static func saveInfoTalk(title: String, content: String, completion: @escaping (Result<Void, Error>) -> Void) {
        let endpoint = "v1/infoTalk/save"
        let url = baseURL + endpoint

        let infoItem = ItemData(title: title, content: content)
        //post요청 생성
        AF.request(url, method: .post, parameters: infoItem, encoder: JSONParameterEncoder.default)
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

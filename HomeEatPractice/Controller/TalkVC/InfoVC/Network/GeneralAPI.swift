import UIKit
import Alamofire

class GeneralAPI {
    static let baseURL = "https://dev.homeat.site/"

    static func saveInfoTalk(title: String, content: String, tags: [String]?, images: [UIImage], completion: @escaping (Result<Void, Error>) -> Void) {
        let uploadGroup = DispatchGroup()
        var imageURLs: [String] = []

        for image in images {
            uploadGroup.enter()
            uploadImage(image: image) { result in
                switch result {
                case .success(let url):
                    imageURLs.append(url)
                case .failure(let error):
                    completion(.failure(error))
                    return
                }
                uploadGroup.leave()
            }
        }

        uploadGroup.notify(queue: .global()) {
            let endpoint = "v1/infoTalk/save"
            let url = baseURL + endpoint

            let parameters: [String: Any] = [
                "content": [
                    "title": title,
                    "content": content
                ],
                "tags": tags ?? [],
                "imgUrl": imageURLs // 변경된 부분
            ]

            AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
                .validate()
                .responseJSON { response in
                    switch response.result {
                    case .success:
                        completion(.success(()))
                    case .failure(let error):
                        completion(.failure(error))
                    }
                }
        }
    }

    static func uploadImage(image: UIImage, completion: @escaping (Result<String, Error>) -> Void) {
        let imageUploadEndpoint = "v1/image/upload" // 이미지를 받아들일 수 있는 엔드포인트로 설정
        let imageUrl = baseURL + imageUploadEndpoint

        // 이미지를 JPEG 형식으로 압축하여 데이터로 변환
        guard let imageData = image.jpegData(compressionQuality: 0.2) else {
            completion(.failure(NSError(domain: "ImageUploadError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to convert image to data"])))
            return
        }

        AF.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(imageData, withName: "image", fileName: "image.jpg", mimeType: "image/jpeg")
        }, to: imageUrl)
        .validate()
        .responseJSON { response in
            switch response.result {
            case .success(let value):
                if let imageURL = value as? String {
                    completion(.success(imageURL))
                } else {
                    completion(.failure(NSError(domain: "ImageUploadError", code: -1, userInfo: [NSLocalizedDescriptionKey: "Failed to parse image URL"])))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}

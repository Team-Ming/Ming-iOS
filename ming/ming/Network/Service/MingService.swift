//
//  MingService.swift
//  ming
//
//  Created by 김윤서 on 2022/05/21.
//

import Alamofire

class MingService {
    static let shared = MingService()
    
    private init() {}

     func getMiracle(completion: @escaping (NetworkResult<Any>) -> Void) {
         let url: String! = URLConstant.baseURL + "/miracle/all"
         let header: HTTPHeaders = ["Content-type": "application/json"]

         let dataRequest = AF.request(
            url, method: .get,
            parameters: nil,
            encoding: URLEncoding.default,
            headers: header
         )

         dataRequest.responseData { response in
             dump(response)
             switch response.result {
             case .success:
                 guard let statusCode = response.response?.statusCode else { return }
                 dump(statusCode)
                 guard let value = response.value else { return }
                 dump(value)
                 let networkResult = self.judgeStatus(by: statusCode, value, Response.self)
                 completion(networkResult)

             case .failure:
                 completion(.networkFail)
             }
         }
     }

     private func judgeStatus<T:Codable> (by statusCode: Int, _ data: Data, _ type: T.Type) -> NetworkResult<Any> {
         let decoder = JSONDecoder()
         guard let decodedData = try? decoder.decode(type.self, from: data)
         else { return .pathErr }

         switch statusCode {
         case 200 ..< 300: return .success(decodedData as Any)
         case 400 ..< 500: return .pathErr
         case 500: return .serverErr
         default: return .networkFail
         }
     }
 }

//
//  APIClient.swift
//  Webkeyz Hotels
//
//  Created by Amr Fawzy on 1/26/21.
//

import Foundation
import Alamofire

class APIClient {
    
    //MARK:- GetHotels
    
    func GetHotels(onSuccess: @escaping ([Hotel]) -> Void, onError: @escaping (_ error: String)-> Void) {
        
        
        AF.request(URL(string: Constants.ProductionServer.baseURL)!, method: .get,encoding: JSONEncoding.default).responseData {
            response in
            switch response.result {
            case .success(let jsonData):
                do {
                    let data = try JSONDecoder().decode(Hotels.self, from: jsonData)
                    print(data)
                    onSuccess(data.hotel)
                } catch {
                    print("ParseError",error.localizedDescription)
                    onError(error.localizedDescription)
                }
                break
            case .failure(let error):
                print("Request error: \(error)")
                onError(error.localizedDescription)
                break
            }
        }
    }
}

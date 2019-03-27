//
//  NetWork.swift
//  Alamofire+Moya+SwiftyJSON
//
//  Created by fsc on 2019/3/27.
//  Copyright © 2019 fsc. All rights reserved.
//

import Foundation
import Moya
import SwiftyJSON

struct Network {
    static let provider = MoyaProvider<DouBan>()
    
    static func request(
        _ target: DouBan,
        success successCallback: @escaping (JSON) -> Void,
        error errorCallback: @escaping (Int) -> Void,
        failure failureCallback: @escaping (MoyaError) -> Void
        ) {
        provider.request(target) { result in
            switch result {
            case let .success(response):
                do {
                    let json = try JSON(response.mapJSON())
                    successCallback(json)
                }
                catch let error {
                    errorCallback((error as! MoyaError).response!.statusCode)
                }
            case let .failure(error):
                failureCallback(error)
            }
        }
    }
}

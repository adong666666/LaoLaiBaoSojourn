//  Created by adong666666 on 2018/8/18. Copyright © 2018年 adong666666. All rights reserved.

import Foundation
import Alamofire

enum MethodType {
    case get
    case post
}

class Networktools{
    class func requestData(URLString: String, type: MethodType, parameters: [String: Any]? = nil, finishedCallback: @escaping (_ result: Any)->()) {
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post
        
        Alamofire.request(URLString, method: method, parameters: parameters).responseJSON( completionHandler: {(response) in
            guard let result = response.result.value else{
                print(response.result.error ?? 0)
                return
            }
            finishedCallback(result)
        })
        
    }
}


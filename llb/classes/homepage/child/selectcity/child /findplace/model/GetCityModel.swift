//  Created by adong666666 on 2018/8/24.  Copyright © 2018年 adong666666. All rights reserved.
import UIKit

class cover_city : NSObject {
    @objc var city_name: String = ""
    @objc var city_no: String = ""
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

//  Created by adong666666 on 2018/8/25. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class room_info: NSObject{
    @objc var room_no: String = ""
    @objc var room_name: String = ""
    @objc var room_price: String = ""
    init (dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class base_info: NSObject{
    @objc var base_tag: String = ""
    @objc var base_address: String = ""
    @objc var base_no: String = ""
    @objc var base_name: String = ""
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class base_slider: NSObject{
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

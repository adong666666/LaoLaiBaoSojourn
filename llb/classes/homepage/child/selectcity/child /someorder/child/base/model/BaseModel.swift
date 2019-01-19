//  Created by adong666666 on 2018/8/25. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class bbase_info: NSObject{
    @objc var latitude: String = ""
    @objc var longitude: String = ""
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

class room_slider: NSObject{
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class all_price: NSObject{
    @objc var price: String = ""
    @objc var room_date: String = ""
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class can_not_order: NSObject{
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class other_room: NSObject{
    @objc var room_no: String = ""
    @objc var room_price: String = ""
    @objc var room_name: String = ""
    @objc var room_img: String = ""
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class rroom_info: NSObject{
    @objc var room_price: String = ""
    @objc var room_style: String = ""
    @objc var room_conf: String = ""
    @objc var room_size: String = ""
    @objc var roomCondition: RoomCondition?
    var room_condition: [String: NSObject]?{
        didSet{
            guard let room_condition = room_condition else { return }
            roomCondition = RoomCondition(dict: room_condition)
        }
    }
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class cancel_deal: NSObject{
    @objc var before_day: String = ""
    @objc var cash_after_day: String = ""
    @objc var cash_before_day: String = ""
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
class RoomCondition: NSObject{
    @objc var condition_name: String = ""
    @objc var condition_img = ""
    
    init (dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

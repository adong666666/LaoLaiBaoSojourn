//  Created by adong666666 on 2018/8/25.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class title_info: NSObject{
    @objc var title_id: Int = 0
    @objc var title_name: String = ""
    @objc var tagInfo: TagInfo?
    var tag_info: [String: NSObject]? {
        didSet{
            guard let tag_info = tag_info else {return}
            tagInfo = TagInfo(dict: tag_info)
        }
    }
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

public class bbbase_info: NSObject{
    @objc var base_img: String = ""
    @objc var base_no: String = ""
    @objc var base_price: String = ""
    @objc var distance: Double = 0.0
    @objc var collect: String = ""
    @objc var max_in_people: String = ""
    @objc var popular_value: String = ""
    @objc var base_name: String = ""
    @objc var well_value: String = ""
    @objc var hot_value: String = ""
    @objc var base_tag: [String] = [String]()
    
    init(dict:[String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override public func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

class TagInfo: NSObject{
    @objc var tag_id: String = ""
    @objc var tag_name: String = ""
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}


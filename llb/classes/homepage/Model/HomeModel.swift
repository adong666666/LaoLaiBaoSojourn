//  Created by adong666 on 2018/8/18.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class head_img : NSObject {
    @objc var slider_url: String = ""
    
    init(dict : [String : Any]) {
        super.init()
        setValuesForKeys(dict)
    }

    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
class show_list_before : NSObject{
    @objc var title_id : String = ""
    @objc var headline : String = ""
    @objc var subhead : String = ""
    @objc var bindBaseList : BindBaseList?
    var bind_base_list : [String: NSObject]?{
        didSet{
            guard let bind_base_list = bind_base_list else { return }
            bindBaseList = BindBaseList(dict: bind_base_list)
        }
    }
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
class sshow : NSObject{
    @objc var location_href : String = ""
    @objc var img_url : String = ""
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
class show_list_after : NSObject{
    @objc var title_id : String = ""
    @objc var headline : String = ""
    @objc var subhead : String = ""
    @objc var bindBaseList : BindBaseList?
    var bind_base_list : [String: NSObject]?{
        didSet{
            guard let bind_base_list = bind_base_list else{ return }
            bindBaseList = BindBaseList(dict: bind_base_list)
        }
    }
    
    init(dict:[String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
class vvideo : NSObject{
    @objc var img_url : String = ""
    @objc var video_url : String = ""
    
    init(dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forKey key: String) {}
}
class BindBaseList: NSObject{
    @objc var subhead : String = ""
    @objc var base_id : String = ""
    @objc var base_city : String = ""
    @objc var img_url : String = ""
    @objc var min_price : String = ""
    @objc var base_no : String = ""
    
    init (dict: [String: Any]){
        super.init()
        setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}

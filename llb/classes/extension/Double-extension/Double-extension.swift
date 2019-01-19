//  Created by adong666 on 2018/8/17.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit


public extension Double {
    var fitScreen: Double {
        return self/414.0 * Double(UIScreen.main.bounds.size.width)
    }
}
public extension Double {
    var fitHeight: Double {
        return self/737.0 * Double(UIScreen.main.bounds.size.height)
    }
}

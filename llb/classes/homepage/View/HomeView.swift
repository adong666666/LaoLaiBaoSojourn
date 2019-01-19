//  Created by adong666666 on 2018/8/6. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class PowerLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.textAlignment = .center
        self.textColor = UIColor.black
        self.backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class PowerButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(UIColor.black, for: UIControl.State())
        self.titleLabel?.font = UIFont(name: "Arial", size: 24)
        self.backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

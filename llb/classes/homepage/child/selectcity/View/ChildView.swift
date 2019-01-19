
//  Created by adong666666 on 2018/8/6.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class SmallButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setTitleColor(UIColor.black, for: UIControl.State())
        let imageSize:CGSize = self.imageView!.frame.size
        let titleSize:CGSize = self.titleLabel!.frame.size
        self.frame = CGRect(x: 40.fitScreen, y: 470.fitHeight, width: 100.fitScreen, height: 35.fitHeight)
        self.titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageSize.width , bottom: -imageSize.height - 50, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: -titleSize.height - 5, left: 0, bottom: 0, right: -titleSize.width)
        self.titleLabel?.font = UIFont(name: "#404040", size: 0.1)
        self.backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class SmallLabel: UILabel {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.shadowOffset = CGSize(width: 1, height: 1)
        self.textAlignment = NSTextAlignment.center
        self.textColor = UIColor.black
        self.backgroundColor = UIColor.clear
        self.alpha = 0.8
        self.font = UIFont (name: "Arial", size: 12)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
class PatientInfoCustomLabel: SmallLabel {
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    override func textRect(forBounds bounds: CGRect, limitedToNumberOfLines numberOfLines: Int) -> CGRect {
        var textRect = super.textRect(forBounds: bounds, limitedToNumberOfLines: numberOfLines)
        textRect.origin.y = bounds.origin.y
        return textRect
    }
    override func drawText(in rect: CGRect) {
        let actualRect = self.textRect(forBounds: rect, limitedToNumberOfLines: self.numberOfLines)
        super.drawText(in: actualRect)
    }
}

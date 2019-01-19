//  Created by adong666666 on 2018/8/7. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class PowertextField: UITextField {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.alpha=1
        self.font = UIFont(name: "Arial", size: 14)
        self.textColor = UIColor.black
        self.autocorrectionType = UITextAutocorrectionType.no
        self.clearButtonMode = UITextField.ViewMode.whileEditing
        self.keyboardAppearance = UIKeyboardAppearance.light
        self.delegate = self as? UITextFieldDelegate
        self.textAlignment = NSTextAlignment.center
        self.backgroundColor = UIColor.clear
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

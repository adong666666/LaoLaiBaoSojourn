//  Created by adong666666 on 2018/9/6.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit
import Foundation

extension NSMutableAttributedString {
    static func highLightText(_ normal: String, changeFont: String,
                              color: UIColor, color2: UIColor,
                              font: UIFont, font2: UIFont) -> NSMutableAttributedString {
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        let strings = normal.components(separatedBy: changeFont)
        
        for i in 0..<strings.count {
            let item = strings[i]
            let dict = [NSAttributedString.Key.font: font,
                NSAttributedString.Key.foregroundColor: color]
            let content = NSAttributedString(string: item, attributes: dict)
            attributedStrM.append(content)
            
            if i != strings.count - 1 {
                let dict1 = [NSAttributedString.Key.font: font2,
                    NSAttributedString.Key.foregroundColor: color2]                
                let content2 = NSAttributedString(string: changeFont,
                                                  attributes: dict1)
                attributedStrM.append(content2)
            }
            
        }
        return attributedStrM
    }
}
extension NSMutableAttributedString{
    static func changeTextFont(_ normal: String, changeFont: String,
                               color: UIColor, font: UIFont,
                               font2: UIFont) -> NSMutableAttributedString{
        let attributedStrM = highLightText(normal, changeFont: changeFont,
                                           color: color, color2: color,
                                           font: font, font2: font2)
        return attributedStrM
    }
}
extension NSMutableAttributedString{
    static func changeTextColor(_ normal: String, changeColor: String,
                                color: UIColor, color2: UIColor,
                                font: UIFont) -> NSMutableAttributedString{
        let attributedStrM = highLightText(normal, changeFont: changeColor,
                                           color: color, color2: color2,
                                           font: font, font2: font)
        return attributedStrM
    }
}
extension NSMutableAttributedString {
    static func highLightText2(_ normal: String, changeFont: String, changeFont2: String,
        color: UIColor, color2: UIColor, color3: UIColor,
        font: UIFont, font2: UIFont, font3: UIFont) -> NSMutableAttributedString {
        let attributedStrM : NSMutableAttributedString = NSMutableAttributedString()
        let strings = normal.components(separatedBy: changeFont)
        
        for i in 0..<strings.count {
            let item = strings[i]
            let dict = [NSAttributedString.Key.font: font,
                        NSAttributedString.Key.foregroundColor: color]
            let content = NSAttributedString(string: item, attributes: dict)
            attributedStrM.append(content)
            
            if i != strings.count - 1 {
                let dict1 = [NSAttributedString.Key.font: font2,
                             NSAttributedString.Key.foregroundColor: color2]
                let content2 = NSAttributedString(string: changeFont,
                                                  attributes: dict1)
                attributedStrM.append(content2)
                
                let dict2 = [NSAttributedString.Key.font: font3,
                             NSAttributedString.Key.foregroundColor: color3]
                let content3 = NSAttributedString(string: changeFont2,
                                                  attributes: dict2)
                attributedStrM.append(content3)
            }
            
        }
        return attributedStrM
    }
}




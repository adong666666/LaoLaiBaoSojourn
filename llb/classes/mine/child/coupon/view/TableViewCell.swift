//  Created by adong666 on 2018/8/21.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class TableViewCell: UITableViewCell {

    override func awakeFromNib() { allthings() }
    
    var btn1: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect(x: 20.fitScreen, y: 0.fitHeight, width: 380.fitScreen, height : 150.fitHeight)
        bt4.setBackgroundImage(UIImage(named: "优惠券2"), for: .normal)
        bt4.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 16
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        return bt4
    }()
    var llabel: PowerLabel = {
       let label = PowerLabel()
        label.text = "￥5"
        label.textColor = UIColor.white
        label.font = UIFont(name: "Arial", size: 40)
        label.frame = CGRect(x: 25.fitScreen, y: 40.fitHeight, width: 100.fitScreen, height: 80.fitHeight)
        return label
    }()
    var llabel1: PatientInfoCustomLabel = {
       let label = PatientInfoCustomLabel()
        label.text = "新人券"
        label.font = UIFont(name: "Arial", size: 18)
        label.frame = CGRect(x: 150.fitScreen, y: 20.fitHeight, width: 100.fitScreen, height: 40.fitHeight)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel2: PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.text = "满50可用"
        label.font = UIFont(name: "Arial", size: 15)
        label.frame = CGRect(x: 150.fitScreen, y: 60.fitHeight, width: 150.fitScreen, height: 40.fitHeight)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel3: PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.text = "有效期至2018-11-12"
        label.font = UIFont(name: "Arial", size: 12)
        label.frame = CGRect(x: 150.fitScreen, y: 100.fitHeight, width: 200.fitScreen, height: 40.fitHeight)
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
}
extension TableViewCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension TableViewCell{
    func add(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(btn1)
        addSubview(llabel)
        addSubview(llabel1)
        addSubview(llabel2)
        addSubview(llabel3)
    }
}

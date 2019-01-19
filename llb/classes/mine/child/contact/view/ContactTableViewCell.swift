//  Created by adong666 on 2018/8/22. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class contactTableViewCell: UITableViewCell {
    
    override func awakeFromNib() { allthings() }
    
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 20.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        return label
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 100.fitScreen, y: 40.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.font = UIFont(name: "Arial", size: 15)
        label.textAlignment = .left
        label.text = "xx基地"
        return label
    }()
    var llabel3: PowerLabel = {
        let frame1 = CGRect (x: 310.fitScreen, y: 40.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.font = UIFont(name: "Arial", size: 13)
        label.textAlignment = .left
        label.text = "2018/9/13"
        label.alpha = 0.5
        return label
    }()
    var btn1: PowerButton = {
        let frame = CGRect(x: 20.fitScreen, y: 40.fitHeight, width: 60.fitScreen, height: 60.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setBackgroundImage(UIImage(named: "默认头像"), for: UIControl.State.normal)
        bt1.layer.cornerRadius = 24
        bt1.layer.masksToBounds = true
        return bt1
    }()
    var btn2: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 187.fitScreen, y: 45.fitHeight, width: 100.fitScreen, height: 30.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("基地认证", for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 12
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.gray.cgColor
        return bt4
    }()
    var llabel5: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 100.fitScreen, y: 80.fitHeight, width: 250.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "最后一条消息"
        return bt1
    }()
    var llabel9: PowerButton = {
        let bt1 = PowerButton()
        bt1.frame = CGRect(x: 380.fitScreen, y: 90.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "右"), for: UIControl.State.normal)
        return bt1
    }()
}
extension contactTableViewCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension contactTableViewCell{
    func add(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(llabel)
        addSubview(btn1)
        addSubview(btn2)
        addSubview(llabel2)
        addSubview(llabel3)
        addSubview(llabel5)
        addSubview(llabel9)
    }
}

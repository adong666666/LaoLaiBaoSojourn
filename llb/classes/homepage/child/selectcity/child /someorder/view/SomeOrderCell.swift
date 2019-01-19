//  Created by adong666666 on 2018/8/29.  Copyright © 2018年 adong666666. All rights reserved.CGFloat


import UIKit
import Kingfisher

class someOrderCell: UITableViewCell {
    
    override func awakeFromNib() { allthings() }
    
    var roomNameLabel: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 30.fitScreen, y: 10.fitHeight, width: 200.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = ""
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.black
        return label
    }()
    var llabel2: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 31.fitScreen, y: 55.fitHeight, width: 90.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.black
        bt1.font = UIFont(name: "Arial", size: 12)
        bt1.text = "大床 | 有窗"
        return bt1
    }()
    var roomPriceLabel: PowerLabel = {
        let frame1 = CGRect (x: 25.fitScreen, y: 95.fitHeight, width: 200.fitScreen, height: 40.fitHeight)
        let label3 = PowerLabel (frame: frame1)
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .left
        label3.text = ""
        label3.alpha = 0.7
        label3.textColor = UIColor.red
        label3.font = UIFont (name: "Arial", size: 25)
        return label3
    }()
    var llabel4: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:150.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    var llabel5: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 280.fitScreen, y: 80.fitHeight, width: 120.fitScreen, height: 30.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("在线付", for: UIControl.State())
        bt4.setTitleColor(UIColor.orange, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 6
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 255, g: 158, b: 5).cgColor
        bt4.isUserInteractionEnabled = false
        return bt4
    }()
    var llabel6: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 280.fitScreen, y: 40.fitHeight, width: 120.fitScreen, height: 40.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("", for: UIControl.State())
        bt4.setTitleColor(UIColor.white, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 15)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 6
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 255, g: 158, b: 5).cgColor
        bt4.backgroundColor = UIColor.init(r: 255, g: 158, b: 5)
        bt4.isUserInteractionEnabled = false
        return bt4
    }()
    var llabel7: PowerLabel = {
        let frame1 = CGRect (x: 280.fitScreen, y:70.fitHeight, width: 119.5.fitScreen, height: 15.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 1
        label.backgroundColor = UIColor.init(r: 255, g: 158, b: 5)
        return label
    }()
    var llabel8: PowerLabel = {
        let frame1 = CGRect (x: 280.fitScreen, y:70.fitHeight, width: 119.5.fitScreen, height: 15.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 1
        label.backgroundColor = UIColor.init(r: 255, g: 158, b: 5)
        return label
    }()
    var llabel9: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 280.fitScreen, y: 45.fitHeight, width: 120.fitScreen, height: 40.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("预订", for: UIControl.State())
        bt4.setTitleColor(UIColor.white, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 15)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 6
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.clear.cgColor
        bt4.isUserInteractionEnabled = false
        return bt4
    }()
    var llabel10: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 280.fitScreen, height: 156.fitHeight)
        return bt1
    }()
    var llabel11: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 280.fitScreen, y: 110.fitHeight, width: 134.fitScreen, height: 45.fitHeight)
        return bt1
    }()
    var llabel12: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 280.fitScreen, y: 0.fitHeight, width: 134.fitScreen, height: 46.fitHeight)
        return bt1
    }()
    var roomInfo: room_info?{
        didSet{
            self.roomNameLabel.text = roomInfo?.room_name
            self.roomPriceLabel.text = "￥" + String(roomInfo?.room_price ?? "0")
        }
    }
}
extension someOrderCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension someOrderCell{
    func add(){
        self.backgroundColor = UIColor.white
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(roomNameLabel)
        addSubview(llabel2)
        addSubview(roomPriceLabel)
        addSubview(llabel4)
        addSubview(llabel5)
        addSubview(llabel6)
        addSubview(llabel7)
        addSubview(llabel8)
        addSubview(llabel9)
        addSubview(llabel10)
        addSubview(llabel11)
        addSubview(llabel12)
    }
}

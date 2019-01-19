//  Created by adong666 on 2018/8/22. Copyright © 2018年 adong666666. All rights reserved.左

import UIKit

class orderTableViewCell: UITableViewCell {
    override func awakeFromNib() { allthings() }
    
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
        return label
    }()
    var llabel5: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 124.fitScreen, y: 80.fitHeight, width: 250.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "7月17日-月18日  共一晚\n\n整套出租 一套\n\n订单总额： ￥280.00"
        return bt1
    }()
    var llabel6: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 10.fitScreen, y: 50.fitHeight, width: 300.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.font = UIFont(name: "Arial", size: 14)
        bt1.text = "【逅湖民宿】美式复古大床房201"
        return bt1
    }()
    var llabel8: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 333.fitScreen, y: 50.fitHeight, width: 300.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.font = UIFont(name: "Arial", size: 14)
        bt1.text = "待点评"
        bt1.textColor = UIColor.init(r: 27, g: 199, b: 141)
        return bt1
    }()
    var llabel9: PowerButton = {
        let bt1 = PowerButton()
        bt1.frame = CGRect(x: 380.fitScreen, y: 110.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "右"), for: UIControl.State.normal)
        return bt1
    }()
    var img1 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "1"))
        img.frame = CGRect(x:15.fitScreen, y: 80.fitHeight, width: 94.fitScreen, height: 80.fitHeight)
        return img
    }()
}
extension orderTableViewCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension orderTableViewCell{
    func add(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(llabel)
        addSubview(llabel5)
        addSubview(llabel6)
        addSubview(llabel8)
        addSubview(llabel9)
        addSubview(img1)
    }
}


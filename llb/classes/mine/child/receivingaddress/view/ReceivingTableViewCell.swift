//  Created by adong666 on 2018/8/22. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class receivingTableViewCell: UITableViewCell {
    
    override func awakeFromNib() { allthings() }
    
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 1.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 30.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.font = UIFont(name: "Arial", size: 18)
        label.textAlignment = .left
        label.text = "收货人"
        return label
    }()
    var llabel3: PowerLabel = {
        let frame1 = CGRect (x: 310.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.font = UIFont(name: "Arial", size: 12)
        label.textAlignment = .left
        label.text = "15674930334"
        return label
    }()
    var llabel6: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 30.fitScreen, y: 50.fitHeight, width: 300.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.font = UIFont(name: "Arial", size: 14)
        bt1.text = "详细地址"
        return bt1
    }()
    var btn1 : PowerButton = {
        let frame = CGRect(x:204.fitScreen, y: 60.fitHeight, width: 150.fitScreen, height: 100.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("编辑", for: .normal)
        bt1.setTitleColor(UIColor.init(r: 124, g: 124, b: 124), for: UIControl.State())
        bt1.titleLabel?.font = UIFont (name: "Arial", size: 12)
        bt1.titleLabel?.textColor = UIColor.lightGray
        return bt1
    }()
    var btn2 : PowerButton = {
        let frame = CGRect(x: 284.fitScreen, y: 60.fitHeight, width: 150.fitScreen, height: 100.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("删除", for: .normal)
        bt1.setTitleColor(UIColor.init(r: 124, g: 124, b: 124), for: UIControl.State())
        bt1.titleLabel?.font = UIFont (name: "Arial", size: 12)
        bt1.titleLabel?.textColor = UIColor.lightGray
        return bt1
    }()
    var btn3 : PowerButton = {
        let frame = CGRect(x: 44.fitScreen, y: 60.fitHeight, width: 150.fitScreen, height: 100.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("设为默认地址", for: .normal)
        bt1.setTitleColor(UIColor.black, for: UIControl.State())
        bt1.titleLabel?.font = UIFont (name: "Arial", size: 12)
        bt1.titleLabel?.textColor = UIColor.lightGray
        return bt1
    }()
    var btn4 : PowerButton = {
        let frame = CGRect(x: 20.fitScreen, y: 80.fitHeight, width: 60.fitScreen, height: 60.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("◯", for: .normal)
        bt1.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt1.titleLabel?.font = UIFont (name: "Arial", size: 20)
        return bt1
    }()
}
extension receivingTableViewCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension receivingTableViewCell{
    func add(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(llabel)
        addSubview(llabel2)
        addSubview(llabel3)
        addSubview(llabel6)
        addSubview(btn1)
        addSubview(btn2)
        addSubview(btn3)
        addSubview(btn4)
    }
}

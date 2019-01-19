//  Created by adong666666 on 2018/8/6. Copyright © 2018年 adong666666. All rights reserved。

import UIKit

struct  Count1 {
    var count : Int
    mutating func add1(_ distance : Int){
        self.count += distance
    }
    init(count: Int){
        self.count  = count
    }
}

class reserveViewController: UIViewController {
    
    override func viewDidLoad() { allthings() }
    
    var count1 = Count1.init(count: 1)
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(reserveViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 90.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 2130.fitHeight)
        return scroll
    }()
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 35.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "预订"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 22)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:90.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel3: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 124.fitScreen, y: 30.fitHeight, width: 250.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "【保证入住正规许可】此木堂-复式町屋近金阁寺\n\n整套出租\n\n"
        return bt1
    }()
    var llabel4: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 140.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel5: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 160.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "入住时段"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel6: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 180.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "（以北京时间为准）"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.init(r: 124, g: 124, b: 124)
        label.textAlignment = .center
        return label
    }()
    var llabel7: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 270.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "共6晚"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel8: PowerLabel = {
        let frame1 = CGRect (x: 90.fitScreen, y: 275.fitHeight, width: 40.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "18"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.black
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        return label
    }()
    var llabel9: PowerLabel = {
        let frame1 = CGRect (x: 288.fitScreen, y: 275.fitHeight, width: 40.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "24"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        return label
    }()
    var llabel10: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 340.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel11: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 370.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "入住人信息"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel12: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 570.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "保险"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel13: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 540.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel14: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 20.fitScreen, y: 670.fitHeight, width: 250.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "旅行意外险\n\n完善身份信息，最高赔付12万元"
        return bt1
    }()
    var llabel15: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 770.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "代金券"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel16: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 740.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel17: PowerLabel = {
        let frame1 = CGRect (x: 20.fitScreen, y: 295.fitHeight, width: 100.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "7月18日"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.init(r: 27, g: 199, b: 141)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        return label
    }()
    var llabel18: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 295.fitHeight, width: 100.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "14:00入住"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        return label
    }()
    var llabel19: PowerLabel = {
        let frame1 = CGRect (x: 219.fitScreen, y: 295.fitHeight, width: 100.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "7月24日"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.init(r: 38, g: 202, b: 203)
        label.backgroundColor = UIColor.clear
        label.textAlignment = .center
        return label
    }()
    var llabel20: PowerLabel = {
        let frame1 = CGRect (x: 299.fitScreen, y: 295.fitHeight, width: 100.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "12:00离开"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.black
        label.textAlignment = .center
        label.backgroundColor = UIColor.clear
        return label
    }()
    var llabel21: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 970.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "发票"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel22: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 940.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel23: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 1070.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "需要发票"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:20)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel24: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1140.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel25: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y:1170.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "预订人信息"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel26: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 1278.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "昵    称：summere9"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:16)
        label.textColor = UIColor.black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel27: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 1378.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "手    机：+86 13507993630"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:16)
        label.textColor = UIColor.black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel28: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y:1470.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "基地要求"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel29: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1440.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel30: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1340.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 250, g: 250, b: 250)
        return label
    }()
    var llabel31: PowerLabel = {
        let frame1 = CGRect (x: 17.fitScreen, y:1576.fitHeight, width: 380.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.7
        label.backgroundColor = UIColor.init(r: 249, g: 217, b: 228)
        return label
    }()
    var llabel32: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 30.fitScreen, y: 1595.fitHeight, width: 360.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.init(r: 38, g: 202, b: 203)
        bt1.text = "根据基地设置的交易规则未早于08月31日退订视为有责取消，应扣除取消订单时间点后七天订金作为违约金，剩余钱款将被原路退还►"
        return bt1
    }()
    var llabel33: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 15.fitScreen, y: 1573.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel34: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 15.fitScreen, y: 1576.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel35: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 396.fitScreen, y: 1573.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel36: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 396.fitScreen, y: 1576.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel37: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 396.fitScreen, y: 1579.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel38: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 396.fitScreen, y: 1582.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel39: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 15.fitScreen, y: 1579.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel40: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 15.fitScreen, y: 1582.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 249, g: 217, b: 228)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel41: PowerLabel = {
        let frame1 = CGRect (x: 17.fitScreen, y:1670.fitHeight, width: 380.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.7
        label.backgroundColor = UIColor.init(r: 249, g: 217, b: 228)
        return label
    }()
    var llabel42: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 17.fitScreen, y: 1700.fitHeight, width: 380.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.black
        bt1.font = UIFont(name: "Arial", size: 12)
        bt1.text = "不允许做饭。不允许带宠物，不允许吸烟。接待境外人士。入住人数：宜居2人，不允许加客其它费用：清洁费60元特殊要求：（1）退房时间为12：00；入住时间为14:00……"
        return bt1
    }()
    var llabel43: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1840.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var llabel44: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 51.fitScreen, y: 1860.fitHeight, width: 340.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.black
        bt1.font = UIFont(name: "Arial", size: 12)
        bt1.text = "我同意《老来宝平台服务协议》《房客规则》《意外健康保险告知书》及基地规定的退订规则及入住要求"
        return bt1
    }()
    var llabel45: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1960.fitHeight, width: 414.fitScreen, height: 80.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 1
        label.backgroundColor = UIColor.white
        return label
    }()
    var llabel46: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 21.fitScreen, y: 1975.fitHeight, width: 340.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.init(r: 38, g: 202, b: 203)
        bt1.font = UIFont(name: "Arial", size: 14)
        bt1.text = "订单总额：￥9646.90"
        return bt1
    }()
    var llabel47: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 21.fitScreen, y: 2010.fitHeight, width: 340.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.black
        bt1.font = UIFont(name: "Arial", size: 12)
        bt1.text = "押金￥1000.00"
        return bt1
    }()
    var llabel48: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1960.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var llabel49: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:2038.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var llabel50: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:0.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var img1 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "1"))
        img.frame = CGRect(x:15.fitScreen, y: 30.fitHeight, width: 94.fitScreen, height: 80.fitHeight)
        return img
    }()
    var img2 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "日历"))
        img.frame = CGRect(x:90.fitScreen, y: 270.fitHeight, width: 40.fitScreen, height: 40.fitHeight)
        return img
    }()
    var img3 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "日历"))
        img.frame = CGRect(x:288.fitScreen, y: 270.fitHeight, width: 40.fitScreen, height: 40.fitHeight)
        return img
    }()
    var btn1 : PowerButton = {
        let frame5 = CGRect(x: 103.fitScreen, y: 480.fitHeight, width: 207.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("＋添加入住人", for: .normal)
        bt5.setTitleColor(UIColor.init(r: 38, g: 202, b: 203), for: UIControl.State())
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 20)
        bt5.titleLabel?.textColor = UIColor.init(r: 38, g: 202, b: 203)
        bt5.addTarget(self,action: #selector(reserveViewController.buttonTap2(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn2 : PowerButton = {
        let frame5 = CGRect(x: 103.fitScreen, y: 880.fitHeight, width: 207.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("我的代金券", for: .normal)
        bt5.setTitleColor(UIColor.init(r: 38, g: 202, b: 203), for: UIControl.State())
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 20)
        bt5.titleLabel?.textColor = UIColor.init(r: 38, g: 202, b: 203)
        bt5.addTarget(self,action: #selector(reserveViewController.buttonTap3(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn3 : PowerButton = {
        let frame5 = CGRect(x: -50.fitScreen, y: 1780.fitHeight, width: 207.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("查看全部►", for: .normal)
        bt5.setTitleColor(UIColor.black, for: UIControl.State())
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 12)
        bt5.titleLabel?.textColor = UIColor.black
        bt5.addTarget(self,action: #selector(reserveViewController.buttonTap4(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn4 : PowerButton = {
        let frame5 = CGRect(x: 26.fitScreen, y: 1860.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("☐", for: .normal)
        bt5.setTitleColor(UIColor.init(r: 38, g: 202, b: 203), for: UIControl.State())
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 20)
        bt5.titleLabel?.textColor = UIColor.init(r: 38, g: 202, b: 203)
        bt5.addTarget(self,action: #selector(reserveViewController.buttonTap5(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn5 : PowerButton = {
        let frame5 = CGRect(x: 264.fitScreen, y: 1960.fitHeight, width: 150.fitScreen, height: 80.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("提交订单", for: .normal)
        bt5.setTitleColor(UIColor.white, for: UIControl.State())
        bt5.backgroundColor = UIColor.init(r: 38, g: 202, b: 203)
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 14)
        bt5.titleLabel?.textColor = UIColor.white
        bt5.addTarget(self,action: #selector(reserveViewController.buttonTap6(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn6 : PowerButton = {
        let frame5 = CGRect(x: 26.fitScreen, y: 1860.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setBackgroundImage(UIImage(named: "勾"), for: .normal)
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.tag = 2
        return bt5
    }()
    var sswitch : UISwitch = {
        let frame = CGRect (x: 320.fitScreen, y: 1070.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let uiswitch = UISwitch(frame: frame)
        uiswitch.setOn(false, animated: true)
        uiswitch.addTarget(self, action: #selector(reserveViewController.switchChanged(_:)),for: UIControl.Event.valueChanged)
        return uiswitch
    }()
}
extension reserveViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
    }
}
extension reserveViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(llabel)
        self.view.addSubview(llabel2)
        self.view.addSubview(sscroll)
        sscroll.addSubview(llabel3)
        sscroll.addSubview(llabel4)
        sscroll.addSubview(llabel5)
        sscroll.addSubview(llabel6)
        sscroll.addSubview(llabel7)
        sscroll.addSubview(llabel8)
        sscroll.addSubview(llabel9)
        sscroll.addSubview(llabel10)
        sscroll.addSubview(llabel11)
        sscroll.addSubview(llabel12)
        sscroll.addSubview(llabel13)
        sscroll.addSubview(llabel14)
        sscroll.addSubview(llabel15)
        sscroll.addSubview(llabel16)
        sscroll.addSubview(llabel17)
        sscroll.addSubview(llabel18)
        sscroll.addSubview(llabel19)
        sscroll.addSubview(llabel20)
        sscroll.addSubview(llabel21)
        sscroll.addSubview(llabel22)
        sscroll.addSubview(llabel23)
        sscroll.addSubview(llabel24)
        sscroll.addSubview(llabel25)
        sscroll.addSubview(llabel26)
        sscroll.addSubview(llabel27)
        sscroll.addSubview(llabel28)
        sscroll.addSubview(llabel29)
        sscroll.addSubview(llabel30)
        sscroll.addSubview(llabel31)
        sscroll.addSubview(llabel32)
        sscroll.addSubview(llabel33)
        sscroll.addSubview(llabel34)
        sscroll.addSubview(llabel35)
        sscroll.addSubview(llabel36)
        sscroll.addSubview(llabel37)
        sscroll.addSubview(llabel38)
        sscroll.addSubview(llabel39)
        sscroll.addSubview(llabel40)
        sscroll.addSubview(llabel41)
        sscroll.addSubview(llabel42)
        sscroll.addSubview(llabel43)
        sscroll.addSubview(llabel44)
        sscroll.addSubview(llabel45)
        sscroll.addSubview(llabel46)
        sscroll.addSubview(llabel47)
        sscroll.addSubview(llabel48)
        sscroll.addSubview(llabel49)
        sscroll.addSubview(llabel50)
        sscroll.addSubview(img1)
        sscroll.addSubview(img2)
        sscroll.addSubview(img3)
        sscroll.addSubview(btn1)
        sscroll.addSubview(btn2)
        sscroll.addSubview(btn3)
        sscroll.addSubview(btn4)
        sscroll.addSubview(btn5)
        sscroll.addSubview(sswitch)
    }
}
extension reserveViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton)
    {
        self.navigationController?.pushViewController(addoccupantViewController(),animated: true)
    }
    @objc func buttonTap3(_ button: UIButton)
    {
        
    }
    @objc func buttonTap4(_ button: UIButton)
    {
        
    }
    @objc func buttonTap5(_ button: UIButton)
    {
        count1.add1(1)
        print(count1)
        if count1.count % 2 == 0{
            sscroll.addSubview(btn6)
            btn6.tag = 1
            sscroll.addSubview(btn4)
        }else{
            btn6.removeFromSuperview()
            btn6.tag = 2
        }
        if count1.count == 10000{
            count1.count = 0
        }else {}
    }
    @objc func buttonTap6(_ button: UIButton)
    {
        
    }
    @objc func switchChanged(_ uiSwitch:UISwitch)
    {
        var message = "Turn off the switch."
        if(uiSwitch.isOn)
        {
            message = "Turn on the switch."
        }
        let alert = UIAlertController(title: "Information", message: message, preferredStyle: UIAlertController.Style.alert)
        let OKAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil)
        alert.addAction(OKAction)
        self.present(alert, animated: true, completion: nil)
    }
}
extension reserveViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

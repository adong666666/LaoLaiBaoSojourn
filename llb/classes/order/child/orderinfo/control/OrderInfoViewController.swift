//  Created by adong666666 on 2018/8/6. Copyright © 2018年 adong666666. All rights reserved。"1"

import UIKit

class orderinfoViewController: UIViewController {

    override func viewDidLoad() { allthings() }
    
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(orderinfoViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 90.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 1410.fitHeight)
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
        label.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
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
        label.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
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
        label.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
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
        label.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
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
        label.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
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
        label.textColor = UIColor.init(r: 27, g: 199, b: 141)
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
    var llabel21: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 20.fitScreen, y: 880.fitHeight, width: 250.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "进入个人中心，查找您的代金券"
        return bt1
    }()
    var llabel24: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:940.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
        return label
    }()
    var llabel25: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y:970.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "预订人信息"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel26: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 1078.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
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
        let frame1 = CGRect (x: 0.fitScreen, y: 1178.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
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
    var llabel30: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1140.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    var llabel48: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1240.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 1
        label.backgroundColor = UIColor.init(r: 27, g: 199, b: 141)
        return label
    }()
    var llabel49: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1318.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 1
        label.backgroundColor = UIColor.init(r: 27, g: 199, b: 141)
        return label
    }()
    var llabel50: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:0.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
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
    var btn5 : PowerButton = {
        let frame5 = CGRect(x: 207.fitScreen, y: 1240.fitHeight, width: 207.fitScreen, height: 80.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("去支付", for: .normal)
        bt5.setTitleColor(UIColor.white, for: UIControl.State())
        bt5.backgroundColor = UIColor.init(r: 38, g: 202, b: 203)
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 14)
        bt5.titleLabel?.textColor = UIColor.white
        bt5.addTarget(self,action: #selector(orderinfoViewController.buttonTap6(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn6 : PowerButton = {
        let frame5 = CGRect(x: 0.fitScreen, y: 1240.fitHeight, width: 207.fitScreen, height: 80.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("取消订单", for: .normal)
        bt5.setTitleColor(UIColor.init(r: 38, g: 202, b: 203), for: UIControl.State())
        bt5.backgroundColor = UIColor.white
        bt5.tintColor = UIColor.clear
        bt5.layer.borderColor = UIColor.init(r: 27, g: 199, b: 141).cgColor
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 14)
        bt5.addTarget(self,action: #selector(orderinfoViewController.buttonTap6(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap6(_ button: UIButton)
    {
        
    }
}
extension orderinfoViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
    }
}
extension orderinfoViewController{
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
        sscroll.addSubview(llabel24)
        sscroll.addSubview(llabel25)
        sscroll.addSubview(llabel26)
        sscroll.addSubview(llabel27)
        sscroll.addSubview(llabel30)
        sscroll.addSubview(llabel50)
        sscroll.addSubview(img1)
        sscroll.addSubview(img2)
        sscroll.addSubview(img3)
        sscroll.addSubview(btn5)
        sscroll.addSubview(btn6)
        sscroll.addSubview(llabel48)
        sscroll.addSubview(llabel49)
    }
}
extension orderinfoViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

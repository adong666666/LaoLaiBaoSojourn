//  Created by adong666666 on 2018/8/14. Copyright © 2018年 adong666666. All rights reserved. 

import UIKit

class mineViewController: UIViewController {
    
    override func viewDidLoad() { allthings() }
    
    var btn: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: -103.5.fitScreen, y: -467.fitHeight, width: 621.fitScreen, height: 737.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("", for: UIControl.State())
        bt4.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = CGFloat(305.fitScreen)
        bt4.layer.borderWidth = CGFloat(389.fitScreen)
        bt4.layer.borderColor = UIColor.init(r: 27, g: 199, b: 141).cgColor
        bt4.addTarget(self, action: #selector(mineViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt4
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 1050.fitHeight)
        return scroll
    }()
    static var btn2 : PowerButton = {
        let frame = CGRect(x: 155.fitScreen, y: 80.fitHeight, width: 104.fitScreen, height: 104.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("未登录", for: .normal)
        bt1.setImage(UIImage(named: "未登录头像"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    static var btn3 : PowerButton = {
        let frame = CGRect(x: 155.fitScreen, y: 170.fitHeight, width: 104.fitScreen, height: 104.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("未登录", for: .normal)
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.titleLabel?.textColor = UIColor.white
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 20)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn4 : PowerButton = {
        let frame = CGRect(x: 177.fitScreen, y: 300.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("优惠券", for: .normal)
        bt1.setImage(UIImage(named: "优惠券"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap4(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn5 : PowerButton = {
        let frame = CGRect(x: 295.fitScreen, y: 300.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("历史订单", for: .normal)
        bt1.setImage(UIImage(named: "历史订单"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap13(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn6 : PowerButton = {
        let frame = CGRect(x: 59.fitScreen, y: 400.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("收藏浏览", for: .normal)
        bt1.setImage(UIImage(named: "收藏浏览"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap6(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn7 : PowerButton = {
        let frame = CGRect(x: 177.fitScreen, y: 400.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("评价晒单", for: .normal)
        bt1.setImage(UIImage(named: "评价晒单"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap7(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn8 : PowerButton = {
        let frame = CGRect(x: 295.fitScreen, y: 400.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("联系客服", for: .normal)
        bt1.setImage(UIImage(named: "联系客服"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap8(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn9 : PowerButton = {
        let frame = CGRect(x: 59.fitScreen, y: 500.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("常用入住人", for: .normal)
        bt1.setImage(UIImage(named: "常用入住人"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap9(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn10 : PowerButton = {
        let frame = CGRect(x: 177.fitScreen, y: 500.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("收货地址", for: .normal)
        bt1.setImage(UIImage(named: "收货地址"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap10(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn11 : PowerButton = {
        let frame = CGRect(x: 59.fitScreen, y: 300.fitHeight, width: 42.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("邀请好友", for: .normal)
        bt1.setImage(UIImage(named: "邀请好友"), for: .normal)
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap11(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn12 : PowerButton = {
        let frame = CGRect(x: 147.fitScreen, y: 340.fitHeight, width: 104.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("优惠券", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap4(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn13 : PowerButton = {
        let frame = CGRect(x: 265.fitScreen, y: 340.fitHeight, width: 104.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("历史订单", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap13(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn14 : PowerButton = {
        let frame = CGRect(x: 29.fitScreen, y: 440.fitHeight, width: 104.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("收藏浏览", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap6(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn15 : PowerButton = {
        let frame = CGRect(x: 147.fitScreen, y: 440.fitHeight, width: 104.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("评价晒单", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap7(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn16 : PowerButton = {
        let frame = CGRect(x: 265.fitScreen, y: 440.fitHeight, width: 104.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("联系客服", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap8(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn17 : PowerButton = {
        let frame = CGRect(x: 9.fitScreen, y: 540.fitHeight, width: 154.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("常用入住人", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap9(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn18 : PowerButton = {
        let frame = CGRect(x: 147.fitScreen, y: 540.fitHeight, width: 104.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("收货地址", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap10(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn19 : PowerButton = {
        let frame = CGRect(x: 29.fitScreen, y: 340.fitHeight, width: 104.fitScreen, height: 42.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("邀请好友", for: .normal)
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt1.addTarget(self, action: #selector(mineViewController.buttonTap11(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn20 : PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect(x: 7.fitScreen, y: 620.fitHeight, width: 400.fitScreen, height: 150.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setBackgroundImage(UIImage(named: "aaaaa"), for: .normal)
        bt4.setTitleColor(UIColor.lightText, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 27
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        return bt4
    }()
    var btn21 : PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect(x: 0.fitScreen, y: 800.fitHeight, width: 414.fitScreen, height: 80.fitHeight)
        bt4.backgroundColor = UIColor.clear
        return bt4
    }()
    var btn22 : PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect(x: 0.fitScreen, y: 880.fitHeight, width: 414.fitScreen, height: 80.fitHeight)
        bt4.backgroundColor = UIColor.clear
        return bt4
    }()
    var btn23 : PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect(x: 0.fitScreen, y: 960.fitHeight, width: 414.fitScreen, height: 80.fitHeight)
        bt4.backgroundColor = UIColor.clear
        return bt4
    }()
    var llabel1: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:880.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.2
        label.backgroundColor = UIColor.black
        return label
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:960.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.2
        label.backgroundColor = UIColor.black
        return label
    }()
    var llabel3: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:1040.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.2
        label.backgroundColor = UIColor.black
        return label
    }()
    var llabel4: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 30.fitScreen, y: 830.fitHeight, width: 414.fitScreen, height: 50.fitHeight)
        bt1.text = "推荐老来宝给朋友"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.font = UIFont(name: "Arial", size: 16)
        bt1.textColor = UIColor.black
        return bt1
    }()
    var llabel5: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 30.fitScreen, y: 910.fitHeight, width: 414.fitScreen, height: 50.fitHeight)
        bt1.text = "意见反馈"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.font = UIFont(name: "Arial", size: 16)
        bt1.textColor = UIColor.black
        return bt1
    }()
    var llabel6: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 30.fitScreen, y: 990.fitHeight, width: 414.fitScreen, height: 50.fitHeight)
        bt1.text = "关于老来宝旅居"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.font = UIFont(name: "Arial", size: 16)
        bt1.textColor = UIColor.black
        return bt1
    }()
    var llabel7: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 250.fitScreen, y: 990.fitHeight, width: 414.fitScreen, height: 50.fitHeight)
        bt1.text = "已是最新版本"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.font = UIFont(name: "Arial", size: 16)
        bt1.textColor = UIColor.black
        return bt1
    }()
    var llabel8: PowerButton = {
        let bt1 = PowerButton()
        bt1.frame = CGRect(x: 370.fitScreen, y: 827.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "右"), for: UIControl.State.normal)
        return bt1
    }()
    var llabel9: PowerButton = {
        let bt1 = PowerButton()
        bt1.frame = CGRect(x: 370.fitScreen, y: 907.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "右"), for: UIControl.State.normal)
        return bt1
    }()
    var llabel10: PowerButton = {
        let bt1 = PowerButton()
        bt1.frame = CGRect(x: 370.fitScreen, y: 987.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "右"), for: UIControl.State.normal)
        return bt1
    }()
}
extension mineViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
    }
}
extension mineViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(sscroll)
        sscroll.addSubview(btn)
        sscroll.addSubview(mineViewController.btn2)
        sscroll.addSubview(mineViewController.btn3)
        sscroll.addSubview(btn11)
        sscroll.addSubview(btn4)
        sscroll.addSubview(btn5)
        sscroll.addSubview(btn6)
        sscroll.addSubview(btn7)
        sscroll.addSubview(btn8)
        sscroll.addSubview(btn9)
        sscroll.addSubview(btn10)
        sscroll.addSubview(btn19)
        sscroll.addSubview(btn12)
        sscroll.addSubview(btn13)
        sscroll.addSubview(btn14)
        sscroll.addSubview(btn15)
        sscroll.addSubview(btn16)
        sscroll.addSubview(btn17)
        sscroll.addSubview(btn18)
        sscroll.addSubview(btn20)
        sscroll.addSubview(btn21)
        sscroll.addSubview(btn22)
        sscroll.addSubview(btn23)
        sscroll.addSubview(llabel1)
        sscroll.addSubview(llabel2)
        sscroll.addSubview(llabel3)
        sscroll.addSubview(llabel4)
        sscroll.addSubview(llabel5)
        sscroll.addSubview(llabel6)
        sscroll.addSubview(llabel7)
        sscroll.addSubview(llabel8)
        sscroll.addSubview(llabel9)
        sscroll.addSubview(llabel10)
    }
}
extension mineViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.pushViewController(logandregViewController(), animated: true)
    }
    @objc func buttonTap4(_ button: UIButton)
    {
        self.navigationController?.pushViewController(conponViewController(), animated: true)
    }
    @objc func buttonTap6(_ button: UIButton)
    {
        self.navigationController?.pushViewController(collectViewController(), animated: true)
    }
    @objc func buttonTap7(_ button: UIButton)
    {
        self.navigationController?.pushViewController(evaluateViewController(), animated: true)
    }
    @objc func buttonTap8(_ button: UIButton)
    {
        self.navigationController?.pushViewController(contactViewController(), animated: true)
    }
    @objc func buttonTap9(_ button: UIButton)
    {
        self.navigationController?.pushViewController(commoncustomerViewController(), animated: true)
    }
    @objc func buttonTap10(_ button: UIButton)
    {
        self.navigationController?.pushViewController(receivingaddressViewController(), animated: true)
    }
    @objc func buttonTap11(_ button: UIButton)
    {
        
    }
    @objc func buttonTap13(_ button: UIButton)
    {
        self.navigationController?.pushViewController(histroicalViewController(), animated: true)
    }
}
extension mineViewController{
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

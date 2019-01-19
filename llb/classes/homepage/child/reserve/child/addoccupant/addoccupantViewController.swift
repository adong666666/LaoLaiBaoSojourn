//  Created by adong666666 on 2018/8/7. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class addoccupantViewController: UIViewController {
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 35.fitHeight, width: 20.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "返回"), for: UIControlState())
        bt1.setTitle(" ", for: UIControlState())
        bt1.setTitleColor(UIColor.white, for: UIControlState())
        bt1.addTarget(self, action: #selector(reserveViewController.buttonTap(_:)), for: UIControlEvents.touchUpInside)
        return bt1
    }()
    var btn2: PowerButton = {
        let bt1 = PowerButton(type: UIButtonType.roundedRect)
        bt1.frame = CGRect(x: 350.fitScreen, y: 35.fitHeight, width: 50.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControlState())
        bt1.setTitle("完成", for: UIControlState())
        bt1.setTitleColor(UIColor.green, for: UIControlState())
        bt1.addTarget(self, action: #selector(reserveViewController.buttonTap2(_:)), for: UIControlEvents.touchUpInside)
        return bt1
    }()
    var btn3 : PowerButton = {
        let frame5 = CGRect(x: 103.fitScreen, y: 40.fitHeight, width: 207.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("＋添加入住人", for: .normal)
        bt5.setTitleColor(UIColor.green, for: UIControlState())
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 20)
        bt5.titleLabel?.textColor = UIColor.green
        bt5.addTarget(self,action: #selector(reserveViewController.buttonTap3(_:)),for: UIControlEvents.touchUpInside)
        return bt5
    }()
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 35.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "选择入住人"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 10.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var llabel3: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 100.fitHeight, width: 414.fitScreen, height: 9999.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 90.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 647.fitHeight)
        return scroll
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(btn2)
        self.view.addSubview(llabel)
        self.view.addSubview(sscroll)
        sscroll.addSubview(llabel2)
        sscroll.addSubview(llabel3)
        sscroll.addSubview(btn3)
    }
    @objc func buttonTap(_ button: UIButton){
       self.dismiss(animated: true, completion: nil)
    }
    @objc func buttonTap2(_ button: UIButton){
        self.dismiss(animated: true, completion: nil)
    }
    @objc func buttonTap3(_ button: UIButton){

    }
    
}

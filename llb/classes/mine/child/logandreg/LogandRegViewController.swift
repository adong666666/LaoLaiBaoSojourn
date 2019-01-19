//  Created by adong666 on 2018/8/14.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit
import Alamofire


struct  Count {
    var count : Int
    mutating func add1(_ distance : Int){
    self.count += distance
    }
    init(count: Int){
        self.count  = count
    }
}
class logandregViewController: UIViewController,UITextFieldDelegate{
    
    override func viewDidLoad() { allthings() }
    
    struct MIX {
        static var mix: String = ""
    }
    var interval = 60
    var count1 = Count.init(count: 1)
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 10.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 800
            .fitHeight)
        return scroll
    }()
    var img1 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "老人"))
        img.frame = CGRect(x:0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 240.fitHeight)
        return img
    }()
    var img2 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "手机"))
        img.frame = CGRect(x:30.fitScreen, y: 335.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        return img
    }()
    var img3 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "验证码"))
        img.frame = CGRect(x:30.fitScreen, y: 415.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        return img
    }()
    var llabel1 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 10.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.text = "老来宝旅居"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 22)
        label.textColor = UIColor.white
        return label
    }()
    var llabel2 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 60.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.text = "携手旅居，畅游天下"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = UIColor.white
        return label
    }()
    var llabel3 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 270.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.text = "验证码登录注册"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 16)
        label.textColor = UIColor.black
        label.alpha = 0.5
        return label
    }()
    var ttextField: PowertextField = {
        let frame1 = CGRect (x: 80.fitScreen, y: 315.fitHeight, width: 320.fitScreen, height: 70.fitHeight)
        let textField = PowertextField(frame: frame1)
        textField.attributedPlaceholder = NSAttributedString.init(string: "手机号", attributes:
            [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 50)])
        textField.attributedPlaceholder = NSAttributedString.init(string: "手机号", attributes:
            [kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.init(r: 124, g: 124, b: 124)])
        textField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 31))
        textField.keyboardType = UIKeyboardType.numberPad
        textField.textAlignment = .left
        textField.rightViewMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    var ttextField1: PowertextField = {
        let frame1 = CGRect (x: 80.fitScreen, y: 395.fitHeight, width: 320.fitScreen, height: 70.fitHeight)
        let textField1 = PowertextField(frame: frame1)
        textField1.attributedPlaceholder = NSAttributedString.init(string: "验证码", attributes:
            [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 50)])
        textField1.attributedPlaceholder = NSAttributedString.init(string: "验证码", attributes:
            [kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.init(r: 124, g: 124, b: 124)])
        textField1.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        textField1.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 31))
        textField1.keyboardType = UIKeyboardType.numberPad
        textField1.textAlignment = .left
        textField1.rightViewMode = .always
        textField1.returnKeyType = .done
        return textField1
    }()
    var btn2: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 40.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 1000.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("", for: UIControl.State())
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap3(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var llabel4: PowerLabel = {
        let frame1 = CGRect (x: 70.fitScreen, y:365.fitHeight, width: 320.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.4
        label.backgroundColor = UIColor.black
        return label
    }()
    var llabel5: PowerLabel = {
        let frame1 = CGRect (x: 70.fitScreen, y:445.fitHeight, width: 320.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.4
        label.backgroundColor = UIColor.black
        return label
    }()
    var btn3: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 35.fitScreen, y: 475.fitHeight, width: 354.fitScreen, height: 60.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("", for: UIControl.State())
        bt1.backgroundColor = UIColor.init(r: 27, g: 199, b: 141)
        return bt1
    }()
    var btn4 : PowerButton = {
        let frame = CGRect(x: 300.fitScreen, y: 410.fitHeight, width: 104.fitScreen, height: 50.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("获取验证码", for: .normal)
        bt1.setTitleColor(UIColor.init(r: 124, g: 124, b: 124), for: UIControl.State())
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.titleLabel?.textColor = UIColor.init(r: 124, g: 124, b: 124)
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 12)
        return bt1
    }()
    var btn5 : PowerButton = {
        let frame = CGRect(x: 310.fitScreen, y: 510.fitHeight, width: 104.fitScreen, height: 100.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("立即注册", for: .normal)
        bt1.setTitleColor(UIColor.init(r: 124, g: 124, b: 124), for: UIControl.State())
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.titleLabel?.textColor = UIColor.init(r: 124, g: 124, b: 124)
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap4(_:)), for: UIControl.Event.touchUpInside)
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 12)
        return bt1
    }()
    var btn6: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 35.fitScreen, y: 480.fitHeight, width: 354.fitScreen, height: 50.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("注册", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.backgroundColor = UIColor.clear
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap5(_:)), for: UIControl.Event.touchUpInside)
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 20)
        bt1.tag = 1
        return bt1
    }()
    var btn7: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 35.fitScreen, y: 480.fitHeight, width: 354.fitScreen, height: 50.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("登录", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.backgroundColor = UIColor.clear
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap6(_:)), for: UIControl.Event.touchUpInside)
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 20)
        bt1.tag = 2
        return bt1
    }()
    var btn8 : PowerButton = {
        let frame = CGRect(x: 310.fitScreen, y: 510.fitHeight, width: 104.fitScreen, height: 100.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("立即登录", for: .normal)
        bt1.setTitleColor(UIColor.init(r: 124, g: 124, b: 124), for: UIControl.State())
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap7(_:)), for: UIControl.Event.touchUpInside)
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 12)
        return bt1
    }()
    var llabel6 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 80.fitScreen, y: 610.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.text = "我同意服务协议和隐私保护声明"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 10)
        label.textColor = UIColor.black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.alpha = 0.5
        return label
    }()
    var btn9 : PowerButton = {
        let frame5 = CGRect(x: 50.fitScreen, y: 605.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("☐", for: .normal)
        bt5.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 20)
        bt5.titleLabel?.textColor = UIColor.init(r: 27, g: 199, b: 141)
        bt5.addTarget(self,action: #selector(logandregViewController.buttonTap8(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var llabel7 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 745.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.text = "其他登录方式"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 15)
        label.textColor = UIColor.black
        label.alpha = 0.5
        return label
    }()
    var btn10 : PowerButton = {
        let frame = CGRect(x: 145.fitScreen, y: 780.fitHeight, width: 54.fitScreen, height: 54.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setImage(UIImage(named: "QQ"), for: .normal)
        bt1.setTitleColor(UIColor.lightGray, for: UIControl.State())
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap9(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn11 : PowerButton = {
        let frame = CGRect(x: 217.fitScreen, y: 780.fitHeight, width: 54.fitScreen, height: 54.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setImage(UIImage(named: "微信"), for: .normal)
        bt1.setTitleColor(UIColor.lightGray, for: UIControl.State())
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.addTarget(self, action: #selector(logandregViewController.buttonTap10(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn12 : PowerButton = {
        let frame = CGRect(x: 240.fitScreen, y: 410.fitHeight, width: 204.fitScreen, height: 50.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("请稍后获取验证码", for: .normal)
        bt1.setTitleColor(UIColor.lightGray, for: UIControl.State())
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.titleLabel?.textColor = UIColor.lightGray
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 12)
        return bt1
    }()
    var btn13 : PowerButton = {
        let frame5 = CGRect(x: 50.fitScreen, y: 605.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setBackgroundImage(UIImage(named: "勾"), for: .normal)
        bt5.backgroundColor = UIColor.clear
        bt5.tintColor = UIColor.clear
        bt5.tag = 2
        return bt5
    }()
}
extension logandregViewController{
    func allthings(){
        addSubview()
        delegate()
    }
}
extension logandregViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(sscroll)
        sscroll.addSubview(btn2)
        sscroll.addSubview(img1)
        sscroll.addSubview(btn)
        sscroll.addSubview(llabel1)
        sscroll.addSubview(llabel2)
        sscroll.addSubview(llabel3)
        sscroll.addSubview(img2)
        sscroll.addSubview(img3)
        sscroll.addSubview(ttextField)
        sscroll.addSubview(ttextField1)
        sscroll.addSubview(llabel4)
        sscroll.addSubview(llabel5)
        sscroll.addSubview(btn3)
        sscroll.addSubview(btn4)
        sscroll.addSubview(btn5)
        sscroll.addSubview(btn7)
        sscroll.addSubview(llabel6)
        sscroll.addSubview(btn9)
        sscroll.addSubview(llabel7)
        sscroll.addSubview(btn10)
        sscroll.addSubview(btn11)
    }
}
extension logandregViewController{
    func delegate(){
        ttextField.delegate = self
        ttextField1.delegate = self
    }
}
extension logandregViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton)
    {
        print(ttextField.text!)
        print(ttextField1.text!)
        if btn7.tag == 1{
            regverify()
        }else { logverify() }
        btn4.removeFromSuperview()
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(logandregViewController.timerAction(_:)), userInfo: "秒后重新获取", repeats: true)
    }
    @objc func timerAction(_ timer:Timer)
    {
        sscroll.addSubview(btn12)
        //let parameter = timer.userInfo
        //print("\(interval) \(parameter!)")
        interval -= 1
        btn12.titleLabel?.text = String(interval) + "秒后重新获取"
        if interval == 0 {
            timer.invalidate()
            timer.fireDate = Date.distantFuture
            sscroll.addSubview(btn4)
            btn12.removeFromSuperview()
            interval = 60
        }
    }
    @objc func buttonTap3(_ button: UIButton)
    {
        self.view.endEditing(true)
    }
    @objc func buttonTap4(_ button: UIButton)
    {
        btn7.removeFromSuperview()
        sscroll.addSubview(btn6)
        btn5.removeFromSuperview()
        sscroll.addSubview(btn8)
        btn6.tag = 2
        btn7.tag = 1
    }
    @objc func buttonTap5(_ button: UIButton)
    {
        register()
    }
    @objc func buttonTap6(_ button: UIButton)
    {
        login()
    }
    @objc func buttonTap7(_ button: UIButton)
    {
        btn6.removeFromSuperview()
        sscroll.addSubview(btn7)
        btn8.removeFromSuperview()
        sscroll.addSubview(btn5)
        btn6.tag = 1
        btn7.tag = 2
    }
    @objc  func buttonTap8(_ button: UIButton)
    {
        count1.add1(1)
        print(count1)
        if count1.count % 2 == 0{
            sscroll.addSubview(btn13)
            btn13.tag = 1
            sscroll.addSubview(btn9)
        }else{
            btn13.removeFromSuperview()
            btn13.tag = 2
        }
        if count1.count == 10000{
            count1.count = 0
        }else {}
    }
    @objc func buttonTap9(_ button: UIButton)
    {
        
    }
    @objc func buttonTap10(_ button: UIButton)
    {
        
    }
}
extension logandregViewController{
    func login(){
        print("login")
        if btn13.tag == 1{
        let url5 =  login_url
        let params3 = [
            "phone": self.ttextField.text!,
            "code" : self.ttextField1.text!
            ] as [String : Any]
        Alamofire.request(url5, method: .post, parameters: params3 ).responseJSON{(response) in
            guard response.result.isSuccess else{
                print("not successful")
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                print(json)
                if json["error"] == JSON.null {
                    self.navigationController?.popViewController(animated: true)
                }else {
                    let message = json["error"].rawString()
                    let alert = UIAlertController(title: "抱歉", message: message, preferredStyle: UIAlertController.Style.alert)
                    let OKAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            }
        }
        }else{
            let message = "您还没有同意协议呢！"
            let alert = UIAlertController(title: "抱歉", message: message, preferredStyle: UIAlertController.Style.alert)
            let OKAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
extension logandregViewController{
    func logverify(){
        print("logverify")
        error1()
        let url4 =  logincode_url
        let params3 = [
            "phone": ttextField.text!
            ] as [String : Any]
        Alamofire.request(url4, method: .post, parameters: params3 ).responseJSON{(response) in
            guard response.result.isSuccess else{
                print("not successful")
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                print(json)
                guard json["error"] == JSON.null else {
                    let message = json["error"].rawString()
                    let alert = UIAlertController(title: "抱歉", message: message, preferredStyle: UIAlertController.Style.alert)
                    let OKAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            }
        }
    }
}
extension logandregViewController{
    func register(){
        print("registter")
        if btn13.tag == 1{
        let url3 =  register_url
        let params3 = [
            "phone": ttextField.text!,
            "code" : ttextField1.text!,
            ] as [String : Any]
        Alamofire.request(url3, method: .post, parameters: params3 ).responseJSON{(response) in
            guard response.result.isSuccess else{
                print("not successful")
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                print(json)
                if json["error"] == JSON.null {
                    self.navigationController?.popViewController(animated: true)
                }else {
                    let message = json["error"].rawString()
                    let alert = UIAlertController(title: "抱歉", message: message, preferredStyle: UIAlertController.Style.alert)
                    let OKAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
                    alert.addAction(OKAction)
                    self.present(alert, animated: true, completion: nil)
                    return
                }
            }
        }
        }else{
            let message = "您还没有同意协议呢！"
            let alert = UIAlertController(title: "抱歉", message: message, preferredStyle: UIAlertController.Style.alert)
            let OKAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
        }
    }
}
extension logandregViewController{
    func regverify(){
        print("regverify")
        error1()
        let url = getMix_url
        let url2 = getCode_url
        Alamofire.request(url).responseJSON{(response) in
            guard response.result.isSuccess else{
                print("not successful")
                return
            }
            if let value = response.result.value{
                let json = JSON(value)
                print(json)
                logandregViewController.MIX.mix = json["mix_string"].rawString()!
                print(logandregViewController.MIX.mix)
                let recordTime = UInt64(Date().timeIntervalSince1970 * 1000)
                var string = self.ttextField.text! + logandregViewController.MIX.mix +  String(recordTime)
                print(logandregViewController.MIX.mix)
                print(string)
                string = string.sha1()
                let params2 = [
                               "phone": self.ttextField.text!,
                               "code" : logandregViewController.MIX.mix,
                               "time": recordTime,
                               "signature" : string
                    ] as [String : Any]
                Alamofire.request(url2, method: .post, parameters: params2 ).responseJSON{(response) in
                    guard response.result.isSuccess else{
                        print("not successful2")
                        return
                    }
                    if let value = response.result.value{
                        let json = JSON(value)
                        print(json)
                        guard json["error"] == JSON.null else {
                            let message = json["error"].rawString()
                            let alert = UIAlertController(title: "抱歉", message: message, preferredStyle: UIAlertController.Style.alert)
                            let OKAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
                            alert.addAction(OKAction)
                            self.present(alert, animated: true, completion: nil)
                            return
                        }
                    }
                }
            }
        }
    }
}
extension logandregViewController{
    func error1(){
        guard ttextField.text!.count != 0 else {
            let message = "请输入手机号"
            let alert = UIAlertController(title: "抱歉", message: message, preferredStyle: UIAlertController.Style.alert)
            let OKAction = UIAlertAction(title: "好的", style: UIAlertAction.Style.default, handler: nil)
            alert.addAction(OKAction)
            self.present(alert, animated: true, completion: nil)
            return
        }
    }
}
extension logandregViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension logandregViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

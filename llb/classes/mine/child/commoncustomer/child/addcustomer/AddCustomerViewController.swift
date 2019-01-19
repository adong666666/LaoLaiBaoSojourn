//  Created by adong666666 on 2018/8/7. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class addcustomerViewController: UIViewController,UITextFieldDelegate {
    
    override func viewDidLoad() { allthings() }
    
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(addcustomerViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn2: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 308.fitScreen, y: 40.fitHeight, width: 100.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("确认添加", for: UIControl.State())
        bt1.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt1.addTarget(self, action: #selector(addcustomerViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn3: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 1000.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("", for: UIControl.State())
        bt1.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt1.addTarget(self, action: #selector(addcustomerViewController.buttonTap3(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 35.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "添加入住人"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 90.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 1000.fitHeight)
        return scroll
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:10.fitHeight, width: 414.fitScreen, height: 80.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        return label
    }()
    var llabel3: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: -120.fitScreen, y: 40.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "身份信息（必填）"
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel4: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:170.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    var llabel5: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:250.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        return label
    }()
    var llabel6: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: -155.fitScreen, y: 120.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "真实姓名"
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel7: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: -155.fitScreen, y: 200.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "身份证号"
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel8: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: -128.fitScreen, y: 273.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "手机号（选填）"
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel9: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: -35.fitScreen, y: 307.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "可免费获赠最高保额10万元的住宿旅行意外险"
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size:12)
        label.textColor = UIColor.init(r: 124, g: 124, b: 124)
        label.textAlignment = .center
        return label
    }()
    var llabel10: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:430.fitHeight, width: 414.fitScreen, height: 999.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        return label
    }()
    var llabel11: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: -165.fitScreen, y: 380.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "手机号"
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.font = UIFont (name: "Arial", size:14)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel12: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:0.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    var ttextField: PowertextField = {
        let frame1 = CGRect (x: 207.fitScreen, y: 90.fitHeight, width: 207.fitScreen, height: 80.fitHeight)
        let textField = PowertextField(frame: frame1)
        textField.attributedPlaceholder = NSAttributedString.init(string: "请确保信息属实", attributes:
            [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 15)])
        textField.attributedPlaceholder = NSAttributedString.init(string: "请确保信息属实", attributes:
            [kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.init(r: 124, g: 124, b: 124)])
        textField.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        textField.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 31))
        textField.rightViewMode = .always
        textField.returnKeyType = .done
        return textField
    }()
    var ttextField1: PowertextField = {
        let frame1 = CGRect (x: 207.fitScreen, y: 170.fitHeight, width: 207.fitScreen, height: 80.fitHeight)
        let textField1 = PowertextField(frame: frame1)
        textField1.attributedPlaceholder = NSAttributedString.init(string: "请确保信息属实", attributes:
            [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 15)])
        textField1.attributedPlaceholder = NSAttributedString.init(string: "请确保信息属实", attributes:
            [kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.init(r: 124, g: 124, b: 124)])
        textField1.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        textField1.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 31))
        textField1.keyboardType = UIKeyboardType.numberPad
        textField1.rightViewMode = .always
        textField1.returnKeyType = .done
        return textField1
    }()
    var ttextField2: PowertextField = {
        let frame1 = CGRect (x: 207.fitScreen, y: 350.fitHeight, width: 207.fitScreen, height: 80.fitHeight)
        let textField1 = PowertextField(frame: frame1)
        textField1.attributedPlaceholder = NSAttributedString.init(string: "请确保信息属实", attributes:
            [kCTFontAttributeName as NSAttributedString.Key: UIFont.systemFont(ofSize: 15)])
        textField1.attributedPlaceholder = NSAttributedString.init(string: "请确保信息属实", attributes:
            [kCTForegroundColorAttributeName as NSAttributedString.Key: UIColor.init(r: 124, g: 124, b: 124)])
        textField1.setValue(UIColor.white, forKeyPath: "_placeholderLabel.textColor")
        textField1.rightView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 31))
        textField1.keyboardType = UIKeyboardType.numberPad
        textField1.rightViewMode = .always
        textField1.returnKeyType = .done
        return textField1
    }()
}
extension addcustomerViewController{
    func allthings(){
        super.viewDidLoad()
        delegate()
        addSubview()
    }
}
extension addcustomerViewController{
    func delegate(){
        ttextField.delegate = self
        ttextField1.delegate = self
        ttextField2.delegate = self
    }
}
extension addcustomerViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(sscroll)
        sscroll.addSubview(btn3)
        self.view.addSubview(btn)
        self.view.addSubview(btn2)
        self.view.addSubview(llabel)
        sscroll.addSubview(llabel2)
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
        sscroll.addSubview(ttextField)
        sscroll.addSubview(ttextField1)
        sscroll.addSubview(ttextField2)
    }
}
extension addcustomerViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap3(_ button: UIButton)
    {
        self.view.endEditing(true)
    }
}
extension addcustomerViewController{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
extension addcustomerViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

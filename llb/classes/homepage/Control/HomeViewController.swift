//  Created by adong666666 on 2018/8/12. Copyright © 2018年 adong666666. All rights reserved. import Appz

import UIKit
import Kingfisher
import Alamofire
import MapKit
import CoreLocation
import AVFoundation

public var myCity = String()
public var myCity2 = String()
public var MyLatitude = String()
public var MyLongitude = String()

class shouyeViewController: UIViewController,UIPageViewControllerDelegate{
   
    override func viewDidLoad() { allthings() }
    
    var latitude :Double = 0.0
    var longitude :Double = 0.0
    var myLatitude :Double = 0.0
    var myLongitude :Double = 0.0
    var url = URL(string: "https://www.jd.com")
    var player : ZYPlayer?
    var locationManager :CLLocationManager?
    var mapView :MKMapView!
    var geoC :CLGeocoder?
    var str :String!
    var directions :MKDirections?
    var label = PowerLabel()
    
    fileprivate lazy var myCoverCity: [cover_city] = [cover_city]()
    var headImgArray = [String]()
    fileprivate var headImg : [head_img] = [head_img](){
        didSet{
            for dataArray in headImg {
                self.headImgArray.append(dataArray.slider_url)
            }
            self.cyclescrollview.serverImgArray = self.headImgArray
            self.headImgArray = [String]()
        }
    }
    fileprivate var showListBefore : [show_list_before] = [show_list_before]()
    var showArray = [String]()
    fileprivate var ssshow : [sshow] = [sshow](){
        didSet{
            for dataArray in ssshow{
                self.showArray.append(dataArray.img_url)
            }
            self.cyclescrollview2.serverImgArray = self.showArray
            self.showArray = [String]()
        }
    }
    fileprivate var showListAfter : [show_list_after] = [show_list_after](){
        didSet{
            self.label7.text = "{  " + showListAfter[0].headline + "  }"
            self.label8.text = showListAfter[0].subhead
        }
    }
    fileprivate var vvvideo : [String: Any]?
    var showBeforeAr = [String]()
    var showBeforedesc = [String]()
    fileprivate var BindBase: [BindBaseList] = [BindBaseList](){
        didSet{
            for dataArray in BindBase{
                self.showBeforeAr.append(dataArray.img_url)
                let descString = dataArray.base_city + "     " + dataArray.subhead
                self.showBeforedesc.append(descString)
            }
            self.cyclescrollview3.serverImgArray = self.showBeforeAr
            self.showBeforeAr = [String]()
            self.cyclescrollview3.descTextArray = self.showBeforedesc
            self.showBeforedesc = [String]()
            self.label24.text = BindBase[0].min_price
        }
    }
    var showBeforeArr = [String]()
    var showBeforeDesc = [String]()
    fileprivate var BindBase2: [BindBaseList] = [BindBaseList](){
        didSet{
            for dataArray in BindBase2{
                self.showBeforeArr.append(dataArray.img_url)
                let descString = dataArray.base_city + "     " + dataArray.subhead
                self.showBeforeDesc.append(descString)
            }
            self.cyclescrollview5.serverImgArray = self.showBeforeArr
            self.showBeforeArr = [String]()
            self.cyclescrollview5.descTextArray = self.showBeforeDesc
            self.showBeforeDesc = [String]()
            self.label25.text = BindBase2[0].min_price
        }
    }
    var showAfterArr = [String]()
    var showAfterDesc = [String]()
    fileprivate var BindBase3: [BindBaseList] = [BindBaseList](){
        didSet{
            for dataArray in BindBase3{
                self.showAfterArr.append(dataArray.img_url)
                let descString = dataArray.base_city + "     " + dataArray.subhead
                self.showAfterDesc.append(descString)
            }
            self.cyclescrollview4.serverImgArray = self.showAfterArr
            self.showAfterArr = [String]()
            self.cyclescrollview4.descTextArray = self.showAfterDesc
            self.showAfterDesc = [String]()
            self.label26.text = BindBase3[0].min_price
        }
    }
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 2581.fitHeight)
        return scroll
    }()
    var img1 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "float_background"))
        img.frame = CGRect(x:7.fitScreen, y: 245.fitHeight, width: 400.fitScreen, height: 246.fitHeight)
        return img
    }()
    var img2 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "laolaibao"))
        img.frame = CGRect(x: 57.fitScreen, y: 260.fitHeight, width: 300.fitScreen, height: 32.fitScreen)
        return img
    }()
    var img3 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "背景"))
        img.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 737.fitScreen)
        return img
    }()
    var img4 : UIImageView = {
        let img = UIImageView(image: UIImage(named: ""))
        img.frame = CGRect(x: 50.fitScreen, y: 385.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        return img
    }()
    var img5 : UIImageView = {
        let img = UIImageView()
        img.frame = CGRect(x: 0.fitScreen, y: 2230.fitHeight, width: 414.fitScreen, height: 260.fitHeight)
        return img
    }()
    var label1 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen , y: 530.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "FZHEIL_JW--GB1-0", size: 22)
        label.textColor = UIColor.black
        return label
    }()
    var label2 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 570.fitHeight, width: 414.fitScreen, height: 25.fitHeight)
        label.backgroundColor = UIColor.clear
        label.textAlignment = NSTextAlignment.center
        label.adjustsFontSizeToFitWidth = true
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return label
    }()
    var label3 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen , y: 961.fitHeight, width: 414.fitScreen, height: 25.fitHeight)
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "FZHEIL_JW--GB1-0", size: 22)
        label.textColor = UIColor.black
        return label
    }()
    var label4 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen , y: 1001.fitHeight, width: 414.fitScreen, height: 25.fitHeight)
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return label
    }()
    var label5 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 1388.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.text = "{  最新活动  }"
        label.backgroundColor = UIColor.clear
        label.font = UIFont.init(name: "FZHEIL_JW--GB1-0", size: 22)
        label.textColor = UIColor.black
        return label
    }()
    var label6 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen , y: 1428.fitHeight, width: 414.fitScreen, height: 25.fitHeight)
        label.text = "请到天涯海角来  这里四季常青在"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return label
    }()
    var label7 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 1676.fitHeight, width: 414.fitScreen, height: 40.fitHeight)
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "FZHEIL_JW--GB1-0", size: 22)
        label.textColor = UIColor.black
        return label
    }()
    var label8 : PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.frame = CGRect(x: 0.fitScreen, y: 1716.fitHeight, width: 414.fitScreen, height: 25.fitHeight)
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 12)
        label.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return label
    }()
    var label9 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 330.fitScreen, y: 672.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "最低每晚"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 12)
        return label
    }()
    var label10 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 331.fitScreen, y: 642.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "<"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label12 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 346.fitScreen, y: 642.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "1"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label11 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 366.fitScreen, y: 642.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "2"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label13 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 381.fitScreen, y: 642.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = ">"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label14 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 331.fitScreen, y: 1051.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "<"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label16 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 346.fitScreen, y: 1051.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "1"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label15 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 366.fitScreen, y: 1051.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "2"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label17 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 381.fitScreen, y: 1051.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = ">"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label18 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 331.fitScreen, y: 1762.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "<"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label19 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 346.fitScreen, y: 1762.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "1"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label20 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 366.fitScreen, y: 1762.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "2"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label21 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 381.fitScreen, y: 1762.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = ">"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 6)
        return label
    }()
    var label22 : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 330.fitScreen, y: 1081.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "最低每晚"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 12)
        return label
    }()
    var label23: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 330.fitScreen, y: 1792.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.text = "最低每晚"
        label.backgroundColor = UIColor.clear
        label.font = UIFont(name: "Arial", size: 12)
        return label
    }()
    var label24: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 337.fitScreen, y: 712.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.init(r: 221, g: 83, b: 132)
        label.font = UIFont(name: "Arial", size: 12)
        return label
    }()
    var label25: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 337.fitScreen, y: 1121.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.init(r: 221, g: 83, b: 132)
        label.font = UIFont(name: "Arial", size: 12)
        return label
    }()
    var label26: UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 337.fitScreen, y: 1832.fitHeight, width: 100.fitScreen, height: 20.fitHeight)
        label.backgroundColor = UIColor.clear
        label.textColor = UIColor.init(r: 221, g: 83, b: 132)
        label.font = UIFont(name: "Arial", size: 12)
        return label
    }()
    var btn1 : PowerButton = {
        let frame = CGRect(x: 20.fitScreen, y: 2101.fitHeight, width: 64.fitScreen, height: 64.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("放心入住", for: .normal)
        bt1.setImage(UIImage(named: "放心入住"), for: .normal)
        bt1.setTitleColor(UIColor.init(r: 108, g: 108, b: 108), for: UIControl.State())
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 5, right: 10)
        bt1.titleLabel?.font = UIFont (name: "Arial", size: 10)
        bt1.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var btn2 : PowerButton = {
        let frame = CGRect(x: 124.fitScreen, y: 2101.fitHeight, width: 64.fitScreen, height: 64.fitHeight)
        let bt1 = PowerButton(frame: frame)
        bt1.setTitle  ("爱心客服", for: .normal)
        bt1.setImage(UIImage(named: "爱心客服"), for: .normal)
        bt1.setTitleColor(UIColor.lightGray, for: UIControl.State())
        bt1.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt1.layer.borderColor = UIColor.clear.cgColor
        bt1.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var btn3 : PowerButton = {
        let frame = CGRect(x: 227.fitScreen, y: 2098.fitHeight, width: 80.fitScreen, height: 80.fitHeight)
        let bt2 = PowerButton(frame: frame)
        bt2.setTitle  ("信用认证", for: .normal)
        bt2.setImage(UIImage(named: "信用认证"), for: .normal)
        bt2.setTitleColor(UIColor.lightGray, for: UIControl.State())
        bt2.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt2.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt2
    }()
    var btn4 : PowerButton = {
        let frame = CGRect(x: 331.fitScreen, y: 2106.fitHeight, width: 64.fitScreen, height: 64.fitHeight)
        let bt3 = PowerButton(frame: frame)
        bt3.setTitle ("旅居保险",for: .normal)
        bt3.setImage (UIImage(named: "旅居保险"), for: .normal)
        bt3.setTitleColor(UIColor.lightGray, for: UIControl.State())
        bt3.titleEdgeInsets = UIEdgeInsets(top: 110, left: 10, bottom: 50, right: 10)
        bt3.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt3
    }()
    var btn5 : PowerButton = {
        let bt4 = PowerButton(frame: CGRect(x:220.fitScreen, y: 305.fitHeight, width: 207.fitScreen, height: 25.fitHeight))
        bt4.setTitle ("我的位置",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "#404040", size: 32)
        bt4.addTarget(self, action: #selector(shouyeViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt4
    }()
    var btn6 : PowerButton = {
        let frame5 = CGRect(x: 109.fitScreen, y: 430.fitHeight, width: 207.fitScreen, height: 25.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("查找养老社区", for: .normal)
        bt5.setTitleColor(UIColor.black, for: UIControl.State())
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 22)
        bt5.addTarget(self,action: #selector(shouyeViewController.buttonTap2(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn6a : PowerButton = {
        let frame5 = CGRect(x: 329.fitScreen, y: 435.fitHeight, width: 30.fitScreen, height: 15.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setBackgroundImage(UIImage(named: "云朵右"), for: UIControl.State.normal)
        bt5.addTarget(self,action: #selector(shouyeViewController.buttonTap2(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn6b : PowerButton = {
        let frame5 = CGRect(x: 49.fitScreen, y: 435.fitHeight, width: 30.fitScreen, height: 15.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setBackgroundImage(UIImage(named: "云朵左"), for: UIControl.State.normal)
        bt5.addTarget(self,action: #selector(shouyeViewController.buttonTap2(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
    var btn7 : PatientInfoCustomLabel = {
        let bt6 = PatientInfoCustomLabel()
        let frame6 = CGRect(x: 109.fitScreen, y: 390.fitHeight, width: 207.fitScreen, height: 25.fitHeight)
        bt6.frame = frame6
        bt6.backgroundColor = UIColor.clear
        bt6.font = UIFont(name: "Arial", size: 12)
        return bt6
    }()
    var btn8 : PowerButton = {
        let frame = CGRect(x: -30.fitScreen , y: 305.fitHeight , width: 207.fitScreen, height: 25.fitHeight)
        let bt7 = PowerButton(frame: frame)
        bt7.setTitle (targetCity,for: .normal)
        bt7.setTitleColor(UIColor.black, for: UIControl.State())
        bt7.backgroundColor = UIColor.clear
        bt7.tintColor = UIColor.clear
        bt7.titleLabel?.font = UIFont(name: "Arial", size: 18)
        bt7.addTarget(self, action: #selector(shouyeViewController.buttonTap4(_:)), for: UIControl.Event.touchUpInside)
        return bt7
    }()
    var btn9 : PowerButton = {
        let bt4 = PowerButton(frame: CGRect(x:240.fitScreen, y: 304.fitHeight, width: 25.fitScreen, height: 25.fitHeight))
        bt4.setTitle ("",for: .normal)
        bt4.setBackgroundImage(UIImage(named: "location"), for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "#404040", size: 32)
        bt4.addTarget(self, action: #selector(shouyeViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt4
    }()
    var btn10 : PowerButton = {
        let frame = CGRect(x: 0.fitScreen, y: 2171.fitHeight, width: 104.fitScreen, height: 25.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("放心入住",for: .normal)
        bt4.setTitleColor(UIColor.init(r: 108, g: 108, b: 108), for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt4
    }()
    var btn11 : PowerButton = {
        let frame = CGRect(x: 104.fitScreen, y: 2171.fitHeight, width: 104.fitScreen, height: 25.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("爱心客服",for: .normal)
        bt4.setTitleColor(UIColor.init(r: 108, g: 108, b: 108), for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt4
    }()
    var btn12 : PowerButton = {
        let frame = CGRect(x: 215.fitScreen, y: 2171.fitHeight, width: 104.fitScreen, height: 25.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("信用认证",for: .normal)
        bt4.setTitleColor(UIColor.init(r: 108, g: 108, b: 108), for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt4
    }()
    var btn13 : PowerButton = {
        let frame = CGRect(x: 313.fitScreen, y: 2171.fitHeight, width: 104.fitScreen, height: 25.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("旅居保险",for: .normal)
        bt4.setTitleColor(UIColor.init(r: 108, g: 108, b: 108), for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.titleLabel?.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt4
    }()
    var btn14 : PowerButton = {
        let frame = CGRect(x: 320.fitScreen, y: 630.fitHeight, width: 80.fitScreen, height: 120.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.white
        bt4.alpha = 1
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 16)
        return bt4
    }()
    var btn15 : PowerButton = {
        let frame = CGRect(x: 320.fitScreen, y: 749.fitHeight, width: 80.fitScreen, height: 20.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.alpha = 1
        bt4.setBackgroundImage(UIImage(named: "云朵"), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 16)
        return bt4
    }()
    var btn16 : PowerButton = {
        let frame = CGRect(x: 320.fitScreen, y: 1051.fitHeight, width: 80.fitScreen, height: 120.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.white
        bt4.alpha = 1
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 16)
        return bt4
    }()
    var btn17 : PowerButton = {
        let frame = CGRect(x: 320.fitScreen, y: 1170.fitHeight, width: 80.fitScreen, height: 20.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.alpha = 1
        bt4.setBackgroundImage(UIImage(named: "云朵"), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 16)
        return bt4
    }()
    var btn18 : PowerButton = {
        let frame = CGRect(x: 320.fitScreen, y: 1762.fitHeight, width: 80.fitScreen, height: 120.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.white
        bt4.alpha = 1
        bt4.tintColor = UIColor.clear
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 16)
        return bt4
    }()
    var btn19 : PowerButton = {
        let frame = CGRect(x: 320.fitScreen, y: 1881.fitHeight, width: 80.fitScreen, height: 20.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.alpha = 1
        bt4.setBackgroundImage(UIImage(named: "云朵"), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 16)
        return bt4
    }()
    var btn20 : PowerButton = {
        let frame = CGRect(x: 181.fitScreen, y: 2345.fitHeight, width: 50.fitScreen, height: 50.fitHeight)
        let bt4 = PowerButton(frame: frame)
        bt4.setTitle ("",for: .normal)
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.backgroundColor = UIColor.clear
        bt4.alpha = 1
        bt4.setBackgroundImage(UIImage(named: "center_play_btn"), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 16)
        bt4.addTarget(self, action: #selector(shouyeViewController.buttonTap5(_:)), for: UIControl.Event.touchUpInside)
        return bt4
    }()
    lazy var cyclescrollview: WRCycleScrollView = {
        var cycleScrollView: WRCycleScrollView?
        let frame = CGRect(x: 0.fitScreen, y: 0.fitHeight , width: 414.fitScreen, height: 300.fitHeight)
        var serverImages = ["0"]
        let descs = [""]
        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages)
        cycleScrollView?.backgroundColor = UIColor.white
        cycleScrollView?.isAutoScroll = true
        return cycleScrollView!
    }()
    lazy var cyclescrollview2: WRCycleScrollView = {
        var cycleScrollView:WRCycleScrollView?
        let frame = CGRect(x: 0.fitScreen, y: 1478.fitHeight, width: 414.fitScreen, height: 150.fitHeight)
        var serverImages = ["0"]
        let descs = [""]
        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages)
        cycleScrollView?.isAutoScroll = true
        return cycleScrollView!
    }()
    lazy var cyclescrollview3: WRCycleScrollView = {
        var cycleScrollView:WRCycleScrollView?
        let frame = CGRect(x: 0.fitScreen, y: 630.fitHeight, width: 414.fitScreen, height: 295.fitHeight)
        var serverImages = ["0"]
        let descs = [""]
        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages, descs:descs)
        cycleScrollView?.currentDotColor = UIColor.clear
        cycleScrollView?.otherDotColor = UIColor.clear
        cycleScrollView?.isAutoScroll = false
        cycleScrollView?.descLabelFont = UIFont(name: "Arial", size: 11)
        cycleScrollView?.descLabelTextAlignment = NSTextAlignment.left
        cycleScrollView?.bottomViewBackgroundColor = UIColor.clear
        cycleScrollView?.descLabelHeight = 50
        //cycleScrollView?. = UIEdgeInsets(0, CGFloat(10.fitScreen), 0, CGFloat(10.fitScreen))
        return cycleScrollView!
    }()
    lazy var cyclescrollview4: WRCycleScrollView = {
        var cycleScrollView:WRCycleScrollView?
        let frame = CGRect(x: 0.fitScreen, y: 1762.fitHeight, width: 414.fitScreen, height: 295.fitHeight)
        var serverImages = ["0"]
        let descs = [""]
        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages, descs: descs)
        cycleScrollView?.currentDotColor = UIColor.clear
        cycleScrollView?.otherDotColor = UIColor.clear
        cycleScrollView?.isAutoScroll = false
        cycleScrollView?.descLabelFont = UIFont(name: "Arial", size: 11)
        cycleScrollView?.descLabelTextAlignment = NSTextAlignment.left
        cycleScrollView?.bottomViewBackgroundColor = UIColor.clear
        cycleScrollView?.descLabelHeight = 50
        return cycleScrollView!
    }()
    lazy var cyclescrollview5: WRCycleScrollView = {
        var cycleScrollView:WRCycleScrollView?
        let frame = CGRect(x: 0.fitScreen, y:1051.fitHeight, width: 414.fitScreen, height: 295.fitHeight)
        var serverImages = ["0"]
        let descs = [""]
        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages, descs: descs)
        cycleScrollView?.currentDotColor = UIColor.clear
        cycleScrollView?.otherDotColor = UIColor.clear
        cycleScrollView?.isAutoScroll = false
        cycleScrollView?.descLabelFont = UIFont(name: "Arial", size: 11)
        cycleScrollView?.descLabelTextAlignment = NSTextAlignment.left
        cycleScrollView?.bottomViewBackgroundColor = UIColor.clear
        cycleScrollView?.descLabelHeight = 50
        return cycleScrollView!
    }()
    var wwebview: UIWebView  = {
        let rect = CGRect(x: 0.fitScreen, y: 50.fitHeight, width: 414.fitScreen, height: 687.fitHeight)
        let webView = UIWebView(frame: rect)
        return webView
    }()
    var llabel27: UILabel = {
        let rect2 = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 50.fitHeight)
        let label = PowerLabel(frame: rect2)
        label.alpha = 1
        label.backgroundColor = UIColor.white
        return label
    }()
    var btn21 : PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(shouyeViewController.buttonTap3(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
}
extension shouyeViewController{
    func allthings(){
        super.viewDidLoad()
        usemap()
        addSubview()
        delegate()
        loadData()
    }
}
extension shouyeViewController{
    func delegate(){
        self.cyclescrollview.delegate = self
        self.cyclescrollview2.delegate = self
        self.cyclescrollview3.delegate = self
        self.cyclescrollview4.delegate = self
        self.cyclescrollview5.delegate = self
        self.sscroll.delegate = self
    }
}
extension shouyeViewController{
    func addSubview(){
        self.view.backgroundColor =  UIColor.white
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(img3)
        self.view.addSubview(sscroll)
        sscroll.addSubview(cyclescrollview)
        sscroll.addSubview(cyclescrollview2)
        sscroll.addSubview(cyclescrollview3)
        sscroll.addSubview(cyclescrollview4)
        sscroll.addSubview(cyclescrollview5)
        sscroll.addSubview(img1)
        sscroll.addSubview(img2)
        sscroll.addSubview(img4)
        sscroll.addSubview(btn1)
        sscroll.addSubview(btn2)
        sscroll.addSubview(btn3)
        sscroll.addSubview(btn4)
        sscroll.addSubview(btn5)
        sscroll.addSubview(btn6)
        sscroll.addSubview(btn6a)
        sscroll.addSubview(btn6b)
        sscroll.addSubview(btn7)
        sscroll.addSubview(btn8)
        sscroll.addSubview(btn9)
        sscroll.addSubview(btn10)
        sscroll.addSubview(btn11)
        sscroll.addSubview(btn12)
        sscroll.addSubview(btn13)
        sscroll.addSubview(btn14)
        sscroll.addSubview(btn15)
        sscroll.addSubview(btn16)
        sscroll.addSubview(btn17)
        sscroll.addSubview(btn18)
        sscroll.addSubview(btn19)
        sscroll.addSubview(label1)
        sscroll.addSubview(label2)
        sscroll.addSubview(label3)
        sscroll.addSubview(label4)
        sscroll.addSubview(label5)
        sscroll.addSubview(label6)
        sscroll.addSubview(label7)
        sscroll.addSubview(label8)
        sscroll.addSubview(label9)
        sscroll.addSubview(label10)
        sscroll.addSubview(label11)
        sscroll.addSubview(label12)
        sscroll.addSubview(label13)
        sscroll.addSubview(label14)
        sscroll.addSubview(label15)
        sscroll.addSubview(label16)
        sscroll.addSubview(label17)
        sscroll.addSubview(label18)
        sscroll.addSubview(label19)
        sscroll.addSubview(label20)
        sscroll.addSubview(label21)
        sscroll.addSubview(label22)
        sscroll.addSubview(label23)
        sscroll.addSubview(label24)
        sscroll.addSubview(label25)
        sscroll.addSubview(label26)
        self.label11.textColor = UIColor.init(r: 27, g: 199, b: 141)
        self.label12.textColor = UIColor.black
        self.label15.textColor = UIColor.init(r: 27, g: 199, b: 141)
        self.label16.textColor = UIColor.black
        self.label19.textColor = UIColor.init(r: 27, g: 199, b: 141)
        self.label20.textColor = UIColor.black
    }
}

extension shouyeViewController{
    @objc func buttonTap(_ button: UIButton) {
        targetCity = myCity
        targetCityNO = ""
        if myCoverCity != [cover_city](){
            for item in myCoverCity{
                if item.city_name == targetCity{
                    targetCityNO = item.city_no
                }
            }
        }
        self.btn8.setTitle(targetCity, for: UIControl.State.normal)
    }
    @objc func buttonTap2(_ button: UIButton){
        self.player?.releasePlayer()
        sscroll.addSubview(img5)
        sscroll.addSubview(btn20)
        targetCityNO = ""
        if myCoverCity != [cover_city](){
            for item in myCoverCity{
                if item.city_name == targetCity{
                    targetCityNO = item.city_no
                }
            }
        }
        self.navigationController?.pushViewController(selectcityViewController(), animated: true)
    }
    @objc func buttonTap3(_ button: UIButton){
        wwebview.removeFromSuperview()
        llabel27.removeFromSuperview()
        btn21.removeFromSuperview()
    }
    @objc func buttonTap4(_ button: UIButton)
    {
        self.player?.releasePlayer()
        sscroll.addSubview(img5)
        sscroll.addSubview(btn20)
        self.navigationController?.pushViewController(findplaceViewController(),animated: true)
    }
    @objc func buttonTap5(_ button: UIButton)
    {
        self.player?.startToPlay()
        self.img5.removeFromSuperview()
        self.btn20.removeFromSuperview()
    }
    @objc func click() -> Void {
        
    }
    @objc func leftClick() -> Void {
        
    }
}

extension shouyeViewController{
    fileprivate func loadData(){
        Networktools.requestData(URLString: getCity_url, type: .get){(result : Any) in
            guard let resultDict = result as? [String: Any] else {return}
            if let dataArray = resultDict["cover_city"] as? [[String: NSObject]]{
                for dict in dataArray{
                    self.myCoverCity.append(cover_city(dict: dict))
                }
            }
        }
        Networktools.requestData(URLString: home_url, type: .get){ (result : Any) in
            guard let resultDict = result as? [String: Any] else { return }
            if let dataArray = resultDict["head_img"] as? [[String: NSObject]] {
                for dict in dataArray{
                    self.headImg.append(head_img(dict: dict))
                }
            }
            if let dataArray1 = resultDict["show_list_before"] as? [[String: NSObject]]{
                for dict in dataArray1{
                    self.showListBefore.append(show_list_before(dict: dict))
                }
                self.label1.text = "{  " + self.showListBefore[0].headline + "  }"
                self.label2.text = self.showListBefore[0].subhead
                self.label3.text = "{  " + self.showListBefore[1].headline + "  }"
                self.label4.text = self.showListBefore[1].subhead
                if let dataAr = dataArray1[0]["bind_base_list"] as? [[String: NSObject]]{
                    for dict2 in dataAr{
                        self.BindBase.append(BindBaseList(dict: dict2))
                    }
                }

                if let dataArr = dataArray1[1]["bind_base_list"] as? [[String: NSObject]]{
                    for dict2 in dataArr{
                        self.BindBase2.append(BindBaseList(dict: dict2))
                    }
                }
            }
            if let dataArray2 = resultDict["page_show"] as? [[String: NSObject]] {
                for dict in dataArray2{
                    self.ssshow.append(sshow(dict: dict))
                }
            }
            if let dataArray3 = resultDict["show_list_after"] as? [[String: NSObject]] {
                for dict in dataArray3{
                    self.showListAfter.append(show_list_after(dict: dict))
                }
                if let dataAr = dataArray3[0]["bind_base_list"] as? [[String: NSObject]]{
                    for dict2 in dataAr{
                        self.BindBase3.append(BindBaseList(dict: dict2))
                    }
                }
            }
            if let dataArray4 = resultDict["page_video"] as? [String: Any] {
                self.vvvideo = dataArray4
                self.setplayer()
            }
            }
    }
}
extension shouyeViewController: WRCycleScrollViewDelegate{
    func cycleScrollViewDidSelect(at index: Int, cycleScrollView: WRCycleScrollView) {
        if cycleScrollView == self.cyclescrollview2{
            let locationHref = self.ssshow[index].location_href
            self.url = URL(string: locationHref)
            self.wwebview.loadRequest(URLRequest(url: self.url!))
            self.view.addSubview(self.wwebview)
            self.view.addSubview(self.llabel27)
            self.view.addSubview(self.btn21)
        }else{
            if cycleScrollView == self.cyclescrollview{
                
            }else if cycleScrollView == self.cyclescrollview3{
                BaseNo = BindBase[index].base_no
            }else if cycleScrollView == self.cyclescrollview5{
                BaseNo = BindBase2[index].base_no
            }else if cycleScrollView == self.cyclescrollview4{
                BaseNo = BindBase3[index].base_no
            }
            self.navigationController?.pushViewController(someorderViewController(), animated: true)
        }
    }
}
extension shouyeViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.btn8.setTitle(targetCity, for: UIControl.State.normal)
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        self.player?.releasePlayer()
        sscroll.addSubview(img5)
        sscroll.addSubview(btn20)
    }
}
extension shouyeViewController{
    func usemap(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "规划", style: .plain, target: self, action:#selector(click))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "导航", style: .plain, target: self, action:#selector(leftClick))
        createMap()
        createLocation()
        createGeoC1()
        self.mapView.removeFromSuperview()
    }
}
extension shouyeViewController: UIScrollViewDelegate{
    func  setplayer(){
        let videoUrl = (self.vvvideo ?? ["": ""])["video_url"] as? String
        let imgUrl = (self.vvvideo ?? ["": ""])["img_url"] as? String
        let rect = CGRect(x: 0.fitScreen, y: 2230.fitHeight, width: 414.fitScreen, height: 260.fitHeight)
        self.player = ZYPlayer(nibName: "ZYPlayer", bundle: nil, onView: self.sscroll, orgFrame: rect, url: videoUrl ?? "")
        self.player?.fillMode = .resizeAspectFill
        /*do {
           _ = try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, with: AVAudioSessionCategoryOptions.mixWithOthers)
    _ =  AVAudioSession.sharedInstance(
        ).categoryOptions.contains(AVAudioSession.CategoryOptions.mixWithOthers)
            
        } catch {
            print("音视频设置捕获异常！！！！！！！")
        }*/
        self.sscroll.addSubview((self.player?.view)!)
        self.addChild(self.player!)
        let imgurl = URL(string: imgUrl ?? "")
        self.img5.kf.setImage(with: imgurl)
        self.sscroll.addSubview(self.img5)
        self.sscroll.addSubview(self.btn20)
    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.player?.releasePlayer()
        sscroll.addSubview(img5)
        sscroll.addSubview(btn20)
    }
}
extension shouyeViewController{
    func cycleScrollViewDidScroll(to index: Int, cycleScrollView: WRCycleScrollView) {
        let url = home_url
        Alamofire.request(url).responseJSON{ (response) in
                if let json2 = response.result.value
                {
                    let json = JSON(json2)
                    let llll = json["show_list_before"][0]["bind_base_list"][0]["min_price"].rawString()
                    let mmmm = json["show_list_before"][0]["bind_base_list"][1]["min_price"].rawString()
                    let nnnn = json["show_list_before"][1]["bind_base_list"][0]["min_price"].rawString()
                    let oooo = json["show_list_before"][1]["bind_base_list"][1]["min_price"].rawString()
                    let pppp = json["show_list_after"][0]["bind_base_list"][0]["min_price"].rawString()
                    let qqqq = json["show_list_after"][0]["bind_base_list"][1]["min_price"].rawString()
                    if cycleScrollView == self.cyclescrollview3{
                        BaseNo = self.BindBase[index].base_no
                        if index == 0{
                            self.label24.text = llll
                            self.label11.textColor = UIColor.init(r: 27, g: 199, b: 141)
                            self.label12.textColor = UIColor.black
                        }else{
                            self.label24.text = mmmm
                            self.label11.textColor = UIColor.black
                            self.label12.textColor = UIColor.init(r: 27, g: 199, b: 141)
                        }
                    }else{}
                    if cycleScrollView == self.cyclescrollview4{
                        if index == 0{
                            self.label26.text = pppp
                            self.label19.textColor = UIColor.init(r: 27, g: 199, b: 141)
                            self.label20.textColor = UIColor.black
                        }else{
                            self.label26.text = qqqq
                            self.label19.textColor = UIColor.black
                            self.label20.textColor = UIColor.init(r: 27, g: 199, b: 141)
                        }
                    }else {}
                    if cycleScrollView == self.cyclescrollview5{
                        
                        if index == 0{
                            self.label25.text = nnnn
                            self.label15.textColor = UIColor.init(r: 27, g: 199, b: 141)
                            self.label16.textColor = UIColor.black
                        }else{
                            self.label25.text = oooo
                            self.label15.textColor = UIColor.black
                            self.label16.textColor = UIColor.init(r: 27, g: 199, b: 141)
                        }
                    }else{}
                }
        }
        }
    
}

extension shouyeViewController: MKMapViewDelegate,CLLocationManagerDelegate{
    func createMap() -> Void {
        let frame = CGRect(x: 0.fitScreen, y: 480.fitHeight, width: 414.fitScreen, height: 257)
        mapView = MKMapView.init(frame: frame)
        mapView?.mapType = MKMapType.standard
        mapView?.showsScale = true
        mapView?.showsCompass = true
        mapView?.showsUserLocation = true
        mapView?.delegate = self
        self.view.addSubview(mapView!)
    }
    
    func createLocation() -> Void {
        
        if CLLocationManager.locationServicesEnabled() {
            print("可以定位")
            
            locationManager = CLLocationManager.init()
            locationManager?.delegate = self
            locationManager?.desiredAccuracy = kCLLocationAccuracyBest
            locationManager?.distanceFilter = 50
            if CLLocationManager.authorizationStatus() == .notDetermined {
                locationManager?.requestWhenInUseAuthorization()
            }
            locationManager?.startUpdatingLocation()
        }else{
            
            print("打开定位权限")
        }
    }
    
    
    func createGeoC1() -> Void {
        geoC = CLGeocoder.init()
        test()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("定位成功");
        
        let currLocation = locations.last
        var theCoordinate = CLLocationCoordinate2D()
        
        theCoordinate.latitude = (currLocation?.coordinate.latitude)!;
        print(theCoordinate.latitude)

        theCoordinate.longitude = (currLocation?.coordinate.longitude)!;
        print(theCoordinate.longitude)
        myLatitude  = (currLocation?.coordinate.latitude)!;
        myLongitude = (currLocation?.coordinate.longitude)!;
        MyLatitude = String(myLatitude)
        MyLongitude = String(myLongitude)

        var theSpan = MKCoordinateSpan()
        theSpan.latitudeDelta = 0.01;
        theSpan.longitudeDelta = 0.01;
        
        var theRegion =  MKCoordinateRegion()
        theRegion.center = theCoordinate
        theRegion.span = theSpan
        mapView.region = theRegion
        
        let geocoder = CLGeocoder()
        let location = CLLocation(latitude: theCoordinate.latitude, longitude: theCoordinate.longitude)
        geocoder.reverseGeocodeLocation(location){ (placeMarks:[CLPlacemark]?, error:Error?)
            ->Void in
            guard  let array = placeMarks as NSArray? else { return }
            let mark = array.firstObject as!CLPlacemark
            let city: String = (mark.addressDictionary!as NSDictionary).value(forKey: "City")as! String
            myCity = city
            myCity2 = city
            targetCity = city
            let url =  "https://free-api.heweather.com/s6/weather/"
            let location = city
            self.btn8.setTitle(city, for: .normal)
            let key = "54b1c13df75248dbba847b8f8d574a02"
            let params = ["location":location,
                          "key":key]
            Alamofire.request(url, parameters: params).responseJSON
                { response in
                    if let json2 = response.result.value
                    {
                        let json  = JSON(json2)
                        let aaa = json["HeWeather6"][0]["now"]["cond_txt"].rawString()
                        let bbb = json["HeWeather6"][0]["now"]["wind_dir"].rawString()
                        if aaa != nil && bbb != nil{
                            self.btn7.text = aaa! + "  风向：" + bbb!
                        }else{
                            self.btn7.text = "获取天气信息失败"
                        }
                        switch aaa!{
                        case"晴" : self.img4.image =  UIImage(named: "晴")
                        case"小雨" : self.img4.image = UIImage(named: "小雨")
                        case"中雨" : self.img4.image = UIImage(named: "中雨")
                        case"大雨" : self.img4.image = UIImage(named: "大雨")
                        case"多云" : self.img4.image = UIImage(named: "多云")
                        case"阴" : self.img4.image = UIImage(named: "阴")
                        case"暴雨" : self.img4.image = UIImage(named: "暴雨")
                        case"特大暴雨" : self.img4.image = UIImage(named: "特大暴雨")
                        case"雷阵雨伴有冰雹" : self.img4.image =  UIImage(named: "雷阵雨伴有冰雹")
                        case"小到中雨" : self.img4.image = UIImage(named: "小到中雨")
                        case"大到暴雨" : self.img4.image = UIImage(named: "大到暴雨")
                        case"暴雨到大暴雨" : self.img4.image = UIImage(named: "暴雨到大暴雨")
                        case"大暴雨到特大暴雨" : self.img4.image = UIImage(named: "大暴雨到特大暴雨")
                        case"中到大雨" : self.img4.image = UIImage(named: "中到大雨")
                        case"阵雨" : self.img4.image = UIImage(named: "阵雨")
                        case"雷阵雨" : self.img4.image = UIImage(named: "雷阵雨")
                        case"冻雨" : self.img4.image = UIImage(named: "冻雨")
                        case"中雪" : self.img4.image =  UIImage(named: "中雪")
                        case"小雪" : self.img4.image = UIImage(named: "小雪")
                        case"大雪" : self.img4.image = UIImage(named: "大雪")
                        case"雨夹雪" : self.img4.image = UIImage(named: "雨夹雪")
                        case"小到中雪" : self.img4.image = UIImage(named: "小到中雪")
                        case"中到大雪" : self.img4.image = UIImage(named: "中到大雪")
                        case"暴雪" : self.img4.image = UIImage(named: "暴雪")
                        case"阵雪" : self.img4.image = UIImage(named: "阵雪")
                        case"大到暴雪" : self.img4.image =  UIImage(named: "大到暴雪")
                        case"扬沙" : self.img4.image = UIImage(named: "扬沙")
                        case"浮尘" : self.img4.image = UIImage(named: "浮尘")
                        case"沙尘暴" : self.img4.image = UIImage(named: "沙尘暴")
                        case"强沙尘暴" : self.img4.image = UIImage(named: "强沙尘暴")
                        case"雾" : self.img4.image = UIImage(named: "雾")
                        case"霾" : self.img4.image = UIImage(named: "霾")
                        default: self.img4.image = UIImage(named:"")
                        }
                    }
            }
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print("定位失败!详见：\(error)");
        
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateHeading newHeading: CLHeading) {
        
    }
    
    
    func locationManagerShouldDisplayHeadingCalibration(_ manager: CLLocationManager) -> Bool {
        
        return true
    }

    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        userLocation.title = "现在位置"
        var theCoordinate = CLLocationCoordinate2D()
        theCoordinate.latitude = userLocation.coordinate.latitude;
        theCoordinate.longitude = userLocation.coordinate.longitude;
        mapView.setCenter(theCoordinate, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        
    }
    
    func mapView(_ mapView: MKMapView, regionDidChangeAnimated animated: Bool) {
        
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        if annotation is MKUserLocation  {
            return nil
        }
        let inden = "pappap"
        var pin = mapView.dequeueReusableAnnotationView(withIdentifier: inden)
        if pin == nil {
            pin = MKAnnotationView.init(annotation: annotation, reuseIdentifier: inden)
            pin?.annotation = annotation
        }
        
        pin?.image = UIImage(named: "map")
        let imageView = UIImageView.init(frame: CGRect(x: 0, y: 0, width: 20, height: 25))
        imageView.image = UIImage(named: "map1")
        pin?.detailCalloutAccessoryView = imageView
        return pin
    }
    
    
    func test() -> Void {
        
        geoC?.geocodeAddressString("张江药谷大厦", completionHandler: { (pls: [CLPlacemark]?, error: Error?)  in
            
            if error == nil {
                print("地理编码成功")
                guard pls != nil else {return}
                let firstPL = pls?.first
                self.latitude = (firstPL?.location?.coordinate.latitude)!
                self.longitude = (firstPL?.location?.coordinate.longitude)!
                let location1 = CLLocation.init(latitude: self.latitude, longitude: self.longitude)
                let location2 = CLLocation.init(latitude: self.myLatitude, longitude: self.myLongitude)
                let distance  = location1.distance(from: location2)
                self.str = String(format: "%", arguments: [distance/1000])
                self.addAnnoWithPT(pt: (firstPL?.location?.coordinate)!)
            }else {
                print("错误")
            }
        })
    }
    
    func addAnnoWithPT(pt:CLLocationCoordinate2D) -> Void {
        let objectAnnotation = MKPointAnnotation()
        objectAnnotation.coordinate = CLLocation(latitude: pt.latitude,
                                                 longitude: pt.longitude).coordinate
        objectAnnotation.title = self.str
        objectAnnotation.subtitle = "张江药谷大厦"
        self.mapView.addAnnotation(objectAnnotation)
    }
}


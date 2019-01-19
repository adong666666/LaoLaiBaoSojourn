//  Created by adong666666 on 2018/7/17. Copyright © 2018年 adong666666. All rights reserved.

import UIKit
import CoreLocation
import MapKit
import Alamofire

private let CollectionID = "CollectionID"

class baseViewController: UIViewController, UIActionSheetDelegate{
   
    override func viewDidLoad() { allthings() }
    
    fileprivate lazy var AllPrice: [all_price] = [all_price]()
    fileprivate var RoomSlider = [String](){
        didSet{
            self.cyclescrollview.serverImgArray = RoomSlider
        }
    }
    fileprivate lazy var CanNotOrder = [String]()
    fileprivate lazy var CancelDeal: [cancel_deal] = [cancel_deal]()
    fileprivate var RoomInfo = [String: Any](){
        didSet{
            
        }
    }
    fileprivate var baseInfo: [String: Any]?{
        didSet{
            self.llabel1.setTitle(baseInfo?["base_tag"] as? String, for: UIControl.State.normal)
            self.llabel.attributedText = NSMutableAttributedString.highLightText2(
                (((baseInfo?["base_name"] as? String) ?? "") + "   " + ((RoomInfo["room_price"] as? String) ?? "") ),
                changeFont: ((RoomInfo["room_price"] as? String) ?? ""), changeFont2: "元/晚",
                color: UIColor.black, color2: UIColor.init(r: 252, g: 0, b: 0), color3: UIColor.black,
                font: UIFont(name: "Arial", size: 18)!,
                font2: UIFont(name: "Arial", size: 16)!,
                font3: UIFont(name: "Arial", size: 11)!)
            self.llabel2.text = baseInfo?["base_address"] as? String
            llabel1.bounds.size = CGSize(
                width: Double(((self.baseInfo?["base_tag"] as? String) ?? "").count * 25).fitScreen,
                                   height: 40.fitHeight)
        }
    }
    fileprivate lazy var OtherRoom: [other_room] = [other_room]()
    fileprivate var roomCondition: [RoomCondition] = [RoomCondition]()
    
    var latitude: Double = 0.0
    var longitude: Double = 0.0
    var myLatitude: Double = 0.0
    var myLongitude: Double = 0.0
    var locationManager: CLLocationManager?
    var mapView: MKMapView!
    var geoC: CLGeocoder?
    var str: String!
    var directions: MKDirections?
    
    var rootLayout: TGFlowLayout = {
        let root = TGFlowLayout(.vert ,arrangedCount: 1)
        root.backgroundColor = UIColor.white
        root.tg_width.equal(.fill)
        root.tg_height.equal(.wrap)
        return root
    }()
    var sscroll: UIScrollView = {
        let scroll  = UIScrollView()
        scroll.frame = CGRect(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight)
        return scroll
    }()
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn1: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 300.fitScreen, y: 35.fitHeight, width: 30.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "收藏1"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn2: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 300.fitScreen, y: 35.fitHeight, width: 30.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "收藏2"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn3: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 360.fitScreen, y: 35.fitHeight, width: 30.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "分享黑"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap3(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn4: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.backgroundColor = UIColor.init(r: 253, g: 239, b: 239)
        bt4.setTitle(" ", for: UIControl.State())
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 8
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.lightText.cgColor
        bt4.bounds.size = CGSize(width: 374.fitScreen, height: 40.fitHeight)
        bt4.alpha = 0.5
        bt4.tg_top.equal(20)
        bt4.tg_left.equal(15)
        return bt4
    }()
    var llabel1: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.setTitleColor(UIColor.init(r: 38, g: 202, b: 203), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 14)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 6
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.clear.cgColor
        bt4.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        bt4.tg_left.equal(15)
        bt4.tg_top.equal(15)
        return bt4
    }()
    var llabel: PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.bounds.size = CGSize(width: 400.fitScreen, height: 40.fitHeight)
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.darkText
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        label.tg_left.equal(15)
        label.tg_top.equal(15)
        return label
    }()
    var llabel2: PatientInfoCustomLabel = {
        let label3 = PatientInfoCustomLabel()
        label3.bounds.size =  CGSize(width: 348.fitScreen, height: 40.fitHeight)
        label3.alpha = 0.7
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .left
        label3.font = UIFont (name: "Arial", size: 11)
        label3.textColor = UIColor.black
        label3.tg_left.equal(35)
        label3.tg_top.equal(-15)
        return label3
    }()
    var llabel3: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.bounds.size = CGSize(width: 25.fitScreen, height: 25.fitHeight)
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 15)
        bt4.layer.masksToBounds = true
        bt4.setBackgroundImage(UIImage(named: "定位"), for: UIControl.State.normal)
        bt4.layer.cornerRadius = 6
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.clear.cgColor
        bt4.tg_left.equal(15)
        bt4.tg_top.equal(10)
        return bt4
    }()
    var llabel5: PatientInfoCustomLabel = {
        let label = PatientInfoCustomLabel()
        label.bounds.size = CGSize(width: 374.fitScreen, height: 40.fitHeight)
        label.text = "简欧风格   1卧室1卫1厨  34.8平方"
        label.font = UIFont (name: "Arial", size: 12)
        label.textColor = UIColor.black
        label.textAlignment = .left
        label.tg_top.equal(-22)
        label.tg_left.equal(20)
        return label
    }()
    var slabels: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 5.fitScreen, y:1000.fitHeight, width: 414.fitScreen, height: 35.fitHeight)
        bt1.text = "_______________________________________"
        bt1.textColor = UIColor.init(r: 190, g: 190, b: 190)
        return bt1
    }()
    var slabels2: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 5.fitScreen, y:1630.fitHeight, width: 414.fitScreen, height: 35.fitHeight)
        bt1.text = "_______________________________________"
        bt1.textColor = UIColor.init(r: 190, g: 190, b: 190)
        return bt1
    }()
    var slabelx: PowerLabel = {
        let bt1 = PowerLabel()
        bt1.frame = CGRect(x: 5.fitScreen, y: 1040.fitHeight, width: 100.fitScreen, height: 35.fitHeight)
        bt1.text = "入住须知"
        bt1.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var slabelX: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "●   Xbed全程自助，不设前台，入住流程：打开微信Xbed/APP办理入住-【我的订单】，按提示操作即可获得开门密码哟~\n\n●  入住当天14：00后即可在【我的订单】办理入住手续，请耐心等待房间清洁完成后再进行办理入住；\n\n●   房门密码于进房当日12：00失效，特别情况请致电客服电话18021273533\n\n●   退房离店时，只需在微信Xbed/App【我的订单】点击【办理退房】即可；\n\n●   预订后请确认所有入住人在微信Xbed/App-办理入住-个人中心-发票，按提示填入开票信息即可；\n\n●   目前仅支持接待中国二代身份证的客人；\n\n●   预订后请确认所有入住人在微信Xbed/App完成身份验证，管家会统一查实哦~\n\n●   如需打扫房间，请在【我的订单】里面点击【清洁申请】按钮。将会有清洁管家为您安排打扫；\n\n●   微信Xbed/App点击半流退房之前，请检查您所携带的行李物品是否带齐，以免发生遗漏；\n\n●   入住当天12：00前取消订单，房费全部退还，逾时取消，房费将不予退还。\n\n"
        bt1.alpha = 0.5
        bt1.tg_width ~= .fill
        bt1.tg_height ~= .wrap
        return bt1
    }()
    var slabelxx: PowerLabel = {
        let bt1 = PowerLabel()
        bt1.bounds.size = CGSize(width: 100.fitScreen, height: 35.fitHeight)
        bt1.text = "退款政策"
        bt1.textColor = UIColor.init(r: 108, g: 108, b: 108)
        bt1.tg_left.equal(15)
        return bt1
    }()
    var slabelx1: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 60.fitScreen, y: 40.fitHeight, width: 414.fitScreen, height: 35.fitHeight)
        bt1.text = "如需取消订单，全额退款"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var slabelx2: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 380.fitScreen, y: 40.fitHeight, width: 414.fitScreen, height: 35.fitHeight)
        bt1.text = "如取消订单，退还房费的50%"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var slabelx3: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: -152.fitScreen, y: 136.fitHeight, width: 414.fitScreen, height: 50.fitHeight)
        bt1.text = "预订成功"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .center
        bt1.textColor = UIColor.black
        return bt1
    }()
    var slabelx4: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 180.fitScreen, y: 126.fitHeight, width: 414.fitScreen, height: 50.fitHeight)
        bt1.text = "入住日前1天\n12:00"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .center
        bt1.textColor = UIColor.black
        return bt1
    }()
    var slabels3: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 60.fitScreen, y: 80.fitHeight, width: 414 * 2 .fitScreen, height: 35.fitHeight)
        bt1.text = "----------------------------------------------------------"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var slabels4: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 380.fitScreen, y:80.fitHeight, width: 414 * 2.fitScreen, height: 35.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "----------------------------------------------------------"
        bt1.textColor =  UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var btn12: SmallButton = {
        let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 30.fitScreen, y: 76.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "时间"), for: UIControl.State())
        return bt1
    }()
    var btn13: SmallButton = {
        let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 360.fitScreen, y: 76.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "时间"), for: UIControl.State())
        return bt1
    }()
    var slabelxx2: PowerLabel = {
        let bt1 = PowerLabel()
        bt1.frame = CGRect(x: 5.fitScreen, y: 1900.fitHeight, width: 200.fitScreen, height: 35.fitHeight)
        bt1.text = "本基地其他房源"
        bt1.textColor = UIColor.init(r: 108, g: 108, b: 108)
        return bt1
    }()
    var segmentedcontrol: TwicketSegmentedControl = {
        let titles = ["房间介绍", "位置指引", "住客评价"]
        let frame = CGRect(x: 5.fitScreen, y: 480.fitHeight, width: 404.fitScreen, height: 40.fitHeight)
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(titles)
        segmentedControl.backgroundColor = UIColor.clear
        segmentedControl.defaultTextColor = .gray
        segmentedControl.highlightTextColor = UIColor.init(r: 27, g: 199, b: 141)
        segmentedControl.sliderBackgroundColor = UIColor.white
        segmentedControl.move(to: 0)
        return segmentedControl
    }()
    var rootLayout2: UIScrollView = {
        let scroll = UIScrollView()
        scroll.bounds.size = CGSize(width: 414.fitScreen, height: 180.fitHeight)
        scroll.contentSize = CGSize(width: 828.fitScreen, height: 180.fitHeight)
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    var rootLayout3: UIScrollView = {
        let scroll = UIScrollView()
        scroll.bounds.size = CGSize( width: 414.fitScreen, height: 240.fitHeight)
        scroll.contentSize = CGSize(width: 1656.fitScreen, height: 240.fitHeight)
        scroll.showsHorizontalScrollIndicator = false
        return scroll
    }()
    var btn14: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 16
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        bt4.setBackgroundImage(UIImage(named: "base1"), for: UIControl.State())
        bt4.frame = CGRect (x: 30.fitScreen, y: 30.fitHeight, width: 180.fitScreen, height: 138.fitHeight)
        return bt4
    }()
    var basename: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect (x: 30.fitScreen, y: 190.fitHeight, width: 400.fitScreen, height: 40.fitHeight)
        bt1.text = "高级大床房"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.black
        return bt1
    }()
    var baseprice: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 140.fitScreen, y: 135.fitHeight, width: 200.fitScreen, height: 35.fitHeight)
        let label3 = PatientInfoCustomLabel (frame: frame1)
        label3.text = "￥128"
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .left
        label3.textColor = UIColor.white
        label3.font = UIFont (name: "Arial", size: 16)
        return label3
    }()
    var call: SmallButton = {
        let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 20.fitScreen, y: 676.fitHeight, width: 30.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "电话"), for: UIControl.State())
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap11(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var chat: SmallButton = {
        let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 68.fitScreen, y: 676.fitHeight, width: 35.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "聊天"), for: UIControl.State())
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap12(_:)),for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var call1: SmallButton = {
        let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: -12.fitScreen, y: 666.fitHeight, width: 100.fitScreen, height: 50.fitHeight)
        bt1.setTitle("通话", for: UIControl.State.normal)
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt1.setTitleColor(UIColor.init(r: 108, g: 108, b: 108), for: UIControl.State.normal)
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap11(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var chat1: SmallButton = {
        let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 36.fitScreen, y: 666.fitHeight, width: 100.fitScreen, height: 50.fitHeight)
        bt1.setTitle("聊天", for: UIControl.State.normal)
        bt1.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt1.setTitleColor(UIColor.init(r: 108, g: 108, b: 108), for: UIControl.State.normal)
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap12(_:)),for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var callprompt: SmallButton = {
        let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 10.fitScreen, y: 580.fitHeight, width: 190.fitScreen, height: 80.fitHeight)
        bt1.backgroundColor = UIColor.black
        bt1.layer.cornerRadius = CGFloat(10.fitScreen)
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap7(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var callprompt2: SmallButton = {
       let bt1 = SmallButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 20.fitScreen, y: 640.fitHeight, width: 35.fitScreen, height: 35.fitHeight)
        bt1.backgroundColor = UIColor.black
        bt1.layer.cornerRadius = CGFloat(40.fitScreen)
        return bt1
    }()
    var reserve: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 120.fitScreen, y: 676.fitHeight, width: 280.fitScreen, height: 55.fitHeight)
        bt4.backgroundColor = UIColor.init(r: 68, g: 211, b: 149)
        bt4.setTitle("立即预订", for: UIControl.State())
        bt4.setTitleColor(UIColor.white, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 18)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 4
        bt4.layer.borderWidth = 1
        bt4.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt4.layer.borderColor = UIColor.lightText.cgColor
        bt4.addTarget(self, action: #selector(baseViewController.buttonTap10(_:)), for: UIControl.Event.touchUpInside)
        bt4.titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: CGFloat(-40.fitScreen))
        bt4.alpha = 1
        return bt4
    }()
    var reserve2: PowerButton = {
       let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 206.fitScreen, y: 698.fitHeight, width: 18.fitScreen, height: 15.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "立即预订"), for: UIControl.State.normal)
        return bt1
    }()
    var slabelx7: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 27.fitScreen, y: 596.fitHeight, width: 200.fitScreen, height: 100.fitHeight)
        bt1.text = "免费通话哦！\n\n和社区聊聊你的住宿计划"
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.textColor = UIColor.white
        bt1.font = UIFont (name: "Arial", size: 11)
        return bt1
    }()
    var btn20: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 170.fitScreen, y: 596.fitHeight, width: 15.fitScreen, height: 15.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "叉"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.black, for: UIControl.State())
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap7(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn21: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 5.fitScreen, y: 555.fitHeight, width: 200.fitScreen, height: 50.fitHeight)
        bt4.backgroundColor = UIColor.white
        bt4.setTitle("地图导航", for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 18)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 16
        bt4.layer.borderWidth = 1
        bt4.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt4.layer.borderColor = UIColor.clear.cgColor
        bt4.addTarget(self, action: #selector(baseViewController.buttonTap9(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.6
        return bt4
    }()
    var btn21a: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 25.fitScreen, y: 565.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt4.setBackgroundImage(UIImage(named: "导航"), for: UIControl.State())
        bt4.addTarget(self, action: #selector(baseViewController.buttonTap9(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.6
        return bt4
    }()
    var grayLineLabel: PowerLabel = {
       let label = PowerLabel()
       label.frame = CGRect (x: 25.fitScreen, y: 545.fitHeight, width: 364.fitScreen, height: 1.fitHeight)
       label.backgroundColor = UIColor.init(r: 124, g: 124, b: 124)
       label.alpha = 0.6
       return label
    }()
    var btn22: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 210.fitScreen, y: 555.fitHeight, width: 200.fitScreen, height: 50.fitHeight)
        bt4.backgroundColor = UIColor.white
        bt4.setTitle("寻路指南", for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 18)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 16
        bt4.layer.borderWidth = 1
        bt4.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt4.layer.borderColor = UIColor.clear.cgColor
        bt4.addTarget(self, action: #selector(baseViewController.buttonTap8(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.6
        return bt4
    }()
    var btn22a: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 230.fitScreen, y: 565.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        bt4.backgroundColor = UIColor.white
        bt4.setBackgroundImage(UIImage(named: "寻路指南"), for: UIControl.State())
        bt4.addTarget(self, action: #selector(baseViewController.buttonTap8(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.6
        return bt4
    }()
    var grayLineLabel2: PowerLabel = {
        let label = PowerLabel()
        label.frame = CGRect (x: 25.fitScreen, y: 615.fitHeight, width: 364.fitScreen, height: 1.fitHeight)
        label.backgroundColor = UIColor.init(r: 124, g: 124, b: 124)
        label.alpha = 0.6
        return label
    }()
    var score: PowerLabel = {
        let frame1 = CGRect (x: 10.fitScreen, y: 560.fitHeight, width: 150.fitScreen, height: 40.fitHeight)
        let label3 = PowerLabel (frame: frame1)
        label3.text = "4.9"
        label3.alpha = 0.7
        label3.textColor = UIColor.init(r: 250, g: 207, b: 30)
        label3.font = UIFont (name: "Arial", size: 40)
        return label3
    }()
    var evaluate: PowerLabel = {
        let frame1 = CGRect (x: 10.fitScreen, y: 620.fitHeight, width: 150.fitScreen, height: 40.fitHeight)
        let label3 = PowerLabel (frame: frame1)
        label3.text = "110条评价"
        label3.alpha = 0.7
        label3.textColor = UIColor.init(r: 108, g: 108, b: 108)
        label3.font = UIFont (name: "Arial", size: 15)
        return label3
    }()
    var evaluate1: PowerLabel = {
        let frame1 = CGRect (x: 135.fitScreen, y: 540.fitHeight, width: 160.fitScreen, height: 40.fitHeight)
        let label3 = PowerLabel (frame: frame1)
        label3.text = "设施评分"
        label3.alpha = 0.7
        label3.textColor = UIColor.init(r: 108, g: 108, b: 108)
        label3.font = UIFont (name: "Arial", size: 15)
        return label3
    }()
    var evaluate2: PowerLabel = {
        let frame1 = CGRect (x: 135.fitScreen, y: 580.fitHeight, width: 160.fitScreen, height: 40.fitHeight)
        let label3 = PowerLabel (frame: frame1)
        label3.text = "卫生评分"
        label3.alpha = 0.7
        label3.textColor = UIColor.init(r: 108, g: 108, b: 108)
        label3.font = UIFont (name: "Arial", size: 15)
        return label3
    }()
    var evaluate3: PowerLabel = {
        let frame1 = CGRect (x: 135.fitScreen, y: 620.fitHeight, width: 160.fitScreen, height: 40.fitHeight)
        let label3 = PowerLabel (frame: frame1)
        label3.text = "安全感"
        label3.alpha = 0.7
        label3.textColor = UIColor.init(r: 108, g: 108, b: 108)
        label3.font = UIFont (name: "Arial", size: 15)
        return label3
    }()
    var evaluate4: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 146.fitScreen, y: 535.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 190, g: 190, b: 190)
        bt1.alpha = 1
        return bt1
    }()
    var evaluate5: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 146.fitScreen, y: 540.fitHeight, width: 414.fitScreen, height: 100.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "|\n|\n|\n|\n|\n|\n|\n"
        bt1.textColor = UIColor.init(r: 190, g: 190, b: 190)
        bt1.alpha = 1
        return bt1
    }()
    var evaluate6: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect (x: 270.fitScreen, y: 252.fitHeight, width: 160.fitScreen, height: 40.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "★ ★ ★ ★ ★ 4.9"
        bt1.textColor = UIColor.init(r: 250, g: 207, b: 30)
        bt1.font = UIFont (name: "Arial", size: 10)
        bt1.alpha = 1
        return bt1
    }()
    var evaluate7: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect (x: 270.fitScreen, y: 592.fitHeight, width: 160.fitScreen, height: 40.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "★ ★ ★ ★ ★ 4.9"
        bt1.textColor = UIColor.init(r: 250, g: 207, b: 30)
        bt1.font = UIFont (name: "Arial", size: 10)
        bt1.alpha = 1
        return bt1
    }()
    var evaluate8: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect (x: 270.fitScreen, y: 332.fitHeight, width: 160.fitScreen, height: 40.fitHeight)
        bt1.lineBreakMode = NSLineBreakMode.byWordWrapping
        bt1.numberOfLines = 0
        bt1.textAlignment = .left
        bt1.text = "★ ★ ★ ★ ★ 4.9"
        bt1.textColor = UIColor.init(r: 250, g: 207, b: 30)
        bt1.font = UIFont (name: "Arial", size: 10)
        bt1.alpha = 1
        return bt1
    }()
    var line: PatientInfoCustomLabel = {
        let bt1 = PatientInfoCustomLabel()
        bt1.frame = CGRect(x: 0.fitScreen, y: 700.fitHeight, width: 414.fitScreen, height: 35.fitHeight)
        bt1.text = "_______________________________________"
        bt1.textColor = UIColor.init(r: 190, g: 190, b: 190)
        return bt1
    }()
    var whiteLabel: PowerLabel = {
       let label = PowerLabel()
       label.frame = CGRect(x: 0.fitScreen, y: 666.fitHeight, width: 414.fitScreen, height: 71.fitHeight)
       label.backgroundColor = UIColor.white
       return label
    }()
    lazy var cyclescrollview: WRCycleScrollView = {
        var cycleScrollView: WRCycleScrollView?
        let frame = CGRect(x: 0.fitScreen, y: 0.fitHeight , width: 414.fitScreen, height: 300.fitHeight)
        var serverImages = ["0"]
        let descs = [""]
        cycleScrollView = WRCycleScrollView(frame: frame, type: .SERVER, imgs: serverImages)
        cycleScrollView?.backgroundColor = UIColor.white
        cycleScrollView?.isAutoScroll = true
        cycleScrollView?.backgroundColor = UIColor.clear
        return cycleScrollView!
    }()
    fileprivate lazy var collectionView : UICollectionView = {[unowned self] in
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 64.fitScreen, height: 64.fitHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.sectionInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        let frame = CGRect(x: 0.fitScreen, y: 600.fitHeight, width: 414.fitScreen, height: 400.fitHeight)
        let collectionView = UICollectionView(frame: frame, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.purple
        collectionView.register(facilitiesCollectionViewCell.self, forCellWithReuseIdentifier: CollectionID)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.alwaysBounceVertical = true
        return collectionView
    }()
    lazy var levelArr: Array<Any>? = {
        return []
    }()
    lazy var menu: Menu = {
        var me = Menu.initMenu(size: CGSize(width: 334.fitScreen ,height: 521.fitHeight))
        self.view.addSubview(me)
        return me
    }()
    var grayBackground: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height:  737.fitHeight)
        bt1.backgroundColor = UIColor.init(r: 144, g: 144, b: 144)
        bt1.alpha = 0.4
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap13(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var clearBackground: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height:  737.fitHeight)
        bt1.backgroundColor = UIColor.clear
        bt1.addTarget(self, action: #selector(baseViewController.buttonTap13(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var findRoomLabel: PowerLabel = {
       let label = PowerLabel()
       label.frame = CGRect(x: 40.fitScreen, y: 120.fitHeight, width: 334.fitScreen, height: 60.fitHeight)
       label.text = "寻路指南"
       label.alpha = 0.5
       return label
    }()
    var lineLabel: PowerLabel = {
        let label = PowerLabel()
        label.frame = CGRect(x: 40.fitScreen, y: 180.fitHeight, width: 334.fitScreen, height: 1.fitHeight)
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
}
extension baseViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        delegate()
        loadData()
        usemap1()
    }
}
extension baseViewController{
    func delegate(){
        segmentedcontrol.delegate = self
        collectionView.dataSource = self
        collectionView.delegate = self
    }
}
extension baseViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(sscroll)
        rootLayout.addSubview(cyclescrollview)
        rootLayout.addSubview(llabel1)
        rootLayout.addSubview(llabel)
        rootLayout.addSubview(llabel3)
        rootLayout.addSubview(llabel2)
        rootLayout.addSubview(segmentedcontrol)
        add()
        sscroll.addSubview(rootLayout)
        self.view.addSubview(btn)
        self.view.addSubview(btn2)
        self.view.addSubview(btn3)
        self.view.addSubview(whiteLabel)
        self.view.addSubview(call)
        self.view.addSubview(chat)
        self.view.addSubview(call1)
        self.view.addSubview(chat1)
        self.view.addSubview(reserve)
        self.view.addSubview(reserve2)
        self.view.addSubview(callprompt)
        self.view.addSubview(callprompt2)
        self.view.addSubview(slabelx7)
        self.view.addSubview(btn20)
    }
}
extension baseViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton)
    {
        btn1.frame = self.btn2.frame
        self.view.addSubview(btn1)
    }
    @objc func buttonTap3(_ button: UIButton)
    {
        let textToShare = "聚龙水世界"
        let imageToShare = UIImage(named: "1")
        let urlToShare = URL(string: "http://www.baidu.com")
        let activityItems = [textToShare, imageToShare ?? nil!, urlToShare ?? nil!] as [Any]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        activityVC.excludedActivityTypes = [.print, .copyToPasteboard, .assignToContact, .saveToCameraRoll]
        present(activityVC, animated: true)
        activityVC.completionWithItemsHandler = { activityType, completed, returnedItems, activityError in
            if completed {
                print("completed")
            } else {
                print("cancled")
            }
        }
    }
    @objc func buttonTap7(_ button: UIButton)
    {
        callprompt.removeFromSuperview()
        callprompt2.removeFromSuperview()
        slabelx7.removeFromSuperview()
        btn20.removeFromSuperview()
    }
    @objc func buttonTap8(_ button: UIButton)
    {
        self.view.addSubview(grayBackground)
        let point = CGPoint(x: 40.fitScreen, y: 120.fitHeight)
        self.menu.popupMenu(orginPoint:point, arr: self.levelArr!)
        self.view.addSubview(clearBackground)
        self.view.addSubview(findRoomLabel)
        self.view.addSubview(lineLabel)
    }
    @objc func buttonTap9(_ button: UIButton) {
        let aalert1: UIAlertController = {
            let alert = UIAlertController(title: "本宝为您提供高德与百度地图导航服务", message: "开始您的导航吧", preferredStyle: UIAlertController.Style.actionSheet)
            let gaode: UIAlertAction = {
                let queren = UIAlertAction(title: "使用高德地图", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction) -> Void in print ("使用高德地图")
                })
                return queren
            }()
            let baidu = UIAlertAction(title: "使用百度地图", style: UIAlertAction.Style.default, handler: {(_: UIAlertAction) -> Void in print ("使用百度地图")})
            let cancel = UIAlertAction(title: "取消", style: UIAlertAction.Style.cancel, handler: {(_: UIAlertAction) -> Void in print("取消")})
            alert.addAction(gaode)
            alert.addAction(baidu)
            alert.addAction(cancel)
            return alert
        }()
        self.present(aalert1, animated: true, completion: nil)
    }
    @objc func buttonTap10(_ button: UIButton){
        self.navigationController?.pushViewController(reserveViewController(), animated: true)
    }
    @objc func buttonTap11(_ button: UIButton){
        
    }
    @objc func buttonTap12(_ button: UIButton){
        
    }
    @objc func buttonTap13(_ button: UIButton){
        self.menu.packUpMenu()
        self.grayBackground.removeFromSuperview()
        self.clearBackground.removeFromSuperview()
        self.findRoomLabel.removeFromSuperview()
        self.lineLabel.removeFromSuperview()
    }
    @objc func click() -> Void {
        
    }
    
    @objc func leftClick() -> Void {
        
    }
}
extension baseViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
extension baseViewController{
    func usemap1(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.init(title: "规划", style: .plain, target: self, action:#selector(click))
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(title: "导航", style: .plain, target: self, action:#selector(leftClick))
        createMap()
        createLocation()
        createGeoC1()
        self.mapView.removeFromSuperview()
    }
}
extension baseViewController: TwicketSegmentedControlDelegate{
    func didSelect(_ segmentIndex: Int)
    {
        if segmentIndex == 0
        {
            move2()
            move3()
            add()
        }
        else if segmentIndex == 1
        {
            move1()
            move3()
            rootLayout.addSubview(btn21)
            rootLayout.addSubview(btn21a)
            rootLayout.addSubview(grayLineLabel)
            rootLayout.addSubview(btn22)
            rootLayout.addSubview(btn22a)
            rootLayout.addSubview(grayLineLabel2)
            self.mapView.isHidden = false
            self.directions?.accessibilityElementsHidden = false
            self.mapView.frame = CGRect(x: 0.fitScreen, y: 640.fitHeight, width: 414.fitScreen, height: 300)
            rootLayout.addSubview(self.mapView)
        }
        else if segmentIndex == 2
        {
            move1()
            move2()

            rootLayout.addSubview(score)
            rootLayout.addSubview(evaluate)
            rootLayout.addSubview(evaluate1)
            rootLayout.addSubview(evaluate2)
            rootLayout.addSubview(evaluate3)
            rootLayout.addSubview(evaluate4)
            rootLayout.addSubview(evaluate5)
            rootLayout.addSubview(evaluate6)
            rootLayout.addSubview(evaluate7)
            rootLayout.addSubview(evaluate8)
            rootLayout.addSubview(line)
        }
    }
}
extension baseViewController{
    func move1(){
        btn4.removeFromSuperview()
        slabels.removeFromSuperview()
        slabels2.removeFromSuperview()
        slabelx.removeFromSuperview()
        slabelX.removeFromSuperview()
        slabelxx.removeFromSuperview()
        slabelx1.removeFromSuperview()
        slabelx2.removeFromSuperview()
        slabelx3.removeFromSuperview()
        slabelx4.removeFromSuperview()
        slabels3.removeFromSuperview()
        slabels4.removeFromSuperview()
        btn12.removeFromSuperview()
        btn13.removeFromSuperview()
        slabelxx2.removeFromSuperview()
        rootLayout2.removeFromSuperview()
        rootLayout3.removeFromSuperview()
        btn14.removeFromSuperview()
        basename.removeFromSuperview()
        baseprice.removeFromSuperview()
        llabel5.removeFromSuperview()
        collectionView.removeFromSuperview()
    }
    func move2(){
        btn21.removeFromSuperview()
        btn21a.removeFromSuperview()
        grayLineLabel.removeFromSuperview()
        btn22.removeFromSuperview()
        btn22a.removeFromSuperview()
        grayLineLabel2.removeFromSuperview()
        self.mapView.isHidden = true
        self.directions?.accessibilityElementsHidden = true
        self.mapView.removeFromSuperview()
    }
    func move3(){
        score.removeFromSuperview()
        evaluate.removeFromSuperview()
        evaluate1.removeFromSuperview()
        evaluate2.removeFromSuperview()
        evaluate3.removeFromSuperview()
        evaluate4.removeFromSuperview()
        evaluate5.removeFromSuperview()
        evaluate6.removeFromSuperview()
        evaluate7.removeFromSuperview()
        evaluate8.removeFromSuperview()
        line.removeFromSuperview()
    }
}
extension baseViewController{
    func add(){
        rootLayout.addSubview(btn4)
        rootLayout.addSubview(llabel5)
        rootLayout.addSubview(collectionView)
        rootLayout.addSubview(slabels)
        rootLayout.addSubview(slabelx)
        rootLayout.addSubview(slabelX)
        rootLayout.addSubview(slabels2)
        rootLayout.addSubview(slabelxx)
        rootLayout.addSubview(slabels3)
        rootLayout.addSubview(slabels4)
        rootLayout.addSubview(rootLayout2)
        rootLayout.addSubview(slabelxx2)
        rootLayout.addSubview(rootLayout3)
        
        rootLayout2.addSubview(slabelx1)
        rootLayout2.addSubview(slabelx2)
        rootLayout2.addSubview(slabels3)
        rootLayout2.addSubview(slabels4)
        rootLayout2.addSubview(btn12)
        rootLayout2.addSubview(btn13)
        rootLayout2.addSubview(slabelx3)
        rootLayout2.addSubview(slabelx4)
        
        rootLayout3.addSubview(btn14)
        rootLayout3.addSubview(basename)
        rootLayout3.addSubview(baseprice)
    }
}
extension baseViewController{
    fileprivate func loadData(){
        let parameters = ["room_no": RoomNo]
        Networktools.requestData(URLString: getRoomInformation_url, type: .post, parameters: parameters){(result: Any) in
            guard let resultDict = result as? [String: Any] else { return }
            print(resultDict)
            if let dataArray = resultDict["all_price"] as? [[String: NSObject]]{
                for dict in dataArray{
                    self.AllPrice.append(all_price(dict: dict))
                }
            }
            if let dataArray2 = resultDict["room_slider"] as? [String]{
                self.RoomSlider = dataArray2
            }
            if let dataArray3 = resultDict["room_info"] as? [String: Any]{
                self.RoomInfo = dataArray3
                if let dataArray = dataArray3["room_condition"] as? [[String: NSObject]]{
                    for dict in dataArray{
                        self.roomCondition.append(RoomCondition(dict: dict))
                    }
                }
            }
            if let dataArray4 = resultDict["base_info"] as? [String: Any]{
                self.baseInfo = dataArray4
            }
            if let dataArray5 = resultDict["other_room"] as?[[String: Any]]{
                for dict in dataArray5{
                    self.OtherRoom.append(other_room(dict: dict))
                }
            }
            if let dataArray6 = resultDict["can_not_order"] as? [String]{
                self.CanNotOrder = dataArray6
            }
        }
    }
}
extension baseViewController: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.roomCondition.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionID, for: indexPath) as! facilitiesCollectionViewCell
        cell.backgroundColor = UIColor.clear
        cell.roomCondition = roomCondition[indexPath.row]
        return cell
    }
}
extension baseViewController: MKMapViewDelegate,CLLocationManagerDelegate{
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
        
        var theSpan = MKCoordinateSpan()
        theSpan.latitudeDelta = 0.01;
        theSpan.longitudeDelta = 0.01;
        
        var theRegion =  MKCoordinateRegion()
        theRegion.center = theCoordinate
        theRegion.span = theSpan
        mapView.region = theRegion
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
        objectAnnotation.subtitle = ""
        self.mapView.addAnnotation(objectAnnotation)
    }
}

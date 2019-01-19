//  Created by adong666666 on 2018/8/17. Copyright © 2018年 adong666666. All rights reserved.super
import UIKit
import Alamofire

private let CellID = "CellID"
private let TitleCellID = "TitleCellID"
private let TagCellID = "TagCellID"
private let RecommendCellID = "RecommendCellID"
public var CustomMaxIndexPath: IndexPath = IndexPath(row: 0, section: 0)
public var ScrollArray = [0]
public var InstanceInfoCount: Int? = nil
public var LowLabelText = ""
public var HighLabelText = ""
public var SelectedBtnTag = 2
public var BaseNo = ""
public var InstanceInfoArray = [bbbase_info]()

class selectcityViewController: UIViewController {

    override func viewDidLoad() { allthings() }
    
    fileprivate var TitleInfo: [title_info] = [title_info](){
        didSet{
            self.titleNameTableView.reloadData()
        }
    }
    fileprivate var BBBaseInfo: [bbbase_info] = [bbbase_info](){
        didSet{
            self.tableView.reloadData()
        }
    }
    fileprivate var tagInfo: [TagInfo] = [TagInfo](){
        didSet{
            self.tagNameTableView.reloadData()
        }
    }
    var titleNameArray = [String]()
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn2: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 70.fitScreen, y: 35.fitHeight, width: 35.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "收货地址"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn4: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 40.fitScreen, y: 30.fitHeight, width: 360.fitScreen, height: 45.fitHeight)
        bt4.backgroundColor = UIColor.init(r: 243, g: 244, b: 248)
        bt4.setTitle(" ", for: UIControl.State())
        bt4.setTitleColor(UIColor.white, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 23)
        bt4.addTarget(self, action: #selector(selectcityViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 16
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.clear.cgColor
        bt4.alpha = 0.4
        return bt4
    }()
    var btn5: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 95.fitHeight, width: 104.fitScreen, height: 70.fitHeight)
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap5(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn6: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 104.fitScreen, y: 95.fitHeight, width: 104.fitScreen, height: 70.fitHeight)
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap6(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn7: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 208.fitScreen, y: 95.fitHeight, width: 104.fitScreen, height: 70.fitHeight)
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap7(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn8: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 312.fitScreen, y: 95.fitHeight, width: 104.fitScreen, height: 70.fitHeight)
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap8(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn9: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 170.fitHeight, width: 414.fitScreen, height:  567.fitHeight)
        bt1.backgroundColor = UIColor.init(r: 144, g: 144, b: 144)
        bt1.alpha = 0.2
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap9(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn9a: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 170.fitHeight, width: 414.fitScreen, height:  567.fitHeight)
        bt1.backgroundColor = UIColor.init(r: 144, g: 144, b: 144)
        bt1.alpha = 0.2
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap9a(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn9b: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 170.fitHeight, width: 414.fitScreen, height:  567.fitHeight)
        bt1.backgroundColor = UIColor.init(r: 144, g: 144, b: 144)
        bt1.alpha = 0.2
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap9b(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn10: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 368.5.fitHeight)
        bt1.backgroundColor = UIColor.clear
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap9(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn11: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 10.fitScreen, y: 55.fitHeight, width: 95.fitScreen, height: 40.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("1~2人", for: UIControl.State())
        bt4.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 14)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 8
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        bt4.addTarget(self, action: #selector(selectcityViewController.buttonTap11(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.8
        return bt4
    }()
    var btn12: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 110.fitScreen, y: 55.fitHeight, width: 95.fitScreen, height: 40.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("3~4人", for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 14)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 8
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        bt4.addTarget(self, action: #selector(selectcityViewController.buttonTap12(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.8
        return bt4
    }()
    var btn13: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 210.fitScreen, y: 55.fitHeight, width: 95.fitScreen, height: 40.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("5~7人", for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 14)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 8
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        bt4.addTarget(self, action: #selector(selectcityViewController.buttonTap13(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.8
        return bt4
    }()
    var btn14: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 310.fitScreen, y: 55.fitHeight, width: 95.fitScreen, height: 40.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("8~10人", for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 14)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 8
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        bt4.addTarget(self, action: #selector(selectcityViewController.buttonTap14(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.8
        return bt4
    }()
    var btn15: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 10.fitScreen, y: 105.fitHeight, width: 95.fitScreen, height: 40.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle("10人以上", for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 14)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 8
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        bt4.addTarget(self, action: #selector(selectcityViewController.buttonTap15(_:)), for: UIControl.Event.touchUpInside)
        bt4.alpha = 0.8
        return bt4
    }()
    var btn16: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 124.fitScreen, y: 310.fitHeight, width: 280.fitScreen, height: 50.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("完成", for: UIControl.State())
        bt1.setTitleColor(UIColor.black, for: UIControl.State())
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap16(_:)), for: UIControl.Event.touchUpInside)
        bt1.backgroundColor = UIColor.init(r: 27, g: 199, b: 141)
        return bt1
    }()
    var btn17: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 20.fitScreen, y: 310.fitHeight, width: 90.fitScreen, height: 50.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("重置", for: UIControl.State())
        bt1.setTitleColor(UIColor.black, for: UIControl.State())
        bt1.backgroundColor = UIColor.init(r: 229, g: 229, b: 229)
        bt1.addTarget(self, action: #selector(selectcityViewController.buttonTap17(_:)), for: UIControl.Event.touchUpInside)
        bt1.alpha = 0.5
        return bt1
    }()
    var llabel1: PowerLabel = {
        let frame1 = CGRect(x: 40.fitScreen, y: 30.fitHeight, width: 360.fitScreen, height: 45.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = myCity2
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.black
        return label
    }()
    var llabel11: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:100.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:170.fitHeight, width: 414.fitScreen, height: 567.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 144, g: 144, b: 144)
        return label
    }()
    var llabel13: PowerButton = {
        let frame = CGRect(x: 65.fitScreen, y: 120.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        let label = PowerButton(frame: frame)
        label.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        label.alpha = 0.8
        return label
    }()
    var llabel14: PowerButton = {
        let frame = CGRect(x: 169.fitScreen, y: 120.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        let label = PowerButton(frame: frame)
        label.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        label.alpha = 0.8
        return label
    }()
    var llabel15: PowerButton = {
        let frame = CGRect(x: 278.fitScreen, y: 120.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        let label = PowerButton(frame: frame)
        label.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        label.alpha = 0.8
        return label
    }()
    var llabel16: PowerButton = {
        let frame = CGRect(x: 377.fitScreen, y: 120.fitHeight, width: 30.fitScreen, height: 30.fitHeight)
        let label = PowerButton(frame: frame)
        label.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        label.alpha = 0.8
        return label
    }()
    var llabel17: PatientInfoCustomLabel = {
        let frame = CGRect(x: 10.fitScreen, y: 115.fitHeight, width: 104.fitScreen, height: 35.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame)
        label.text = "住08/17\n退08/18"
        label.textColor = UIColor.init(r: 27, g: 199, b: 141)
        label.font = UIFont(name: "Arial", size: 12)
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel18: PatientInfoCustomLabel = {
        let frame = CGRect(x: 124.fitScreen, y: 125.fitHeight, width: 104.fitScreen, height: 35.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame)
        label.text = "位置"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Arial", size: 12)
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel19: PatientInfoCustomLabel = {
        let frame = CGRect(x: 218.fitScreen, y: 125.fitHeight, width: 104.fitScreen, height: 35.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame)
        label.text = "推荐排序"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Arial", size: 12)
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel20: PatientInfoCustomLabel = {
        let frame = CGRect(x: 332.fitScreen, y: 125.fitHeight, width: 104.fitScreen, height: 35.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame)
        label.text = "筛选"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Arial", size: 12)
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel21: PatientInfoCustomLabel = {
        let frame = CGRect(x: 10.fitScreen, y: 15.fitHeight, width: 104.fitScreen, height: 50.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame)
        label.text = "可住人数"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Arial", size: 17)
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel22: PatientInfoCustomLabel = {
        let frame = CGRect(x: 10.fitScreen, y: 165.fitHeight, width: 104.fitScreen, height: 50.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame)
        label.text = "价格区间"
        label.textColor = UIColor.black
        label.font = UIFont(name: "Arial", size: 17)
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel23: PatientInfoCustomLabel = {
        let frame = CGRect(x: 114.fitScreen, y: 167.fitHeight, width: 104.fitScreen, height: 50.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame)
        label.text = "￥0~不限"
        label.textColor = UIColor.init(r: 27, g: 199, b: 141)
        label.font = UIFont(name: "Arial", size: 15)
        label.alpha = 0.8
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    lazy var levelArr: Array<Any>? = {
        return []
    }()
    lazy var menu: Menu = {
        var me = Menu.initMenu(size: CGSize(width: 414.fitScreen ,height: 368.5.fitHeight))
        self.view.addSubview(me)
        return me
    }()
    var indicatorSlider: AORangeSlider = {
        let iindicatorSlider = AORangeSlider()
        iindicatorSlider.frame = CGRect(x:7.fitScreen, y:400.fitHeight, width: 400.fitScreen, height: 60.fitHeight)
        iindicatorSlider.isUserInteractionEnabled = true
        iindicatorSlider.tintColor = UIColor.init(r: 40, g: 194, b: 192)
        let trackImage = AORangeSlider.getImage(color: UIColor.init(r: 40, g: 194, b: 142), size: CGSize(width: 1, height: 5))
        iindicatorSlider.trackImage = trackImage
        let trackBackgroundImage = AORangeSlider.getImage(color: UIColor.init(r: 40, g: 194, b: 192), size: CGSize(width: 0.4, height: 5))
        iindicatorSlider.trackBackgroundImage = trackBackgroundImage
        return iindicatorSlider
    }()
    lazy var levelArr1: Array<Any>? = {
        return []
    }()
    lazy var menu1: Menu = {
        var me = Menu.initMenu(size: CGSize(width: 414.fitScreen ,height: 270.fitHeight))
        self.view.addSubview(me)
        return me
    }()
    lazy var levelArr2: Array<Any>? = {
        return []
    }()
    lazy var menu2: Menu = {
        var me = Menu.initMenu(size: CGSize(width: 414.fitScreen ,height: 368.5.fitHeight))
        self.view.addSubview(me)
        return me
    }()
    fileprivate lazy var tableView: UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0.fitScreen, y: 170.fitHeight, width: 414.fitScreen, height: 567.fitHeight)
        tableView.register(selectcityTableViewCell.self, forCellReuseIdentifier: CellID)
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
    fileprivate lazy var titleNameTableView: UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0.fitScreen, y: 170.fitHeight, width: 110.fitScreen, height: 368.5.fitHeight)
        tableView.register(titleNameCell.self, forCellReuseIdentifier: TitleCellID)
        tableView.separatorColor = UIColor.clear
        tableView.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        tableView.alpha = 0.3
        return tableView
    }()
    fileprivate lazy var tagNameTableView: UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 90.fitScreen, y: 170.fitHeight, width: 324.fitScreen, height: 368.5.fitHeight)
        tableView.register(tagNameCell.self, forCellReuseIdentifier: TagCellID)
        tableView.separatorColor = UIColor.black
        tableView.backgroundColor = UIColor.clear
        tableView.isScrollEnabled = true
        return tableView
    }()
    fileprivate lazy var recommendTableView: UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: -30.fitScreen, y: 170.fitHeight, width: 456.fitScreen, height: 270.fitHeight)
        tableView.register(recommendTableViewCell.self, forCellReuseIdentifier: RecommendCellID)
        tableView.separatorColor = UIColor.black
        tableView.backgroundColor = UIColor.clear
        tableView.isScrollEnabled = true
        return tableView
    }()
}
extension selectcityViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        delegate()
        setupIndicatorSlider()
    }
}
extension selectcityViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(llabel2)
        self.view.addSubview(btn)
        self.view.addSubview(btn2)
        self.view.addSubview(btn4)
        self.view.addSubview(llabel1)
        self.view.addSubview(llabel11)
        self.view.addSubview(btn5)
        self.view.addSubview(btn6)
        self.view.addSubview(btn7)
        self.view.addSubview(btn8)
        self.view.addSubview(llabel13)
        self.view.addSubview(llabel14)
        self.view.addSubview(llabel15)
        self.view.addSubview(llabel16)
        self.view.addSubview(llabel17)
        self.view.addSubview(llabel18)
        self.view.addSubview(llabel19)
        self.view.addSubview(llabel20)
        self.view.addSubview(tableView)
    }
}
extension selectcityViewController{
    func delegate(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.titleNameTableView.delegate = self
        self.titleNameTableView.dataSource = self
        self.tagNameTableView.delegate = self
        self.tagNameTableView.dataSource = self
        self.recommendTableView.delegate = self
        self.recommendTableView.dataSource = self
    }
}
extension selectcityViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton)
    {
        self.navigationController?.pushViewController(findplaceViewController(),animated: true)
    }
    @objc func buttonTap4(_ button: UIButton)
    {
        
    }
    @objc func buttonTap5(_ button: UIButton)
    {
        
    }
    @objc func buttonTap6(_ button: UIButton)
    {
        self.view.addSubview(btn9b)
        if self.menu2.isShow! == false {
            llabel14.setBackgroundImage(UIImage(named: "上"), for: UIControl.State.normal)
            llabel18.textColor = UIColor.init(r: 27, g: 199, b: 141)
            let point = CGPoint(x: 0.fitScreen, y: 170.fitHeight)
            self.menu2.popupMenu(orginPoint:point, arr: self.levelArr2!)
            //self.menu2.didSelectIndex = { [weak self] (index:Int) in
               // print( "选中--  \(index) -行 -- \(String(describing: self?.levelArr?[index]))")
           // }
            self.menu1.packUpMenu()
            llabel15.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
            llabel19.textColor = UIColor.black
            move()
            self.view.addSubview(tagNameTableView)
            self.view.addSubview(titleNameTableView)
            recommendTableView.removeFromSuperview()
        }else{
            self.menu2.packUpMenu()
            llabel14.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
            llabel18.textColor = UIColor.black
            btn9.removeFromSuperview()
            btn9a.removeFromSuperview()
            btn9b.removeFromSuperview()
            titleNameTableView.removeFromSuperview()
            tagNameTableView.removeFromSuperview()
        }
    }
    @objc func buttonTap7(_ button: UIButton)
    {
        self.view.addSubview(btn9a)
        if self.menu1.isShow! == false {
            llabel15.setBackgroundImage(UIImage(named: "上"), for: UIControl.State.normal)
            llabel19.textColor = UIColor.init(r: 27, g: 199, b: 141)
            let point = CGPoint(x: 0.fitScreen, y: 170.fitHeight)
            self.menu1.popupMenu(orginPoint: point, arr: self.levelArr1!)
            self.menu2.packUpMenu()
            llabel14.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
            llabel18.textColor = UIColor.black
            titleNameTableView.removeFromSuperview()
            tagNameTableView.removeFromSuperview()
            move()
            self.view.addSubview(recommendTableView)
        }else{
            move3()
        }
    }
    @objc func buttonTap8(_ button: UIButton)
    {
        self.view.addSubview(btn9)
        if self.menu.isShow! == false {
            llabel16.setBackgroundImage(UIImage(named: "上"), for: UIControl.State.normal)
            llabel20.textColor = UIColor.init(r: 27, g: 199, b: 141)
            let point = CGPoint(x: 0.fitScreen, y: 170.fitHeight)
            self.menu.popupMenu(orginPoint:point, arr: self.levelArr!)
            self.menu.addSubview(btn10)
            menu.addSubview(llabel21)
            menu.addSubview(btn11)
            menu.addSubview(btn12)
            menu.addSubview(btn13)
            menu.addSubview(btn14)
            menu.addSubview(btn15)
            menu.addSubview(llabel22)
            menu.addSubview(llabel23)
            self.view.addSubview(indicatorSlider)
            menu.addSubview(btn16)
            menu.addSubview(btn17)
            self.menu1.packUpMenu()
            llabel15.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
            llabel19.textColor = UIColor.black
            self.menu2.packUpMenu()
            titleNameTableView.removeFromSuperview()
            tagNameTableView.removeFromSuperview()
            recommendTableView.removeFromSuperview()
            llabel14.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
            llabel18.textColor = UIColor.black
        }else{
        move()
        self.indicatorSlider.removeFromSuperview()
        self.btn9.removeFromSuperview()
        self.btn9a.removeFromSuperview()
        self.btn9b.removeFromSuperview()
        }
    }
    @objc func buttonTap9(_ button: UIButton)
    {
        move()
        self.btn9a.removeFromSuperview()
        self.btn9b.removeFromSuperview()
        recommendTableView.removeFromSuperview()
    }
    @objc func buttonTap9a(_ button: UIButton)
    {
        self.menu1.packUpMenu()
        self.btn9a.removeFromSuperview()
        self.btn9b.removeFromSuperview()
        llabel15.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        llabel19.textColor = UIColor.black
        recommendTableView.removeFromSuperview()
    }
    @objc func buttonTap9b(_ button: UIButton)
    {
        move2()
        recommendTableView.removeFromSuperview()
    }
    @objc func buttonTap11(_ button: UIButton)
    {
        SelectedBtnTag = 2
        self.btn11.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State.normal)
        self.btn12.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn13.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn14.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn15.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    @objc func buttonTap12(_ button: UIButton)
    {
        SelectedBtnTag = 4
        self.btn11.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn12.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State.normal)
        self.btn13.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn14.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn15.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    @objc func buttonTap13(_ button: UIButton)
    {
        SelectedBtnTag = 7
        self.btn11.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn12.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn13.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State.normal)
        self.btn14.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn15.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    @objc func buttonTap14(_ button: UIButton)
    {
        SelectedBtnTag = 10
        self.btn11.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn12.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn13.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn14.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State.normal)
        self.btn15.setTitleColor(UIColor.black, for: UIControl.State.normal)
    }
    @objc func buttonTap15(_ button: UIButton)
    {
        SelectedBtnTag = 12
        self.btn11.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn12.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn13.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn14.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn15.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State.normal)
    }
    @objc func buttonTap16(_ button: UIButton)
    {
        move()
        recommendTableView.removeFromSuperview()
        self.btn9.removeFromSuperview()
        self.btn9a.removeFromSuperview()
        self.btn9b.removeFromSuperview()
        guard self.BBBaseInfo.count != 0 else { return }
        var instanceArray = [bbbase_info]()
        if SelectedBtnTag == 2{
            for item in self.BBBaseInfo{
                let maxInPeople = Int(item.max_in_people) ?? 0
                guard maxInPeople > 0 else { return }
                if maxInPeople >= 1 && maxInPeople <= 2 {
                    instanceArray.append(item)
                }
            }
        }else if SelectedBtnTag == 4{
            for item in self.BBBaseInfo{
                let maxInPeople = Int(item.max_in_people) ?? 0
                guard maxInPeople > 0 else { return }
                if maxInPeople >= 3 && maxInPeople <= 4 {
                    instanceArray.append(item)
                }
            }
        }else if SelectedBtnTag == 7{
            for item in self.BBBaseInfo{
                let maxInPeople = Int(item.max_in_people) ?? 0
                guard maxInPeople > 0 else { return }
                if maxInPeople >= 5 && maxInPeople <= 7 {
                    instanceArray.append(item)
                }
            }
        }else if SelectedBtnTag == 10{
            for item in self.BBBaseInfo{
                let maxInPeople = Int(item.max_in_people) ?? 0
                guard maxInPeople > 0 else { return }
                if maxInPeople >= 8 && maxInPeople <= 10 {
                    instanceArray.append(item)
                }
            }
        }else if SelectedBtnTag == 12{
            for item in self.BBBaseInfo{
                let maxInPeople = Int(item.max_in_people) ?? 0
                guard maxInPeople > 0 else { return }
                if maxInPeople > 10 {
                    instanceArray.append(item)
                }
            }
        }
        let minPrice = Int(LowLabelText) ?? 0
        let maxPrice = Int(HighLabelText) ?? 99999
        guard instanceArray != [bbbase_info]() else {
            InstanceInfoCount = 0
            self.tableView.reloadData()
            return
        }
        InstanceInfoArray = [bbbase_info]()
        for item in instanceArray{
            let basePrice = Double(item.base_price) ?? 0
            if basePrice >= Double(minPrice) && basePrice <= Double(maxPrice){
                InstanceInfoArray.append(item)
            }
        }
        InstanceInfoCount = InstanceInfoArray.count
        self.tableView.reloadData()
        if InstanceInfoArray.count != 0{
            for item in 0..<InstanceInfoArray.count{
                let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: IndexPath(row: item, section: 0))
                (cell as? selectcityTableViewCell)?.BBBaseInfo = InstanceInfoArray[item]
            }
        }
        self.tableView.reloadData()
        
    }
    @objc func buttonTap17(_ button: UIButton)
    {
        SelectedBtnTag = 2
        self.btn11.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State.normal)
        self.btn12.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn13.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn14.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.btn15.setTitleColor(UIColor.black, for: UIControl.State.normal)
        self.indicatorSlider.minimumValue = 0
        self.indicatorSlider.maximumValue = 8
        self.indicatorSlider.lowValue = 0
        self.indicatorSlider.highValue = 8
    }
}
extension selectcityViewController{
    func move(){
        llabel16.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        llabel20.textColor = UIColor.black
        self.menu.packUpMenu()
        self.btn9.removeFromSuperview()
        llabel21.removeFromSuperview()
        btn11.removeFromSuperview()
        btn12.removeFromSuperview()
        btn13.removeFromSuperview()
        btn14.removeFromSuperview()
        btn15.removeFromSuperview()
        llabel22.removeFromSuperview()
        llabel23.removeFromSuperview()
        self.indicatorSlider.removeFromSuperview()
        btn16.removeFromSuperview()
        btn17.removeFromSuperview()
    }
    func move2(){
        self.menu2.packUpMenu()
        self.btn9a.removeFromSuperview()
        self.btn9b.removeFromSuperview()
        titleNameTableView.removeFromSuperview()
        tagNameTableView.removeFromSuperview()
        llabel14.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        llabel18.textColor = UIColor.black
    }
    func move3(){
        self.menu1.packUpMenu()
        llabel15.setBackgroundImage(UIImage(named: "下"), for: UIControl.State.normal)
        llabel19.textColor = UIColor.black
        btn9.removeFromSuperview()
        btn9a.removeFromSuperview()
        btn9b.removeFromSuperview()
        recommendTableView.removeFromSuperview()
    }
}
extension selectcityViewController{
    func setupIndicatorSlider() {
        
        let contentView = indicatorSlider//.superview!
        
        indicatorSlider.minimumValue = 0
        indicatorSlider.maximumValue = 8
        indicatorSlider.lowValue = 0
        indicatorSlider.highValue = 8
        indicatorSlider.minimumDistance = 1
        
        let lowLabel = UILabel()
        contentView.addSubview(lowLabel)
        lowLabel.textAlignment = .center
        lowLabel.frame = CGRect(x:0.fitScreen, y:0.fitHeight, width: 80.fitScreen, height: 20.fitHeight)
        lowLabel.font = UIFont(name: "Arial" ,size: 15)
        
        let highLabel = UILabel()
        contentView.addSubview(highLabel)
        highLabel.textAlignment = .center
        highLabel.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 80.fitScreen, height: 20.fitHeight)
        highLabel.font = UIFont(name: "Arial" ,size: 14)
        
        indicatorSlider.valuesChangedHandler = { [weak self] in
            guard let `self` = self else {
                return
            }
            let lowCenterInSlider = CGPoint(x:self.indicatorSlider.lowCenter.x, y: self.indicatorSlider.lowCenter.y - 30)
            let highCenterInSlider = CGPoint(x:self.indicatorSlider.highCenter.x, y: self.indicatorSlider.highCenter.y - 30)
            let lowCenterInView = self.indicatorSlider.convert(lowCenterInSlider, to: contentView)
            let highCenterInView = self.indicatorSlider.convert(highCenterInSlider, to: contentView)
            
            lowLabel.center = lowCenterInView
            highLabel.center = highCenterInView
            lowLabel.text = String(format: "￥%.f00", self.indicatorSlider.lowValue)
            highLabel.text = String(format: "￥%.f00", self.indicatorSlider.highValue)
            LowLabelText = String(format: "%.f00", self.indicatorSlider.lowValue)
            HighLabelText = String(format: "%.f00", self.indicatorSlider.highValue)
            if lowLabel.text == "￥000"{
                lowLabel.text = "￥0"
            }
            if highLabel.text == "￥800"{
                highLabel.text = "不限"
            }
            if LowLabelText == "000"{
                LowLabelText = "0"
            }
            if HighLabelText == "800"{
                HighLabelText = "99999"
            }
        }
    }
}
extension selectcityViewController{
    fileprivate func loadData(){
        let parameters =  ["longitude": MyLongitude,
                            "latitude": MyLatitude,
                            "city_no": targetCityNO]
        Networktools.requestData(URLString: getResult_url, type: .post, parameters: parameters){(result: Any) in
            guard let resultDict = result as? [String: Any] else { return }
            if let dataArray = resultDict["title_info"] as? [[String: NSObject]]{
                for dict in dataArray {
                    self.TitleInfo.append(title_info(dict: dict))
                    if let tagNameArr = dict["tag_info"] as? [[String: NSObject]]{
                        for dict2 in tagNameArr{
                            self.tagInfo.append(TagInfo(dict: dict2))
                        }
                        let tagInfoCount = self.tagInfo.count
                        ScrollArray.append(tagInfoCount)
                    }
                }
            }
            if let dataArray2 = resultDict["base_info"] as? [[String: NSObject]]{
                for dict in dataArray2 {
                    self.BBBaseInfo.append(bbbase_info(dict: dict))
                }
                InstanceInfoArray = self.BBBaseInfo
            }
        }
    }
}
extension selectcityViewController {
    internal override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
        self.BBBaseInfo = [bbbase_info]()
        self.TitleInfo = [title_info]()
        self.tagInfo = [TagInfo]()
        ScrollArray = [0]
        loadData()
        if targetCity != ""{
            llabel1.text = targetCity
        }else{
            llabel1.text = myCity
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
        InstanceInfoCount = nil
    }
    override func viewDidDisappear(_ animated: Bool) {
        self.llabel19.text = "推荐排序"
    }
}
extension selectcityViewController: UITableViewDelegate, UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var tempcount: Int = 0
        if tableView == self.tableView{
            if InstanceInfoCount == nil{
                tempcount = self.BBBaseInfo.count
            }else{
                tempcount = InstanceInfoCount ?? 0
            }
        }else if tableView == self.titleNameTableView{
            tempcount = self.TitleInfo.count
        }else if tableView == self.tagNameTableView{
            tempcount = self.tagInfo.count
        }else if tableView == self.recommendTableView{
            tempcount = 5
        }
        return tempcount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if tableView == self.tableView{
            cell = selectcityTableViewCell()
            cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! selectcityTableViewCell
            cell.awakeFromNib()
            //let rowNum = (indexPath as NSIndexPath).row
            cell.backgroundColor = UIColor.clear
            cell.alpha = 0.1
            if InstanceInfoCount == nil{
                (cell as? selectcityTableViewCell)?.BBBaseInfo = BBBaseInfo[indexPath.row]
            }
        }else if tableView == self.titleNameTableView{
            cell = titleNameCell()
            cell = tableView.dequeueReusableCell(withIdentifier: TitleCellID, for: indexPath) as! titleNameCell
            cell.awakeFromNib()
            cell.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
            (cell as? titleNameCell)?.TitleInfo = TitleInfo[indexPath.row]
        }else if tableView == self.tagNameTableView{
            cell = tagNameCell()
            cell = tableView.dequeueReusableCell(withIdentifier: TagCellID, for: indexPath) as! tagNameCell
            cell.awakeFromNib()
            cell.backgroundColor = UIColor.clear
            (cell as? tagNameCell)?.tagInfo = tagInfo[indexPath.row]
        }else if tableView == self.recommendTableView{
            let recommendArray = ["推荐排序","默认排序","价格排序","距离排序","好评排序"]
            cell = recommendTableViewCell()
            cell = tableView.dequeueReusableCell(withIdentifier: RecommendCellID, for: indexPath) as! recommendTableViewCell
            cell.awakeFromNib()
            cell.backgroundColor = UIColor.clear
            (cell as? recommendTableViewCell)?.recommendName.text = recommendArray[indexPath.row]
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt  indexPath: IndexPath) -> CGFloat {
        var height: CGFloat = 0
        if tableView == self.tableView{
            height = CGFloat(415.fitHeight)
        }else if tableView == self.titleNameTableView{
            height = CGFloat(52.fitHeight)
        }else if tableView == self.tagNameTableView{
            height = CGFloat(45.fitHeight)
        }else{
            height = CGFloat(52.fitHeight)
        }
        return height
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        if tableView == self.tableView{
            if InstanceInfoArray != [bbbase_info](){
                BaseNo = InstanceInfoArray[indexPath.row].base_no
            }
            self.navigationController?.pushViewController(someorderViewController(),animated: true)
        }else if tableView == self.titleNameTableView{
            
            if CustomMaxIndexPath < indexPath{
                CustomMaxIndexPath = indexPath
            }
            let indPath = IndexPath(row: 0, section: 0)
            let minindex = 0
            let maxindex = CustomMaxIndexPath.row
            if CustomMaxIndexPath != indPath {
                for index in minindex...maxindex{
                    self.titleNameTableView.cellForRow(at: IndexPath(row: index, section: 0))?.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
                    let eachcell = self.titleNameTableView.cellForRow(at: IndexPath(row: index, section: 0)) as? titleNameCell
                    eachcell?.titleName.textColor = UIColor.black
                }
            }
            self.titleNameTableView.cellForRow(at: indexPath)?.backgroundColor = UIColor.white
            let selectedcell = self.titleNameTableView.cellForRow(at: indexPath) as? titleNameCell
            selectedcell?.titleName.textColor = UIColor.init(r: 27, g: 199, b: 141)
            let scrollIndexPath = IndexPath(row: ScrollArray[indexPath.row], section: 0)
            self.tagNameTableView.scrollToRow(at: scrollIndexPath, at: UITableView.ScrollPosition.middle, animated: true)
            
        }else if tableView == self.tagNameTableView{
            
            let selectCell = self.tagNameTableView.cellForRow(at: indexPath) as? tagNameCell
            let selectTagID = String(selectCell?.tagName.tag ?? 0)
            InstanceInfoArray = [bbbase_info]()
            for item in self.BBBaseInfo{
                let fitBaseTag = item.base_tag
                for item2 in fitBaseTag{
                    if selectTagID == item2{
                        InstanceInfoArray.append(item)
                    }
                }
            }
            InstanceInfoCount = InstanceInfoArray.count
            self.tableView.reloadData()
            if InstanceInfoArray.count != 0{
            for item in 0..<InstanceInfoArray.count{
                let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: IndexPath(row: item, section: 0))
                (cell as? selectcityTableViewCell)?.BBBaseInfo = InstanceInfoArray[item]
            }
            }
            self.tableView.reloadData()
            move2()
            
        }else if tableView == self.recommendTableView{
    
            guard self.BBBaseInfo.count != 0 else {
                move3()
                return
            }
            if indexPath == IndexPath(row: 2, section: 0){
                
                self.llabel19.text = "价格排序"
                InstanceInfoArray = [bbbase_info]()
                for item in self.BBBaseInfo{
                    InstanceInfoArray.append(item)
                }
                var min = 0
                for item2 in 0..<InstanceInfoArray.count-1{
                    min = item2
                    for item3 in item2+1...InstanceInfoArray.count-1{
                        if InstanceInfoArray[item3].base_price < InstanceInfoArray[min].base_price{
                            min = item3
                        }
                    }
                    if min != item2{
                        InstanceInfoArray.swap(i: min, j: item2)
                    }
                }
                InstanceInfoCount = InstanceInfoArray.count
                self.tableView.reloadData()
                if InstanceInfoArray.count != 0{
                    for item in 0..<InstanceInfoArray.count{
                        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: IndexPath(row: item, section: 0))
                        (cell as? selectcityTableViewCell)?.BBBaseInfo = InstanceInfoArray[item]
                    }
                }
                self.tableView.reloadData()
                move3()
            }else if indexPath == IndexPath(row: 0, section: 0){
                
                self.llabel19.text = "推荐排序"
                InstanceInfoArray = [bbbase_info]()
                for item in self.BBBaseInfo{
                    InstanceInfoArray.append(item)
                }
                var min = 0
                for item2 in 0..<InstanceInfoArray.count-1{
                    min = item2
                    for item3 in item2+1...InstanceInfoArray.count-1{
                        if InstanceInfoArray[item3].popular_value < InstanceInfoArray[min].popular_value{
                            min = item3
                        }
                    }
                    if min != item2{
                        InstanceInfoArray.swap(i: min, j: item2)
                    }
                }
                InstanceInfoCount = InstanceInfoArray.count
                self.tableView.reloadData()
                if InstanceInfoArray.count != 0{
                    for item in 0..<InstanceInfoArray.count{
                        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: IndexPath(row: item, section: 0))
                        (cell as? selectcityTableViewCell)?.BBBaseInfo = InstanceInfoArray[item]
                    }
                }
                self.tableView.reloadData()
                move3()
                
            }else if indexPath == IndexPath(row: 3, section: 0){
                
                self.llabel19.text = "距离排序"
                InstanceInfoArray = [bbbase_info]()
                for item in self.BBBaseInfo{
                    InstanceInfoArray.append(item)
                }
                var min = 0
                for item2 in 0..<InstanceInfoArray.count-1{
                    min = item2
                    for item3 in item2+1...InstanceInfoArray.count-1{
                        if InstanceInfoArray[item3].distance < InstanceInfoArray[min].distance{
                            min = item3
                        }
                    }
                    if min != item2{
                        InstanceInfoArray.swap(i: min, j: item2)
                    }
                }
                InstanceInfoCount = InstanceInfoArray.count
                self.tableView.reloadData()
                if InstanceInfoArray.count != 0{
                    for item in 0..<InstanceInfoArray.count{
                        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: IndexPath(row: item, section: 0))
                        (cell as? selectcityTableViewCell)?.BBBaseInfo = InstanceInfoArray[item]
                    }
                }
                self.tableView.reloadData()
                move3()
                
            }else if indexPath == IndexPath(row: 4, section: 0){
                
                self.llabel19.text = "好评排序"
                InstanceInfoArray = [bbbase_info]()
                for item in self.BBBaseInfo{
                    InstanceInfoArray.append(item)
                }
                var min = 0
                for item2 in 0..<InstanceInfoArray.count-1{
                    min = item2
                    for item3 in item2+1...InstanceInfoArray.count-1{
                        if InstanceInfoArray[item3].well_value < InstanceInfoArray[min].well_value{
                            min = item3
                        }
                    }
                    if min != item2{
                        InstanceInfoArray.swap(i: min, j: item2)
                    }
                }
                InstanceInfoCount = InstanceInfoArray.count
                self.tableView.reloadData()
                if InstanceInfoArray.count != 0{
                    for item in 0..<InstanceInfoArray.count{
                        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: IndexPath(row: item, section: 0))
                        (cell as? selectcityTableViewCell)?.BBBaseInfo = InstanceInfoArray[item]
                    }
                }
                self.tableView.reloadData()
                move3()
            }else if indexPath == IndexPath(row: 1, section: 0){
                self.llabel19.text = "默认排序"
                InstanceInfoCount = self.BBBaseInfo.count
                self.tableView.reloadData()
                if self.BBBaseInfo.count != 0{
                    for item in 0..<self.BBBaseInfo.count{
                        let cell = self.tableView.dequeueReusableCell(withIdentifier: CellID, for: IndexPath(row: item, section: 0))
                        (cell as? selectcityTableViewCell)?.BBBaseInfo = self.BBBaseInfo[item]
                    }
                }
                self.tableView.reloadData()
                move3()
            
            }
        }
    }
}

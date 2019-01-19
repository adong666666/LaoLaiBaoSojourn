//  Created by adong666666 on 2018/8/7.  Copyright © 2018年 adong666666. All rights reserved. 

import UIKit
import Alamofire

private let CellID = "CellID"

public var RoomNo = ""

class someorderViewController: UIViewController {
   
    override func viewDidLoad() { allthings() }
    
    fileprivate var roomInfo: [room_info] = [room_info](){
        didSet{
            self.someOrderTableView.reloadData()
        }
    }
    fileprivate var baseInfo: [String: Any]?{
        didSet{
            self.llabel1.setTitle(baseInfo?["base_tag"] as? String, for: UIControl.State.normal)
            self.llabel.text = baseInfo?["base_name"] as? String
            self.llabel2.text = baseInfo?["base_address"] as? String
            llabel1.frame = CGRect(x: 20.fitScreen, y: 320.fitHeight,
                                   width: Double(((self.baseInfo?["base_tag"] as? String) ?? "").count * 25).fitScreen,
                                   height: 40.fitHeight)
        }
    }
    fileprivate var baseSlider: [String] = [String](){
        didSet{
            self.cyclescrollview.serverImgArray = baseSlider
        }
    }
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(someorderViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn1: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 300.fitScreen, y: 35.fitHeight, width: 30.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "收藏1"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(someorderViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn2: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 300.fitScreen, y: 35.fitHeight, width: 30.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "收藏2"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(someorderViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn3: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 360.fitScreen, y: 35.fitHeight, width: 30.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "分享黑"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(someorderViewController.buttonTap3(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var llabel: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 20.fitScreen, y: 380.fitHeight, width: 400.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.darkText
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel1: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 20.fitScreen, y: 320.fitHeight, width: 100.fitScreen, height: 40.fitHeight)
        bt4.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 14)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 6
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.clear.cgColor
        bt4.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        return bt4
    }()
    var llabel2: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 50.fitScreen, y: 435.fitHeight, width: 348.fitScreen, height: 40.fitHeight)
        let label3 = PatientInfoCustomLabel(frame: frame1)
        label3.alpha = 0.7
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .left
        label3.font = UIFont (name: "Arial", size: 11)
        label3.textColor = UIColor.black
        return label3
    }()
    var llabel3: PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 20.fitScreen, y: 430.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 15)
        bt4.layer.masksToBounds = true
        bt4.setBackgroundImage(UIImage(named: "定位"), for: UIControl.State.normal)
        bt4.layer.cornerRadius = 6
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.clear.cgColor
        return bt4
    }()
    var llabel4: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 480.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 108, g: 108, b: 108)
        return label
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 900.fitHeight)
        return scroll
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
    fileprivate lazy var someOrderTableView: UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0.fitScreen, y: 482.fitHeight, width: 414.fitScreen, height: 420.fitHeight)
        tableView.register(someOrderCell.self, forCellReuseIdentifier: CellID)
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
}
extension someorderViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        delegate()
        LoadData()
    }
}
extension someorderViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(sscroll)
        self.view.addSubview(btn)
        self.view.addSubview(btn2)
        self.view.addSubview(btn3)
        sscroll.addSubview(cyclescrollview)
        sscroll.addSubview(llabel)
        sscroll.addSubview(llabel1)
        sscroll.addSubview(llabel2)
        sscroll.addSubview(llabel3)
        sscroll.addSubview(llabel4)
        sscroll.addSubview(someOrderTableView)
    }
}
extension someorderViewController{
    func delegate(){
        self.someOrderTableView.delegate = self
        self.someOrderTableView.dataSource = self
    }
}
extension someorderViewController{
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
        let textToShare = self.llabel.text
        let imageToShare = UIImage(named: "1")
        let urlToShare = URL(string: "http://www.baidu.com")
        let activityItems = [textToShare ?? "", imageToShare ?? nil!, urlToShare ?? nil!] as [Any]
        let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        //不出现在活动项目
        activityVC.excludedActivityTypes = [.print, .copyToPasteboard, .assignToContact, .saveToCameraRoll]
        present(activityVC, animated: true)
        // 分享之后的回调
        activityVC.completionWithItemsHandler = { activityType, completed, returnedItems, activityError in
            if completed {
                print("completed")
            } else {
                print("cancled")
            }
        }
    }
    @objc func buttonTap4(_ button: UIButton)
    {
        self.navigationController?.pushViewController(baseViewController(),animated: true )
    }
}

extension someorderViewController{
    fileprivate func LoadData(){
        let parameters = ["base_no": BaseNo]
        Networktools.requestData(URLString: getBaseInformation_url, type: .post, parameters: parameters){(result: Any) in
            guard let resultDict = result as? [String: Any] else { return }
            if let dataArray = resultDict["room_info"] as? [[String: NSObject]] {
               for dict in dataArray {
                 self.roomInfo.append(room_info(dict: dict))
               }
            }
            if let dataArray2 = resultDict["base_info"] as? [String: Any]{
                self.baseInfo = dataArray2
            }
            if let dataArray3 = resultDict["base_slider"] as? [String]{
                self.baseSlider = dataArray3
            }
    }
}
}
extension someorderViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}
extension someorderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.roomInfo.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = someOrderCell()
        cell = tableView.dequeueReusableCell(withIdentifier: CellID, for: indexPath) as! someOrderCell
        cell.awakeFromNib()
        cell.backgroundColor = UIColor.clear
        cell.roomInfo = self.roomInfo[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(156.fitHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        RoomNo = self.roomInfo[indexPath.row].room_no
        self.navigationController?.pushViewController(baseViewController(), animated: true)
    }
}

//  Created by adong666666 on 2018/7/17. Copyright © 2018年 adong666666. All rights reserved.

import UIKit
import MapKit
import CoreLocation

public var targetCity = String()
public var targetCityNO = String()
public var citys = [String]()

class findplaceViewController: UIViewController, WRCycleScrollViewDelegate,MKMapViewDelegate,CLLocationManagerDelegate{
    
    override func viewDidLoad() { allthings() }
    
    fileprivate lazy var coverCity: [cover_city] = [cover_city]()
    var cityname: String = ""
    
    
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(findplaceViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn2 : PowerButton = {
        let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt4.frame = CGRect (x: 30.fitScreen, y: 76.fitHeight, width: 75.fitScreen, height: 30.fitHeight)
        bt4.backgroundColor = UIColor.clear
        bt4.setTitle(myCity, for: UIControl.State())
        bt4.setTitleColor(UIColor.black, for: UIControl.State())
        bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
        bt4.layer.masksToBounds = true
        bt4.layer.cornerRadius = 8
        bt4.layer.borderWidth = 1
        bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
        bt4.addTarget(self, action: #selector(findplaceViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt4
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 100.fitHeight, width: 414.fitScreen, height: 637.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 637.fitHeight)
        return scroll
    }()
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 35.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "目的地"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 22)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var llabel2: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:100.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var llabel3: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:0.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.gray
        return label
    }()
    var llabel4: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 30.fitScreen, y: 36.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "定位城市"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 12)
        label.textColor = UIColor.init(r: 27, g: 199, b: 141)
        label.textAlignment = .center
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel5: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 30.fitScreen, y: 126.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "历史目的地"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 12)
        label.textColor = UIColor.init(r: 27, g: 199, b: 141)
        label.textAlignment = .center
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var llabel6: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 30.fitScreen, y: 206.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.text = "入驻城市"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 12)
        label.textColor = UIColor.init(r: 27, g: 199, b: 141)
        label.textAlignment = .center
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var img1 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "选择云朵"))
        img.frame = CGRect (x: 110.fitScreen, y: 36.fitHeight, width: 50.fitScreen, height: 20.fitHeight)
        return img
    }()
    var img2 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "选择云朵"))
        img.frame = CGRect (x: 110.fitScreen, y: 126.fitHeight, width: 50.fitScreen, height: 20.fitHeight)
        return img
    }()
    var img3 : UIImageView = {
        let img = UIImageView(image: UIImage(named: "选择云朵"))
        img.frame = CGRect (x: 110.fitScreen, y: 206.fitHeight, width: 50.fitScreen, height: 20.fitHeight)
        return img
    }()
}
extension findplaceViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        loadData()
    }
}
extension findplaceViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(llabel)
        self.view.addSubview(llabel2)
        self.view.addSubview(sscroll)
        sscroll.addSubview(llabel3)
        sscroll.addSubview(llabel4)
        sscroll.addSubview(img1)
        sscroll.addSubview(img2)
        sscroll.addSubview(img3)
        sscroll.addSubview(btn2)
        sscroll.addSubview(llabel5)
        sscroll.addSubview(llabel6)
    }
}
extension findplaceViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        citys = [String]()
        targetCity = myCity
        targetCityNO = ""
        if self.coverCity != [cover_city](){
            for item in self.coverCity{
                if item.city_name == targetCity{
                    targetCityNO = item.city_no
                }
            }
        }
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton)
    {
        targetCity = citys[button.tag-1]
        citys = [String]()
        targetCityNO = self.coverCity[button.tag-1].city_no
        myCity2 = targetCity
        citys = [String]()
        self.navigationController?.popViewController(animated: true)
    }
}
extension findplaceViewController{
    fileprivate func loadData(){
        Networktools.requestData(URLString: getCity_url, type: .get){(result : Any) in
            guard let resultDict = result as? [String: Any] else {return}
            if let dataArray = resultDict["cover_city"] as? [[String: NSObject]]{
                for dict in dataArray{
                    self.coverCity.append(cover_city(dict: dict))
                }
            }
            for item in 0..<self.coverCity.count{
                citys.append(self.coverCity[item].city_name)
            }
            var tag = 0
            var count: Double = 20
            var coordinateX: Double = 20
            var coordinateY: Double = 246
            for item in citys{
                self.cityname = item
                let Width = Double(25 * item.count)
                coordinateX = count + 10
                count = count + Width + 10
                tag += 1
                let btn : PowerButton = {
                    let bt4 = PowerButton(type: UIButton.ButtonType.roundedRect)
                    bt4.frame = CGRect (x: coordinateX.fitScreen, y: coordinateY.fitHeight, width: Width.fitScreen, height: 30.fitHeight)
                    bt4.setTitle(item, for: UIControl.State())
                    bt4.setTitleColor(UIColor.black, for: UIControl.State())
                    bt4.titleLabel?.font = UIFont(name: "Arial", size: 12)
                    bt4.layer.masksToBounds = true
                    bt4.layer.cornerRadius = 8
                    bt4.layer.borderWidth = 1
                    bt4.layer.borderColor = UIColor.init(r: 190, g: 190, b: 190).cgColor
                    bt4.addTarget(self, action: #selector(self.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
                    return bt4
                }()
                btn.tag = tag
                if count > 414.fitScreen {
                    coordinateY += 40
                    count = 20
                }
                self.sscroll.addSubview(btn)
            }
        }
    }
}
extension findplaceViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

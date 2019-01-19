//  Created by adong666 on 2018/8/22.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class receivingaddressViewController: UIViewController {
    
    
    override func viewDidLoad() { allthings()}
    
    fileprivate let CellID = "CellID"
    var btn: PowerButton = {() in
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(collectViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 35.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "管理收货地址"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 90.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 750.fitHeight)
        return scroll
    }()
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 587.fitHeight)
        tableView.register(receivingTableViewCell.self, forCellReuseIdentifier: CellID)
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
    var btn2: PowerButton = {
        let frame5 = CGRect(x: 0.fitScreen, y: 677.fitHeight, width: 414.fitScreen, height: 60.fitHeight)
        let bt5 = PowerButton(frame: frame5)
        bt5.setTitle ("新增收货地址", for: .normal)
        bt5.setTitleColor(UIColor.white, for: UIControl.State())
        bt5.backgroundColor = UIColor.init(r: 27, g: 199, b: 141)
        bt5.tintColor = UIColor.clear
        bt5.titleLabel?.font = UIFont(name: "Arial",size: 14)
        bt5.titleLabel?.textColor = UIColor.white
        bt5.addTarget(self,action: #selector(receivingaddressViewController.buttonTap2(_:)),for: UIControl.Event.touchUpInside)
        return bt5
    }()
}
extension receivingaddressViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        delegate()
    }
}
extension receivingaddressViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(llabel)
        self.view.addSubview(sscroll)
        sscroll.addSubview(tableView)
        self.view.addSubview(btn2)
    }
}
extension receivingaddressViewController{
    func delegate(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension receivingaddressViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton){
        
    }
}
extension receivingaddressViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID) as! receivingTableViewCell
        cell.awakeFromNib()
        //let rowNum = (indexPath as NSIndexPath).row
        //cell.textLabel?.text = activities[rowNum]
        cell.backgroundColor = UIColor.clear
        cell.alpha = 0.1
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt  indexPath: IndexPath) -> CGFloat {
        return CGFloat(130.fitHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension receivingaddressViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

//  Created by adong666666 on 2018/8/8 . Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class orderViewController: UIViewController,TwicketSegmentedControlDelegate {
    
    override func viewDidLoad() { allthings() }
    
    fileprivate let CellID = "CellID"
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 35.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "我的订单"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 22)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var segmentedcontrol: TwicketSegmentedControl = {
        let titles = ["待支付订单", "待入住订单", "待退房订单"]
        let frame = CGRect(x: 5.fitScreen, y: 85.fitHeight, width: 404.fitScreen, height: 40.fitHeight)
        let segmentedControl = TwicketSegmentedControl(frame: frame)
        segmentedControl.setSegmentItems(titles)
        segmentedControl.backgroundColor = UIColor.clear
        segmentedControl.defaultTextColor = UIColor.init(r: 124, g: 124, b: 124)
        segmentedControl.highlightTextColor = UIColor.init(r: 27, g: 199, b: 141)
        segmentedControl.sliderBackgroundColor = UIColor.white
        segmentedControl.move(to: 0)
        return segmentedControl
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 140.fitHeight, width: 414.fitScreen, height: 697.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 697.fitHeight)
        return scroll
    }()
    var llabel4: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:80.fitHeight, width: 414.fitScreen, height: 2.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    var llabel7: PowerLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y:140.fitHeight, width: 414.fitScreen, height: 597.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.alpha = 0.1
        label.backgroundColor = UIColor.init(r: 190, g: 190, b: 190)
        return label
    }()
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 537.fitHeight)
        tableView.register(orderTableViewCell.self, forCellReuseIdentifier: CellID)
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
}
extension orderViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        delegate()
    }
}
extension orderViewController{
    func addSubview(){
        self.navigationController?.isNavigationBarHidden = true
        self.view.addSubview(llabel7)
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(llabel)
        self.view.addSubview(segmentedcontrol)
        self.view.addSubview(sscroll)
        self.view.addSubview(llabel4)
        sscroll.addSubview(tableView)
    }
}
extension orderViewController{
    func delegate(){
        self.segmentedcontrol.delegate = self
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension orderViewController{
    func didSelect(_ segmentIndex: Int) {
        if segmentIndex == 1{
            
        }else if segmentIndex == 2{
            
        }else{}
    }
}
extension orderViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID) as! orderTableViewCell
        cell.awakeFromNib()
        //let rowNum = (indexPath as NSIndexPath).row
        //cell.textLabel?.text = activities[rowNum]
        cell.backgroundColor = UIColor.clear
        cell.alpha = 0.1
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt  indexPath: IndexPath) -> CGFloat {
        return CGFloat(182.fitHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
        self.navigationController?.pushViewController(orderinfoViewController(), animated: true)
    }
}
extension orderViewController{
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}


//  Created by adong666 on 2018/8/22.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class contactViewController: UIViewController {
    
    
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
        label.text = "消息中心"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 90.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 690.fitHeight)
        return scroll
    }()
    fileprivate lazy var tableView : UITableView = {[unowned self] in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 647.fitHeight)
        tableView.register(contactTableViewCell.self, forCellReuseIdentifier: CellID)
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
}
extension contactViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        delegate()
    }
}
extension contactViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(llabel)
        self.view.addSubview(sscroll)
        sscroll.addSubview(tableView)
    }
}
extension contactViewController{
    func delegate(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension contactViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
}
extension contactViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellID) as! contactTableViewCell
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
extension contactViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

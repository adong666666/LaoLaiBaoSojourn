//  Created by adong666 on 2018/8/21. Copyright © 2018年 adong666666. All rights reserved. tableview


import UIKit


class conponViewController: UIViewController {

    override func viewDidLoad() { allthings()}
    
    private let kHomeCellID = "kHomeCellID"
    var btn: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 5.fitScreen, y: 40.fitHeight, width: 25.fitScreen, height: 25.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "左"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        bt1.addTarget(self, action: #selector(conponViewController.buttonTap(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn2: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 350.fitScreen, y: 40.fitHeight, width: 50.fitScreen, height: 35.fitHeight)
        bt1.setBackgroundImage(UIImage(named: ""), for: UIControl.State())
        bt1.setTitle("兑换", for: UIControl.State())
        bt1.setTitleColor(UIColor.init(r: 27, g: 199, b: 141), for: UIControl.State())
        bt1.addTarget(self, action: #selector(conponViewController.buttonTap2(_:)), for: UIControl.Event.touchUpInside)
        return bt1
    }()
    var btn3: PowerButton = {
        let bt1 = PowerButton(type: UIButton.ButtonType.roundedRect)
        bt1.frame = CGRect(x: 260.fitScreen, y: 540.fitHeight, width: 200.fitScreen, height: 200.fitHeight)
        bt1.setBackgroundImage(UIImage(named: "优惠券按钮"), for: UIControl.State())
        bt1.setTitle(" ", for: UIControl.State())
        bt1.setTitleColor(UIColor.white, for: UIControl.State())
        return bt1
    }()
    var llabel: PowerLabel = {
        let frame1 = CGRect (x: 103.fitScreen, y: 35.fitHeight, width: 207.fitScreen, height: 40.fitHeight)
        let label = PowerLabel(frame: frame1)
        label.text = "优惠券"
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 18)
        label.textColor = UIColor.black
        label.textAlignment = .center
        return label
    }()
    var sscroll: UIScrollView = {
        let scroll = UIScrollView()
        scroll.frame = CGRect(x: 0.fitScreen, y: 90.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        scroll.contentSize = CGSize(width: 414.fitScreen, height: 647.fitHeight)
        return scroll
    }()
    fileprivate lazy var tableView : UITableView = {[weak self] () in
        let tableView = UITableView()
        tableView.frame = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 480.fitHeight)
        //tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "kHomeCellID")  //xib
        tableView.register(TableViewCell.self, forCellReuseIdentifier: kHomeCellID)
        tableView.separatorColor = UIColor.clear
        return tableView
    }()
}
extension conponViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
        delegate()
    }
}
extension conponViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.view.addSubview(btn)
        self.view.addSubview(btn2)
        self.view.addSubview(llabel)
        self.view.addSubview(sscroll)
        sscroll.addSubview(tableView)
        self.view.addSubview(btn3)
    }
}
extension conponViewController{
    func delegate(){
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
}
extension conponViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //var cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID, for: indexPath) as! TableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: kHomeCellID) as! TableViewCell
        cell.awakeFromNib()
        //let rowNum = (indexPath as NSIndexPath).row
        //cell.textLabel?.text = activities[rowNum]
        cell.imageView?.image = UIImage(named: "51")
        cell.imageView?.highlightedImage = UIImage(named: "44")
        cell.backgroundColor = UIColor.clear
        cell.alpha = 0.1
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt  indexPath: IndexPath) -> CGFloat {
        return CGFloat(156.fitHeight)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
extension conponViewController{
    @objc func buttonTap(_ button: UIButton)
    {
        self.navigationController?.popViewController(animated: true)
    }
    @objc func buttonTap2(_ button: UIButton)
    {

    }
}
extension conponViewController{
    override func viewWillAppear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = true
    }
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

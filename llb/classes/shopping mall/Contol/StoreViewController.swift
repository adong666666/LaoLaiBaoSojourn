//  Created by adong666666 on 2018/7/15.  Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class storeViewController: UIViewController
{
    override func viewDidLoad(){ allthings() }
}
extension storeViewController{
    func allthings(){
        super.viewDidLoad()
        web()
    }
}
extension storeViewController{
    func web(){
        self.navigationController?.isNavigationBarHidden = true
        self.view.backgroundColor = UIColor.white
        let rect = CGRect(x: 0.fitScreen, y: 0.fitHeight, width: 414.fitScreen, height: 737.fitHeight)
        let webView = UIWebView(frame: rect)
        let url = URL(string: "https://www.jd.com")
        let request = URLRequest(url: url!)
        webView.loadRequest(request)
        self.view.addSubview(webView)
    }
}
extension storeViewController{
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

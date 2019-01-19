//  Created by adong666666 on 2018/7/15. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class serviceViewController: UIViewController {
    
    override func viewDidLoad() { allthings() }
}
extension serviceViewController{
    func allthings(){
        super.viewDidLoad()
        addSubview()
    }
}
extension serviceViewController{
    func addSubview(){
        self.view.backgroundColor = UIColor.white
        self.navigationController?.navigationBar.isHidden = true
    }
}
extension serviceViewController{
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
}

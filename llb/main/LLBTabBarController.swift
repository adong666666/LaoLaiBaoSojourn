
//  Created by adong666666 on 2018/8/29. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class llbTabBarController: UITabBarController {
    
    override func viewDidLoad() { allthings() }
    
}
extension llbTabBarController{
    func allthings(){
        super.viewDidLoad()
        viewcontrollers()
    }
}
extension llbTabBarController{
    func viewcontrollers(){
        let homeVc = shouyeViewController()
        let homeNc = MyNavigationController(rootViewController: homeVc)
        homeVc.tabBarItem.title = "首页"
        homeVc.tabBarItem.image = UIImage.init(named:"首页")
        homeVc.tabBarItem.selectedImage = UIImage.init(named:"首页2")
        
        let storeVc = storeViewController()
        let storeNc = MyNavigationController(rootViewController: storeVc)
        storeVc.tabBarItem.title = "商城"
        storeVc.tabBarItem.image = UIImage.init(named:"商城")
        storeVc.tabBarItem.selectedImage = UIImage.init(named:"商城2")
        
        let serviceVc = serviceViewController()
        let serviceNc = MyNavigationController(rootViewController: serviceVc)
        serviceVc.tabBarItem.title = "管家"
        serviceVc.tabBarItem.image = UIImage.init(named:"客服")
        serviceVc.tabBarItem.selectedImage = UIImage.init(named:"客服2")
        
        let orderVc = orderViewController()
        let orderNc = MyNavigationController(rootViewController: orderVc)
        orderVc.tabBarItem.title = "订单"
        orderVc.tabBarItem.image = UIImage.init(named:"订单")
        orderVc.tabBarItem.selectedImage = UIImage.init(named:"订单2")
        
        let mineVc = mineViewController()
        let mineNc = MyNavigationController(rootViewController: mineVc)
        mineVc.tabBarItem.title = "我的"
        mineVc.tabBarItem.image = UIImage.init(named:"我的")
        mineVc.tabBarItem.selectedImage = UIImage.init(named:"我的2")
        
        //self.viewControllers = [homeNc,storeNc,serviceNc,orderNc,mineNc]
        setViewControllers([homeNc,storeNc,serviceNc,orderNc,mineNc], animated: true)
        self.tabBar.tintColor = UIColor.init(r: 27, g: 199, b: 141)
        /* addChildViewController(homeNc)
         addChildViewController(storeNc)
         addChildViewController(serviceNc)
         addChildViewController(orderNc)
         addChildViewController(mineNc)*/
    }
}
extension llbTabBarController{
    override func viewWillAppear(_ animated: Bool) {
        selectedViewController?.beginAppearanceTransition(true, animated: animated)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        selectedViewController?.endAppearanceTransition()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        selectedViewController?.beginAppearanceTransition(false, animated: animated)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        selectedViewController?.endAppearanceTransition()
    }
}

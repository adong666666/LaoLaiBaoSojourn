//  Created by adong666666 on 2018/8/28. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class MyNavigationController: UINavigationController {
    
    override func viewDidLoad() { allthings() }
}
extension MyNavigationController{
    func allthings(){
        super.viewDidLoad()
    }
}
extension MyNavigationController{
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = false
        super.pushViewController(viewController, animated: animated)
    }
}
extension MyNavigationController{
    func StrongPop(){
        guard let systemGes = interactivePopGestureRecognizer else { return }
        guard let gesView = systemGes.view else { return }
        let targets = systemGes.value(forKey: "_targets") as? [NSObject]
        guard let targetObjc = targets?.first else { return }
        guard let target = targetObjc.value(forKey: "target") else { return }
        let action = Selector(("handleNavigationTransition:"))
        let panGes = UIPanGestureRecognizer()
        gesView.addGestureRecognizer(panGes)
        panGes.addTarget(target, action: action)
    }
}

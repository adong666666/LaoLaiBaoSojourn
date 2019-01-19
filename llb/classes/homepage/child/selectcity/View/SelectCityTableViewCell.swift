//  Created by adong666666 on 2018/8/29.  Copyright © 2018年 adong666666. All rights reserved.


import UIKit
import Kingfisher

class selectcityTableViewCell: UITableViewCell {
    
    override func awakeFromNib() { allthings() }
    
    var baseImg: UIImageView = {
        let view = UIImageView()
        view.frame = CGRect(x: 20.fitScreen, y: 0.fitHeight, width: 374.fitScreen, height: 242.fitHeight)
        return view
    }()
    var baseName: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 20.fitScreen, y: 260.fitHeight, width: 200.fitScreen, height: 40.fitHeight)
        let label = PatientInfoCustomLabel(frame: frame1)
        label.alpha = 0.8
        label.font = UIFont (name: "Arial", size: 22)
        label.textColor = UIColor.black
        label.lineBreakMode = NSLineBreakMode.byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .left
        return label
    }()
    var someValue: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 20.fitScreen, y: 300.fitHeight, width: 400.fitScreen, height: 40.fitHeight)
        let label3 = PatientInfoCustomLabel (frame: frame1)
        label3.font = UIFont (name: "Arial", size: 11)
        label3.textColor = UIColor.init(r: 124, g: 124, b: 124)
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .left
        return label3
    }()
    var collect: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 200.fitScreen, y: 358.fitHeight, width: 400.fitScreen, height: 40.fitHeight)
        let label3 = PatientInfoCustomLabel(frame: frame1)
        label3.font = UIFont (name: "Arial", size: 12)
        label3.textColor = UIColor.init(r: 124, g: 124, b: 124)
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .left
        return label3
    }()
    var basePrice: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 20.fitScreen, y: 340.fitHeight, width: 200.fitScreen, height: 40.fitHeight)
        let label3 = PatientInfoCustomLabel (frame: frame1)
        label3.textColor = UIColor.init(r: 252, g: 0, b: 0)
        label3.font = UIFont (name: "Arial", size: 38)
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .left
        return label3
    }()
    var BBBaseInfo: bbbase_info?{
        didSet{
            let baseimgurl = URL(string: BBBaseInfo?.base_img ?? "")
            let distance = String(format: "%.3f", BBBaseInfo?.distance ?? 0.000)
            let popValue = String(describing: BBBaseInfo?.popular_value ?? "0")
            let hotValue = String(describing: BBBaseInfo?.hot_value ?? "0")
            baseImg.kf.setImage(with: baseimgurl, placeholder: UIControl.State.normal as? Placeholder)
            baseName.text = BBBaseInfo?.base_name ?? ""
            someValue.text = "推荐值：\(popValue) | 人气值：\(hotValue) | 距离你\(distance)千米"
            collect.text = "\(String(describing: BBBaseInfo?.collect ?? "0"))人收藏了"
            basePrice.text = "\(String(describing: BBBaseInfo?.base_price ?? "0"))"
        }
    }
}
extension selectcityTableViewCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension selectcityTableViewCell{
    func add(){
        self.backgroundColor = UIColor.white
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(baseImg)
        addSubview(baseName)
        addSubview(someValue)
        addSubview(collect)
        addSubview(basePrice)
    }
}

//  Created by adong666666 on 2018/8/29.  Copyright © 2018年 adong666666. All rights reserved.


import UIKit
import Kingfisher

class recommendTableViewCell: UITableViewCell {
    
    override func awakeFromNib() { allthings() }
    
    var recommendName: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 30.fitScreen, y: 10.fitHeight, width: 414.fitScreen, height: 35.fitHeight)
        let label3 = PatientInfoCustomLabel(frame: frame1)
        label3.alpha = 0.7
        label3.font = UIFont (name: "Arial", size: 18)
        label3.textColor = UIColor.black
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .center
        return label3
    }()
}
extension recommendTableViewCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension recommendTableViewCell{
    func add(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(recommendName)
    }
}

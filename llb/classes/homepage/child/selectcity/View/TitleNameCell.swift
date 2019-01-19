//  Created by adong666666 on 2018/8/29.  Copyright © 2018年 adong666666. All rights reserved.


import UIKit
import Kingfisher

class titleNameCell: UITableViewCell {
    
    override func awakeFromNib() { allthings() }
    
    var titleName: PatientInfoCustomLabel = {
        let frame1 = CGRect (x: 0.fitScreen, y: 14.fitHeight, width: 110.fitScreen, height: 40.fitHeight)
        let label3 = PatientInfoCustomLabel(frame: frame1)
        label3.alpha = 0.7
        label3.font = UIFont (name: "Arial", size: 16)
        label3.textColor = UIColor.init(r: 111, g: 111, b: 111)
        label3.lineBreakMode = NSLineBreakMode.byWordWrapping
        label3.numberOfLines = 0
        label3.textAlignment = .center
        return label3
    }()
    var TitleInfo: title_info?{
        didSet{
            titleName.text = TitleInfo?.title_name
            self.titleName.textColor = UIColor.black
            self.backgroundColor = UIColor.init(r: 237, g: 237, b: 237)
        }
    }
}
extension titleNameCell{
    func allthings(){
        super.awakeFromNib()
        add()
    }
}
extension titleNameCell{
    func add(){
        self.selectionStyle = UITableViewCell.SelectionStyle.none
        addSubview(titleName)
    }
}

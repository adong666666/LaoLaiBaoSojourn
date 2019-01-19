//  Created by adong666666 on 2018/9/7. Copyright © 2018年 adong666666. All rights reserved.

import UIKit

class facilitiesCollectionViewCell: UICollectionViewCell {
    override init (frame: CGRect){
        super.init(frame: frame)
        contentView.addSubview(image)
        contentView.addSubview(label)
        let constraints = [
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ]
        NSLayoutConstraint.activate(constraints)
    }
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    var image: UIImageView = {
        let img = UIImageView()
        img.backgroundColor = UIColor.black
        img.frame = CGRect(x: 0, y:0, width: 64.fitScreen, height: 64.fitHeight)
        return img
    }()
    var label: PowerLabel = {
        let label = PowerLabel()
        label.text = "12345"
        label.frame = CGRect(x: 0, y: 0, width: 64.fitScreen, height: 64.fitHeight)
        label.textAlignment = .center
        return label
    }()
    var roomCondition: RoomCondition?{
        didSet{
            label.text = roomCondition?.condition_name
            if let iconUrl = URL(string: roomCondition?.condition_img ?? ""){
                image.kf.setImage(with: iconUrl)
            }
        }
    }
}


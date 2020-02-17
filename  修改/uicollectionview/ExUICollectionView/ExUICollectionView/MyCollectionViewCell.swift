//
//  MyCollectionViewCell.swift
//  ExUICollectionView
//
//  Created by joe feng on 2016/5/20.
//  Copyright © 2016年 hsin. All rights reserved.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var titleLabel:UILabel!
 //   var myTextView: UITextView!

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // 取得螢幕寬度
        let w = Double(UIScreen.main.bounds.size.width)
        let h = Double(UIScreen.main.bounds.size.height)
        
        // 建立一個 UIImageView
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: w/2, height: w/3 - 10.0))
        self.addSubview(imageView)
        
        // 建立一個 UILabel
        titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: w/3 - 10.0, height: 40))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        self.addSubview(titleLabel)
        
        // 建立一个 UITextView
        // myTextView = UITextView(frame: CGRect(x: 0, y: 0, width: 250, height: h - 40))
        // myTextView.textColor = UIColor.white
        // myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
        // self.addSubview(myTextView)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

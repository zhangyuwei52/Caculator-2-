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
    var nameLabel:UILabel!
    var myTextView: UITextView!
   // var photoView = UIImageView()
    var photoView = [UIImageView](repeating: UIImageView(), count: 9)
    

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        // 取得螢幕寬度
        let w = Double(UIScreen.main.bounds.size.width)
        let h = Double(UIScreen.main.bounds.size.height)
        
        // 建立一個 UIImageView
     //   imageView.backgroundColor = UIColor.white
        imageView = UIImageView(frame: CGRect(x: 15, y: 15, width: w/7, height: w/7 ))
        self.addSubview(imageView)
        imageView.backgroundColor = UIColor.white

        // 建立一個 UILabel
 /*       titleLabel = UILabel(frame:CGRect(x: 0, y: 0, width: w/3 - 10.0, height: 40))
        titleLabel.textAlignment = .center
        titleLabel.textColor = UIColor.orange
        self.addSubview(titleLabel)     */
        
        //建立名字 UILabel
        nameLabel = UILabel(frame:CGRect(x: 30+w/7, y: 15, width: w/3, height: 40 ))
        nameLabel.textAlignment = .center
        nameLabel.backgroundColor = UIColor.white
        nameLabel.textColor = UIColor.black
        self.addSubview(nameLabel)
        
        // 建立一个 UITextView
       myTextView = UITextView(frame: CGRect(x: 25+w/7, y: 30+h/16, width: 6*w/7-40, height: h/12))
       myTextView.textColor = UIColor.black
       myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
       self.addSubview(myTextView)
        
        //建立photo的展示 一行最多展示3张图
        let blankArea = Int(6*w/7-40)
        for i in 1...3{
            photoView[i].backgroundColor = UIColor.white
            photoView[i].frame = CGRect(x:Int (25+w/7) + blankArea/i , y:Int( 30 + h/6 ),
                                        width: blankArea/i,height: Int(h/6))
            self.addSubview(photoView[i])
        }
       
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

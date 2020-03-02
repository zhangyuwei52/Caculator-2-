//
//  MyCollectionViewCell.swift
//  ExUICollectionView
//
//  Created by joe feng on 2016/5/20.
//  Copyright © 2016年 hsin. All rights reserved.
//

import UIKit
import SnapKit

class MyCollectionViewCell: UICollectionViewCell {
    var imageView:UIImageView!
    var titleLabel:UILabel!
    var nameLabel:UILabel!
    var myTextView: UITextView!
   // var photoView = UIImageView()
    var snapkitTestView:UIImageView!
    var snapkitTestView2:UIImageView!
    var horizontalLine:UILabel!
  //  var snapkitFirstView:UIImageView!
  
    
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
        nameLabel.textAlignment = .left
        nameLabel.backgroundColor = UIColor.white
        nameLabel.textColor = UIColor.black
        self.addSubview(nameLabel)
        
        // 建立一个 UITextView
       myTextView = UITextView(frame: CGRect(x: 25+w/7, y: 5+h/16, width: 6*w/7-40, height: h/12))
       myTextView.textColor = UIColor.black
       myTextView.textAlignment = .left
       myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
       self.addSubview(myTextView)
        
       //建立photo的展示 一行最多展示3张图
       snapkitTestView = UIImageView(frame: CGRect(x: 25+w/7, y: h/6, width: 2*w/7-15,
                                                   height:2*w/7-10 ))
       snapkitTestView.backgroundColor = UIColor.white
       self.addSubview(snapkitTestView)
      
       snapkitTestView2 = UIImageView(frame: CGRect(x: 20+3*w/7, y: h/6, width: 2*w/7-15,
                                                    height:2*w/7-10 ))
       snapkitTestView2.backgroundColor = UIColor.white
       self.addSubview(snapkitTestView2)
        
/*     horizontalLine.backgroundColor = UIColor.black
   //    snapkitTestView2 = UIImageView(frame: CGRect(x: 0, y: h/3, width:w-10,height:3 ))
        snapkitTestView2.snp.makeConstraints { (make) in
            make.top.equalTo(snapkitTestView2.snp.bottom).offset(20)
            make.width.equalTo(w-15)
            make.height.equalTo(5)
        }
       self.addSubview(horizontalLine)
 */
       
 /*   snapkitTestView2.backgroundColor = UIColor.black
        snapkitTestView2.snp.makeConstraints { (make) in
        make.top.equalTo(snapkitTestView.snp.top)
        make.bottom.equalTo(snapkitTestView.snp.bottom)
        make.left.equalTo(snapkitTestView.snp.right).offset(10)
        make.width.equalTo(2*w/7-15)
        }
        self.addSubview(snapkitTestView2)
  */
     
   /*     horizontalLine.backgroundColor = UIColor.black
        snapkitTestView2 = UIImageView(frame: CGRect(x: 0, y: h/2-15, width:w,
                                                     height:2 ))
     */
        
        //建立photo的展示 一行最多展示3张图
/*        let blankArea = Int(6*w/7-40)
        for i in 1...3{
            photoView[i].backgroundColor = UIColor.white
            photoView[i].frame = CGRect(x:Int (25+w/7) + blankArea/i , y:Int( 30 + h/6 ),
                                        width: blankArea/i,height: Int(h/6))
            self.addSubview(photoView[i])
        }
 */
        //建立photo的展示 一行x最多展示3张图
/*        snapkitTestView.backgroundColor = UIColor.white
        snapkitTestView.snp.makeConstraints { (make) in
            make.width.height.equalTo(100)    // 链式语法直接定义宽高
            make.center.equalToSuperview()    // 直接在父视图居中

        }
   */
     
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    
}


class MyNewCollectionViewCell: UICollectionViewCell{
    var imageView:UIImageView!
    var horizontalLine:UILabel!
    var titleLabel:UILabel!
    var nameLabel:UILabel!
    var myTextView: UITextView!
    // var photoView = UIImageView()
    var snapkitTestView:UIImageView!
    var snapkitTestView2:UIImageView!
 //   var horizontalLine:UIImageView!
 
    override init(frame: CGRect) {
        super.init(frame: frame)
        let w = Double(UIScreen.main.bounds.size.width)
        let h = Double(UIScreen.main.bounds.size.height)
        
        //建立一个很迷的分割线
 /*       horizontalLine.backgroundColor = UIColor.black
        horizontalLine = UILabel(frame: CGRect(x: 0, y: h/10-5, width:w-10,height:5 ))
        self.addSubview(horizontalLine)
  */

        imageView = UIImageView(frame: CGRect(x: 15, y:h/10, width: w/7, height: w/7 ))
        self.addSubview(imageView)
        imageView.backgroundColor = UIColor.white
 
        nameLabel = UILabel(frame:CGRect(x: 30+w/7, y: h/10, width: w/3, height: 40 ))
        nameLabel.textAlignment = .left
        nameLabel.backgroundColor = UIColor.white
        nameLabel.textColor = UIColor.black
        self.addSubview(nameLabel)
        
        // 建立一个 UITextView
        myTextView = UITextView(frame: CGRect(x: 25+w/7, y: 30+h/10, width: 6*w/7-40, height: h/6))
        myTextView.textColor = UIColor.black
        myTextView.textAlignment = .left
        myTextView.font = UIFont(name: "Helvetica-Light", size: 20)
        self.addSubview(myTextView)
      
        
        snapkitTestView = UIImageView(frame: CGRect(x: 25+w/7, y: h/3-10, width: 2*w/7-15,
                                                    height:2*w/7-10 ))
        snapkitTestView.backgroundColor = UIColor.white
        self.addSubview(snapkitTestView)
        
        
        snapkitTestView2.snp.makeConstraints { (make) in
            make.height.equalTo(2*w/7-10)
            make.width.equalTo(2*w/7-15)
            make.left.equalTo(snapkitTestView.snp.right).offset(5)
        snapkitTestView2.backgroundColor = UIColor.white
        self.addSubview(snapkitTestView2)
        }
    
    
    
  }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

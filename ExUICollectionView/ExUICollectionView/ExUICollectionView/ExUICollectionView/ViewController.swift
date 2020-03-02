//
//  ViewController.swift
//  ExUICollectionView
//
//  Created by joe feng on 2016/5/20.
//  Copyright © 2016年 hsin. All rights reserved.
//

import UIKit
import SnapKit     

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    // 取得螢幕的尺寸
   // var collectionView :UICollectionView!
    let fullScreenSize = UIScreen.main.bounds.size
    override func viewDidLoad() {
        super.viewDidLoad()
       //    var collectionView :UICollectionView!
        // 設置底色
       // self.collectionView.backgroundColor = UIColor.white
       // collectionView.backgroundColor = [UIColor,whiteColor];
        // 建立 UICollectionViewFlowLayout
        let layout = UICollectionViewFlowLayout()
     
        
        // 設置 section 的間距 四個數值分別代表 上、左、下、右 的間距
   //     layout.sectionInset = UIEdgeInsetsMake(5, 5, 5, 5);
        
        // 設置每一行的間距
        layout.minimumLineSpacing = 5
        
        // 設置每個 cell 的尺寸
        layout.itemSize = CGSize(width: CGFloat(fullScreenSize.width), height: CGFloat(fullScreenSize.width)/2 - 10.0)
        
        //设置每一行颜色
        let page = UIView(frame: self.view.bounds)
        page.backgroundColor = .white
        
        
        
        // 設置 header 及 footer 的尺寸
  /*      layout.headerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)
        layout.footerReferenceSize = CGSize(width: fullScreenSize.width, height: 40)  */
        
        // 建立 UICollectionView
        let myCollectionView = UICollectionView(frame: CGRect(x: 0, y: 20, width: fullScreenSize.width, height: fullScreenSize.height - 20), collectionViewLayout: layout)
        
        // 註冊 cell 以供後續重複使用
        myCollectionView.register(MyCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
        myCollectionView.register(MyNewCollectionViewCell.self,forCellWithReuseIdentifier: "newCell")
        
        
        // 設置委任對象
        myCollectionView.delegate = self
        myCollectionView.dataSource = self
        
        //设置背景颜色
        myCollectionView.backgroundColor = UIColor.white

        // 加入畫面中
        self.view.addSubview(myCollectionView)
    
    }
    
    // 有幾個 section
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    // 必須實作的方法：每個 cell 要顯示的內容
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) ->   UICollectionViewCell {
        if indexPath.row == 0  {
        // 依據前面註冊設置的識別名稱 "Cell" 取得目前使用的 cell
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MyCollectionViewCell
        
        // 設置 cell 內容 (即自定義元件裡 增加的圖片與文字元件)
        cell.imageView.image = UIImage(named: "0\(indexPath.item + 3).jpg")   //
        cell.nameLabel.text = "篮球场 "
        cell.myTextView.text = "Swift 起步走123456\n7889"
        cell.snapkitTestView.image = UIImage(named: "04.jpg")
        cell.snapkitTestView2.image = UIImage(named: "06.jpg")
        return cell
        } else {
            let newCell = collectionView.dequeueReusableCell(withReuseIdentifier: "newCell", for: indexPath) as! MyNewCollectionViewCell
            newCell.imageView.image = UIImage(named: "09.jpg")   //
            newCell.nameLabel.text = "葛东琪 "
            newCell.myTextView.text = "是新专辑里最有意思的一首歌\n很具有魔幻色彩\n名字叫做喜\n你听了吗\n"
            newCell.snapkitTestView.image = UIImage(named: "08.jpg")
            newCell.snapkitTestView.image = UIImage(named: "10.jpg")
            return newCell
        }
    }
    
        
    
        
    
  
  
  
    
    
 /*   // 設置 reuse 的 section 的 header 或 footer
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        // 建立 UICollectionReusableView
        var reusableView = UICollectionReusableView()
        
        // 顯示文字
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: fullScreenSize.width, height: 40))
        label.textAlignment = .center
        
        // header
      if kind == UICollectionElementKindSectionHeader {
            // 依據前面註冊設置的識別名稱 "Header" 取得目前使用的 header
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "Header", for: indexPath)
            // 設置 header 的內容
            reusableView.backgroundColor = UIColor.darkGray
            label.text = "Header";
            label.textColor = UIColor.white

        } else if kind == UICollectionElementKindSectionFooter {
            // 依據前面註冊設置的識別名稱 "Footer" 取得目前使用的 footer
            reusableView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "Footer", for: indexPath)
            // 設置 footer 的內容
           reusableView.backgroundColor = UIColor.cyan
           label.text = "Footer";
           label.textColor = UIColor.black

        }

        reusableView.addSubview(label)
        return reusableView
    }
*/
}



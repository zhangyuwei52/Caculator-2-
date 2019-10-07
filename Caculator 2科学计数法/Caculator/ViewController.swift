//
//  ViewController.swift
//  Caculator
//
//  Created by Virtual Box on 2019/9/29.
//  Copyright © 2019年 Virtual Box. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var myButton = [UIButton](repeating: UIButton(type: .system), count: 20)
    var myText = UITextView()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //self.view.backgroundColor = UIColor.lightGray
        let buttonWidth  = Int(UIScreen.main.bounds.width/4 + 1)
        let buttonHeight = Int(UIScreen.main.bounds.height*3/5/5 + 1)
        
        let blankArea = Int(UIScreen.main.bounds.height*2/5)
        //所有按钮样式初始化
        for i in 0...19 {
            myButton[i] = UIButton(type: .system)
            myButton[i].frame = CGRect(x: (buttonWidth)*(i%4),
                                       y: Int(buttonHeight*(i/4) +  blankArea),
                                       width: buttonWidth,
                                       height: buttonHeight)
            myButton[i].setTitle(String(i), for: .normal)
            myButton[i].titleLabel?.font = UIFont.systemFont(ofSize: UIFont.systemFontSize*3)
            myButton[i].setTitleColor(UIColor.black, for: .normal)
            myButton[i].layer.backgroundColor = UIColor.white.cgColor
            myButton[i].layer.borderColor = UIColor.lightGray.cgColor
            myButton[i].layer.borderWidth = 1
            myButton[i].isEnabled = true
            myButton[i].titleLabel?.textAlignment = NSTextAlignment.center
            myButton[i].addTarget(self, action: #selector(ViewController.clickButton), for: .touchUpInside)
            self.view.addSubview(myButton[i])
        }
        myText = UITextView(frame: CGRect(x: 0, y: 20, width: Int(UIScreen.main.bounds.width + 1), height: blankArea - 20))
        myText.textAlignment = NSTextAlignment.right
        myText.font = UIFont.systemFont(ofSize: UIFont.systemFontSize*3)
        myText.textColor = UIColor.gray
        myText.layer.borderWidth = 1
        myText.layer.borderColor = UIColor.lightGray.cgColor
        myText.text = "0"
        myText.isEditable = false
        self.view.addSubview(myText)
        
        //按钮文字及函数的添加
        myButton[0].setTitle("C", for: .normal)
        myButton[1].setTitle("(", for: .normal)
        myButton[2].setTitle(")", for: .normal)
        myButton[3].setTitle("/", for: .normal)
        myButton[4].setTitle("7", for: .normal)
        myButton[5].setTitle("8", for: .normal)
        myButton[6].setTitle("9", for: .normal)
        myButton[7].setTitle("X", for: .normal)
        myButton[8].setTitle("4", for: .normal)
        myButton[9].setTitle("5", for: .normal)
        myButton[10].setTitle("6", for: .normal)
        myButton[11].setTitle("-", for: .normal)
        myButton[12].setTitle("1", for: .normal)
        myButton[13].setTitle("2", for: .normal)
        myButton[14].setTitle("3", for: .normal)
        myButton[15].setTitle("+", for: .normal)
        myButton[16].setTitle("e", for: .normal)
        myButton[17].setTitle("0", for: .normal)
        myButton[18].setTitle("^", for: .normal)
        myButton[19].setTitle("=", for: .normal)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    func caculate(arithmetic : String) -> String{
        //getstring()
       // suffix()
        
        return arithmetic + ("\n") + final ()
    }
    
    @objc func clickButton(sender: UIButton)
    {
        
        switch sender.titleLabel?.text {
        case "C"?:
            myText.text = "0"
        case "<-"?:
            myText.text = String(myText.text.prefix(myText.text.count - 1))
            if myText.text.isEmpty {
                myText.text = "0"
            }
        case "="?:
            myText.text = caculate(arithmetic: myText.text);
        default:
            let btn = (sender.titleLabel?.text)!
            if btn >= "0" && btn <= "9" {
                if myText.text == "0"{
                    myText.text = ""
                }
            }
            myText.text.append((sender.titleLabel?.text)!)
        }
    }
    
    func getstring() -> [String] //一整个字符串分割
    {
        let inputstring=String(myText.text)
        var inputstringnumber=[String]()
        var startIndex=0
        var endIndex=0
        var skip = 0
        for i in inputstring {
            if skip != 0 {
                skip = skip - 1
                continue
            }
            if i == "("{
                inputstringnumber.append(String(i))
                endIndex = endIndex + 1
                startIndex = endIndex
            }
            else if i<"0" || i>"9"{
                
                
                //s = inputstring.index(inputstring.startIndex, offsetBy: endIndex + 1)//符号开始
                switch i {
                case "s":
                    inputstringnumber.append(String("sin"))
                    skip = 2
                    endIndex = endIndex + 3 //移动3位到符号结束
                case "c":
                    inputstringnumber.append(String("cos"))
                    skip = 2
                    endIndex = endIndex + 3
                default:let s=inputstring.index(inputstring.startIndex, offsetBy: startIndex)
                let e=inputstring.index(inputstring.startIndex, offsetBy: endIndex)//遇到运算符最后一个数字下标
                inputstringnumber.append(String(inputstring[s ..< e])) //数字放进去
                    inputstringnumber.append(String(i))
                    endIndex = endIndex + 1
                }
//                e = inputstring.index(inputstring.startIndex, offsetBy: endIndex)//符号结束
//                inputstringnumber.append(String(inputstring[s ..< e] ))
//
//                endIndex = endIndex + 1
                startIndex = endIndex
            }else{
                endIndex = endIndex + 1
            }
        }
        if startIndex < endIndex {
            let s=inputstring.index(inputstring.startIndex, offsetBy: startIndex)
            let e=inputstring.index(inputstring.startIndex, offsetBy: endIndex)//遇到运算符最后一个数字下标
            inputstringnumber.append(String(inputstring[s ..< e]))
        }
        for i in inputstringnumber{
            print(i)
        }
        return inputstringnumber
    }
    
    func priority(site:String) -> Int {
        if (site=="+"||site=="-" ){
            return 1}
        if (site=="X"||site=="/" ){
            return 2}
        if (site=="e"||site=="^"){
            return 3}
        else {
            return 0
        }
    }
    
    
    
    
    
    func suffix()-> [String]
    {
        var numberstring=[String]()
        var signstring=[String]()
        let allstring=getstring()
        for i in allstring{
            if i==""{
            continue
            }
            if i>="0" && i<="9"{
            numberstring.append(String(i))
            }
            //
            else if i=="(" {
            signstring.append(String(i))
            }
            else if i==")"{
                while(signstring.last != "("){
                    numberstring.append(signstring.last!)
                    signstring.popLast()
                }
                signstring.popLast()
            }//
            else if(i<"0" || i>"9"){
                while(true){
                    if (signstring.isEmpty)||(signstring.last == "(")||(priority(site: i)>=priority(site: (signstring.last!) )){
                        signstring.append(String(i))
                        break
                    }
                    else {
                        numberstring.append(signstring.last!)
                        signstring.popLast()
                        //break
                    }
                }
            }
            
            
        }
        while !signstring.isEmpty {
            numberstring.append(signstring.last!)
            signstring.popLast()
        }
        
        print("逆波兰表达式")
        for i in numberstring{
            print(i)
        }
        return numberstring
    }
    
    
    
    func cal (n1:String,n2:String,i:String )->Double{
        let n1int=Double(n1)
        let n2int=Double(n2)
        if i=="+"{
           return Double(n1int! + n2int!)
        }
        if i=="-"{
           return Double(n1int!-n2int!)
        }
        if i=="X"{
            return Double(n1int!)*Double(n2int!)
        }
        if i=="/"{
            return Double(n1int!)/Double(n2int!)
        }
        if i=="e"{
            return Double(n1int!*pow(10,n2int!))
        }
        if i=="^"{
            return Double(pow(n1int!,n2int!))
        }
        else {
            return 0
        }
    }
    
    
    
    
    
    func final ()->String{
        let suffixstring=suffix()
        var caculatestring=[String]()
        var n1:String
        var n2:String
        var result:Double
        var resultstring:String
        for i in suffixstring{
            if i.isEmpty {
                continue
            }
            if i>="0" && i<="9"{
               caculatestring.append(String(i))
            }
            else if i<"0" || i>"9"{
                n2=caculatestring.popLast()!
                n1=caculatestring.popLast()!
                result = cal(n1: n1, n2: n2, i: i)
                resultstring=String(result)
                caculatestring.append(String(resultstring))
            }
        }
        print(caculatestring[0])
        return caculatestring[0]
    }
    
    
    //
    
}


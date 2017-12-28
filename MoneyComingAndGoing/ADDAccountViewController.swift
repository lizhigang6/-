//
//  ADDAccountViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/20.
//  Copyright © 2017年 user. All rights reserved.
//
//https://realm.io/cn/docs/swift/latest/

import UIKit
import RealmSwift

class books: Object {
    @objc dynamic var amount = ""
    @objc dynamic var type = ""
    @objc dynamic var useName = ""
    @objc dynamic var className = ""

    @objc dynamic var time = ""
    @objc dynamic var year = ""
    @objc dynamic var month = ""
    @objc dynamic var day = ""

}



class ADDAccountViewController: UIViewController,UITextFieldDelegate {
    
    var textField :UITextField!
    var typeStr : String!
    var datePickerStr:String!

    var datePicker:UIDatePicker!
    var datePickerBut:UIButton!
    var classBut:UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        
        
        let classUserDefault = UserDefaults.standard
        classUserDefault.set("常用", forKey: "typeName")
        classUserDefault.set("生活缴费", forKey: "classname")
        
        classUserDefault.synchronize()
        
        
        
        let saveButton:UIButton = UIButton(type:.custom)
        saveButton.frame = CGRect(x:10, y:22, width:60, height:40)
        saveButton.setTitle("保存", for:.normal)
        saveButton.setTitleColor(UIColor.blue, for: .normal)
        saveButton.addTarget(self, action:#selector(saveButtonItem), for:.touchUpInside)
        let rightItem=UIBarButtonItem(customView: saveButton)
        
        self.navigationItem.rightBarButtonItem  = rightItem
        //返回到上个页面
        // 返回到指定页面
        // let viewAarray = self.navigationController?.viewControllers;
        // self.navigationController?.popToViewController(viewAarray![2], animated: true);
        //返回根视图
        // self.navigationController?.popToRootViewControllerAnimated(true);
        
        typeStr = "支出"
        let items = ["支出", "收入", "转账","借贷"] as [Any]
        let segmented = UISegmentedControl(items:items)
        segmented.frame = CGRect(x:20, y:100, width:kScreenWidth-40, height:40)
        
        //        segmented.center = self.view.center
        segmented.selectedSegmentIndex = 0 //默认选中第二项
        segmented.addTarget(self, action: #selector(ADDAccountViewController.segmentDidchange(_:)),
                            for: .valueChanged)  //添加值改变监听
        self.view.addSubview(segmented)
        
        
        textField = UITextField(frame: CGRect(x:15, y:140, width:kScreenWidth-30, height:40))
        textField.placeholder = "输入记账金额"
        textField.keyboardType = UIKeyboardType.decimalPad
        textField.delegate = self
        
        self.view.addSubview(textField)
        
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        datePickerStr = formatter.string(from: Date())
        
     
        classBut  = UIButton(type:.custom)
        classBut.frame = CGRect(x:15, y:180, width:kScreenWidth-30, height:40)
        classBut.setTitleColor(UIColor.black, for: .normal)
        classBut.contentHorizontalAlignment  = .left
        classBut.addTarget(self, action:#selector(classButs), for:.touchUpInside)
        self.view.addSubview(classBut)
        
        
        datePickerBut  = UIButton(type:.custom)
        datePickerBut.frame = CGRect(x:15, y:220, width:kScreenWidth-30, height:40)
        //        datePickerBut.titleEdgeInsets = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 0)
        datePickerBut.setTitle((datePickerStr as NSString).substring(from: 5), for:.normal)
        datePickerBut.setTitleColor(UIColor.black, for: .normal)
        datePickerBut.contentHorizontalAlignment  = .left
        datePickerBut.addTarget(self, action:#selector(datePickerButs), for:.touchUpInside)
        self.view.addSubview(datePickerBut)
        
        
        
        
        datePicker = UIDatePicker(frame: CGRect(x:0, y:self.view.frame.size.height - 216, width:kScreenWidth, height:216))
        datePicker.locale = Locale(identifier: "zh_CN")
        datePicker.addTarget(self, action: #selector(dateChanged),
                             for: .valueChanged)
        self.view.addSubview(datePicker)
        datePicker.isHidden = true
        
    }
    
    
    @objc  func segmentDidchange(_ segmented:UISegmentedControl){
        
        typeStr = segmented.titleForSegment(at: segmented.selectedSegmentIndex)
    }
    
    @objc  func classButs(){
        
        let viewC = ClassViewController ()
        self.navigationController?.pushViewController(viewC, animated: true)
    }

    
    override func viewWillAppear(_ animated: Bool) {
        
        textField.becomeFirstResponder()
        datePicker.isHidden = false
        let classUserDefault = UserDefaults.standard
        classBut.setTitle("\(classUserDefault.object(forKey:"typeName") ?? "") - \(classUserDefault.object(forKey:"classname") ?? "")", for:.normal)

    
        
    }
    
    
    @objc  func saveButtonItem( ){
        
        
        
        let mybook = books()
        
        if let text = textField.text {
            
            if( text.count > 0) {
                
                mybook.amount = textField.text ?? ""
                mybook.type = typeStr
                mybook.year  = (datePickerStr as NSString).substring(to: 4)
                mybook.month  = (datePickerStr as NSString).substring(with: NSMakeRange(5, 2))
                mybook.day  = (datePickerStr as NSString).substring(with: NSMakeRange(8, 2))
                mybook.time  = (datePickerStr as NSString).substring(from: 11)
                let classUserDefault = UserDefaults.standard

                mybook.className = classUserDefault.object(forKey:"typeName") as! String
                mybook.useName = classUserDefault.object(forKey:"classname") as! String
                

                let realm = try! Realm()
                try! realm.write {
                    realm.add(mybook)
                    
                    
                }
                
            
                
                
                
                self.navigationController? .popViewController(animated: true)
            }
                
            else
            {
                
            }
            
        }
        
        
        
    }
    @objc  func datePickerButs(){
        textField.resignFirstResponder()
        
        
    }
    
    //日期选择器响应方法
    @objc  func dateChanged(datePicker : UIDatePicker){
        //更新提醒时间文本框
        let formatter = DateFormatter()
        //日期样式
        formatter.dateFormat = "yyyy-MM-dd HH:mm"
        datePickerStr = formatter.string(from: datePicker.date)
        datePickerBut.setTitle((datePickerStr as NSString).substring(from: 5), for:.normal)
        
    }
    
    
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        var newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
        let expression = "^[0-9]*(?:\\.[0-9]{0,2})?$"
        
        do {
            let regex: NSRegularExpression = try NSRegularExpression(pattern: expression, options: NSRegularExpression.Options.caseInsensitive)
            let numberOfMatches = regex.matches(in: newString, options: NSRegularExpression.MatchingOptions.reportProgress, range: NSMakeRange(0, newString.count))
            
            if numberOfMatches.count == 0{
                return false
            }else{
                
                if newString != "" {
                    if newString[newString.startIndex] == "." {
                        newString = "0" + newString
                    }
                    
                    if newString[newString.index(before: newString.endIndex)] == "." {
                        newString = newString + "0"
                    }
                    
                    
                }
                return true
            }
        }
        catch {
            return false
        }
    }
    

  
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}


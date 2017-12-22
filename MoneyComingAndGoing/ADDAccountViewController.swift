//
//  ADDAccountViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/20.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ADDAccountViewController: UIViewController {
    
    var textField :UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.tabBarController?.tabBar.isHidden = true
        
        
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
        
        
        let items = ["支出", "收入", "转账","借贷"] as [Any]
        let segmented = UISegmentedControl(items:items)
        segmented.frame = CGRect(x:20, y:100, width:kScreenWidth-40, height:40)
        
        //        segmented.center = self.view.center
        segmented.selectedSegmentIndex = 1 //默认选中第二项
        segmented.addTarget(self, action: #selector(ADDAccountViewController.segmentDidchange(_:)),
                            for: .valueChanged)  //添加值改变监听
        self.view.addSubview(segmented)
        
        
         textField = UITextField(frame: CGRect(x:10, y:140, width:kScreenWidth-20, height:40))
         textField.placeholder = "输入记账金额"
         textField.keyboardType = UIKeyboardType.decimalPad
        self.view.addSubview(textField)
        
    }
    
    
    @objc  func segmentDidchange(_ segmented:UISegmentedControl){
        //获得选项的索引
        print(segmented.selectedSegmentIndex)
        //获得选择的文字
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        textField.becomeFirstResponder()
    }
    
    
    @objc  func saveButtonItem( ){
       

        let userDefault = UserDefaults.standard
        
        userDefault.set(textField.text, forKey: "name")
        userDefault.synchronize()
        
        self.navigationController? .popViewController(animated: true)

    }
    
    override func viewWillDisappear(_ animated: Bool) {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}


//
//  ViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/12.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
var days = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view!.backgroundColor = UIColor.white
//        self.title = "圖表"
        
        let items = ["支出", "收入"] as [Any]
        let segmented = UISegmentedControl(items:items)
        segmented.frame = CGRect(x:20, y:66, width:kScreenWidth-40, height:40)

        //        segmented.center = self.view.center
        segmented.selectedSegmentIndex = 1 //默认选中第二项
        segmented.addTarget(self, action: #selector(ADDAccountViewController.segmentDidchange(_:)),
                            for: .valueChanged)  //添加值改变监听
        self.view.addSubview(segmented)

    }

    
    @objc  func segmentDidchange(_ segmented:UISegmentedControl){
        //获得选项的索引
        print(segmented.selectedSegmentIndex)
        //获得选择的文字
        print(segmented.titleForSegment(at: segmented.selectedSegmentIndex))
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


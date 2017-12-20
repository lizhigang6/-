//
//  BOPViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/13.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class BOPViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "收支"
        
        let imageView = UIImageView(image:UIImage(named:"pb_back"))
        imageView.frame = CGRect(x:0, y:0, width:640, height:350)
        self.view.addSubview(imageView)
        
        let revenue = UILabel(frame:CGRect(x:10, y:200, width:640, height:40))
        let revenueStr = "0.00"
        revenue.text = "本月收入：\(revenueStr)"
        revenue.textColor = UIColor.white
        imageView.addSubview(revenue);
        
        
        let place = UILabel(frame:CGRect(x:10, y:260, width:640, height:40))
        let placeStr = "0.00"
        place.text = "本月支出：\(placeStr)"
        place.textColor = UIColor.white
        imageView.addSubview(place);
        
        
        let button:UIButton = UIButton(type:.custom)
        button.frame = CGRect(x:50, y:320, width:260, height:40)
        button.backgroundColor = UIColor.yellow
        button.setTitle("记一笔", for:.normal)
        button.addTarget(self, action:#selector(tapped), for:.touchUpInside)
       

        self.view.addSubview(button)
        
    }
   @objc  func tapped(){
        print("tapped")
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

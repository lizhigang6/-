//
//  BOPViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/13.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
//http://www.hangge.com/blog/cache/detail_891.html
class BOPViewController: UIViewController {
    
    var revenue :UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent  = true
        self.title = "收支"
        
        let imageView = UIImageView(image:UIImage(named:"pb_back"))
        imageView.frame = CGRect(x:0, y:0, width:kScreenWidth, height:350)
        self.view.addSubview(imageView)
        
        
        revenue = UILabel(frame:CGRect(x:10, y:200, width:kScreenWidth-20, height:40))
        
        
        revenue.textColor = UIColor.white
        imageView.addSubview(revenue);
        
        
        let place = UILabel(frame:CGRect(x:10, y:260, width:kScreenWidth-20, height:40))
        let placeStr = "0.00"
        place.text = "本月支出：\(placeStr)"
        place.textColor = UIColor.white
        imageView.addSubview(place);
        
        
        let button:UIButton = UIButton(type:.custom)
        button.frame = CGRect(x:50, y:330, width:kScreenWidth-100, height:40)
        button.backgroundColor = UIColor(red: 0xf4/255, green: 0xea/255, blue: 0x2a/255, alpha: 1.0)
        button.setTitle("记一笔", for:.normal)
        button.layer.cornerRadius = 10;
        
        button.addTarget(self, action:#selector(tapped), for:.touchUpInside)
        
        
        self.view.addSubview(button)
        
    }
    @objc  func tapped(){
        
        let viewC = ADDAccountViewController ()
        self.navigationController?.pushViewController(viewC, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let userDefault = UserDefaults.standard
        
        let revenueStr = userDefault.object(forKey: "name")
        
//        var eee = revenueStr as! String
//        if eee != nil {
//            eee  = "0.00"
//        }
//        revenue.text = "本月收入：\(revenueStr as! String)"
        
    }
    
    func showName(_ name: String?){
        
        if name != nil {
            print("name")
        }else{
            print("anme is nil")
        }
        
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


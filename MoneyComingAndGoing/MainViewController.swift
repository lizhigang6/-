//
//  MainViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/12.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.creatSubViewControllers()

    }

    func creatSubViewControllers(){
        let BOPVC  = BOPViewController ()
        let item1 : UITabBarItem = UITabBarItem (title: "收支", image: UIImage(named: "tabbar_bop"), selectedImage: UIImage(named: "tabbar_bop"))
        BOPVC.tabBarItem = item1
        
        let secondVC = ViewController ()
        let item2 : UITabBarItem = UITabBarItem (title: "图标", image: UIImage(named: "tabbar_graph"), selectedImage: UIImage(named: "tabbar_graph"))
        secondVC.tabBarItem = item2
        
        let otherVC = FindViewController ()
        let item3 : UITabBarItem = UITabBarItem (title: "发现", image: UIImage(named: "tabbar_find"), selectedImage: UIImage(named: "tabbar_find"))
        otherVC.tabBarItem = item3
        
        let meVC = MeViewController ()
        let item4 : UITabBarItem = UITabBarItem (title: "我的", image: UIImage(named: "tabbar_me"), selectedImage: UIImage(named: "tabbar_me"))
        meVC.tabBarItem = item4
        self.tabBar.tintColor = UIColor(red: 0xf4/255, green: 0xea/255, blue: 0x2a/255, alpha: 1.0)
        let tabArray = [UINavigationController(rootViewController: BOPVC),secondVC,UINavigationController(rootViewController: otherVC),UINavigationController(rootViewController: meVC)]
        
        self.viewControllers = tabArray
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

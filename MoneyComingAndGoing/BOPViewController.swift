//
//  BOPViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/13.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import RealmSwift




//http://www.hangge.com/blog/cache/detail_891.html
class BOPViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {
    
    var revenue :UILabel!
    var place :UILabel!
    var difference :UILabel!
    
    
    var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.isTranslucent  = true
        self.title = "收支"
        
        

        
        let imageView = UIImageView(image:UIImage(named:"pb_back"))
        imageView.frame = CGRect(x:0, y:0, width:kScreenWidth, height:350)
        self.view.addSubview(imageView)
        
        
        revenue = UILabel(frame:CGRect(x:10, y:200, width:kScreenWidth-20, height:40))
        revenue.textColor = UIColor.white
        imageView.addSubview(revenue)
        
        
        place = UILabel(frame:CGRect(x:10, y:260, width:kScreenWidth/2-20, height:40))
        place.textColor = UIColor.white
        imageView.addSubview(place)
        
        
        difference = UILabel(frame:CGRect(x:kScreenWidth/2+10, y:260, width:kScreenWidth/2-20, height:40))
        difference.textColor = UIColor.white
        imageView.addSubview(difference)
        
        
        let button:UIButton = UIButton(type:.custom)
        button.frame = CGRect(x:50, y:330, width:kScreenWidth-100, height:40)
        button.backgroundColor = UIColor(red: 0xf4/255, green: 0xea/255, blue: 0x2a/255, alpha: 1.0)
        button.setTitle("记一笔", for:.normal)
        button.layer.cornerRadius = 10;
        
        button.addTarget(self, action:#selector(tapped), for:.touchUpInside)
        
        
        self.view.addSubview(button)
        
        
        self.tableView = UITableView(frame:CGRect(x:0, y:370, width:kScreenWidth, height:self.view.frame.size.height-370), style:.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 70.0
        self.view.addSubview(self.tableView)
        self.tableView.tableFooterView = UIView()
        
    }
    @objc  func tapped(){
        
        let viewC = ADDAccountViewController ()
        self.navigationController?.pushViewController(viewC, animated: true)
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        self.tabBarController?.tabBar.isHidden = false

        let realm = try! Realm()
        
        let puppies = realm.objects(books.self)
        
        if puppies.count > 0 {
            
            var amounts = 0.00
            var placestr = 0.00
            
            for name in puppies {
                
                if(name.type .starts(with: "收入") )
                {
                    amounts = amounts + Double(name.amount)!
                    
                }
                else
                {
                    placestr = placestr + Double(name.amount)!
                    
                }
                
            }
            
            revenue.text = "本月收入：\(amounts)"
            place.text = "本月支出：\(placestr)"
            difference.text = "本月差额：\(amounts - placestr)"
            
            
        }
        else
        {
            revenue.text = "本月收入：0.00"
            place.text = "本月支出：0.00"
            difference.text = "本月差额：0.00"
            
            
        }
        
        self.tableView.reloadData()
        
        
    }
    
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let realm = try! Realm()
        
        let puppies = realm.objects(books.self)
        
        return puppies.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "testCellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
            
            let    typeName = UILabel(frame:CGRect(x:10, y:5, width:kScreenWidth-20, height:30))
            typeName.font = UIFont(name:"Arial",size:14)
            typeName.tag = 100
            cell!.addSubview(typeName)
            
            let   dates = UILabel(frame:CGRect(x:10, y:35, width:kScreenWidth-20, height:20))
            dates.textColor = UIColor.gray
            dates.font = UIFont(name:"Arial",size:12)
            dates.tag = 200
            
            cell!.addSubview(dates)
            
            
            let  amount = UILabel(frame:CGRect(x:10, y:0, width:kScreenWidth-20, height:70))
            amount.textAlignment = .right
            amount.tag = 300
            
            cell!.addSubview(amount)
        }
        
        let realm = try! Realm()
        let puppies = realm.objects(books.self)
        let puppiesDict = puppies[puppies.count - indexPath.row - 1];
        let typeName = cell?.viewWithTag(100) as! UILabel
        let dates = cell?.viewWithTag(200) as! UILabel
        let amount = cell?.viewWithTag(300) as! UILabel
        
        typeName.text = puppiesDict.useName
        dates.text = "\(puppiesDict.month)-\(puppiesDict.day) \(puppiesDict.time)"
        amount.text = puppiesDict.amount
        
        
        if(puppiesDict.type .starts(with: "收入") )
        {
            amount.textColor = UIColor.green
            
        }
        else
        {
            amount.textColor = UIColor.red
            
        }
        
        
        
        return cell!
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView .deselectRow(at: indexPath, animated: true)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}


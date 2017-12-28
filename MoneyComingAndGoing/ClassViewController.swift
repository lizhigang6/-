//
//  ClassViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/27.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import RealmSwift


//消费类型
class ConsumeType:Object {
    @objc dynamic var typeName = ""
}

class typeClass: Object {
    @objc dynamic var typeName = ""
    @objc dynamic var classname = ""
    @objc dynamic var type:ConsumeType?
    
    
}

class ClassViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {
    var tableView:UITableView!
    var typeNameStr:String!
    
    var classTableView:UITableView!
    var consumeItems:Results<typeClass>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "选择类别"
        
        
        let type1 = ConsumeType()
        type1.typeName = "固定支出"
        
        let type2 = ConsumeType()
        type2.typeName = "常用"
        
        typeNameStr = "常用"
        
        let realm = try! Realm()
        
        let myTypeClass = realm.objects(typeClass.self)
        
        if(myTypeClass.count < 1)  {
            
            let arte = ["房租","交通","电话费","网费","信用卡还款"]
            let realm = try! Realm()
            try! realm.write {
                
                for i in 0...4{
                    let myTypeClass = typeClass()
                    myTypeClass.typeName = "固定支出"
                    myTypeClass.type = type1
                    myTypeClass.classname = arte [i]
                    realm.add(myTypeClass)
                    
                }
            }
            
            
            let arte2 = ["服饰","旅游","医疗","生活缴费","其他"]
            try! realm.write {
                
                for i in 0...4{
                    let myTypeClass = typeClass()
                    myTypeClass.typeName = "常用"
                    myTypeClass.type = type2
                    myTypeClass.classname = arte2 [i]
                    realm.add(myTypeClass)
                    
                }
            }
            
        }
        
        
        self.tableView = UITableView(frame:CGRect(x:0, y:0, width:kScreenWidth/3, height:self.view.frame.size.height), style:.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.tag = 1
        self.tableView.rowHeight = 50.0
        self.view.addSubview(self.tableView)
        self.tableView.selectRow(at: IndexPath(row: 0, section: 0), animated: true, scrollPosition: UITableViewScrollPosition.none)
        self.tableView.tableFooterView = UIView()
        
        
        self.classTableView = UITableView(frame:CGRect(x:kScreenWidth/3, y:0, width:kScreenWidth/3*2, height:self.view.frame.size.height), style:.plain)
        self.classTableView.delegate = self
        self.classTableView.dataSource = self
        self.classTableView.rowHeight = 50.0
        self.view.addSubview(self.classTableView)
        self.classTableView.tableFooterView = UIView()
        
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        let realm = try! Realm()
        
        if(tableView.tag == 1)
        {
            
            
            
            
            return 2
            
        }
        else
        {
            
            if(typeNameStr == "固定支出")
            {
                consumeItems = realm.objects(typeClass.self).filter("type.typeName = '固定支出'")
                
            }
            else
            {
                consumeItems = realm.objects(typeClass.self).filter("type.typeName = '常用'")
                
            }
            
            return consumeItems!.count
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellID = "testCellID"
        
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
            
        }
        if(tableView.tag == 1)
        {
            if(indexPath.row == 0)
            {
                cell?.textLabel?.text = "常用"
                
            }
            else
            {
                cell?.textLabel?.text = "固定支出"
                
            }
            
            
            
        }
        else
        {
            let realm = try! Realm()
            
            if(typeNameStr == "固定支出")
            {
                consumeItems = realm.objects(typeClass.self).filter("type.typeName = '固定支出'")
                
            }
            else
            {
                consumeItems = realm.objects(typeClass.self).filter("type.typeName = '常用'")
                
            }
            
            cell?.textLabel?.text = consumeItems![indexPath.row].classname
            
        }
        
        
        
        return cell!
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        if(tableView.tag != 1)
        {
            tableView .deselectRow(at: indexPath, animated: true)
            let realm = try! Realm()
            
            if(typeNameStr == "固定支出")
            {
                consumeItems = realm.objects(typeClass.self).filter("type.typeName = '固定支出'")
                
            }
            else
            {
                consumeItems = realm.objects(typeClass.self).filter("type.typeName = '常用'")
                
            }
            

            let classUserDefault = UserDefaults.standard
            classUserDefault.set(typeNameStr, forKey: "typeName")
            classUserDefault.set(consumeItems![indexPath.row].classname, forKey: "classname")

            classUserDefault.synchronize()
            
            self.navigationController? .popViewController(animated: true)
            
        }
        else
        {
            if(indexPath.row == 0)
            {
                typeNameStr =  "常用"
            }
            else
            {
                typeNameStr =  "固定支出"
                
            }
            
            self.classTableView.reloadData()
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    
}


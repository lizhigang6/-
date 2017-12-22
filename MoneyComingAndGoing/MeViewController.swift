//
//  MeViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/12.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import LocalAuthentication


protocol MOGTouchDeledagte {
    /// 验证成功
    func mog_touchSuccess()
    /// 验证失败（错误码）
    func mog_touchFailure(error:Int)
    /// 当前设备不支持指纹解锁
    func mog_notSupport()
}


class MeViewController: UIViewController,UITableViewDelegate ,UITableViewDataSource {

    var tableView:UITableView!
    var dataArray = NSMutableArray()
    var uiswitch = UISwitch()
    
    let cellID = "testCellID"

    override func viewDidLoad() {
        super.viewDidLoad()

        
   
       
        
        self.title = "我的"
        
        self.dataArray = ["面容ID/手势密码",
                          "联络我们",
                          "关于"]
        
        
        self.tableView = UITableView(frame:CGRect(x:0, y:0, width:kScreenWidth, height:self.view.frame.size.height), style:.plain)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 50.0
        self.view.addSubview(self.tableView)
        self.tableView.tableFooterView = UIView()

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.dataArray.count;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        cell!.textLabel!.text = self.dataArray[indexPath.row] as? String
        
        
        if (indexPath.row == 0) {
            
            uiswitch.center = CGPoint(x:kScreenWidth-45, y:25)
            uiswitch.isOn = true;
            
            uiswitch.addTarget(self, action: #selector(switchDidChange), for:.valueChanged)

            cell!.contentView.addSubview(uiswitch);
            
            
            
        }
        else
        {
            let imageView = UIImageView(image:UIImage(named:"go_right"))
            imageView.frame = CGRect(x:kScreenWidth-35, y:15, width:20, height:20)
            
            
            cell!.contentView.addSubview(imageView)
            
        }
        return cell!
        
        
    }
    
   @objc func switchDidChange (){
        
        
        if (uiswitch.isOn) {
            
            let context = LAContext()
            var error: NSError?
            if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
                // 下面是开始指纹解锁的代码
            }
            else {
//                if let error = error as? NSError {
//                    // 获取错误信息
//                    let message = self.errorMessageForLAErrorCode(errorCode: error.code)
//                    print(message)
//                }
            }
        
           
        }
        else
        {
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        tableView .deselectRow(at: indexPath, animated: true)
        if (indexPath.row == 0)
        {
            self.deblocking ()
            
        }
        else if (indexPath.row == 1)
        {
            self.switchDidChange ()
        }
        else if (indexPath.row == 2)
        {
           // UIApplication.shared.openURL(URL(string: "sms://18638106558")!)
            
            
        }
        else if (indexPath.row == 3)
        {
//            self.navigationController?.pushViewController(AboutViewController(), animated: false);
        }
        
    }

    func deblocking (){
        let authentication = LAContext()
        var error: NSError?
        //2.检查Touch ID是否可用
        let isAvailable = authentication.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics,
                                                           error: &error)
        //3.处理结果
        if isAvailable
        {
            NSLog("Touch ID is available")
            //这里是采用认证策略 LAPolicy.DeviceOwnerAuthenticationWithBiometrics
            //--> 指纹生物识别方式
            authentication.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "这里需要您的指纹来进行识别验证", reply: {
                //当调用authentication.evaluatePolicy方法后，系统会弹提示框提示用户授权
                (success, error) -> Void in
                if success
                {
                    NSLog("您通过了Touch ID指纹验证！")
                }
                else
                {
                    //上面提到的指纹识别错误
                    NSLog("您未能通过Touch ID指纹验证！错误原因：\n\(error)")
                }
            })
        }
        else
        {
            //上面提到的硬件配置
            NSLog("Touch ID不能使用！错误原因：\n\(error)")
        }
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

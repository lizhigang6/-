//
//  FindViewController.swift
//  MoneyComingAndGoing
//
//  Created by user on 2017/12/13.
//  Copyright © 2017年 user. All rights reserved.
//

import UIKit
import Alamofire






//http://blog.csdn.net/lvchenqiang_/article/details/77418272
class FindViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
//        var header:HTTPHeaders = [:]
//        if let authorizationHeader = Request.authorizationHeader(user: "token", password: "bearer -dl6kbQ8FZGJn-uEsnL41QiPUCEpFDOpEzVVbSTMvS_qFTDOxymCg62UN0CyBzMF0vuj54Lk-rI6FnrYAcs71I-5X0Befe98IRBzEi576suOUjMXZNvl6L0db5FO99a--7UAOxGh17OAmMjSoxhAnoHLJCCpljSxfrzG7wQFHgOcSP43_LfF77E6ufKNu2jltJYzI9NVsy3z9nPktmRbtD0abVBQIzJZYcC_pxcwqrg") {
//            header[authorizationHeader.key] = authorizationHeader.value
//        }
////        // 此处的 URLEncoding.default （URLEncoding.queryString ）会将parameters 拼接到url后面
////        Alamofire.request("http://tnewposapi.easesales.com/api/language/GetLanguage", method: HTTPMethod.get, parameters: ["langEnum":"en","platformEnum":"IOS","sysVersion":"11.2.1","appVersion":"2.0","shopId":""], encoding: URLEncoding.default, headers: header).responseJSON { (response) in
////            if(response.error == nil){
////                print("请求成功")
////                print(response.result.value)
////            }else{
////                print("请求失败\(String(describing: response.error))")
////            }
////
////        }
////
//        //post 請求
//        Alamofire.request("http://10.20.0.123:888/api/client/GetClientInfoById", method: .get, parameters: ["cashierNo":"","langEnum":"en","platformEnum":"IOS","sysVersion":"11.2.1","appVersion":"2.0","shopId":""], encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//
//            if(response.error == nil){
//                print("请求成功")
//                print(response.result.value)
//            }else{
//                print("请求失败\(String(describing: response.error))")
//            }
//
//        }
        
//        Alamofire.request("http://tnewposapi.easesales.com/api/language/GetLanguage？langEnum=en&platformEnum=IOS&sysVersion=11.2.1&appVersion=2.0&shopId=", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
//            if(response.error == nil){
//                let dict  = response.result.value
//
//
//            }else{
//                NSLog("请求失败\(String(describing: response.error))")
//            }
//
//        }
        
        
       
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

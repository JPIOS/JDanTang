//
//  NetworkTool.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/14.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit
import Alamofire
import Foundation
import SwiftyJSON
import SVProgressHUD





class NetworkTool: NSObject {
    
    /// 单利
    static let shareNetworkTool = NetworkTool()
    
}

extension NetworkTool {
    
    
    func getRequest(urlString: String, params: [String: Any], success: @escaping (_ response : JSON)-> (),failture: @escaping (_ error: Error)-> ())  {
        
        let NewUrlString:String = BASE_URL+urlString
        print("NewUrlString ==  " + NewUrlString)
        
        SVProgressHUD.show(withStatus: "正在加载...")
        Alamofire.request(NewUrlString, method: .get, parameters: params)
            .responseJSON { (response) in
                SVProgressHUD.dismiss()
                guard response.result.isSuccess else {
                    SVProgressHUD.showError(withStatus: "加载失败...")
                    return
                }
                
                
                if let value = response.result.value {
                    let dict = JSON(value)
                    let code = dict["code"].intValue
                    let message = dict["message"].stringValue
                    guard code == RETURN_OK else {
                        SVProgressHUD.showInfo(withStatus: message)
                        return
                    }
                 //   let data = dict["data"].dictionary
                    
          
                    success(dict)
                  
                }
                /* /*这里使用了闭包*/
                //当请求后response是我们自定义的，这个变量用于接受服务器响应的信息
                //使用switch判断请求是否成功，也就是response的result
                switch response.result {
                case .success(let value):
                    //当响应成功是，使用临时变量value接受服务器返回的信息并判断是否为[String: AnyObject]类型 如果是那么将其传给其定义方法中的success
                    //if let value = response.result.value as? [String: AnyObject] {
                   // success(value as! [String : AnyObject])
                    //                    }
                    let json = JSON(value)
                    print(json)
                    success(value as! [String : AnyObject])
                case .failure(let error):
                    failture(error)
                    print("error:\(error)")*/
                }
    }
    }
    
    
    
    //MARK: - POST 请求
    func postRequest(urlString : String, params : [String : Any], success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()) {
        
        Alamofire.request(urlString, method: HTTPMethod.post, parameters: params).responseJSON { (response) in
            switch response.result{
            case .success:
                if let value = response.result.value as? [String: AnyObject] {
                    success(value)
                    let json = JSON(value)
                    print(json)
                }
            case .failure(let error):
                failture(error)
                print("error:\(error)")
            }
            
        }
    }

    
    
    
    //MARK: - 照片上传
    ///
    /// - Parameters:
    ///   - urlString: 服务器地址
    ///   - params: ["flag":"","userId":""] - flag,userId 为必传参数
    ///        flag - 666 信息上传多张  －999 服务单上传  －000 头像上传
    ///   - data: image转换成Data
    ///   - name: fileName
    ///   - success:
    ///   - failture:
    func upLoadImageRequest(urlString : String, params:[String:String], data: [Data], name: [String],success : @escaping (_ response : [String : AnyObject])->(), failture : @escaping (_ error : Error)->()){
        
        let headers = ["content-type":"multipart/form-data"]
        
        Alamofire.upload(
            multipartFormData: { multipartFormData in
                //666多张图片上传
                let flag = params["flag"]
                let userId = params["userId"]
                
                multipartFormData.append((flag?.data(using: String.Encoding.utf8)!)!, withName: "flag")
                multipartFormData.append( (userId?.data(using: String.Encoding.utf8)!)!, withName: "userId")
                
                for i in 0..<data.count {
                    multipartFormData.append(data[i], withName: "appPhoto", fileName: name[i], mimeType: "image/png")
                }
        },
            to: urlString,
            headers: headers,
            encodingCompletion: { encodingResult in
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseJSON { response in
                        if let value = response.result.value as? [String: AnyObject]{
                            success(value)
                            let json = JSON(value)
                            print(json)
                        }
                    }
                case .failure(let encodingError):
                    print(encodingError)
                    failture(encodingError)
                }
        }
        )
    
}
    
    
    
    


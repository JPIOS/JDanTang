//
//  JHomeDetailVCViewController.swift
//  JDanTang
//
//  Created by 家朋 on 2017/8/1.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class JHomeDetailVC: UIViewController ,UIWebViewDelegate{

    var selectItem: ChoicenessModel?
    let tabView: UITableView! = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 64))
    let webView: UIWebView? = UIWebView.init(frame: CGRect.init(x: 0, y:64.0, width: kScreenWidth, height: kScreenHeight - 64))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSubview()
        loadHead()
        
        self.title = "攻略详情"
    }

    
    func loadSubview()  {
    
        self.view.backgroundColor = UIColor.white
        view.addSubview(self.tabView)
        view.addSubview(webView!) 
        webView?.delegate = self
        webView?.loadRequest(URLRequest.init(url: URL.init(string: (selectItem?.contentUrl!)!)!))
        
    }
    
    func loadHead()  {
//        
//        let headView :UIView = UIView.init(frame :CGRect.init(x: 0, y: 0, width: kScreenWidth, height: 120))
//        headView.backgroundColor = UIColor.red
//        webView?.addSubview(headView)
        
        
      
    }

    
    // MARK: UIWebViewDelegate
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        
    }

}

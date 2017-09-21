//
//  JHomeVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

import Alamofire
import SwiftyJSON
import SVProgressHUD

class JHomeVC: BaseVC ,SegCollectionDelegate,SegementBarDelegate{
 
    
    var segmemtBarView: segementBar!
    var segContentView: SegCollection!
    var homeItems = [JHomeHeaderItem]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
            loadSubview()
            loadHeadData()
      

    }
  
    override func viewWillAppear(_ animated: Bool) {
 
    }
    
    func loadSubview()  {

        
        let segBar: segementBar = segementBar.init(frame: CGRect.init(x: 0, y: 64, width: kScreenWidth, height: 40), titles: [""], font:14)
        
        segBar.delegate = self
        segmemtBarView = segBar
        
        // 下部的视图-vc
        let contentView :SegCollection = SegCollection.init(frame: CGRect.init(x: 0, y: 64 + 40, width: kScreenWidth, height: kScreenHeight - 64 - 40 ), contentArr: [UIViewController()])
        contentView.backgroundColor = UIColor.white
        
        contentView.delegate = self
        segContentView = contentView
        view.addSubview(segmemtBarView)
        view.addSubview(segContentView)
    }
    
    /// 头部的数据请求
    //http://api.dantangapp.com/v2/channels/preset?gender=1&generation=1
    func loadHeadData() {
        
        NetworkTool.shareNetworkTool.getRequest(urlString: "/v2/channels/preset", params: ["gender":"1","generation":"1"], success: { (result) in
            let resutDic = result.dictionary
            let  rawDictionary = resutDic?["data"]?.dictionary!
           
            
            if let items = rawDictionary?["channels"]?.arrayObject
            {
                for item in items {
                
                    let headItem = JHomeHeaderItem.getHomeHeaderItem(json: item as! [String : Any]);
                    print("ddddd ==  \(headItem)");
                    self.homeItems.append(headItem)
                }
                
                
                self.reloadSubview()
               
            }
          }) { (error) in
           
        }
    }
    

    func reloadSubview()  {
        
        
        //头部的bar
        var  titles = [String]()
        var viewCOntrollers = [UIViewController]()
        
        
        for item:JHomeHeaderItem in homeItems {
            titles.append((item.name)!)
            if item.id == 4 {
                // 精选
                let firstVC = ChoicenessVC()
                firstVC.parantVC = self
                viewCOntrollers.append(firstVC)
            } else {
                // 其他
                let otherVC = JHomeOthersVC()
                otherVC.type = item.id
                otherVC.parantVC = self
                viewCOntrollers.append(otherVC)
            }
            
        }
        
        segmemtBarView.setTitles(titles: titles)
        segContentView.setContentViewCrollers(viewControllers: viewCOntrollers)
    }
    
    //MARK: SegCollectionDelegate && SegementBarDelegate
    func scrollerToDexVC(scorToDex: Int) {
        
        print("scorToDex = \(scorToDex)")
       segmemtBarView.scrollToDexTitle(titleDex: scorToDex)
    }
    
    func clickSegTitleBar(clickTitleDex: Int) {
        print("clickTitleDex = \(clickTitleDex)")
        segContentView.clickToDexViewController(viewControllerDex: clickTitleDex)
    }

 
}

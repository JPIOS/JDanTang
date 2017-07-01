//
//  JHomeVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

import Alamofire

class JHomeVC: BaseVC ,SegCollectionDelegate,SegementBarDelegate{
 
    
    var segmemtBarView: segementBar!
    var segContentView: SegCollection!
    override func viewDidLoad() {
        super.viewDidLoad()
        //头部的bar
        let segBar: segementBar = segementBar.init(frame: CGRect.init(x: 0, y: 64, width: kScreenWidth, height: 40), titles: ["精选","数码","家具","美物","护美","美食"], font:14)
   
        segBar.delegate = self
        segmemtBarView = segBar
        
        //下部的视图-vc
        let VCArr = [ChoicenessVC(),JHomeOthersVC(),JHomeOthersVC(),JHomeOthersVC(),JHomeOthersVC(),JHomeOthersVC()]
        let contentView :SegCollection = SegCollection.init(frame: CGRect.init(x: 0, y: 64 + 40, width: kScreenWidth, height: kScreenHeight - 64 - 40 ), contentArr: VCArr)
        contentView.backgroundColor = UIColor.white
      
        contentView.delegate = self
        segContentView = contentView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // self.navigationController?.navigationBar.isHidden = true
     
        self.view.addSubview(segmemtBarView)
        view.addSubview(segContentView)
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

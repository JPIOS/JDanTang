//
//  JDanTangVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

import SwiftyJSON
import SVProgressHUD
 
import ObjectMapper

class JDanTangVC: BaseVC,UICollectionViewDelegate,UICollectionViewDataSource {

    var sourceData :NSMutableArray!
    var collection :UICollectionView! = nil
    let JDanTangCellID = "JDanTangCellID"
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadSubview()
        loadCommnet()
     
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        loadData()
    }
    
    func  loadSubview(){
        
        loadCollection()
    
    };
    
    /// 设置collectionView
    func loadCollection() {
        let layout =  UICollectionViewFlowLayout()
        let insetEdge : CGFloat  = 8
        let cellEdge  : CGFloat  = 10
        let cul : CGFloat = 2
     
        let cellWidth = (kScreenWidth - ((insetEdge) * 2) - ((cul - 1) * cellEdge))
        let cellHeight = cellWidth / cul * 1.1 + 60
        
        layout.itemSize = CGSize.init(width: cellWidth / cul ,height: cellHeight)
        layout.minimumLineSpacing = cellEdge
        layout.minimumInteritemSpacing = cellEdge
        collection = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight ), collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        view.addSubview(collection)
        collection.register(UINib.init(nibName: "JDanTangCell", bundle: nil), forCellWithReuseIdentifier: JDanTangCellID)
        collection.backgroundColor = JGlobalColor();
        
        collection.contentInset = UIEdgeInsets.init(top: insetEdge, left: insetEdge, bottom: insetEdge, right: insetEdge)
    }
    
    /// 初始化数据
    func loadCommnet()  {
        
        sourceData = [JDanTangModel]() as! NSMutableArray
    }
 
    //MARK: 数据请求
    func loadData() {
         SVProgressHUD.show(withStatus: "正在加载...")
        let param = ["gender":"1","generation":"1","limit":"20","offset":"0"]
         NetworkTool.shareNetworkTool.getRequest(urlString:"/v2/items", params: param, success: { (result) in
            let data = result["data"].dictionary
            if let items = data!["items"]?.arrayObject
            {
                var models = [JDanTangModel]()
                
                for item in items {
                    let dd = JSON(item);
                    let dic = dd.dictionaryObject;
                    let ItemModel = JDanTangModel.getItem(json: dic!["data"]! as! [String : Any]);
                    print("ddddd ==  \(dd)");
                    models.append(ItemModel)
                }
                self.sourceData = models as! NSMutableArray
                self.collection.reloadData()
            }
            print(result)
   
         }) { (error) in
              SVProgressHUD.showError(withStatus: "加载失败...")
        }
    }
    
    
    //MARK: UICollectionViewDelegate&&UICollectionViewDataSource
 
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.sourceData.count;
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell : JDanTangCell = collectionView.dequeueReusableCell(withReuseIdentifier: JDanTangCellID, for: indexPath) as! JDanTangCell
        
        let model = self.sourceData.object(at: indexPath.row)
        // 使用模型刷新cell
        cell.setModel(model: model as! JDanTangModel)
        return cell
    }
    
    /// 设置MJ的刷新
    func setMJFrensh() {
        
    }
    
}

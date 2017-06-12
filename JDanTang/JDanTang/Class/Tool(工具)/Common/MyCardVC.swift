//
//  MyCardVC.swift
//  JDanTang
//
//  Created by 家朋 on 2017/6/12.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class MyCardVC: UIViewController,UITableViewDelegate,UITableViewDataSource {
    var JTab:UITableView?
    var sourceData:NSMutableArray?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComment()
        loadSubView()
   
    }
    func loadComment()  {
        title = "我的身份"
        sourceData = NSMutableArray.init()
        let item1:MoreItem = MoreItem()
        item1.isArrow = true
        item1.title = "性别"
        item1.subTitle = "女孩"
        
        let item2:MoreItem = MoreItem()
        item2.isArrow = true
        item2.title = "角色"
        item2.subTitle = "高中"
      
        sourceData?.add(item1)
        sourceData?.add(item2)
    }
    func loadSubView()  {
        
        JTab = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 64))
        view.addSubview(JTab!)
        JTab?.delegate = self
        JTab?.dataSource = self
        JTab?.tableFooterView = UIView()
        JTab?.backgroundColor = JGlobalColor()
        
        
    }
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return 2
    }
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellID:String = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if  cell == nil {
            cell = UITableViewCell.init(style: UITableViewCellStyle.value1, reuseIdentifier: cellID)
        }
       
        let item :MoreItem = sourceData?.object(at: indexPath.row) as! MoreItem
        cell?.textLabel?.text = item.title
        cell?.detailTextLabel?.text = item.subTitle
        cell?.textLabel?.textColor = RGB(r: 51, g: 51, b: 51)
        cell?.detailTextLabel?.textColor = RGB(r: 151, g: 151, b: 151)
        cell?.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
         tableView.deselectRow(at: indexPath, animated: true)
        
        let item :MoreItem = sourceData?.object(at: indexPath.row) as! MoreItem
        if indexPath.row == 0 {
            let VC :SelectSexVC = SelectSexVC()
            VC.sexName = item.subTitle
            self.navigationController?.pushViewController(VC, animated: true)
        }else
        {
            
        }
    }
    

}

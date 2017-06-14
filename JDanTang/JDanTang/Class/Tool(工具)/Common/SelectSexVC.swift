//
//  SelectSexVC.swift
//  JDanTang
//
//  Created by 家朋 on 2017/6/13.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit


protocol SelectSexDelegate :NSObjectProtocol {
    func clickSexName(sexName:String) 
    
}

class SelectSexVC: BaseVC,UITableViewDelegate,UITableViewDataSource {
    
    open var sexName:String?
    var JTab:UITableView?
    var sourceData:NSMutableArray?
    var delegate :SelectSexDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComment()
        loadSubView()
        
    }
    func loadComment()  {
        title = "性别选择"
        sourceData = NSMutableArray.init()
        let item1:MoreItem = MoreItem()
        item1.isArrow = true
        item1.title = "男孩"
    
        
        let item2:MoreItem = MoreItem()
        item2.isArrow = true
        item2.title = "女孩"
      
        
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
        if item.title == sexName {
            //不存在重用 简单处理咯--偷懒一下 😜
            cell?.textLabel?.textColor = UIColor.red
        }
        return cell!
    }
    
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 40
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item :MoreItem = sourceData?.object(at: indexPath.row) as! MoreItem
        delegate?.clickSexName(sexName: item.title!)
        navigationController?.popViewController(animated: true)
    }
    
    
}

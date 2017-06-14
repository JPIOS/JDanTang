//
//  SelectRoleVC.swift
//  JDanTang
//
//  Created by 家朋 on 2017/6/13.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit





class SelectRoleVC: BaseVC,UITableViewDelegate,UITableViewDataSource {
    
    open var roleName:String?
    var JTab:UITableView?
    var sourceData:NSMutableArray?
    //定义一个闭包-->使用闭包回调
    var selectRoleNameBlock:((_ selectRoleName:String) -> ())?
    override func viewDidLoad() {
        super.viewDidLoad()
        loadComment()
        loadSubView()
        
    }
    func loadComment()  {
        title = "选择身份"
        sourceData = NSMutableArray.init()
        let item1:MoreItem = MoreItem()
        item1.title = "初中生"
        
        
        let item2:MoreItem = MoreItem()
        item2.title = "高中生"
        
        let item3:MoreItem = MoreItem()
        item3.title = "大学生"
        
        let item4:MoreItem = MoreItem()
        item4.title = "职场新人"
        
        let item5:MoreItem = MoreItem()
        item5.title = "资深工作党"
        
        sourceData?.add(item1)
        sourceData?.add(item2)
        sourceData?.add(item3)
        sourceData?.add(item4)
        sourceData?.add(item5)
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
        return (sourceData?.count)!
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
        if item.title == roleName {
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
        selectRoleNameBlock?(item.title!)
        navigationController?.popViewController(animated: true)
    }
    
    
}

//
//  MoreVC.swift
//  JDanTang
//
//  Created by 家朋 on 2017/6/12.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit


class MoreVC: BaseVC, UITableViewDelegate, UITableViewDataSource{
     
    var sourceArr:NSMutableArray?
    var JTab:UITableView?

    override func viewDidLoad() {
        super.viewDidLoad()

        loadComment()
        loadSubview()
    }
    

    override func  viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
        
    }
    private func loadComment() {
        title = "更多"
        
        
        sourceArr =  NSMutableArray.init(capacity: 7)
        
        let item1 : MoreItem = MoreItem()
        item1.icon = "more_icon_share_21x21_.png"
        item1.isArrow = false
        item1.title = "邀请好友使用单糖"
     
        let item2 : MoreItem = MoreItem()
        item2.title = "给我评分吧"
        item2.isArrow = false
        item2.icon = "more_icon_score_21x21_.png"
        
        let item3 : MoreItem = MoreItem()
        item3.title = "意见反馈"
        item3.icon = "more_icon_feedback_21x21_.png"
        item3.isArrow = true
        sourceArr?.add([item1,item2,item3])
        
        
     
        let item4 : MoreItem = MoreItem()
        item4.title = "我的身份"
        item4.isArrow = true
        item4.icon = "checkUserType_icon_identity_21x21_.png"
        item4.className = "MyCardVC"
        
        let item5 : MoreItem = MoreItem()
        item5.icon = "more_icon_notification_21x21_.png"
        item5.title = "接受消息"
        item5.isArrow = false
        
        let item6 : MoreItem = MoreItem()
        item6.icon = "more_icon_clear_21x21_.png"
        item6.title = "清除缓存"
        item6.isArrow = false
        sourceArr?.add([item4,item5,item6])
        
        let item7 : MoreItem = MoreItem()
        item7.icon = "more_icon_about_21x21_.png"
        item7.isArrow = true
        item7.title = "关于单糖"
        sourceArr?.add([item7])
     
    }
 
    private func loadSubview(){
        JTab = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 64))
        view.addSubview(JTab!)
        JTab?.delegate = self
        JTab?.dataSource = self
        JTab?.tableFooterView = UIView()
        JTab?.backgroundColor = UIColor.clear
        
     
        
    };
 
    
    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        switch section {
        case 0: return 3
        case 1: return 3
        case 2: return 1
        default:return 3
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int
    {
        return (sourceArr?.count)!

    }

    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cellID:String = "cellID"
        var cell = tableView.dequeueReusableCell(withIdentifier: cellID)
        if cell == nil {
             cell = UITableViewCell.init(style: UITableViewCellStyle.default, reuseIdentifier: cellID)
        }
        let items:NSArray = sourceArr?.object(at: indexPath.section) as! NSArray
        let item:MoreItem = items[indexPath.row] as! MoreItem
        cell?.imageView?.image = UIImage.init(named: item.icon!)
        cell?.textLabel?.text = item.title
        cell?.textLabel?.font = UIFont.systemFont(ofSize: 14)
        cell?.textLabel?.textColor = RGB(r: 51, g: 51, b: 51)
        if item.isArrow! == true {
            cell?.accessoryType =  UITableViewCellAccessoryType.disclosureIndicator
        }else{
            cell?.accessoryType =  UITableViewCellAccessoryType.none
        }
    
        return cell!
    }

    // MARK: - UITableViewDelegate
    public func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
         return 10
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated:true)
        if indexPath.section == 1 && indexPath.row == 0 {
            let VC:MyCardVC = MyCardVC();
            self.navigationController?.pushViewController(VC, animated: true)
        }
        
        
    }

}

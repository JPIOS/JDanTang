//
//  JMineVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class JMineVC: BaseVC, UITableViewDelegate, UITableViewDataSource {
   
    @IBOutlet weak var mainTable: UITableView!
    
    let cellID = "cellID"
    var dataSource = [String]()
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func  viewWillAppear(_ animated: Bool) {
      super.viewWillAppear(true)
      
        navigationController?.navigationBar.isHidden = true
        self.mainTable.tableFooterView = UIView()
    }
   
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(true)
        navigationController?.navigationBar.isHidden = false
    }
 
    
    func setup() {
        
        self.mainTable.register(UITableViewCell.classForCoder(), forCellReuseIdentifier: cellID)
        self.dataSource.append("订单")
        self.dataSource.append("收藏")
        self.dataSource.append("关注")
    }

  
    @IBAction func ClickSettingBtn(_ sender: Any) {
        
        let VC:MoreVC = MoreVC();
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true);
        
    }
    
    //MARK: UITableViewDelegate && UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.dataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)
        cell.accessoryType = UITableViewCellAccessoryType.disclosureIndicator
        cell.textLabel?.text = self.dataSource[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        tableView.deselectRow(at: indexPath, animated: true)
        let nextVC = UIViewController()
        nextVC.title = self.dataSource[indexPath.row]
        nextVC.view.backgroundColor = UIColor.white
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
}

//
//  GoodDetail.swift
//  JDanTang
//
//  Created by 家朋 on 2017/8/1.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class GoodDetail: UIViewController, UITableViewDelegate ,UITableViewDataSource {
    
    let tabView: UITableView! = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 64))
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        loadSubviiew()
    }

    
    func loadSubviiew()  {
        
        self.view.addSubview(tabView!)
        self.tabView.delegate = self
        tabView.dataSource = self
        
        
    }
    
    
    // MARK: UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        return cell
    }
    
    // MARK: UITableViewDelegate
}

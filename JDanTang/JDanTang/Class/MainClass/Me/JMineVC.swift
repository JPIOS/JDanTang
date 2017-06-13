//
//  JMineVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class JMineVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        

        
    }
    
    override func  viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  
    @IBAction func ClickSettingBtn(_ sender: Any) {
        
        let VC:MoreVC = MoreVC();
        VC.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(VC, animated: true);
        
    }

}

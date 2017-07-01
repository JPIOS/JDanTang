//
//  JNavigationController.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class JNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.barTintColor = JMainColor()
        self.navigationBar.tintColor = UIColor.white
        self.navigationBar.barStyle = UIBarStyle.black
        self.navigationBar.backgroundImage(for: UIBarPosition.top, barMetrics: UIBarMetrics.default)
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
      
        
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        super.pushViewController(viewController, animated: true)
        if  self.viewControllers.count > 1 {
           // viewController.hidesBottomBarWhenPushed = true
            
        }
    }

}

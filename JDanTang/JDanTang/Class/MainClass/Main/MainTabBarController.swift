//
//  MainTabBarController.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit


class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabbar = UITabBar.appearance()
        tabbar.tintColor = JMainColor()
        addChirldVCs()
        
      
        
    }
    private func addChirldVCs() {
        
        addChildViewController(childVC: JHomeVC(), title: "J首页", imageName: "TabBar_home_23x23_", selectImageName: "TabBar_home_23x23_selected")
        addChildViewController(childVC: JDanTangVC(), title: "J单品", imageName: "TabBar_gift_23x23_", selectImageName: "TabBar_gift_23x23_selected")
        addChildViewController(childVC: JCategoryVC(), title: "J分类", imageName: "TabBar_category_23x23_", selectImageName: "TabBar_category_23x23_selected")
        addChildViewController(childVC: JMineVC(), title: "J我的", imageName: "TabBar_me_boy_23x23_", selectImageName: "TabBar_me_boy_23x23_selected")
        
    }
    
    
    private func addChildViewController(childVC:UIViewController ,title: String,imageName: String, selectImageName: String){
        childVC.tabBarItem.image = UIImage(named: imageName)
        childVC.tabBarItem.selectedImage = UIImage(named: selectImageName)
        childVC.title = title
        
        let navC = JNavigationController(rootViewController: childVC)
        addChildViewController(navC)
        
    }

}

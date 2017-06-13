//
//  BaseVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/8.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

// pod 中的第三方库
import Alamofire

import FMDB

import HLHanZiToPinYin

import IQKeyboardManager

import Kingfisher

import MJRefresh

import SnapKit

import SwiftyJSON

import TZImagePickerController

import SVProgressHUD


class BaseVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        let dd:Any =   type(of: self)
        //use 'type(of: anObject)' instead"
     
        print("WillAppear === "); print(dd);print("\n")
        
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
         super.viewWillDisappear(true)
        let className :String = NSStringFromClass(type(of: self))
        print("Disappear === "); print(className)
        print("\n")
        
    }
}

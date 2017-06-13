//
//  JConst.swift
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

// 自定义的库和常量

class JConst: NSObject {

}

/// 服务器地址
let BASE_URL = "http://api.dantangapp.com/"

/// 第一次启动
let YMFirstLaunch = "firstLaunch"
/// 是否登录
let isLogin = "isLogin"

/// code 码 200 操作成功
let RETURN_OK = 200

/// 首页顶部标签指示条的高度
let kIndicatorViewH: CGFloat = 2.0
/// 新特性界面图片数量
let kNewFeatureCount = 4
/// 顶部标题的高度
let kTitlesViewH: CGFloat = 35
/// 顶部标题的y
let kTitlesViewY: CGFloat = 64
/// 动画时长
let kAnimationDuration = 0.25
/// 屏幕的宽
let kScreenHeight = UIScreen.main.bounds.size.height
/// 屏幕的高
let kScreenWidth = UIScreen.main.bounds.size.width


/// RGBA的颜色设置
func JColor(r:CGFloat, g:CGFloat, b:CGFloat, a:CGFloat) -> UIColor {
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: a)
}
/// RGB的颜色设置
func RGB(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor{
    return UIColor(red: r / 255.0, green: g / 255.0, blue: b / 255.0, alpha: 1);
}

/// 背景灰色
func JGlobalColor() -> UIColor {
    return JColor(r: 240, g: 240, b: 240, a: 1)
}

/// 红色
func JGlobalRedColor() -> UIColor {
    return JColor(r: 245, g: 80, b: 83, a: 1.0)
}


func JMainColor() -> UIColor {
    return JColor(r: 245, g: 80, b: 83, a: 1.0);
}

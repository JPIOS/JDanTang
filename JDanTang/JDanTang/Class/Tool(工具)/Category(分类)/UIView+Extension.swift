//
//  UIView+Extension.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/14.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

extension UIView {
    
    
    // MARK: Func
    func clipCorner(direction: UIRectCorner, cornerRadiu: CGFloat) {
        let cornerSize = CGSize.init(width: cornerRadiu, height: cornerRadiu)
        let maskPath = UIBezierPath.init(roundedRect: bounds, byRoundingCorners: direction, cornerRadii: cornerSize)
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.addSublayer(maskLayer)
        layer.mask = maskLayer
        
    }
    
    func cornerRadiu(radiu: CGFloat) {
        layer.masksToBounds = true
        layer.cornerRadius  = radiu
    }
    
    /// 这个直接设置成圆
    func cornerCircle() {
        let aWidth: CGFloat = width > height ? width : height
         cornerRadiu(radiu: aWidth/2)
        
    }
    
    func borderWidth(value: CGFloat) {
        layer.masksToBounds = true
        layer.borderWidth   = value
    }
    
    func borderColor(value: UIColor) {
        layer.masksToBounds = true
        layer.borderColor   = value.cgColor
    }
    
    
    // MARK: SET&GET
    var x: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            
            var aFrame: CGRect = frame
            aFrame.origin.x    = newValue
            frame              = aFrame
        }
    }
    
    var y: CGFloat {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var aFrame: CGRect = frame
            aFrame.origin.y    = newValue
            frame              = aFrame
        }
    }
    
    var top: CGFloat
    {
        get {
            return frame.origin.y
        }
        set(newValue) {
            var aFrame: CGRect = frame
            aFrame.origin.y    = newValue
            frame              = aFrame
        }
    }
    
    var left: CGFloat {
        get {
            return frame.origin.x
        }
        set(newValue) {
            
            var aFrame: CGRect = frame
            aFrame.origin.x    = newValue
            frame              = aFrame
        }
    }
    
    var right: CGFloat {
        get {
            return frame.origin.x + frame.size.width
        }
        set(newValue) {
            var aFrame: CGRect = frame
            aFrame.size.width  = newValue - aFrame.origin.x
            frame              = aFrame
        }
    }
    
    var bottom: CGFloat {
        get {
            return frame.origin.y + frame.size.height
        }
        set(newValue) {
            var aFrame: CGRect = frame
            aFrame.size.height = newValue - frame.origin.y
            frame              = aFrame
         }
        
    }
    
    /// height
    var height: CGFloat {
    get {
    return frame.size.height
    }
    set(newValue) {
    var tempFrame: CGRect = frame
    tempFrame.size.height = newValue
    frame                 = tempFrame
    }
    }
    
    
    /// width
    var width: CGFloat {
        get {
            return frame.size.width
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size.width = newValue
            frame = tempFrame
        }
    }
    
    /// size
    var size: CGSize {
        get {
            return frame.size
        }
        set(newValue) {
            var tempFrame: CGRect = frame
            tempFrame.size = newValue
            frame = tempFrame
        }
    }
    
    /// centerX
    var centerX: CGFloat {
        get {
            return center.x
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.x = newValue
            center = tempCenter
        }
    }
    
    /// centerY
    var centerY: CGFloat {
        get {
            return center.y
        }
        set(newValue) {
            var tempCenter: CGPoint = center
            tempCenter.y = newValue
            center = tempCenter;
        }
    }
    
    
    
    
    
    
    
}

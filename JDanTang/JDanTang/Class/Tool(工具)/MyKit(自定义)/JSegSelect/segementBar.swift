//
//  segementbar.swift
//  WangYiHome
//
//  Created by mac_KY on 2017/6/27.
//  Copyright © 2017年 mac_KY. All rights reserved.
//


let contentBtnTag = 12000
import UIKit
/// 使用代理回调数据
protocol SegementBarDelegate :NSObjectProtocol {
    
    func clickSegTitleBar(clickTitleDex: Int)
    
}

class segementBar: UIView, UIScrollViewDelegate {
   
    //open
    var font :CGFloat?
    var titles: Array<String>?
    var textNormalColor: UIColor? //def = black
    var textSelectColor: UIColor? //def = red
    var line: UIView?//可以隐藏 改变颜色 不能调整位置
    var delegate: SegementBarDelegate? = nil
    var cellWidth: CGFloat = 60
    let cellHeight: CGFloat = 40
    var marginLeft: CGFloat = 10 //底部线和右边的距离
    
    //provide
    var source: Array<segememntItem>?
    var segmemtScrollview: UIScrollView!
    var actionLock: Bool!
    var lastClickRow :Int!
    let durationTime: CGFloat = 0.25
    let cellID = "cellID"
    var selectCell: UIButton!
    
    
    override init(frame: CGRect) {
         super.init(frame: frame)
    }
    
    /*
     frame:大小  
     titles:标题数组   
     font:该contentview标题字体
     */
    init(frame: CGRect,titles: Array<String>,font: CGFloat) {
        super.init(frame: frame)
        self.titles = titles
        self.font = font
        
        loadComment()
        loadScrollView()
        loadContentView()
    }
    
    
    func scrollToDexTitle(titleDex: Int) {
        actionLock = false
        let tag = titleDex + contentBtnTag
        let button = self.segmemtScrollview.viewWithTag(tag) as! UIButton
        self.clickCell(sender: button )
    }
    
    
    
    func loadComment(){
        
        self.textNormalColor = UIColor.black
        self.textSelectColor = UIColor.red
        var items = [segememntItem]()
        for title in titles! {
             let item = segememntItem()
            item.title = title
            items.append(item)
        }
        source = items
        actionLock = true
        lastClickRow = 0
     }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    /// 设置scrollview
    func loadScrollView(){
        
        let segmemtScrollview: UIScrollView = UIScrollView.init(frame: CGRect.init(x: 0, y: 0, width: self.frame.size.width, height:cellHeight))
        segmemtScrollview.delegate = self
        segmemtScrollview.backgroundColor = UIColor.white
        segmemtScrollview.showsVerticalScrollIndicator = false
        segmemtScrollview.showsHorizontalScrollIndicator = false
        segmemtScrollview.contentSize = CGSize.init(width: cellWidth * CGFloat((source?.count)!), height: cellHeight - 10)
        self.addSubview(segmemtScrollview)
        self.segmemtScrollview = segmemtScrollview
        
    }
  
    /// 添加内容
    func loadContentView() {
        //是你出之前的数据
        for obj in self.segmemtScrollview!.subviews {
            if obj.isKind(of: UIView.classForCoder()) {
                obj.removeFromSuperview();
            }
        }
        
        let cellHeight : CGFloat = self.frame.size.height
        
        //添加内容

        for i in 0 ..< (source?.count)!  {
            let item : segememntItem =  source![i]
           // let cell = UIView.init(frame: CGRect.init(x: CGFloat(i) * cellWidth, y: 0, width: cellWidth, height: cellHeight));
            let button = UIButton.init(frame: CGRect.init(x: CGFloat(i) * cellWidth, y: 0, width: cellWidth, height: cellHeight))
            button.setTitle(item.title, for: UIControlState.normal)
            button.setTitleColor(self.textNormalColor, for: UIControlState.normal)
            button.setTitleColor(self.textSelectColor, for: UIControlState.selected)
            button.addTarget(self, action:#selector(clickCell(sender:)),for: .touchUpInside)
            button.tag = contentBtnTag + i
            button.titleLabel?.font = UIFont.systemFont(ofSize: 14)
            self.segmemtScrollview.addSubview(button);
            if i == 0 {
                button.isSelected = true
                selectCell = button;
            }
            
            
        }
        
        // 添加line
        line = UIView.init(frame: CGRect.init(x: marginLeft, y: cellHeight  - 5, width: cellWidth - 2*marginLeft, height: 1))
        line?.backgroundColor = self.textSelectColor
        segmemtScrollview.addSubview(line!)
        segmemtScrollview.bringSubview(toFront: line!)
    }
    
    /// cell的点击事件
    func clickCell(sender:UIButton)  {
        if selectCell == sender {
             return
        }
        let tag = sender.tag - contentBtnTag;
        sender.isSelected = true
        selectCell!.isSelected = false
        selectCell = sender
        
        //得到当前的cell
        var aframe:CGRect = (line?.frame)!
        UIView.animate(withDuration: 0.2) {
            aframe.origin.x = CGFloat(tag*60)  + CGFloat(10)
            self.line?.frame = aframe
        }
        
        //需要title滚动～～ 控制范围 0 到contentsize.x 可读性很差 ～～抱歉咯😄
        // ->👉滚动啊
        let offsetX: CGFloat = segmemtScrollview.contentOffset.x
        let segBarWidth: CGFloat = self.frame.size.width
        if tag > lastClickRow && (CGFloat(tag)*cellWidth - self.segmemtScrollview.contentOffset.x) > (segBarWidth / 2) && (offsetX + segBarWidth < segmemtScrollview.contentSize.width){
            UIView.animate(withDuration: TimeInterval(durationTime), animations: {
                self.segmemtScrollview.contentOffset = CGPoint.init(x: offsetX + self.cellWidth, y: 0)
            })
        }
        
        //->👈滚动啊
        if offsetX > 0 && tag < lastClickRow && (CGFloat(tag)*cellWidth - self.segmemtScrollview.contentOffset.x) < (segBarWidth / 2){
            UIView.animate(withDuration: TimeInterval(durationTime), animations: {
                self.segmemtScrollview.contentOffset = CGPoint.init(x: offsetX - self.cellWidth, y: 0)
            })
        }
        
        if delegate != nil && actionLock == true{
            delegate?.clickSegTitleBar(clickTitleDex: tag)
            
        }
        actionLock = true
        lastClickRow = tag

        
        
    }
 

}




/// Item
class segememntItem: NSObject {
    open var select: Bool?
    open var title: String?
}


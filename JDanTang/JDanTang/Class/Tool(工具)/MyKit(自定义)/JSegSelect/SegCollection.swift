//
//  SegCollection.swift
//  WangYiHome
//
//  Created by mac_KY on 2017/6/27.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit
/// 使用代理回调数据
protocol SegCollectionDelegate :NSObjectProtocol {
    
    func scrollerToDexVC(scorToDex: Int)
    
}

class SegCollection: UIView ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    let SegCollectionCellID: String = "SegCollectionCellID"
    var delegate: SegCollectionDelegate? = nil
    var contentArr: Array<UIViewController>?
    var collection: UICollectionView?
    var scrDex: Int?
    
    func setContentViewCrollers(viewControllers: [UIViewController])  {
        contentArr = viewControllers;
        collection?.reloadData()
    }
    
    
    // MARK: SET
    override init(frame: CGRect) {
         super.init(frame: frame)
    }
    
    init(frame: CGRect, contentArr: Array<UIViewController>) {
        super.init(frame: frame)
        self.contentArr = contentArr
        loadComment()
        loadCollection()
        
    }
    
    
    func clickToDexViewController(viewControllerDex: Int) {
        UIView.animate(withDuration: 0.15) {
            self.collection?.contentOffset = CGPoint.init(x: kScreenWidth * CGFloat(viewControllerDex), y: 0)
        }

    }
    
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func loadComment(){
        
        for vc in contentArr! {
            vc.view.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.width)
        }
        scrDex = 0
        self.backgroundColor = UIColor.black
    }
    
    func loadCollection(){
        
        let cellWidth: CGFloat = self.frame.size.width
        let cellHeight : CGFloat = self.frame.size.height
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
        layout.itemSize = CGSize.init(width: cellWidth, height: cellHeight)
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal
        
        
        
        let colletion: UICollectionView = UICollectionView.init(frame: CGRect.init(x: 0, y: 0, width:self.frame.size.width, height:self.frame.size.height) ,collectionViewLayout: layout)
        colletion.delegate = self
        colletion.dataSource = self
        colletion.showsVerticalScrollIndicator = false
        colletion.showsHorizontalScrollIndicator = false
        colletion.register(SegCollectionCell.classForCoder(), forCellWithReuseIdentifier: SegCollectionCellID)
        self.addSubview(colletion)
        colletion.isPagingEnabled = true
        self.collection = colletion
        
     
    }

    
    // MARK: UICollectionViewDataSource&&UICollectionViewDelegate
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
         return (contentArr?.count)!
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: SegCollectionCell = collectionView.dequeueReusableCell(withReuseIdentifier: SegCollectionCellID, for: indexPath) as! SegCollectionCell
        
        cell.setContentVC(aContentVC: &contentArr![indexPath.row])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {

        let dex: Int = Int.init((scrollView.contentOffset.x) / kScreenWidth)
        if dex == scrDex  { return  }
        //处理滚动事件
        if (delegate != nil) {
            delegate!.scrollerToDexVC(scorToDex: dex)
        }
        scrDex = dex
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
 
        
    }
    
}

class SegCollectionCell: UICollectionViewCell {
    
    var contentVC: UIViewController?
    var aFrame: CGRect?
    
    override init(frame: CGRect) {
       super.init(frame: frame)
        self.backgroundColor = UIColor.black
        aFrame = CGRect.init(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
    }
    open func setContentVC( aContentVC: inout UIViewController){
        contentVC?.view.removeFromSuperview()
        self.addSubview( aContentVC.view)
        contentVC = aContentVC
        aContentVC.view.frame = aFrame!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class SegCollectionItem: NSObject {
    
}


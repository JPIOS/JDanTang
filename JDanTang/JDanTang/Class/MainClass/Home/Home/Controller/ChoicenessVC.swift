//
//  ChoicenessVC.swift
//  JDanTang
//
//  Created by mac_KY on 2017/6/28.
//  Copyright © 2017年 mac_KY. All rights reserved.
//

import UIKit

class ChoicenessVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    let choicenessTabView: UITableView? = UITableView.init(frame: CGRect.init(x: 0, y: 0, width: kScreenWidth, height: kScreenHeight - 106))
    let ChoicenessCellID:String = "ChoicenessCellID"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.choicenessTabView?.delegate = self
        self.choicenessTabView?.dataSource = self
    self.choicenessTabView?.register(UINib.init(nibName: "ChoicenessCell", bundle: nil), forCellReuseIdentifier: ChoicenessCellID)
    }

    override func viewWillAppear(_ animated: Bool) {
         super.viewWillAppear(true)
        view.addSubview(self.choicenessTabView!)
    }
    
    
    func loadHeadData() {
        let id:Int = 4
        let url =  "v2/channels/\(id)/items"
        let params = ["gender":1,
                      "generation":1,
                      "limit":20,
                      "offset":0 ]
        NetworkTool.shareNetworkTool.getRequest(urlString: url, params: params, success: { (results) in
            
        }) { (faile) in
            
        }
    }
    
    func loadBannersData() {
        
    }
    
    func loadContentData() {
        
    }
    
    // MARK: UITableViewDelegate&&UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
         return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
         return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let cell :ChoicenessCell = tableView.dequeueReusableCell(withIdentifier: ChoicenessCellID, for: indexPath) as! ChoicenessCell
        
        return cell
      
    }
    
    
    

}

//
//  XXMainViewController.swift
//  Xiuxiu
//
//  Created by 张一奇 on 2017/7/5.
//  Copyright © 2017年 Xiuxiu. All rights reserved.
//

import UIKit

class XXMainViewController: UIViewController {
    
    var goodsArr: [XXGoods]?
    
    @IBOutlet weak var goodsTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        test()
        
        loadData()
        
        setupUI()
    }
    
    fileprivate func setupUI() {
        
        goodsTableView.dataSource = self
        goodsTableView.delegate = self
        
        goodsTableView.register(UINib(nibName: "XXMainTableViewCell", bundle: nil), forCellReuseIdentifier: "mainTableViewCell")
        
        
    }
    
    fileprivate func loadData() {

        
        let path = Bundle.main.path(forResource: "Goods.plist", ofType: nil)
        let dicArray = NSArray.init(contentsOfFile: path!) as! Array<Dictionary<String, String>>
        
        goodsArr = [XXGoods]()
        
        for dic in dicArray {
            
            let goods = XXGoods()
            
            goods.setValuesForKeys(dic)
            
            goodsArr?.append(goods)
            
        }
        
    }

    
    // MARK: 淘宝购物车测试
//    func test() {
    
//        let service = AlibcTradeSDK.sharedInstance().tradeService()
//        
//        let page = AlibcTradePageFactory.myCartsPage()
//        
//        
//        service?.show(navigationController!, page: page, showParams: nil, taoKeParams: nil, trackParam: nil, tradeProcessSuccessCallback: { (result) in
//            print(result)
//        }, tradeProcessFailedCallback: { (error) in
//            print(error)
//        })
//    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension XXMainViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        return 1
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
        return 100
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainTableViewCell", for: indexPath) as! XXMainTableViewCell
        
        cell.goods = goodsArr?[indexPath.row]
        
        return cell
    }
    
}

extension XXMainViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 150
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let welVC = XXWebViewController()
        welVC.urlStr = goodsArr?[indexPath.row].popDiscountUrl ?? "https://www.baidu.com"
        
        navigationController?.pushViewController(welVC, animated: true)
        
    }
    
}




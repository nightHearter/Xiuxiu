//
//  ViewController.swift
//  Xiuxiu
//
//  Created by 张一奇 on 2017/7/5.
//  Copyright © 2017年 Xiuxiu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        test()
    }
    
    func test() {
        
        let service = AlibcTradeSDK.sharedInstance().tradeService()
        
        let page = AlibcTradePageFactory.myCartsPage()
        
        
        service?.show(navigationController!, page: page, showParams: nil, taoKeParams: nil, trackParam: nil, tradeProcessSuccessCallback: { (result) in
            print(result)
        }, tradeProcessFailedCallback: { (error) in
            print(error)
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


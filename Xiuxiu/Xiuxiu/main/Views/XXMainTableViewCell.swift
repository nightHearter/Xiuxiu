//
//  XXMainTableViewCell.swift
//  Xiuxiu
//
//  Created by 张一奇 on 17/8/12.
//  Copyright © 2017年 Xiuxiu. All rights reserved.
//

import UIKit

class XXMainTableViewCell: UITableViewCell {
    
    var goods: XXGoods? {
        
        didSet {
         
            imageV.sd_setImage(with: URL(string: (goods?.image) ?? ""), placeholderImage: UIImage(named: "placeHolder"))
            nameLabel.text = goods?.name
            originPriceLabel.text = "￥" + ((goods?.price) ?? "0")
            residueDiscountLabel.text = "\((goods?.residueDiscount) ?? "0")份"
            
            let discountValueArray = goods?.discountValue?.components(separatedBy: ["减", "元"])
            var discountValueStr = "0"
            if discountValueArray?.last == "无条件券" {
                discountValueStr = (discountValueArray?.first) ?? "0"
            } else {
                discountValueStr = (discountValueArray?[2]) ?? "0"
            }
            discountValueLabel.text = "￥" + discountValueStr
            
            let originPriceF = Float((goods?.price) ?? "0")
            let discountPriceF = Float(discountValueStr)
            var endPriceF = (originPriceF ?? 0) - (discountPriceF ?? 0)
            
            if endPriceF <= 0 {
                endPriceF = originPriceF ?? 0
            }
            
            endPriceLabel.text = "￥" + String(format: "%.2f", endPriceF)
            
        }
    }
    
    @IBOutlet weak var imageV: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var endPriceLabel: UILabel!
    
    @IBOutlet weak var originPriceLabel: UILabel!
    
    @IBOutlet weak var residueDiscountLabel: UILabel!
    
    @IBOutlet weak var discountValueLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupUI()
    }

    fileprivate func setupUI() {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

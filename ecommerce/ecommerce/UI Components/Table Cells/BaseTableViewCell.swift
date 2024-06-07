//
//  BaseTableViewCell.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import UIKit
import Reusable

class BaseTableViewCell: UITableViewCell, NibReusable {
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        applyStyling()
        applyLocalizations()
        setupAfterInit()
        setBlocks()
    }
    
    func applyStyling() {}
    func applyLocalizations() {}
    func setupAfterInit() {}
    func setBlocks() {}
}

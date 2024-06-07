//
//  BaseView.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 5.06.2024.
//

import UIKit
import Reusable

class BaseView: UIView, NibOwnerLoadable {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadNibContent()
        applyStyling()
        applyLocalizations()
        setupAfterInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadNibContent()
        applyStyling()
        applyLocalizations()
        setupAfterInit()
    }
    
    func applyStyling() { }
    
    func setupAfterInit() { }
    
    func applyLocalizations() { }
}

//
//  ProductTableCell.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import UIKit

final class ProductTableCell: BaseTableViewCell {

    //MARK: - IBOutlets
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productCount: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!
    
    //MARK: - Configure
    func configure(with model: ProductViewModel) {
        productCount.text = String(model.userStock) + " product"
        productImage.downloadedFrom(url: model.image!)
        priceLabel.text = String(model.calculateTotalPrice()) + " TL"
        productName.text = model.productName
    }
}

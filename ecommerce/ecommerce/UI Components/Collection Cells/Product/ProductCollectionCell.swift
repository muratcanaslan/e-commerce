//
//  ProductCollectionCell.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import UIKit

final class ProductCollectionCell: BaseCollectionViewCell {
    //MARK: - IBOutlets
    @IBOutlet private weak var userStockButton: UIButton!
    @IBOutlet private weak var plusButton: UIButton!
    @IBOutlet private weak var minusButton: UIButton!
    @IBOutlet private weak var productName: UILabel!
    @IBOutlet private weak var productImage: UIImageView!
    @IBOutlet private weak var priceLabel: UILabel!
    @IBOutlet private weak var stockCount: UILabel!
    
    //MARK: - Completions
    var onSelectProduct: EmptyCompletion?
    
    //MARK: - Properties
    private var viewModel = ProductViewModel()
    
    //MARK: - Configure
    func configure(with model: ProductViewModel) {
        self.viewModel = model
        stockCount.text = "(\(String(model.stockCount)) stock remained)"
        userStockButton.setTitle(String(model.userStock), for: .normal)
        productName.text = model.productName
        productImage.downloadedFrom(url: model.image ?? .init(string: "")!)
        priceLabel.text = String(model.price) + " TL"
        
        viewModel.onUpdateUserStock = {
            DispatchQueue.main.async {
                self.userStockButton.setTitle(String(self.viewModel.userStock), for: .normal)
            }
        }
    }
    
    //MARK: - IBActions
    @IBAction private func didTapPlus(_ sender: UIButton) {
        viewModel.increaseUserStock()
        onSelectProduct?()
    }
    
    @IBAction private func didTapMinus(_ sender: UIButton) {
        viewModel.decreaseUserStock()
        onSelectProduct?()
    }
}


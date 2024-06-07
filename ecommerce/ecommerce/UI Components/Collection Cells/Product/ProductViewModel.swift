//
//  ProductViewModel.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import Foundation

class ProductViewModel {
    
    var onUpdateUserStock: EmptyCompletion?
    var showError: StringCompletion?
    
    var stockCount: Int
    var image: URL?
    var productName: String
    var price: Int
    
    var userStock: Int = 0
    
    init(stockCount: Int, image: URL, productName: String, userStock: Int = 0, price: Int) {
        self.stockCount = stockCount
        self.image = image
        self.productName = productName
        self.userStock = userStock
        self.price = price
    }
    
    init() {
        image = nil
        productName = ""
        stockCount = 0
        price = 0
    }
    
    func increaseUserStock() {
        if userStock >= stockCount {
            showError?("There are no more products in stock.")
            return
        }
        userStock += 1
        onUpdateUserStock?()
    }
    
    func decreaseUserStock() {
        if userStock == 0 {
            return
        }
        userStock -= 1
        onUpdateUserStock?()
    }
    
    func calculateTotalPrice() -> Int {
        return userStock * price
    }
    
    func updateStock() {
        stockCount = stockCount - userStock
        userStock = 0
    }
}

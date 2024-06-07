//
//  ProductListViewModel.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import Foundation

final class ProductListViewModel {
    
    //MARK: - Properties
    var products: [ProductViewModel] = [
        .init(stockCount: 0, image: .init(string: "https://picsum.photos/200/300")!, productName: "Book", price: 12000),
        .init(stockCount: 1, image: .init(string: "https://picsum.photos/200/300")!, productName: "Macbook Pro 2013", price: 42),
        .init(stockCount: 2, image: .init(string: "https://picsum.photos/200/300")!, productName: "iPhone 11", price: 42),
        .init(stockCount: 3, image: .init(string: "https://picsum.photos/200/300")!, productName: "Huawei", price: 42),
        .init(stockCount: 4, image: .init(string: "https://picsum.photos/200/300")!, productName: "Samsung Note 10", price: 44),
        .init(stockCount: 5, image: .init(string: "https://picsum.photos/200/300")!, productName: "Monster Macbook", price: 43),
        .init(stockCount: 6, image: .init(string: "https://picsum.photos/200/300")!, productName: "Lamb", price: 11),
        .init(stockCount: 7, image: .init(string: "https://picsum.photos/200/300")!, productName: "Spider-man 2", price: 12),
        .init(stockCount: 8, image: .init(string: "https://picsum.photos/200/300")!, productName: "Playstation 4", price: 4444),
        .init(stockCount: 9, image: .init(string: "https://picsum.photos/200/300")!, productName: "Playstation 5", price: 333)
    ]
    
    func selectedProducts() -> [ProductViewModel] {
        return products.filter({ $0.userStock > 0})
    }
}

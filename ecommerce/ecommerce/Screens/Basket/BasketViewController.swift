//
//  BasketViewController.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import UIKit

final class BasketViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var basketButton: UIButton!
    
    //MARK: - Completions
    var onSuccessPurchase: EmptyCompletion?
    
    //MARK: - Properties
    private let viewModel: ProductListViewModel
    
    //MARK: - Inits
    init(viewModel: ProductListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "BasketViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Base methods
    override func applyLocalizations() {
        super.applyLocalizations()
        
        basketButton.setTitle(calculateTotalPrice(), for: .normal)
        navigationItem.title = "Basket"
    }
    
    override func applyStyling() {
        super.applyStyling()
        
        setupTableView()
    }
    
    //MARK: - UI Helpers
    private func setupTableView() {
        tableView.dataSource = self
        tableView.register(cellType: ProductTableCell.self)
        tableView.contentInset = .init(top: 24, left: 0, bottom: 84, right: 0)
    }
    
    private func calculateTotalPrice() -> String {
        var totalPrice = 0
        viewModel.selectedProducts().forEach({ totalPrice += $0.calculateTotalPrice() })
        return "CONFIRM PURCHASE " + "(\(String(totalPrice)) TL)"
    }
    
    //MARK: - IBActions
    @IBAction func didTapConfirmPurchase(_ sender: UIButton) {
        self.dismiss(animated: true) {
            self.onSuccessPurchase?()
        }
    }
}

//MARK: - UITableView DataSource
extension BasketViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.selectedProducts().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let product = viewModel.selectedProducts()[indexPath.row]
        let cell = tableView.dequeueReusableCell(for: indexPath, cellType: ProductTableCell.self)
        cell.configure(with: product)
        return cell
    }
}

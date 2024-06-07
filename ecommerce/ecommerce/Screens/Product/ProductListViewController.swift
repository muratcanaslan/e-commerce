//
//  ProductListViewController.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import UIKit

final class ProductListViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var basketButton: UIButton!

    //MARK: - Properties
    private let viewModel = ProductListViewModel()
    
    //MARK: - Base methods
    override func applyLocalizations() {
        super.applyLocalizations()
        
        navigationItem.title = "Products"
    }
    
    override func applyStyling() {
        super.applyStyling()
        
        setupSelectedProductUI()
    }
    
    override func setupAfterInit() {
        super.setupAfterInit()
        
        setupCollectionView()
    }
    
    //MARK: - UI Helpers
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(cellType: ProductCollectionCell.self)
        collectionView.contentInset = .init(top: 24, left: 16, bottom: 84, right: 16)
    }
    
    private func setupSelectedProductUI() {
        basketButton.isHidden = viewModel.selectedProducts().isEmpty
        basketButton.setTitle("Basket (\(viewModel.selectedProducts().count) product)", for: .normal)
    }
    
    private func openBasketScene() {
        let vc = BasketViewController(viewModel: viewModel)
        vc.onSuccessPurchase = {
            self.viewModel.products.forEach({ $0.updateStock() })
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                self.setupSelectedProductUI()
            }
        }
        let navigation = UINavigationController(rootViewController: vc)
        navigation.modalPresentationStyle = .fullScreen
        navigation.modalTransitionStyle = .coverVertical
        self.present(navigation, animated: true)
    }
    
    @IBAction func didTapBasket(_ sender: UIButton) {
        openBasketScene()
    }
}

//MARK: - UICollectionView Delegate&DataSource
extension ProductListViewController: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(for: indexPath, cellType: ProductCollectionCell.self)
        let product = viewModel.products[indexPath.item]
        product.showError = { [weak self] message in
            self?.showAlert(alertTitle: "Error", alertMessage: message)
        }
        
        cell.onSelectProduct = { [weak self] in
            self?.setupSelectedProductUI()
        }
        cell.configure(with: product)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        /// Cell width değeri paddingler cıkartılarak hesaplanmıstır.
        let width = (collectionView.frame.width / 2) - 22
        /// Cell height değeri
        let height: CGFloat = 240
        
        return .init(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        12
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        12
    }
}

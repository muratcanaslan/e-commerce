//
//  LoginViewController.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 5.06.2024.
//

import UIKit

final class LoginViewController: BaseViewController {

    //MARK: - IBOutlets
    @IBOutlet private weak var usernameView: TextFieldView!
    @IBOutlet private weak var passwordView: TextFieldView!
    
    //MARK: - Properties
    private let viewModel = LoginViewModel()
    
    //MARK: - Base methods
    override func applyStyling() {
        super.applyStyling()
        
        configureNavigationBar()
    }
    
    override func applyLocalizations() {
        super.applyLocalizations()
        
        navigationItem.title = "Login"
    }
    
    override func setupAfterInit() {
        super.setupAfterInit()
        
        setupViewModels()
    }
    
    override func setBlocks() {
        super.setBlocks()
        
        viewModel.didLogin = {
            // TODO: - Route
        }
    }
    
    //MARK: - UI Helpers
    private func setupViewModels() {
        usernameView.configure(with: viewModel.usernameViewModel)
        passwordView.configure(with: viewModel.passwordViewModel)
    }
    
    private func configureNavigationBar() {
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    //MARK: - IBActions
    @IBAction func didTapLogin(_ sender: UIButton) {
//        viewModel.login()
        NavigationManager.shared.show(UINavigationController(rootViewController: ProductListViewController()))
    }
}

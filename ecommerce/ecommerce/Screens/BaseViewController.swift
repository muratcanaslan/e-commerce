//
//  BaseViewController.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 5.06.2024.
//

import UIKit

typealias EmptyCompletion = () -> Void
typealias StringCompletion = (String) -> Void

class BaseViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
        setBlocks()
        applyStyling()
        applyLocalizations()
        setupAfterInit()
    }
    

    private func setupUI() {
        navigationItem.backButtonTitle = ""
        view.backgroundColor = .white
//        navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage(resource: .iconBack)
    }
    
    func applyStyling() { }
    func applyLocalizations() { }
    func setupAfterInit() { }
    func setBlocks() { }
    
    func showAlert(alertTitle: String?, alertMessage: String?) {
        let alert = UIAlertController(title: alertTitle, message: alertMessage, preferredStyle: .alert)
        let cancel = UIAlertAction(title: "Done", style: .cancel)
        alert.addAction(cancel)
        self.present(alert, animated: true)
    }
}

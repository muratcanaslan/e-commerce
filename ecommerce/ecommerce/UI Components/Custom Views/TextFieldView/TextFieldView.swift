//
//  TextFieldView.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 5.06.2024.
//

import UIKit
import IQKeyboardManagerSwift

final class TextFieldView: BaseView {

  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textField: UITextField!
    
    private let viewModel = TextFieldViewModel()
    
    override func applyStyling() {
        super.applyStyling()
        
        textField.tintColor = .darkText
        titleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        textField.setLeftPaddingPoints(16)
        textField.layer.borderColor = UIColor.darkText.cgColor
        textField.layer.borderWidth = 1
    }
    
    private func setupTextField() {
        textField.addTarget(self, action: #selector(didInputTextFieldChanged), for: .editingChanged)
    }
    
    func configure(with model: TextFieldViewModel) {
        self.textField.placeholder = model.placeholder
        self.titleLabel.text = model.title
        self.textField.text = model.text
    }

    @objc private func didInputTextFieldChanged() {
        guard let text = textField.text else { return }
        viewModel.text = text
    }
}


//
//  TextFieldViewModel.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import Foundation

final class TextFieldViewModel {
    
    var text: String
    var title: String
    var placeholder: String
    
    init(text: String, title: String, placeholder: String) {
        self.text = text
        self.title = title
        self.placeholder = placeholder
    }
    
    init() {
        text = ""
        title = ""
        placeholder = ""
    }
    
    var isTextNonEmpty: Bool {
        return !text.isEmpty
    }
}

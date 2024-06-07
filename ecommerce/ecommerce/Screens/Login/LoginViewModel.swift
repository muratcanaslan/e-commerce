//
//  LoginViewModel.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import Foundation

final class LoginViewModel {
    
    var didLogin: EmptyCompletion?
    
    let usernameViewModel = TextFieldViewModel(text: "user", title: "Username", placeholder: "Username")
    let passwordViewModel  = TextFieldViewModel(text: "123", title: "Password", placeholder: "Password")
    
    func login() {
        guard usernameViewModel.isTextNonEmpty && passwordViewModel.isTextNonEmpty else {
            debugPrint("Username or password can not be empty!")
            return
        }
        
        let username = usernameViewModel.text
        let password = passwordViewModel.text
        
    }
}

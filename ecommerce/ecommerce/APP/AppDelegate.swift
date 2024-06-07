//
//  AppDelegate.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 5.06.2024.
//

import UIKit
import IQKeyboardManagerSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
     
        window = UIWindow(frame: UIScreen.main.bounds)

        customizeKeyboard()
        
        NavigationManager.shared.start()
        return true
    }
    
    
    func customizeKeyboard() {
        IQKeyboardManager.shared.enable = true
        IQKeyboardManager.shared.resignOnTouchOutside = true
        IQKeyboardManager.shared.toolbarConfiguration.tintColor = .black
        IQKeyboardManager.shared.toolbarConfiguration.placeholderConfiguration.color = .lightGray
        IQKeyboardManager.shared.toolbarConfiguration.placeholderConfiguration.font = UIFont.systemFont(ofSize: 12)
        IQKeyboardManager.shared.keyboardDistanceFromTextField = 50
        IQKeyboardManager.shared.toolbarPreviousNextAllowedClasses = [UIStackView.self, UIView.self]
    }
}


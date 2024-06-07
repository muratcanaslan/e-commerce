//
//  NavigationManager.swift
//  ecommerce
//
//  Created by Murat Can ASLAN on 7.06.2024.
//

import UIKit

final class NavigationManager {
    
    static let shared: NavigationManager = .init()
    
    private init() {}
    
     func getCurrentWindow() -> UIWindow {
        var window = UIApplication.shared.delegate?.window ?? UIApplication.shared.keyWindow
        if window == nil {
            window = UIWindow(frame: UIScreen.main.bounds)
            window?.makeKeyAndVisible()
        }
        return window!
    }
    
    func show(_ vc: UIViewController) {
        let window = getCurrentWindow()
        window.rootViewController = vc
        window.makeKeyAndVisible()
    }
    
    func start() {
        let vc = UINavigationController(rootViewController: LoginViewController())
        show(vc)
    }
}

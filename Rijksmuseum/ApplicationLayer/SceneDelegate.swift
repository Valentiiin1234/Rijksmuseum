//
//  SceneDelegate.swift
//  Rijksmuseum
//
//  Created by Mac on 30.05.2023.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    
    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        let navigationController = UINavigationController(
            
            rootViewController: StartModuleAssembly.buildModule()
        )
        window = UIWindow(windowScene: scene)
        window?.backgroundColor = .systemPurple
        
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
    }
}


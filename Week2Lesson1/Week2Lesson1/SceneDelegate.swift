//
//  SceneDelegate.swift
//  Week2Lesson1
//
//  Created by s s on 9/2/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
   
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let window = UIWindow(windowScene: windowScene)
        self.window = window
        window.rootViewController = FirstViewController()
        window.makeKeyAndVisible()

    }

   
}


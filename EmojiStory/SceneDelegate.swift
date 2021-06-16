//
//  SceneDelegate.swift
//  EmojiStory
//
//  Created by diayan siat on 14/06/2021.
//

import UIKit
import FirebaseAuth
import GoogleSignIn

class SceneDelegate: UIResponder, UIWindowSceneDelegate, GIDSignInDelegate {
    
    var window: UIWindow?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let storyboard =  UIStoryboard(name: "Main", bundle: nil)
        if let windowScene = scene as? UIWindowScene {
            self.window = UIWindow(windowScene: windowScene)
            if Auth.auth().currentUser != nil {
                // redirect to the status display controller
                print("\((Auth.auth().currentUser?.email)! + " " + (Auth.auth().currentUser?.displayName)!)")
                self.window!.rootViewController = storyboard.instantiateViewController(withIdentifier: "StatusDisplayVC")
                self.window!.makeKeyAndVisible()
            } else {
                // redirect to the login controller
                self.window!.rootViewController = storyboard.instantiateViewController(withIdentifier: "LoginViewController")
                self.window!.makeKeyAndVisible()
            }
        }
        GIDSignIn.sharedInstance()?.clientID = "1011662212595-iosmkrgjebac6ev44ra0o5eaac47a1hg.apps.googleusercontent.com"
        GIDSignIn.sharedInstance()?.delegate = self
    }
    
    // handle the sign in to redirect to the status display controller
    func sign(_ signIn: GIDSignIn!, didSignInFor user: GIDGoogleUser!, withError error: Error?) {
        if error != nil {
            return
        }
        
        guard let authentication = user.authentication else { return }
        let credential = GoogleAuthProvider.credential(withIDToken: authentication.idToken, accessToken: authentication.accessToken)
        Auth.auth().signIn(with: credential) { (authResult, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            let storyboard =  UIStoryboard(name: "Main", bundle: nil)
            // redirect the user to the home controller
            self.window!.rootViewController = storyboard.instantiateViewController(withIdentifier: "StatusDisplayVC")
            self.window!.makeKeyAndVisible()
        }
    }
    
    func sign(_ signIn: GIDSignIn!, didDisconnectWith user: GIDGoogleUser!, withError error: Error!) {
        // Perform any operations when the user disconnects from app here.
    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}


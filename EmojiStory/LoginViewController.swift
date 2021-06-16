//
//  LoginViewController.swift
//  EmojiStory
//
//  Created by diayan siat on 15/06/2021.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class LoginViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        GIDSignIn.sharedInstance()?.presentingViewController = self
        // Automatically sign in the user.
        GIDSignIn.sharedInstance()?.restorePreviousSignIn()
    }
}

//
//  StatusDisplayVC.swift
//  EmojiStory
//
//  Created by diayan siat on 15/06/2021.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class StatusDisplayVC: UICollectionViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Add", style: .plain, target: self, action: #selector(signOutUser))
    }
    
    @objc func signOutUser() {
        
        GIDSignIn.sharedInstance()?.signOut()
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //update screen after user signs in (i.e move back to sign in screen)
            
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
    }
}

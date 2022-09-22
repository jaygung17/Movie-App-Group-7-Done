//
//  ProfilePageController.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 26/08/22.
//

import Foundation
import UIKit

class ProfilePageController: UIViewController {
    var name: String?
    @IBOutlet weak var helloLabel: UILabel!
    
    override func viewDidLoad() {
            
            super.viewDidLoad()
        getUsernameAndSetItToWelcomeLabel()
        
//        let MyUsername = UserDefaults.standard.string(forKey: "username")
//        if let MyUsername = name {
//            helloLabel.text = "Hello, \(MyUsername)!"
//        }
    }
    
    func getUsernameAndSetItToWelcomeLabel() {
        let usernameUserdefaultsKey = "com.funios.usernameKey"
        let savedUsername = UserDefaults.standard.string(forKey: usernameUserdefaultsKey)
        helloLabel.text = "Hello, \(savedUsername ?? "Username Not Found")!"
    }

    @IBAction func logOutTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
        UserDefaults.standard.set(false, forKey: "com.funios.loggedInkey")
    }
}

//
//  LoginController.swift
//  Movie-App-Group-7
//
//  Created by Agung Luo on 26/08/22.
//

import Foundation
import UIKit

class LoginController: UIViewController {
    //properties for part of login page
    @IBOutlet var UsernameTextField: UITextField!
    @IBOutlet var PasswordTextField: UITextField!
    
    @IBAction func VerifyMethod(_ sender: Any)
    {
        //Credential Data for login
        let MyUsername = "agungluo"
        let MyPassword = "qwertyuiop"
    //Verified with if else method
    if UsernameTextField.text == MyUsername && PasswordTextField.text == MyPassword
    {
        performSegue(withIdentifier: "VerifiedSegue", sender: self)
    } else {
            let alert = UIAlertController(
                        title: "Invalid Login",
                        message: "Please fill username and password correctly",
                        preferredStyle: UIAlertController.Style.alert)

        let OKAction = UIAlertAction(title: "OK", style: .default) { (action) in
                        // do something when user press OK button, like deleting text in both fields or do nothing
                    }

                    alert.addAction(OKAction)

        present(alert, animated: true, completion: nil)
                    return
                }
    }

}

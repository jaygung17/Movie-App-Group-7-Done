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
    let loggedInUserDefaultsKey = "com.funios.loggedInkey"
    
    
    @IBAction func VerifyMethod(_ sender: Any)
    {
        //Credential Data for login
        let MyUsername = "a"
        let MyPassword = "a"
        
        //Verified with if else method
        if UsernameTextField.text == MyUsername && PasswordTextField.text == MyPassword {
            saveIsUserLoggeedIn(userLoginSuccesfully: true)
            saveInputtedUsername(inputedUsername: MyUsername)
       
//            userdefault method
                    UserDefaults.standard.set(UsernameTextField.text, forKey: "username")
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
    
   override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        isUserAlreadyLoggedIn()
        view.isHidden = false
    }
    func isUserAlreadyLoggedIn() {
        if UserDefaults.standard.bool(forKey: loggedInUserDefaultsKey) {
           perfomSegueToMovieList()
        }
    }
    
    //advice
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "VerifiedSegue" {
            let barViewControllers = segue.destination as! UITabBarController
            let profilePage = barViewControllers.viewControllers![1] as! ProfilePageController
            
            profilePage.name = UsernameTextField.text
        }
    }
    func perfomSegueToMovieList() {
        performSegue(withIdentifier: "VerifiedSegue", sender: nil)
    }
    func saveIsUserLoggeedIn(userLoginSuccesfully isLogin: Bool) {
        UserDefaults.standard.set(isLogin, forKey: loggedInUserDefaultsKey)
    }
    
    func saveInputtedUsername(inputedUsername username: String) {
        let usernameUserdefaultsKey = "com.funios.usernameKey"
        UserDefaults.standard.set(username, forKey: usernameUserdefaultsKey)
    }
}

//
//  ViewController.swift
//  LoginPassword
//
//  Created by Evgenia Shipova on 27.08.2020.
//  Copyright © 2020 Evgenia Shipova. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    @IBOutlet weak var logInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userNameTextField.delegate = self
        userNameTextField.tag = 0
        userNameTextField.returnKeyType = .next
        passwordTextField.delegate = self
        passwordTextField.tag = 1
        passwordTextField.returnKeyType = .done
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showUserDetails" {
            let tabBarController = segue.destination as! UITabBarController
            let welcomePageVC = tabBarController.viewControllers?.first as!
            WelcomePageViewController
            welcomePageVC.userName = userNameTextField.text!
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    @IBAction func logInAction() {
        if userNameTextField.text != "Evgenia" || passwordTextField.text != "password" {
            showAlert(with: "Invalid login or password", and: "Please, enter correct login and password")
            passwordTextField.text = ""
            return
        } else {
            performSegue(withIdentifier: "showUserDetails", sender: nil)
        }
    }
    
    @IBAction func forgotUserNameAction() {
        showAlert(with: "Ooops", and: "Your name is Evgenia")
    }
    
    @IBAction func forgotPasswordAction() {
        showAlert(with: "Ooops", and: "Your password is password")
    }
    
    @IBAction func unwind(segue: UIStoryboardSegue) {
        userNameTextField.text = ""
        passwordTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        let textTag = textField.tag+1
        let nextResponder = textField.superview?.viewWithTag(textTag) as UIResponder?
        if(nextResponder != nil) {
            nextResponder?.becomeFirstResponder()
        } else if textField == passwordTextField {
            textField.resignFirstResponder()
            logInAction()
        }
        return true
    }
}

// MARK: - Alert Controller
extension LoginViewController {
    private func showAlert(with title: String, and message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Eugenie Tyan on 10.06.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userTextField.autocorrectionType = .no
        passwordTextField.autocorrectionType = .no
        
        userTextField.smartInsertDeleteType = .no
        passwordTextField.smartInsertDeleteType = .no
        
        passwordTextField.isSecureTextEntry = true
        
        userTextField.delegate = self
        passwordTextField.delegate = self
        
        userTextField.tag = 0
        passwordTextField.tag = 1
        
        userTextField.returnKeyType = .next
        passwordTextField.returnKeyType = .done
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super .touchesBegan(touches, with: event)
    }
    
    @IBAction func showUserButtonPressed() {
        showAlert(title: "Login", message: "Jack")
    }
    
    @IBAction func showPasswordButtonPressed() {
        showAlert(title: "Password", message: "1234")
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
                 nextField.becomeFirstResponder()
              } else {
                  if userTextField.text == "Jack" && passwordTextField.text == "1234" {
                      performSegue(withIdentifier: "login", sender: self)
                  }
              }
              return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.username = userTextField.text
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "login" {
            if userTextField.text == "Jack" && passwordTextField.text == "1234" {
                return true
            } else {
                showAlert(title: "Failed attempt", message: "Wrong login or password")
                passwordTextField.text = ""
                return false
            }
        }
        return false
    }

}

extension LoginViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}

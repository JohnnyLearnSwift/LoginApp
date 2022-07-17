//
//  LoginViewController.swift
//  LoginApp
//
//  Created by Eugenie Tyan on 10.06.2022.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    //MARK: Аутлеты
    @IBOutlet var userTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    
    //MARK: Публичные свойства
    let userCV = CV.getCV()
    //MARK: Приватные свойства
    //MARK: Инициализаторы
//    init() {
//    }
    //MARK: Методы переопределения род класса
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
//        super .touchesBegan(touches, with: event)
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
                 nextField.becomeFirstResponder()
              } else {
                  if userTextField.text == userCV.authorizationInfo.login &&
                        passwordTextField.text == userCV.authorizationInfo.password {
                      performSegue(withIdentifier: "login", sender: self)
                  }
              }
              return false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let welcomeVC = segue.destination as? WelcomeViewController else { return }
        welcomeVC.userCV = userCV
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        if identifier == "login" {
            if userTextField.text == userCV.authorizationInfo.login &&
                passwordTextField.text == userCV.authorizationInfo.password {
                return true
            } else {
                showAlert(title: "Failed attempt", message: "Wrong login or password")
                passwordTextField.text = ""
                return false
            }
        }
        return false
    }
    //MARK: IBAction методы
    @IBAction func showUserButtonPressed() {
        showAlert(title: "Login", message: userCV.authorizationInfo.login)
    }
    
    @IBAction func showPasswordButtonPressed() {
        showAlert(title: "Password", message: userCV.authorizationInfo.password)
    }
    
    @IBAction func unwind(for segue: UIStoryboardSegue) {
        passwordTextField.text = ""
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

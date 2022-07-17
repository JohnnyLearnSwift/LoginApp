//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Eugenie Tyan on 10.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var userCV: CV!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        welcomeLabel.text = "Welcome, \(userCV.userInfo.name)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let tabBarController = segue.destination as? UITabBarController else {return}
        guard let viewControllers = tabBarController.viewControllers else {return}
        for viewController in viewControllers {
            if let CVViewController = viewController as? CVViewController {
                CVViewController.userCV = userCV
            }
            if let jobXPVC = viewController as? JobXPViewController {
                jobXPVC.userCV = userCV
            }
            
        }
        
    }
}

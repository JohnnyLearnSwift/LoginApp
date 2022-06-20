//
//  WelcomeViewController.swift
//  LoginApp
//
//  Created by Eugenie Tyan on 10.06.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        welcomeLabel.text = "Welcome, \(username ?? "Johnny")"
    }
}

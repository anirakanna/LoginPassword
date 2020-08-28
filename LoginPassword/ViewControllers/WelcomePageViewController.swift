//
//  WelcomePageViewController.swift
//  LoginPassword
//
//  Created by Evgenia Shipova on 27.08.2020.
//  Copyright © 2020 Evgenia Shipova. All rights reserved.
//

import UIKit

class WelcomePageViewController: UIViewController {

    @IBOutlet weak var welcomeUserNameLabel: UILabel!
    
    var userName: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeUserNameLabel.text = "Welcome, " + userName
    }
    
   @IBAction func logOutAction() {
        dismiss(animated: true)
    }
}

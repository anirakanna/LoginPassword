//
//  UserInfoViewController.swift
//  LoginPassword
//
//  Created by Evgenia Shipova on 27.08.2020.
//  Copyright © 2020 Evgenia Shipova. All rights reserved.
//

import UIKit

class UserInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.title = (self.tabBarController?.viewControllers?[0] as? WelcomePageViewController)?.userName
    }
}

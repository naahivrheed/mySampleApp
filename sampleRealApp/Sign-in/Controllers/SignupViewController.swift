//
//  SignupViewController.swift
//  sampleRealApp
//
//  Created by Vihaan Dheer on 10/16/18.
//  Copyright © 2018 Vihaan Dheer. All rights reserved.
//

import UIKit

class SignupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewWillAppear(_ animated: Bool) {
        // when the view is about to appear each time.
    }
    
    @IBAction func toLoginPage(_ sender:UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }

}

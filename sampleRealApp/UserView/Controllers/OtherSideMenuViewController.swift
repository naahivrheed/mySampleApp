//
//  OtherSideMenuViewController.swift
//  sampleRealApp
//
//  Created by Vihaan Dheer on 10/27/18.
//  Copyright © 2018 Vihaan Dheer. All rights reserved.
//

import UIKit

class OtherSideMenuViewController: UIViewController {

    @IBOutlet weak var LeadingConstraint: NSLayoutConstraint!
    @IBOutlet weak var sideMenu: UIView!
    
    var menuOpen: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // when view appears
        LeadingConstraint.constant = -106
    }
    
    @IBAction func barButtonTapped(_ sender: UIBarButtonItem)
    {
        switch menuOpen {
        case false:
            sideMenu.isHidden = false
            LeadingConstraint.constant = 0
        case true:
            LeadingConstraint.constant = -106
        }
        menuOpen = !menuOpen
        UIView.animate(withDuration: 0.3, delay: 0.0, options: .curveEaseOut, animations: {
            self.view.layoutIfNeeded()
        }, completion: nil)
    }
}

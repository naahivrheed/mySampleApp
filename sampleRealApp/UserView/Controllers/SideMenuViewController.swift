//
//  SideMenuViewController.swift
//  sampleRealApp
//
//  Created by Vihaan Dheer on 10/26/18.
//  Copyright © 2018 Vihaan Dheer. All rights reserved.
//

import UIKit

class SideMenuViewController: UIViewController {

    var isOpen: Bool = false
    
    @IBOutlet weak var TrailingC: NSLayoutConstraint!
    @IBOutlet weak var LeadingC: NSLayoutConstraint!
    @IBOutlet weak var myView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    @IBAction func menuButton(_ sender: UIBarButtonItem)
    {
        if !isOpen
        {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                // self.TrailingC.constant = -150
                self.LeadingC.constant = 150
                self.view.layoutIfNeeded()
            }, completion: nil)
        }
        else
        {
            UIView.animate(withDuration: 0.5, delay: 0.0, options: [], animations: {
                self.TrailingC.constant = 0
                self.LeadingC.constant = 0
                self.view.layoutIfNeeded()
            }, completion: nil)        }
        isOpen = !isOpen
    }
}

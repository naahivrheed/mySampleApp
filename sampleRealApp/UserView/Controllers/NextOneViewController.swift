//
//  NextOneViewController.swift
//  sampleRealApp
//
//  Created by Vihaan Dheer on 10/25/18.
//  Copyright © 2018 Vihaan Dheer. All rights reserved.
//

import UIKit

class NextOneViewController: UIViewController {

    @IBOutlet weak var animatingView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // animatingView.center.y -= view.bounds.height
    }
    
    override func viewDidAppear(_ animated: Bool) {
        UIView.animate(withDuration: 1.5, delay: 0.0, options: [], animations: {
            // self.animatingView.center.y += self.view.bounds.height
            // self.animatingView.backgroundColor = UIColor.red
            self.animatingView.frame = CGRect(x: 0, y: 252, width: 375, height: 143)
        }, completion: nil)
    }
}

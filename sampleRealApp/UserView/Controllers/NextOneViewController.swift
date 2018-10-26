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
        animatingView.isHidden = true
        animatingView.center.x -= view.bounds.width
    }
    
    override func viewDidAppear(_ animated: Bool) {
        animatingView.isHidden = false
        UIView.animate(withDuration: 0.8, delay: 0.2, options: [.curveEaseInOut], animations: {
            self.animatingView.center.x += self.view.bounds.width
        }, completion: { (true) in
            let alert = UIAlertController(title: nil, message: "Are you sure you want to delete your account?", preferredStyle: .actionSheet)
            alert.addAction(.init(title: "Cancel", style: .cancel, handler: { (action) in
                print("tapped")
            }))
            alert.addAction(.init(title: "Delete", style: .destructive, handler: nil))
            self.present(alert, animated: true)
        })
        // Hello world
    }
}

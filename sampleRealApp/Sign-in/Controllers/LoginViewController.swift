//
//  LoginViewController.swift
//  sampleRealApp
//
//  Created by Vihaan Dheer on 10/11/18.
//  Copyright © 2018 Vihaan Dheer. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    
    // Firebase setup
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    
    // @IBOutlets
    @IBOutlet weak var emailField:UITextField!
    @IBOutlet weak var passwordField:UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading view
        self.navigationItem.setHidesBackButton(true, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.text = ""
    }
    
    // Login button
    @IBAction func loginButton(_ sender: UIButton)
    {
        if let email = emailField.text, let password = passwordField.text
        {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if user != nil
                {
                    self.label.text = ""
                    let vc = self.storyboard?.instantiateViewController(withIdentifier: "sampleLogin")
                    self.navigationController?.pushViewController(vc!, animated: true)
                }
                else
                {
                    print("Incorrect login information")
                    print(error ?? "")
                    self.label.text = "Incorrect info!!"
                }
                self.passwordField.text = ""
            }
        }
    }
    
    // Return to signup
    @IBAction func toSignup(_ sender: UIButton)
    {
        self.navigationController?.popToRootViewController(animated: true)
    }
}

class sampleLogin: UIViewController {
    
    // Definitions
    var ref:DatabaseReference?
    var handle:DatabaseHandle?
    
    // @IBOutlets
    @IBOutlet weak var label:UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        label.text = ""
        let user = Auth.auth().currentUser
        ref = Database.database().reference()
        ref?.child("Users").child(user!.uid).child("Name").observeSingleEvent(of: .value, with: { (snapshot) in
            self.label.text = "Hello, \(snapshot.value as? String ?? "Friend")"
        })
        
    }
}

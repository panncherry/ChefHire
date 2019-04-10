//
//  SignUpViewController.swift
//  ChefHire
//
//  Created by Pann Cherry on 4/9/19.
//  Copyright © 2019 TechBloomer. All rights reserved.
//

import UIKit
import Parse

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var emailAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var repeatPasswordTxtField: UITextField!
    @IBOutlet weak var createAccountBtn: UIButton!
    @IBOutlet weak var cancelBtn: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    /*:
     # Create Account
     * Create a new account when clicked on createAccountBtn
     */
    @IBAction func onClick_CreateAccount(_ sender: Any) {
        let user = PFUser()
       
    }
    
    
    /*:
     # Cancel Creating Account
     * Dismiss SignUpViewController
     * Display LogInViewController
     * Clear all text fields
     */
    @IBAction func onClick_Cancel(_ sender: Any) {
    }
}

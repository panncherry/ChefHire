//
//  SignUpViewController.swift
//  ChefHire
//
//  Created by Pann Cherry on 4/9/19.
//  Copyright © 2019 TechBloomer. All rights reserved.
//

import UIKit
import Parse
import AlamofireImage

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var profilePicture: UIImageView!
    @IBOutlet weak var firstNameTxtField: UITextField!
    @IBOutlet weak var lastNameTxtField: UITextField!
    @IBOutlet weak var userNameTxtField: UITextField!
    @IBOutlet weak var emailAddressTxtField: UITextField!
    @IBOutlet weak var passwordTxtField: UITextField!
    @IBOutlet weak var repeatPasswordTxtField: UITextField!
    
    @IBOutlet weak var upload_profilePicture_Btn: UIButton!
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
        // Create a new user with the given information
        let user = PFUser()
        user["firstName"] = firstNameTxtField.text
        user["lastName"] = lastNameTxtField.text
        user.username = userNameTxtField.text
        user.email = emailAddressTxtField.text
        user.password = passwordTxtField.text
        
        // Compress the image and send to server
        let imageData = profilePicture.image!.jpegData(compressionQuality: 0.5)
        let profilePictureFile = PFFileObject(name: "profilePicture.jpg", data: imageData!)
        user["profilePicture"] = profilePictureFile
        
        // Will assign these value in ProfileViewController for editing profile information
        user["gender"] = ""
        user["phone"] = ""
        user["city"] = ""
        user["state"] = ""
        
        // Save the information to the server
        user.signUpInBackground { (success, error) in
            if success {
                self.performSegue(withIdentifier: "logInSegue", sender: nil)
                self.clear_textFields()
            }
        }
        
    }
    
    
    /*:
     # Open Camera or Photo Library on click
     * Initiate UIImagePicker
     * Allow user to take a photo using camera or
     * Allow user to select a photo using photo library when camera source is not available
     * Present the picker
     */
    @IBAction func onClick_CameraButton(_ sender: Any) {
        // Instantiate UIImagePickerController
        let picker = UIImagePickerController()
        //Let me know when user is done taking photo. Call me back on a func that has the photo
        picker.delegate = self as? UIImagePickerControllerDelegate & UINavigationControllerDelegate
        picker.allowsEditing = true
        
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            // Open camera when tapping on camera button
            picker.sourceType = .camera
        } else {
            // Show the libaray when tapping on camera button and camera is not available
            picker.sourceType = .photoLibrary
        }
        present(picker, animated: true, completion: nil)
    }
    
    
    /*:
     # Resize Image
     * Resize image with custom width and height
     * Set the imageVIew with scaled image
     */
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        let image = info[.editedImage] as! UIImage
        let size = CGSize(width: 300, height: 300)
        let scaledImage = image.af_imageAspectScaled(toFill: size)
        profilePicture.image = scaledImage
        dismiss(animated: true, completion: nil)
    }
    
    /*:
     # Cancel Creating Account
     * Dismiss SignUpViewController
     * Display LogInViewController
     * Clear all text fields
     */
    @IBAction func onClick_Cancel(_ sender: Any) {
    }
    
    
    /*:
     # Clear All TextFields
     */
    func clear_textFields() {
        self.firstNameTxtField.text = ""
        self.lastNameTxtField.text = ""
        self.userNameTxtField.text = ""
        self.passwordTxtField.text = ""
        self.repeatPasswordTxtField.text = ""
        self.emailAddressTxtField.text = ""
    }
    
}

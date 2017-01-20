//
//  ContactViewController.swift
//  Contacts
//
//  Created by Michał Skalski on 17.01.2017.
//  Copyright © 2017 Michał Skalski. All rights reserved.
//

import UIKit

class ContactViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, UITextFieldDelegate {
    
    // MARK: - Properties
    @IBOutlet weak var contactImageView: UIImageView!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var phoneTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    var contact: Contact?

    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        phoneTextField.delegate = self
        emailTextField.delegate = self
        
        imageViewDesign()
        loadData()
        checkValidationOfName()
    

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        saveButton.isEnabled = false
    }
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        checkValidationOfName()
    }
    
    func checkValidationOfName() {
        let textField = nameTextField.text ?? ""
        saveButton.isEnabled = !textField.isEmpty
    }
    
    func imageViewDesign() {
        //contactImageView.layer.borderWidth = 1.0
        //contactImageView.layer.borderColor = UIColor.darkGray.cgColor
        contactImageView.layer.masksToBounds = true
        contactImageView.layer.cornerRadius = 60.0
    }
    func loadData() {
        if let contact = contact {
            contactImageView.image = contact.image
            nameTextField.text = contact.name
            phoneTextField.text = contact.phoneNum
            emailTextField.text = contact.email
        } else {
            contactImageView.image = UIImage(named: "noimagephoto")
        }
        
    }
    
    
    
    // MARK: - Navigation
    
    @IBAction func cancel(_ sender: Any) {
        let ispresentingInAddContactMode = presentingViewController is UINavigationController
        
        if ispresentingInAddContactMode {
            dismiss(animated: true, completion: nil)
        } else {
            let _ = navigationController?.popViewController(animated: true)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if saveButton == (sender as! UIBarButtonItem) {
            let photo = contactImageView.image
            let name = nameTextField.text ?? ""
            let phone = phoneTextField.text
            let email = emailTextField.text
            
            contact = Contact(name: name, image: photo, phoneNum: phone, email: email)
        }
    }
    
    @IBAction func pickPictureFromGallery(_ sender: UITapGestureRecognizer) {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self
        present(imagePicker, animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedPhoto = info[UIImagePickerControllerOriginalImage] as? UIImage
  
        contactImageView.image = selectedPhoto
        
        dismiss(animated: true, completion: nil)
    }
    
    
}

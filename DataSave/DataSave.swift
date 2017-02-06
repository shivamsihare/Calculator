//
//  DataSave.swift
//  DataSave
//
//  Created by Tara Palace on 08/01/17.
//  Copyright © 2017 Tara Palace. All rights reserved.
//

import UIKit

class DataSave: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    var imagePicker = UIImagePickerController()
    
    override func viewDidLoad() {
        imagePicker.delegate = self
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        if let pickedImage = info[UIImagePickerControllerReferenceURL] as? URL {
            DocumentURL.text = pickedImage.absoluteString
        }
        dismiss(animated: true, completion: nil)
        
    }
    
    @IBOutlet weak var MyName: UITextField!
    @IBAction func browseFile(_ sender: UIButton) {
        imagePicker.allowsEditing = false
        imagePicker.sourceType = .photoLibrary
        present(imagePicker, animated: true, completion: nil)
    }
    @IBOutlet weak var DOB: UIDatePicker!
    @IBOutlet weak var DocumentURL: UITextField!
    @IBAction func submitData(_ sender: UIButton) {
        
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }

    
    
}

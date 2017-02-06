//
//  ViewController.swift
//  DocumentPicker
//
//  Created by Tara Palace on 13/01/17.
//  Copyright © 2017 Tara Palace. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UIDocumentPickerDelegate {

    
    let documentPicker = UIDocumentPickerViewController(documentTypes: ["public.text"], in: UIDocumentPickerMode.import)
    
    @IBAction func pickADocument(_ sender: UIButton) {
        documentPicker.modalPresentationStyle = UIModalPresentationStyle.fullScreen
        self.present(documentPicker, animated: true, completion: nil)
    }
    func documentPicker(_ controller: UIDocumentPickerViewController, didPickDocumentAt url: URL) {
        if controller.documentPickerMode == UIDocumentPickerMode.import {
            print("if u need url it is \(url.absoluteString)")
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        documentPicker.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


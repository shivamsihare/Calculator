//
//  ViewController.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 27/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import UIKit
//import SwiftyJSON

class ViewController: UIViewController, SSRadioButtonControllerDelegate {

    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var nameOfPerson: UITextField!
    
    @IBOutlet weak var eMailAddress: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    
    @IBOutlet weak var isGenderMale: UIButton!
    
    @IBAction func backOpn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func doOnSignUpPress(_ sender: UIButton) {
        
    }
    
    var radioButtonController: SSRadioButtonsController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        radioButtonController = SSRadioButtonsController(buttons: maleButton,femaleButton)
        radioButtonController!.delegate = self
        radioButtonController!.shouldLetDeSelect = true
        
        maleButton.isSelected = true;

        // Do any additional setup after loading the view, typically from a nib.
    }

    func didSelectButton(aButton: UIButton?) {
        print(aButton!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


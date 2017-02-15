//
//  HomeViewController.swift
//  SampleProject
//
//  Created by Tara Palace on 15/02/17.
//  Copyright © 2017 Al Shamas Tufail. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    @IBAction func loginAction(_ sender: UIButton) {
        performSegue(withIdentifier: "Login", sender: sender)
    }
    
    
    @IBAction func signUpAction(_ sender: UIButton) {
        performSegue(withIdentifier: "Sign Up", sender: sender)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        
    }

}

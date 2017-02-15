//
//  LoginViewController.swift
//  SampleProject
//
//  Created by Tara Palace on 13/02/17.
//  Copyright © 2017 Al Shamas Tufail. All rights reserved.
//

import UIKit
import Alamofire

class LoginViewController: UIViewController {

    
    
    //open http://api.androidhive.info/contacts/ to see all the available contacts and enter uid as uid and email as password to login
    
    @IBOutlet weak var uid: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    func showAlert(){
        let alert = UIAlertController(title: "Error", message: "UID or password is incorrect", preferredStyle: UIAlertControllerStyle.alert)
        alert.addAction(UIAlertAction(title: "Go Back To Login Page", style: UIAlertActionStyle.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    var animals = [[String:AnyObject]]()
    var lookup = ["c200":0,"c201":1,"c202":2,"c203":3,"c204":4,"c205":5,"c206":6,"c207":7,"c208":8,"c209":9,"c2010":10,"c2011":11,"c2012":12]
    
    @IBAction func backOpn(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func performSignInAction(_ sender: UIButton) {
        let uid = self.uid!.text
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                //print("response not nil")
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.animals = resData as! [[String:AnyObject]]
                }
            }
                /*
            else{
                print("response nil")
            }
            */
            if let intIndex = self.lookup[uid!] {
                let index = self.animals.startIndex.advanced(by: intIndex)
                var dict = self.animals[index]
                let pass = dict["email"]
                if pass as? String == self.password?.text {  //Here is bug
                    self.performSegue(withIdentifier: "CorrectData", sender: sender)
                }
                else{
                    self.showAlert()
                }
            }
            else {
                self.showAlert()
            }
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

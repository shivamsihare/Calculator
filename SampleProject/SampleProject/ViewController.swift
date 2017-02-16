//
//  ViewController.swift
//  SampleProject
//
//  Created by Al Shamas Tufail on 27/03/2015.
//  Copyright (c) 2015 Al Shamas Tufail. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, SSRadioButtonControllerDelegate {

    @IBOutlet weak var maleButton: UIButton!
    @IBOutlet weak var femaleButton: UIButton!
    
    @IBOutlet weak var nameOfPerson: UITextField!
    
    @IBOutlet weak var eMailAddress: UITextField!
    
    @IBOutlet weak var Password: UITextField!
    @IBOutlet weak var phone: UITextField!
    
    var isGenderMale: Bool{
        get{
            return maleButton.isSelected
        }
    }
    
    @IBAction func doOnSignUpPress(_ sender: UIButton) {
        let params: [String: AnyObject] = [
            "Name": nameOfPerson.text! as AnyObject, "email": eMailAddress.text! as AnyObject , "phone": phone.text! as AnyObject, "password": Password.text! as AnyObject, "gender": isGenderMale as AnyObject
        ]
        Alamofire.request("http://httpbin.org/post", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response:DataResponse<Any>) in
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    //print(response.result.value)
                }
                break
                
            case .failure(_):
                print(response.result.error)
                break
                
            }
            var json = response.result.value as? [String: AnyObject]
            json = json?["json"] as! [String : AnyObject]?
            if let name = json?["Name"]{
                                    print("The Name of Person is: " + String(describing: name))
                                }
                                if let gender = json?["gender"]{
                                    print("The Gender is: " + ((gender as? Bool)! == true ?"Male":"Female"))
                                }
                                if let gender = json?["email"]{
                                    print("The E-mail is: " + String(describing: gender))
                                }
                                if let gender = json?["phone"]{
                                    print("The Phone no. is: " + String(describing: gender))
                                }
                                if let gender = json?["password"]{
                                    print("The Password is: " + String(describing: gender))
                                }
            let statusCode = response.response?.statusCode
            print("Status Code: \(statusCode!)" )
            
        }
        
//        let todosEndpoint: String = "http://httpbin.org/post/"
//        let newTodo: [String: Any] = ["Name": nameOfPerson.text!, "email": eMailAddress.text! , "phone": phone.text!, "password": Password.text!, "gender": isGenderMale]
//        
//        Alamofire.request(todosEndpoint, method: .post, parameters: newTodo, encoding: JSONEncoding.default, headers: nil)
//            .responseJSON { response in
//                print(response.request as Any)  // original URL request
//                print(response.response as Any) // URL response
//                print(response.result.value as Any)   // result of response serialization
//                
//                print("Success: \(response.result.isSuccess)")
//                print("Response String: \(response.result.value)")
//                
//                var statusCode = response.response?.statusCode
//                if let error = response.result.error as? AFError {
//                    statusCode = error._code // statusCode private
//                    switch error {
//                    case .invalidURL(let url):
//                        print("Invalid URL: \(url) - \(error.localizedDescription)")
//                    case .parameterEncodingFailed(let reason):
//                        print("Parameter encoding failed: \(error.localizedDescription)")
//                        print("Failure Reason: \(reason)")
//                    case .multipartEncodingFailed(let reason):
//                        print("Multipart encoding failed: \(error.localizedDescription)")
//                        print("Failure Reason: \(reason)")
//                    case .responseValidationFailed(let reason):
//                        print("Response validation failed: \(error.localizedDescription)")
//                        print("Failure Reason: \(reason)")
//                        
//                        switch reason {
//                        case .dataFileNil, .dataFileReadFailed:
//                            print("Downloaded file could not be read")
//                        case .missingContentType(let acceptableContentTypes):
//                            print("Content Type Missing: \(acceptableContentTypes)")
//                        case .unacceptableContentType(let acceptableContentTypes, let responseContentType):
//                            print("Response content type: \(responseContentType) was unacceptable: \(acceptableContentTypes)")
//                        case .unacceptableStatusCode(let code):
//                            print("Response status code was unacceptable: \(code)")
//                            statusCode = code
//                        }
//                    case .responseSerializationFailed(let reason):
//                        print("Response serialization failed: \(error.localizedDescription)")
//                        print("Failure Reason: \(reason)")
//                        // statusCode = 3840 ???? maybe..
//                    }
//                    
//                    print("Underlying error: \(error.underlyingError)")
//                } else if let error = response.result.error as? URLError {
//                    print("URLError occurred: \(error)")
//                } else {
//                    print("Unknown error: \(response.result.error)")
//                }
//                
//                print(statusCode!)
//                
//                guard response.result.error == nil else {
//                    // got an error in getting the data, need to handle it
//                    print("error calling POST on /todos/1")
//                    print(response.result.error!)
//                    return
//                }
//                // make sure we got some JSON since that's what we expect
//                guard let json = response.result.value as? [String: Any] else {
//                    print("didn't get todo object as JSON from API")
//                    print("Error: \(response.result.error)")
//                    return
//                }
//                // get and print the title
//                if let name = json["Name"]{
//                    print("The Name of Person is: " + String(describing: name))
//                }
//                if let gender = json["gender"]{
//                    print("The Gender is: " + ((gender as? Bool)! == true ?"Male":"Female"))
//                }
//                if let gender = json["email"]{
//                    print("The E-mail is: " + String(describing: gender))
//                }
//                if let gender = json["phone"]{
//                    print("The Phone no. is: " + String(describing: gender))
//                }
//                if let gender = json["password"]{
//                    print("The Password is: " + String(describing: gender))
//                }
//        }
//        
////        let json: [String: Any] = ["title": "ABC",
////                                   "dict": ["1":"First", "2":"Second"]]
////        let jsonData = try? JSONSerialization.data(withJSONObject: json)
////        
////        // create post request
////        let url = URL(string: "http://httpbin.org/post")!
////        var request = URLRequest(url: url)
////        request.httpMethod = "POST"
////        
////        // insert json data to the request
////        request.httpBody = jsonData
////        
////        let task = URLSession.shared.dataTask(with: request) { data, response, error in
////            guard let data = data, error == nil else {
////                print(error?.localizedDescription ?? "No data")
////                return
////            }
////            let responseJSON = try? JSONSerialization.jsonObject(with: data, options: [])
////            if let responseJSON = responseJSON as? [String: Any] {
////                print(responseJSON)
////            }
////        }
////        
////        task.resume()
//        
//        /*
//        let parameters: Parameters = [
//            "Name": nameOfPerson.text!,
//            "Phone": phone.text!,
//        ]
//        
//        // All three of these calls are equivalent
//        Alamofire.request("https://httpbin.org/post", parameters: parameters).responseJSON { response in
//            debugPrint(response)
//        }
//        //Alamofire.request("https://httpbin.org/post", parameters: parameters, encoding: URLEncoding.default)
//        //Alamofire.request("https://httpbin.org/post", parameters: parameters, encoding: URLEncoding.httpBody)
// */
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


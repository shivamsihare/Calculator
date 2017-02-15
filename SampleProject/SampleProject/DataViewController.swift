//
//  DataViewController.swift
//  SampleProject
//
//  Created by Tara Palace on 14/02/17.
//  Copyright © 2017 Al Shamas Tufail. All rights reserved.
//

import UIKit
import Alamofire

class DataViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var tableView: UITableView = UITableView()
    var animals = [[String:AnyObject]]()
    let cellReuseIdentifier = "cell"
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationItem.hidesBackButton = true
        
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
        self.view.addSubview(tableView)
        Alamofire.request("http://api.androidhive.info/contacts/").responseJSON { (responseData) -> Void in
            if((responseData.result.value) != nil) {
                let swiftyJsonVar = JSON(responseData.result.value!)
                
                if let resData = swiftyJsonVar["contacts"].arrayObject {
                    self.animals = resData as! [[String:AnyObject]]
                }
                if self.animals.count > 0 {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return animals.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell!
        
        
            cell = UITableViewCell(style: UITableViewCellStyle.subtitle,
                                   reuseIdentifier: cellReuseIdentifier)
        // At this point, we definitely have a cell -- either dequeued or newly created,
        // so let's force unwrap the optional into a UITableViewCell
        var dict = animals[indexPath.row]
        cell.textLabel?.text = dict["name"] as? String
        cell.detailTextLabel?.text = dict["email"] as? String
        
        return cell
    }
    
    private func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }

}

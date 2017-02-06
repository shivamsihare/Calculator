//
//  CassiniViewController.swift
//  Cassini
//
//  Created by Tara Palace on 26/12/16.
//  Copyright © 2016 Tara Palace. All rights reserved.
//

import UIKit

class CassiniViewController: UIViewController {

    private struct Storyboard {
        static let ShowImageSegue = "Show Image"
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == Storyboard.ShowImageSegue{
            if let ivc = segue.destination.contentViewController as? ImageViewController{
                let imageName = (sender as? UIButton)?.currentTitle
                if imageName != nil{
                    ivc.imageURL = DemoURL.NASA[imageName!]!
                }
            }
        }
    }

}

extension UIViewController {
    var contentViewController: UIViewController {
        get{
            if let navcon = self as? UINavigationController{
                return navcon.visibleViewController ?? self
            }
            else {
                return self
            }
        }
    }
}

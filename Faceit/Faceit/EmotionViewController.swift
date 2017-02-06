//
//  EmotionViewController.swift
//  Faceit
//
//  Created by Tara Palace on 24/12/16.
//  Copyright © 2016 Tara Palace. All rights reserved.
//

import UIKit

class EmotionViewController: UIViewController {

    private let emotionalFaces: Dictionary<String,FacialExpression> = [
        "angry" : FacialExpression(eyes: .Closed, eyeBrows: .Furrowed, mouth: .Frown),
        "happy" : FacialExpression(eyes: .Open, eyeBrows: .Normal, mouth: .Smile),
        "worried" : FacialExpression(eyes: .Open, eyeBrows: .Relaxed, mouth: .Smirk),
        "mischievious" : FacialExpression(eyes: .Open, eyeBrows: .Furrowed, mouth: .Grin)
    ]
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        var destination = segue.destination
        if let navivc = destination as? UINavigationController{
            destination = navivc.visibleViewController ?? destination
        }
        if let facevc = destination as? FaceViewController {
            if let identifier = segue.identifier{
                if let expression = emotionalFaces[identifier]{
                    facevc.expression = expression
                    if let sendingButton = sender as? UIButton{
                        facevc.navigationItem.title = sendingButton.currentTitle
                    }
                }
            }
        }
    }

}

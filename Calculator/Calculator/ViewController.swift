//
//  ViewController.swift
//  Calculator
//
//  Created by Tara Palace on 03/12/16.
//  Copyright © 2016 Tara Palace. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var display: UILabel!
    
    private var userIsInTheMiddleOfTyping = false
    
    @IBAction private func touchDigit(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping {
            let title = sender.currentTitle!
            let textCurrentlyInDisplay = display.text!
            display.text = textCurrentlyInDisplay + title
        }
        else {
            display.text = sender.currentTitle!
            userIsInTheMiddleOfTyping = true
        }
        
    }
    
    private var displayValue:Double {
        get{
            return Double (display.text!)!
        }
        set{
            display.text = String(newValue)
        }
    }
    
    var savedProgram: CalculatorBrain.PropertyList?
    
    @IBAction func save() {
        savedProgram = brain.program
    }
    @IBAction func restore() {
        if savedProgram != nil{
            brain.program = savedProgram!
            displayValue = brain.result
        }
    }
    
    private var brain = CalculatorBrain()
    
    @IBAction private func performOperation(_ sender: UIButton) {
        if userIsInTheMiddleOfTyping{
            brain.setOperand(operand: displayValue)
            userIsInTheMiddleOfTyping = false
        }
        if let mathematicalSymbol = sender.currentTitle {
            brain.performOperation(symbol: mathematicalSymbol)
        }
        displayValue = brain.result
    }
    
}


//
//  ViewController.swift
//  Calculator
//
//  Created by Tara Palace on 03/12/16.
//  Copyright © 2016 Tara Palace. All rights reserved.
//

import UIKit

var calculatorCount = 0

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        calculatorCount += 1
        print("created a new calculator \(calculatorCount)")
        brain.addUnaryOperation(symbol: "z"){ [unowned me = self] in
            me.display.textColor = UIColor.red
            return sqrt($0)
        }
    }
    
    deinit {
        calculatorCount -= 1
        print("calculator left the heap \(calculatorCount)")
    }
    
    
    
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


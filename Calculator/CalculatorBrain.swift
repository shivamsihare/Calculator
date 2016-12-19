//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Tara Palace on 13/12/16.
//  Copyright © 2016 Tara Palace. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    private var accumulator = 0.0
    private var internalProgram = [AnyObject]()
    
    func setOperand(operand: Double){
        accumulator = operand
        internalProgram.append(operand as AnyObject)
    }
    
    var operations:Dictionary<String,Operation> = [
    
        "e" : Operation.Constant(M_E),
        "π" : Operation.Constant(M_PI),
        "cos" : Operation.UnaryOperation(sin),
        "√" : Operation.UnaryOperation(sqrt),
        "×" : Operation.BinaryOperation({$0*$1}),
        "=" : Operation.Equals,
        "-": Operation.BinaryOperation( {$0-$1} ),
        "÷" : Operation.BinaryOperation({$0/$1}),
        "+" : Operation.BinaryOperation({$0+$1})
        
    ]
    
    enum Operation{
        case Constant(Double)
        case UnaryOperation((Double) -> Double)
        case BinaryOperation((Double,Double)->Double)
        case Equals
    }
    
    func performOperation(symbol: String){
        
        internalProgram.append(symbol as AnyObject)
        if let operation = operations[symbol]{
            switch operation {
            case .Constant(let foo):
                accumulator = foo
            case .UnaryOperation(let function):
                accumulator = function(accumulator)
            case .BinaryOperation(let function):
                equalsOperation()
                pending = PendingBinaryOperationInfo(firstOperand: accumulator, binaryFunction: function)
            case .Equals:
                equalsOperation()
            }
        }
    }
    
    func equalsOperation(){
        if pending != nil{
            accumulator = pending!.binaryFunction(pending!.firstOperand,accumulator)
            pending = nil
        }
    }

    
    private var pending: PendingBinaryOperationInfo?
    
    struct PendingBinaryOperationInfo {
        var firstOperand : Double
        var binaryFunction : (Double , Double) -> Double
    }
    
    typealias PropertyList = AnyObject
    
    var program: PropertyList{
        get{
            return internalProgram as AnyObject
        }
        set{
            clear()
            if let arrayOps = newValue as? [AnyObject]{
                for op in arrayOps{
                    if let operand = op as? Double{
                        setOperand(operand: operand)
                    }
                    else if let operation = op as? String{
                        performOperation(symbol: operation)
                    }
                }
            }
            // Deal with variables
        }
    }
    
    func clear(){
        accumulator = 0.0
        pending = nil
        internalProgram.removeAll()
    }
    
    var result:Double {
        get{
            return accumulator
        }
    }
}

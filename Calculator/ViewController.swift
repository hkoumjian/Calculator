//
//  ViewController.swift
//  Calculator
//
//  Created by Harris Koumjian on 8/21/15.
//  Copyright (c) 2015 Harris Koumjian. All rights reserved.
//

import UIKit

extension String{
    var doubleValue: Double{
        if let number = NSNumberFormatter().numberFromString(self) {
            return number.doubleValue
        }
        return 0
    }
}

class ViewController: UIViewController {
    
    var isTypingNumber = false
    var firstNumber:Double? = 0
    var secondNumber:Double? = 0
    var result:Double = 0
    var operation = ""
    
    
    @IBOutlet weak var calculatorDisplay: UILabel!
    @IBAction func numberTapped(sender: AnyObject) {
        var number = sender.currentTitle
        
        if isTypingNumber {
            calculatorDisplay.text = calculatorDisplay.text! + number!!
        } else{
            calculatorDisplay.text = number
            isTypingNumber = true
        }
    }
    @IBAction func calculationTapped(sender: AnyObject) {
        isTypingNumber = false
        firstNumber = calculatorDisplay.text!.doubleValue
        operation = sender.currentTitle!!
    }
    @IBAction func equalsTapped(sender: AnyObject) {
        isTypingNumber = false
        secondNumber = calculatorDisplay.text!.doubleValue
        
        if operation == "+"{
            result = firstNumber! + secondNumber!
        } else if operation == "-"{
            result = firstNumber! - secondNumber!
        } else if operation == "x"{
            result = firstNumber! * secondNumber!
        }else if operation == "/"{
            result = firstNumber! / secondNumber!
        }
        
        //firstNumber = result
        calculatorDisplay.text = "\(result)"
    }
    
    @IBAction func clearTapped(sender: AnyObject) {
        calculatorDisplay.text = "0"
        isTypingNumber = false
    }
    
    func updateValue(var numberOne: Double, var numberTwo: Double){
        if firstNumber != 0{
            numberOne = firstNumber!
            numberTwo = secondNumber!
            if operation == "+"{
                result = numberOne + numberTwo
            } else if operation == "-"{
                result = numberOne - numberTwo
            } else if operation == "x"{
                result = numberOne * numberTwo
            } else if operation == "/"{
                result = numberOne / numberTwo
            }
            firstNumber = result
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}


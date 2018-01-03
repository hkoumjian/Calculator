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
        if let number = NumberFormatter().number(from: self) {
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
//    Handles when the user presses a number.
    @IBAction func numberTapped(_ sender: AnyObject) {
        let number = sender.currentTitle
        
        if isTypingNumber {
            calculatorDisplay.text = calculatorDisplay.text! + number!!
        } else{
            calculatorDisplay.text = number!
            isTypingNumber = true
        }
    }
//    Handles when a user presses one of the operations.
    @IBAction func calculationTapped(_ sender: AnyObject) {
        isTypingNumber = false
        firstNumber = calculatorDisplay.text!.doubleValue
        operation = sender.currentTitle!!
    }
//    Produces the output when the user presses the equals button depending on what the operation was.
    @IBAction func equalsTapped(_ sender: AnyObject) {
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
    
//    Clears the output of the calculator.
    @IBAction func clearTapped(_ sender: AnyObject) {
        calculatorDisplay.text = "0"
        isTypingNumber = false
    }
    
//    Updates output for when a value is already in the calculator.
    func updateValue(_ numberOne: Double, numberTwo: Double){
        var numberOne = numberOne, numberTwo = numberTwo
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


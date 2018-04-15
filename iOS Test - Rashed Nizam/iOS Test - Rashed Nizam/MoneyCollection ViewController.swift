//
//  MoneyCollection ViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/14/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class MoneyCollection_ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var numberOfClassmateTextField: UITextField!
    
    @IBOutlet weak var unluckyNumberTextField: UITextField!
    
    @IBOutlet weak var outputTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Money Collection"
    }

    
    @IBAction func calculateMaximumProfit(_ sender: Any) {
        
        var numberOfClassmates = 0
        var unluckyNumber = 0
        
        // Number of Classmate
        if (numberOfClassmateTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty!", message: "Number of classmate is Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            numberOfClassmates = Int(numberOfClassmateTextField.text!)!
            if numberOfClassmates < 1 || numberOfClassmates > 2000000000 {
                let alert = UIAlertController(title: "Invalid Entry!", message: "Number of classmates is Invalid\nIt should be within 1 to 2x10^9", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        
        // Unlucky Number
        if (unluckyNumberTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty!", message: "Unlucky Number is Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            unluckyNumber = Int(unluckyNumberTextField.text!)!
            if unluckyNumber < 1 || unluckyNumber > 4000000000000000 {
                let alert = UIAlertController(title: "Invalid Entry!", message: "Unlucky Number is Invalid\nIt should be within 1 to 4x10^15", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
        }
        
        let maxCollection = maxMoney(numberOfClassmates: numberOfClassmates, unluckyNumber: unluckyNumber)
        outputTextView.text = "\(maxCollection)"
    }
    
    func maxMoney(numberOfClassmates: Int, unluckyNumber: Int) -> Int {
        
        var sumArray : [Int] = []
        var sum = 0
        
        for times in 1 ... numberOfClassmates {
            
            var isSumMatchedWithUnluckyNumber = false
            sum = 0
            
            for i in times ... numberOfClassmates {
                sum += i
                // check if sum matches with unlucky number
                if sum == unluckyNumber {
                    sum -= i
                    isSumMatchedWithUnluckyNumber = true
                }
            }
            sumArray.append(sum)
            if !isSumMatchedWithUnluckyNumber {
                break
            }
        }
        
        print(sumArray)
        return sumArray.max()!
    }
    
    
    
    ////////////////////////
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}

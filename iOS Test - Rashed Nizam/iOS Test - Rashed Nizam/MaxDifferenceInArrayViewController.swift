//
//  MaxDifferenceInArrayViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/14/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class MaxDifferenceInArrayViewController: UIViewController {

    var integerArray : [Int] = []
    
    
    @IBOutlet weak var arrayTextView: UITextView!
    
    @IBOutlet weak var integerTextField: UITextField!
    
    @IBOutlet weak var outputTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Max Difference in an Array"
    }

    @IBAction func clearArray(_ sender: Any) {
        integerArray.removeAll()
        arrayTextView.text = ""
    }
    
    @IBAction func addToArray(_ sender: Any) {
        if (integerTextField.text?.isEmpty)! {
            
        } else {
            integerArray.append(Int(integerTextField.text!)!)
            arrayTextView.text = "\(integerArray)"
            integerTextField.text = ""
        }
    }
    
    @IBAction func findMaxDifference(_ sender: Any) {
        
        if (integerArray.isEmpty) {
            let alert = UIAlertController(title: "Empty!", message: "Integer Array is Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            
            // Find out max difference
            if integerArray.count < 2 {
                let alert = UIAlertController(title: "One Element Only!", message: "Enter more number to the array", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            } else {
                let maxDiff = maxDifference (intArray: integerArray)
                
                // Prints output
                outputTextView.text = "\(maxDiff)"
            }
            
        }
    }
    
    func maxDifference(intArray: [Int]) -> Int {
        
        var maxDiffArray : [Int] = []
        
        for i in 1 ..< intArray.count {
            for j in 0 ..< i {
                let diff = intArray[i] - intArray[j]
                print(diff)
                maxDiffArray.append(diff)
            }
        }
        
        return maxDiffArray.max()!
    }
    
    
    ////////////////////////
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

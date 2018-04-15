//
//  SuperStackViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/13/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class SuperStackViewController: UIViewController, UITextFieldDelegate {

    var stackArray : [Int] = []
    
    @IBOutlet weak var stackArrayLabel: UILabel!
    @IBOutlet weak var pushTextField: UITextField!
    
    @IBOutlet weak var eTextField: UITextField!
    @IBOutlet weak var kTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Super Stack"
        
    }
    
    // Pop element from stack
    @IBAction func popElement(_ sender: Any) {
        
        // checks if stack is empty
        if (!stackArray.isEmpty) {
            // if not, then remove the top element
            stackArray.removeFirst()
        }
        // print the stack
        stackArrayLabel.text = "\(stackArray)"
    }
    
    @IBAction func pushElement(_ sender: Any) {
        
        // check if the element is nil or not
        if (!(pushTextField.text?.isEmpty)!) {
            // if not then push the element at top of stack
            let e = Int(pushTextField.text!)
            stackArray.insert(e!, at: 0)
            pushTextField.text = ""
        }
        // print the stack
        stackArrayLabel.text = "\(stackArray)"
    }
    
    @IBAction func incElements(_ sender: Any) {
        
        // check if both e and k are nil or not.
        if (!(eTextField.text?.isEmpty)! && !(kTextField.text?.isEmpty)!) {
            
            let e = Int(eTextField.text!)
            // e should be grater than 0
            if (e! > 0) {
                // e should be less than the count of stack
                if e! <= stackArray.count {
                    let k = Int(kTextField.text!)
                    // make a loop for bottom e elements of stack
                    for i in 1 ... e! {
                        print("\(stackArray.count-i)")
                        // add k with last e elements
                        stackArray[stackArray.count-i] += k!
                    }
                } else {
                    let alert = UIAlertController(title: "Invalid Entry!", message: "e should be less than the stack size", preferredStyle: UIAlertControllerStyle.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                let alert = UIAlertController(title: "Invalid Entry!", message: "e should be greater than 0", preferredStyle: UIAlertControllerStyle.alert)
                alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alert, animated: true, completion: nil)
            }
        } else {
            let alert = UIAlertController(title: "Empty!", message: "Either e or k is empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        // print the stack
        stackArrayLabel.text = "\(stackArray)"
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return true
    }
    
}

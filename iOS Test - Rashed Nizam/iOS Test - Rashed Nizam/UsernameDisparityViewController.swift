//
//  UsernameDisparityViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/13/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class UsernameDisparityViewController: UIViewController, UITextFieldDelegate {

    var stringArray : [String] = []
    
    @IBOutlet weak var stringArrayTextView: UITextView!
    
    @IBOutlet weak var stringTextField: UITextField!
    
    @IBOutlet weak var outPutTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Username Disparity"
        
    }

    @IBAction func addStringToTheArray(_ sender: Any) {
        
        if (!(stringTextField.text?.isEmpty)!) {
            stringArray.append(stringTextField.text!)
        }
        stringArrayTextView.text = "\(stringArray)"
        stringTextField.text = ""
        self.view.endEditing(true)
    }
    
    @IBAction func clearInput(_ sender: Any) {
        stringArray.removeAll()
        stringArrayTextView.text = "\(stringArray)"
    }
    
    @IBAction func calculateUsernameDisparity(_ sender: Any) {
        
        // returns the integer array of disparity of a given string array
        if stringArray.count < 1 {
            let alert = UIAlertController(title: "String Array is Empty!", message: "Add some strings to the array.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let array = calculateDisparityOfAStringArray(strings: stringArray)
            outPutTextView.text = "\(array)"
        }
        
    }
    
    // calculate & return the disparity value array of strina array
    func calculateDisparityOfAStringArray (strings: [String]) -> [Int] {
        
        var result: [Int] = []
        
        for i in 0 ... strings.count-1 {
            // calculate diparity of a particular string of an array
            let disparityValue = calculateDisparityOfAString(string: strings[i])
            // and then append to an integer array
            result.append(disparityValue)
        }
        
        return result
    }
    // calculate & return the Disparity value
    func calculateDisparityOfAString (string: String) -> Int {
        
        var result = string.count
        // getting all the suffixes of the string
        for i in 1 ... string.count-1 {
            // checks if the suffix is also a prefix to the string
            if (checkIfSubStringIsPrefix(subString: String(string.suffix(i)), mainString: string)) {
                // if so then add the count of the sub-string to result
                result += string.suffix(i).count
            }
        }
        return result
    }
    
    // Determine if a substring is prefix to a given string
    func checkIfSubStringIsPrefix(subString: String, mainString: String) -> Bool {
        // Checks if the substring is small or equal to main string
        if subString.count <= mainString.count {
            // checks if the substring is prefix
            if subString == mainString.prefix(subString.count) {
                return true
            }
        }
        return false
    }
    
    
    ////////////////////////
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        if (!(stringTextField.text?.isEmpty)!) {
            stringArray.append(stringTextField.text!)
        }
        stringArrayTextView.text = "\(stringArray)"
        stringTextField.text = ""
        
//        self.view.endEditing(true)
        return true
    }

}

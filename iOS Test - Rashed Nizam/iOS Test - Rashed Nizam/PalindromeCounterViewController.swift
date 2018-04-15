//
//  PalindromeCounterViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/14/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class PalindromeCounterViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var stringTextField: UITextField!
    @IBOutlet weak var outputTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Palindrome Counter"
    }

    @IBAction func countPalindrome(_ sender: Any) {
        
        if (stringTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty!", message: "Enter a string", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            let palindromeStrings = getPalindromeSubstrings(string: stringTextField.text!)
            
            // Prints output
            outputTextView.text = "\(palindromeStrings.count) \n\n \(palindromeStrings)"
        }
    }
    
    // get an array of all the palindromeStrings
    func getPalindromeSubstrings(string: String) -> [String] {
        
        var palindromeStrings : [String] = []
        
        // Get all the substrings
        let substringArray = subStrings(string: stringTextField.text!)
        
        // check if sub-string is palindrome
        for substring in substringArray {
            if(substring == String(substring.reversed())){
                palindromeStrings.append(substring)
            }
        }
        return palindromeStrings
    }
    
    // returns all the substrings array of a given string
    func subStrings(string: String) -> [String] {
        var substringArray : [String] = []
        for i in 1 ... string.count {
            for j in 0 ... string.count-i {
                substringArray.append(substringFromTo(string: string, fromIndex: j, toIndex: j+i)!)
            }
        }
        return substringArray
    }
    
    // returns a substring from-to
    func substringFromTo (string: String, fromIndex: Int, toIndex: Int) -> String? {
        if fromIndex < toIndex && toIndex <= string.count {
            let startIndex = string.index(string.startIndex, offsetBy: fromIndex)
            let endIndex = string.index(string.startIndex, offsetBy: toIndex)
            return String(string[startIndex..<endIndex])
        } else {
            return nil
        }
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



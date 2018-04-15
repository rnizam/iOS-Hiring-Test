//
//  AdorableStringViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/13/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class AdorableStringViewController: UIViewController, UITextFieldDelegate {

    var stringArray : [String] = []
    let alphaNumericLetterWithColon = "abcdefghijklmnopqrstuvwxyz0123456789:"
    let alphaNumericLetter = "abcdefghijklmnopqrstuvwxyz0123456789"
    let lowercaseLetters = "abcdefghijklmnopqrstuvwxyz"
    
    @IBOutlet weak var stringArrayTextView: UITextView!
    @IBOutlet weak var stringTextField: UITextField!
    
    @IBOutlet weak var outPutTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Adorable Strings"
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
    
    @IBAction func countAdorableStrings(_ sender: Any) {
        
        if stringArray.count < 1 {
            let alert = UIAlertController(title: "String Array is Empty!", message: "Add some strings to the array.", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            let countArray = countAdorableStringOfAStringArray(stringArray: stringArray)
            outPutTextView.text = "\(countArray)"
        }
    }
    
    func countAdorableStringOfAStringArray(stringArray: [String]) -> [Int] {
        
        var result: [Int] = []
        
        for string in stringArray {
            result.append(adorableStringsCount(string: string))
        }
        
        return result
    }
    
    // count the adorable strings of a given string
    func adorableStringsCount (string: String) -> Int {
        
        var subStringArray : [String] = []
        var str = string
        
        // Length of an adorable string should be atleast 5
        if str.count < 5 {
            return 0
        }
        
        // appending all the substrings to an array
        while (str.count >= 5) {
            for i in 5 ... str.count {
                subStringArray.append(String(str.prefix(i)))
            }
            str = String(str.suffix(str.count-1))
        }
        
        // check if the substrings is adorable and count
        var count = 0
        for subStr in subStringArray {
            if checkIfStringIsAdorable(string: subStr) {
                count += 1
            }
        }
        
        return count
    }
    
    // Checks if a string is adorable or not
    func checkIfStringIsAdorable(string: String) -> Bool {
        var isStartedWithALowercaseEnglishLetter = false
        var isForwardSlashFound = false
        var isBackwardSlashFound = false
        var isThereAnyCharacterAfterForwardSlash = false
        var isThereAnyCharacterAfterBackwardSlash = false
        
        // check if first character is lowercase letters
        if(isLowercaseLetter(ch: string.first!)) {
            isStartedWithALowercaseEnglishLetter = true
        } else {
            return false
        }
        
        // check every character of the string
        for ch in string {
            
            // Checks the characters untill get forwardslash
            if (isStartedWithALowercaseEnglishLetter) {
                // check if first character is isAlphanumericLetterOrAColon
                if(isAlphanumericLetterOrAColon(ch: ch)) {
                    continue
                } else {
                    if ch == "/" {
                        isForwardSlashFound = true
                        isStartedWithALowercaseEnglishLetter = false
                        continue
                    } else {
                        return false
                    }
                }
            }
            
            // Checks the characters untill get backwardslash
            if (isForwardSlashFound) {
                if(isAlphanumericLetter(ch: ch)) {
                    isThereAnyCharacterAfterForwardSlash = true
                    continue
                } else {
                    if ch == "\\" {
                        if !isThereAnyCharacterAfterForwardSlash {
                            return false
                        }
                        isBackwardSlashFound = true
                        isForwardSlashFound = false
                        continue
                    } else {
                        return false
                    }
                }
            }
            
            // Checks the characters till the last
            if (isBackwardSlashFound) {
                if(isLowercaseLetter(ch: ch)) {
                    isThereAnyCharacterAfterBackwardSlash = true
                    continue
                } else {
                    return false
                }
            }
        }
        
        if !isThereAnyCharacterAfterBackwardSlash {
            return false
        }
        return true
        
    }
    
    
    // check if the character is a lowercase letter
    func isLowercaseLetter(ch:Character) -> Bool {
        for lcl in lowercaseLetters {
            if ch == lcl {
                return true
            }
        }
        return false
    }
    
    // check if the character is a alphanumeric letter
    func isAlphanumericLetter(ch:Character) -> Bool {
        for lcl in alphaNumericLetter {
            if ch == lcl {
                return true
            }
        }
        return false
    }
    
    // check if the character is a alphanumeric letter or a colon
    func isAlphanumericLetterOrAColon(ch:Character) -> Bool {
        for lcl in alphaNumericLetterWithColon {
            if ch == lcl {
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

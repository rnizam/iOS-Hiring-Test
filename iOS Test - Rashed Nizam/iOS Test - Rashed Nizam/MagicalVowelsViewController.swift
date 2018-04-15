//
//  MagicalVowelsViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/15/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class MagicalVowelsViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var stringTextField: UITextField!
    @IBOutlet weak var outputTextView: UITextView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Magical Vowels"
    }
    
    @IBAction func clearString(_ sender: Any) {
        stringTextField.text = ""
    }
    
    @IBAction func traceTheMagicalSubsequence(_ sender: Any) {
        
        if (stringTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty!", message: "Enter a string", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            let maxMagicalSubsequence = longestSubsequence(string: stringTextField.text!)
            
            // Prints output
            if maxMagicalSubsequence.isEmpty {
                outputTextView.text = "Ther is no magical subsequence in the string"
            } else {
                outputTextView.text = "Length: \(maxMagicalSubsequence.count) \n\nLongest Subsequence: \(maxMagicalSubsequence)"
            }
            
        }
        self.view.endEditing(true)
    }
    
    func longestSubsequence (string: String) -> String {
        
        var is_a_On = true
        var is_e_On = false
        var is_i_On = false
        var is_o_On = false
        var is_u_On = false
        
        var magicalVowels : String = ""
        
        for i in 0 ..< string.count {
            
            // appending a
            if is_a_On {
                if string[i] == "a"  {
                    magicalVowels.append(string[i])
                    continue
                }
                if string[i] == "e"  {
                    magicalVowels.append(string[i])
                    is_a_On = false
                    is_e_On = true
                    continue
                }
            }
            
            // appending e
            if is_e_On {
                if string[i] == "e"  {
                    magicalVowels.append(string[i])
                    continue
                }
                if string[i] == "i"  {
                    magicalVowels.append(string[i])
                    is_e_On = false
                    is_i_On = true
                    continue
                }
            }
            
            // appending i
            if is_i_On {
                if string[i] == "i"  {
                    magicalVowels.append(string[i])
                    continue
                }
                if string[i] == "o"  {
                    magicalVowels.append(string[i])
                    is_i_On = false
                    is_o_On = true
                    continue
                }
            }
            
            // appending o
            if is_o_On {
                if string[i] == "o"  {
                    magicalVowels.append(string[i])
                    continue
                }
                if string[i] == "u"  {
                    magicalVowels.append(string[i])
                    is_o_On = false
                    is_u_On = true
                    continue
                }
            }
            
            // appending u
            if is_u_On {
                if string[i] == "u"  {
                    magicalVowels.append(string[i])
                    continue
                }
            }
                        
        }
        
        if is_u_On {
            return magicalVowels
        }
        return ""
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

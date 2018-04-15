//
//  ViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/13/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let projectTitle : [String] = ["Super Stack", "Username Disparity", "Adorable String", "Cutting Metal Surplus", "Money Collection", "Palindrome Counter", "Max Difference in an Array", "Magical Vowels"]
    
    let vcIdentifiers : [String] = ["SuperStack", "UsernameDisparity", "AdorableString", "CuttingMetalSurplus", "MoneyCollection", "PalindromeCounter", "MaxDifferenceInArray", "MagicalVowels"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    // Table View Data Source
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell(style: .default, reuseIdentifier: "Cell")
        cell.textLabel?.text = projectTitle[indexPath.row]
        return cell
    }
    
    // Table View Delegates
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // Transition
        self.navigationController?.pushViewController(vcInstance(name: vcIdentifiers[indexPath.row]), animated: true)
    }
    
    private func vcInstance(name: String) -> UIViewController {
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: name)
    }
    

}




extension String {
    subscript (i: Int) -> Character {
        return self[index(startIndex, offsetBy: i)]
    }
    subscript (bounds: CountableRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ..< end]
    }
    subscript (bounds: CountableClosedRange<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[start ... end]
    }
    subscript (bounds: CountablePartialRangeFrom<Int>) -> Substring {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(endIndex, offsetBy: -1)
        return self[start ... end]
    }
    subscript (bounds: PartialRangeThrough<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ... end]
    }
    subscript (bounds: PartialRangeUpTo<Int>) -> Substring {
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return self[startIndex ..< end]
    }
    
}

//
//  CuttingMetalSurplusViewController.swift
//  iOS Test - Rashed Nizam
//
//  Created by Abu Suhaeeb on 4/14/18.
//  Copyright © 2018 Rashed Nizam. All rights reserved.
//

import UIKit

class CuttingMetalSurplusViewController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var costPerCutTextField: UITextField!
    
    @IBOutlet weak var salePriceTextField: UITextField!
    
    @IBOutlet weak var lengthTextField: UITextField!
    
    @IBOutlet weak var outputTextView: UITextView!
    
    var lengthArray : [Int] = []
    @IBOutlet weak var lengthsArrayTextView: UITextView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cutting Metal Surplus"
    }

    
    @IBAction func addLengthToArray(_ sender: Any) {
        
        let len = Int(lengthTextField.text!)
        lengthArray.append(len!)
        lengthTextField.text = ""
        lengthsArrayTextView.text = "\(lengthArray)"
    }
    
    @IBAction func clearLengthArray(_ sender: Any) {
        lengthArray.removeAll()
        lengthTextField.text = ""
        lengthsArrayTextView.text = "\(lengthArray)"
    }
    
    
    
    @IBAction func calculateMaxProfit(_ sender: Any) {
        
        // Cost Per Unit
        var costPerCut = 0
        if (costPerCutTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty!", message: "Cost Per Cut is Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            costPerCut = Int(costPerCutTextField.text!)!
        }
        
        // Sale Price
        var salePrice = 0
        if (salePriceTextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Empty!", message: "Sale Price is Empty", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        } else {
            salePrice = Int(salePriceTextField.text!)!
        }
        
        // length array
        if (lengthArray.isEmpty) {
            let alert = UIAlertController(title: "Empty!", message: "Length Array is Empty!\nInput some lengths", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            return
        }
        
        // Calculate Max Profit
        let maxProfit = calculateMaxPossibleProfit(costPerCut: costPerCut, salePrice: salePrice, lengths: lengthArray)
        
        // Printing to Output
        outputTextView.text = String(maxProfit)
        self.view.endEditing(true)
    }
    
    func calculateMaxPossibleProfit(costPerCut: Int, salePrice: Int, lengths: [Int]) -> Int {
        
        var totalProfit = 0
        var totalUniformRods = 0
        var saleLength = 0
        var totalCuts = 0
        
        let maxLength : Int = lengths.max()!
        
        // Try for each possible lengths
        var profitArray : [Int] = []
        for i in 1 ... maxLength {
            
            for length in lengths {
                var tempLength = length
                while i <= tempLength { // 2 1
                    if i == tempLength {
                        totalUniformRods += 1
                        tempLength -= i
                        continue
                    }
                    tempLength -= i
                    totalUniformRods += 1
                    totalCuts += 1
                }
            }
            saleLength = i
            let profit = totalUniformRods * saleLength * salePrice - totalCuts * costPerCut
            profitArray.append(profit)
            saleLength = 0
            totalUniformRods = 0
            totalCuts = 0
        }
        
        print(profitArray)
        totalProfit = profitArray.max()!
        return totalProfit
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

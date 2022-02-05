//
//  ViewController.swift
//  Prework
//
//  Created by Gregory Sinaga on 2/4/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipSlider: UISlider!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var minTip: UILabel!
    @IBOutlet weak var maxTip: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let formatter = NumberFormatter()
        formatter.numberStyle = .percent
        formatter.maximumFractionDigits = 2
        if let formattedMinTip = formatter.string(from: tipSlider.minimumValue as NSNumber) {
            minTip.text = "\(formattedMinTip)"
        }
        if let formattedMaxTip = formatter.string(from: tipSlider.maximumValue as NSNumber) {
            maxTip.text = "\(formattedMaxTip)"
        }
    }
    @IBAction func calculateTip(_ sender: Any) {
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tfloatip by multiplying tip * tipPercentage
        let tipPercentage = Double(tipSlider.value)
        let tip = bill * tipPercentage
        let total = bill + tip
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        
        // Update tip amount label
        
        // tipAmountLabel.text = String(format: "$%.2f", tip)
        if let formattedTip = formatter.string(from: tip as NSNumber) {
            tipAmountLabel.text = "\(formattedTip)"
        }
        // Update total amount
        // totalLabel.text = String(format: "$%.2f", total)
        if let formattedTotal = formatter.string(from: total as NSNumber) {
            totalLabel.text = "\(formattedTotal)"
        }
    }
    

}


//
//  ViewController.swift
//  Tipsy
//
//  Created by Mac on 21.06.2022.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var tip = 0.1
    var peopleForSplit = 2
    var billValue = 0.0
    var result = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        updateUI()
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        
        let buttonTitleWithoutPercentSign = String(buttonTitle.dropLast())
        
        let buttonTitleAsNumber = Double(buttonTitleWithoutPercentSign)!
        
        tip = buttonTitleAsNumber / 100
        
        billTextField.endEditing(true)
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        peopleForSplit = Int(sender.value)
        splitNumberLabel.text = String(Int(sender.value))
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        billValue = Double(billTextField.text!) ?? 0.0
        let tempResult = (billValue + billValue * tip) / Double(peopleForSplit)
        result = String(format: "%.2f", tempResult)
        
        performSegue(withIdentifier: "goToResult", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.totalValue = result
            destinationVC.numberOfPeople = peopleForSplit
            destinationVC.tipValue = Int(tip * 100)
        }
    }
    
    func updateUI() {
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
    }
    
}


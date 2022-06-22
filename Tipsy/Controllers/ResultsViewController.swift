//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Mac on 22.06.2022.
//

import UIKit

class ResultsViewController: UIViewController {
    
    var totalValue = "0.0"
    var numberOfPeople = 2
    var tipValue = 10

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = totalValue
        settingsLabel.text = "Split between \(numberOfPeople) people, with \(tipValue)% tip"
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

}

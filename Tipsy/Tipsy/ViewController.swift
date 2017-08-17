//
//  ViewController.swift
//  Tipsy
//
//  Created by Harsh Mehta on 8/16/17.
//  Copyright © 2017 Harsh Mehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billAmount: UITextField!
    @IBOutlet weak var tipAmount: UILabel!
    @IBOutlet weak var tipPercentage: UISegmentedControl!
    @IBOutlet weak var total: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tipCalculate(_ sender: Any) {
        let tipMultipliers = [0.18, 0.20, 0.25]
        
        let billAmountDouble = Double(billAmount.text!) ?? 0
        let tipAmountDouble = billAmountDouble*tipMultipliers[tipPercentage.selectedSegmentIndex]
        let totalAmountDouble = billAmountDouble + tipAmountDouble
        
        tipAmount.text = String.init(format: "%.2f", tipAmountDouble)
        total.text = String.init(format: "%.2f", totalAmountDouble)
    }

}


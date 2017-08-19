//
//  ViewController.swift
//  Tipsy
//
//  Created by Harsh Mehta on 8/16/17.
//  Copyright © 2017 Harsh Mehta. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var totalPerPersonLabel: UILabel!
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipPercentageControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var splitLabel: UILabel!
    @IBOutlet weak var splitSlider: UISlider!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        print("view did load")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func splitSliderAction(_ sender: Any) {
        let splitBy = Int(splitSlider.value)
        splitLabel.text = "\(splitBy)"
        
        tipCalculate(self)
    }
    
    @IBAction func tipCalculate(_ sender: Any) {
        let tipMultipliers = [0.18, 0.20, 0.25]
        
        let billAmountDouble = Double(billAmountTextField.text!) ?? 0
        let tipAmountDouble = billAmountDouble*tipMultipliers[tipPercentageControl.selectedSegmentIndex]
        let totalAmountDouble = billAmountDouble + tipAmountDouble
        let splitBy = Double(splitSlider.value)
        
        tipAmountLabel.text = String.init(format: "$%.2f", tipAmountDouble)
        totalLabel.text = String.init(format: "$%.2f", totalAmountDouble)
        totalPerPersonLabel.text = String.init(format: "$%.2f", totalAmountDouble/splitBy)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("view will appear")
        
        // Text field to become first resonder.
        billAmountTextField.becomeFirstResponder()
        
        // Update the default tip percentage value
        let defaults = UserDefaults.standard
        let defaultTipPercentageSegmentIndex = defaults.integer(forKey: "defaultTipPercentageSegmentIndex")
        tipPercentageControl.selectedSegmentIndex = defaultTipPercentageSegmentIndex
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("view did appear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("view will disappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("view did disappear")
    }

}


//
//  SettingsViewController.swift
//  Tipsy
//
//  Created by Harsh Mehta on 8/19/17.
//  Copyright © 2017 Harsh Mehta. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultTipPercentageControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let defaults = UserDefaults.standard
        let defaultTipPercentageSegmentIndex = defaults.integer(forKey: "defaultTipPercentageSegmentIndex")
        defaultTipPercentageControl.selectedSegmentIndex = defaultTipPercentageSegmentIndex
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func tipPercentageControlOnTap(_ sender: Any) {
        let defaults = UserDefaults.standard
        defaults.set(defaultTipPercentageControl.selectedSegmentIndex, forKey: "defaultTipPercentageSegmentIndex")
        defaults.synchronize()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

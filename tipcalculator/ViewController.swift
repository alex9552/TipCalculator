//
//  ViewController.swift
//  tipcalculator
//
//  Created by Alex  Oser on 12/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var billLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    
    //checks to see if the user has entered their own tip values and preferred tip, if not sets defaults
    func checkForDefaults() {
        var default1: Double
        var default2: Double
        var default3: Double
        //sets default1
        if (defaults.objectForKey("default1") != nil) {
            default1 = defaults.doubleForKey("default1")
            tipControl.setTitle(String(format: "%.0f%%", default1), forSegmentAtIndex: 0)
        }
        else {
            default1 = 10
        }
        //sets default2
        if (defaults.objectForKey("default2") != nil) {
            default2 = defaults.doubleForKey("default2")
            tipControl.setTitle(String(format: "%.0f%%", default2), forSegmentAtIndex: 1)
        }
        else {
            default2 = 20
        }
        //sets default3
        if (defaults.objectForKey("default3") != nil) {
            default3 = defaults.doubleForKey("default3")
            tipControl.setTitle(String(format: "%.0f%%", default3), forSegmentAtIndex: 2)
        }
        else {
            default3 = 30
        }
        var tipPercentages = [default1,default2,default3]
        let selectedPercentage = tipPercentages[tipControl.selectedSegmentIndex]
        
        let billWithDollarSign = billField.text
        let billWithoutDollarSign = String(billWithDollarSign!.characters.dropFirst())
        let billAmount = (billWithoutDollarSign as NSString).doubleValue
        let tip = billAmount * selectedPercentage/100
        let total = billAmount+tip
        
        tipLabel.text = String(format: "$%.2f", tip)
        billLabel.text = String(format: "$%.2f", total)
        if (billField.text == "") {
            billField.text = "$"
        }
//(billField.text! as NSString).doubleValue
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        //call check for defaults when switching back from settings panel
        checkForDefaults()

        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        billField.becomeFirstResponder()
        //call check for defaults when opening the app
        checkForDefaults()
        if (defaults.objectForKey("preferredTip") != nil) {
            let selectedPercentage = defaults.integerForKey("preferredTip")
            tipControl.selectedSegmentIndex = selectedPercentage
        }
        UINavigationBar.appearance().backgroundColor = UIColor.greenColor()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        //call check for defaults when entering bill amount
        checkForDefaults()
    }

    @IBAction func onTap(sender: AnyObject) {
//        view.endEditing(true)
    }

}


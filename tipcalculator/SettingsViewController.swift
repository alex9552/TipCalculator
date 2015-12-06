//
//  SettingsViewController.swift
//  tipcalculator
//
//  Created by Alex  Oser on 12/2/15.
//  Copyright © 2015 codepath. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var defaultOneField: UITextField!
    @IBOutlet weak var defaultTwoField: UITextField!
    @IBOutlet weak var defaultThreeField: UITextField!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    let defaults = NSUserDefaults.standardUserDefaults()
    func checkForDefaults() {
        //sets default1
        if (defaults.objectForKey("default1") != nil) {
            let default1 = defaults.doubleForKey("default1")
            defaultOneField.text = String(format: "%.0f%%", default1)
            tipControl.setTitle(String(format: "%.0f%%", default1), forSegmentAtIndex: 0)
        }
        //sets default2
        if (defaults.objectForKey("default2") != nil) {
            let default2 = defaults.doubleForKey("default2")
            defaultTwoField.text = String(format: "%.0f%%", default2)
            tipControl.setTitle(String(format: "%.0f%%", default2), forSegmentAtIndex: 1)
        }
        //sets default3
        if (defaults.objectForKey("default3") != nil) {
            let default3 = defaults.doubleForKey("default3")
            defaultThreeField.text = String(format: "%.0f%%", default3)
            tipControl.setTitle(String(format: "%.0f%%", default3), forSegmentAtIndex: 2)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        checkForDefaults()
        if (defaults.objectForKey("preferredTip") != nil) {
            let selectedPercentage = defaults.integerForKey("preferredTip")
            tipControl.selectedSegmentIndex = selectedPercentage
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveDefaults(sender: AnyObject) {
        //check if each field is nil before saving as default and then updating labels
        
        if (defaultOneField.text != "") {
        defaults.setDouble((defaultOneField.text! as NSString).doubleValue, forKey: "default1")
        }
        if (defaultTwoField.text != "") {
            defaults.setDouble((defaultTwoField.text! as NSString).doubleValue, forKey: "default2")
        }
        if (defaultThreeField.text != "") {
            defaults.setDouble((defaultThreeField.text! as NSString).doubleValue, forKey: "default3")
        }
        checkForDefaults()
    }

    @IBAction func preferredTipChange(sender: AnyObject) {
        let selectedPercentage = tipControl.selectedSegmentIndex
        
        if (selectedPercentage != defaults.integerForKey("preferredTip")) {
             defaults.setInteger(selectedPercentage, forKey: "preferredTip")
        }
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

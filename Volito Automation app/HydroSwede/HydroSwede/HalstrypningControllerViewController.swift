//
//  HalstrypningControllerViewController.swift
//  HydroSwede
//
//  Created by Linda Wiklund on 2016-08-15.
//  Copyright © 2016 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin

class HalstrypningControllerViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var D24Text: UITextField!
    @IBOutlet weak var D25Text: UITextField!
    @IBOutlet weak var D26Text: UITextField!
    @IBOutlet weak var D27Text: UITextField!
    @IBOutlet weak var D28Text: UITextField!
    @IBOutlet weak var D29Text: UITextField!
    @IBOutlet weak var D30Text: UITextField!
    
    let PI = M_PI
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func CalculateClick(_ sender: UIButton) {
        
        let D24 = D24Text.text!.floatValue
        let D25 = D25Text.text!.floatValue
        let D26 = D26Text.text!.floatValue
        let D27 = D27Text.text!.floatValue
        let first = pow(Double(D25/2000), 2.0)
        let second = (Double(D24)*0.00000006/(0.975*Double(D27)*PI*first))
        let D28 = pow(second, 2.0)/2.0*Double(D26)
        D28Text.text = String(format: "%.2f", D28)
        
        let D29 = Double(D24)*Double(D28)/600.0
        let D30 = Double(D28)/(Double(D26)*0.0208)
        D29Text.text = String(format: "%.2f", D29)
        D30Text.text = String(format: "%.2f", D30)
        
        D24Text.resignFirstResponder()
        D25Text.resignFirstResponder()
        D26Text.resignFirstResponder()
        D27Text.resignFirstResponder()
        
    }

    @IBAction func ResetClick(_ sender: UIButton) {
        D24Text.text = ""
        D25Text.text = ""
        D26Text.text = "860"
        D27Text.text = "0.6"
        D28Text.text = ""
        D29Text.text = ""
        D30Text.text = ""
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        D24Text.delegate = self
        D25Text.delegate = self
        D26Text.delegate = self
        D27Text.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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

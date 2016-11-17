//
//  AccumulatorController.swift
//  HydroSwede
//
//  Created by Kicki Larsson on 2015-06-14.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class AccumulatorController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var önskadText: UITextField!
    @IBOutlet weak var minText: UITextField!
    @IBOutlet weak var maxText: UITextField!
    @IBOutlet weak var adiabaticIndexText: UITextField!
    @IBOutlet weak var iiText: UITextField!
    @IBOutlet weak var aaText: UITextField!
    @IBOutlet weak var iaText: UITextField!
    @IBOutlet weak var verkligText: UITextField!
    @IBOutlet weak var iiSecond: UITextField!
    @IBOutlet weak var aaSecond: UITextField!
    @IBOutlet weak var iaSecond: UITextField!
    @IBOutlet weak var förladdningText: UITextField!
    
    func resign(){
        önskadText.resignFirstResponder()
        minText.resignFirstResponder()
        maxText.resignFirstResponder()
        adiabaticIndexText.resignFirstResponder()
        iiText.resignFirstResponder()
        aaText.resignFirstResponder()
        iaText.resignFirstResponder()
        verkligText.resignFirstResponder()
        iiSecond.resignFirstResponder()
        aaSecond.resignFirstResponder()
        iaSecond.resignFirstResponder()
    }
    
    @IBAction func CalculateFirst(_ sender: UIButton) {
        
        let önskad = önskadText.text!.floatValue
        let min = minText.text!.floatValue
        let max = maxText.text!.floatValue
        let adiabatic = adiabaticIndexText.text!.floatValue
        
        let förladdning = min * 0.9
        förladdningText.text = String(format: "%.2f", förladdning)
        
        let ii = önskad * (min/förladdning) / (1-(min/max))
        let aa = önskad * (min/förladdning) / (1-pow(Float(min/max), Float(1/adiabatic)))
        let ia = önskad * (max/förladdning) / ((pow(Float(max/min), Float(1/adiabatic)))-1)
            
        aaText.text = String(format: "%.2f", aa)
        iiText.text = String(format: "%.2f", ii)
        iaText.text = String(format: "%.2f", ia)
        resign()
        
    }

    @IBAction func CalculateSecond(_ sender: UIButton) {
        
        let min = minText.text!.floatValue
        let max = maxText.text!.floatValue
        let adiabatic = adiabaticIndexText.text!.floatValue
        let förladdning = min * 0.9
        let verklig = verkligText.text!.floatValue
        
        let iiDos = (verklig * (1-(min/max)))/(min/förladdning)
        let aaDos = (verklig * (1-pow(Float(min/max), Float(1/adiabatic)))/(min/förladdning))
        let iaDos = (verklig * ((pow(Float(max/min), Float(1/adiabatic))-1))/(max/förladdning))
        
        aaSecond.text = String(format: "%.2f", aaDos)
        iiSecond.text = String(format: "%.2f", iiDos)
        iaSecond.text = String(format: "%.2f", iaDos)
        resign()
        
    }
    
    @IBAction func Reset(_ sender: UIButton) {
        maxText.text = ""
        minText.text = ""
        önskadText.text = ""
        adiabaticIndexText.text = "1.5"
        iiText.text = ""
        aaText.text = ""
        iaText.text = ""
        verkligText.text = ""
        iiSecond.text = ""
        aaSecond.text = ""
        iaSecond.text = ""
        förladdningText.text = ""
        resign()
        
    }
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        önskadText.delegate = self
        minText.delegate = self
        maxText.delegate = self
        adiabaticIndexText.delegate = self
        iiText.delegate = self
        aaText.delegate = self
        iaText.delegate = self
        verkligText.delegate = self
        iiSecond.delegate = self
        aaSecond.delegate = self
        iaSecond.delegate = self
        adiabaticIndexText.text = "1.5"
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

//
//  StrypningController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2016-07-25.
//  Copyright © 2016 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin
let PI = M_PI

class StrypningController: UIViewController, UITextFieldDelegate {
    
    func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBOutlet weak var S5Text: UITextField!
    @IBOutlet weak var S6Text: UITextField!
    @IBOutlet weak var S8Text: UITextField!
    @IBOutlet weak var S9Test: UITextField!
    @IBOutlet weak var TextLab: UILabel!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))
        
        S5Text.delegate = self
        S6Text.delegate = self
        S8Text.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalculateViscosityClick(_ sender: UIButton) {
        let S5 = S5Text.text!.floatValue
        let S6 = S6Text.text!.floatValue
        let S8 = S8Text.text!.floatValue
        let one = (log10(Double(273+100))-log10(Double(273+40)))
        let two = (log10(Double(273+100))-log10(Double(273+S8)))
        let three = log10(log10(Double(S6+0.8)))
        let four = log10(log10(Double(S6+0.8)))
        let five = log10(log10(Double(S5+0.8)))
        let six = pow(Double(10), ((five-four)/one*two)+three)
        TextLab.text = "Viscosity at " + String(S8) + "°\n is then"
        
        let s9 = pow(Double(10), six)-0.8
        S9Test.text = String(format: "%.2f", s9)
        
        S5Text.resignFirstResponder()
        S6Text.resignFirstResponder()
        S8Text.resignFirstResponder()
    }
    
    @IBAction func ResetViscosity(_ sender: UIButton) {
        S5Text.text = "32"
        S6Text.text = "6.1"
        S8Text.text = "50"
        S9Test.text = "22"
        TextLab.text = "Viscosity at 50° is then"
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

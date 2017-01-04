//
//  FlowDividerController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2016-06-20.
//  Copyright © 2016 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin

class FlowDividerController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var D9Text: UITextField!
    @IBOutlet weak var F8Text: UITextField!
    @IBOutlet weak var F10Text: UITextField!
    @IBOutlet weak var F12Text: UITextField!
    @IBOutlet weak var F14Text: UITextField!
    @IBOutlet weak var F16Text: UITextField!
    @IBOutlet weak var F17Text: UITextField!
    @IBOutlet weak var J8Text: UITextField!
    @IBOutlet weak var J10Text: UITextField!
    @IBOutlet weak var J12Text: UITextField!
    @IBOutlet weak var J14Text: UITextField!
    @IBOutlet weak var J16Text: UITextField!
    @IBOutlet weak var D10Text: UITextField!
    @IBOutlet weak var D11Text: UITextField!
    @IBOutlet weak var F18Text: UITextField!
    @IBOutlet weak var F19Text: UITextField!
    @IBOutlet weak var J17Text: UITextField!
    @IBOutlet weak var J7Text: UITextField!
    @IBOutlet weak var K7Text: UITextField!
    @IBOutlet weak var J9Text: UITextField!
    @IBOutlet weak var K9Text: UITextField!
    @IBOutlet weak var J11Text: UITextField!
    @IBOutlet weak var K11Text: UITextField!
    @IBOutlet weak var J13Text: UITextField!
    @IBOutlet weak var K13Text: UITextField!
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Find Store", style: .plain, target: self, action: #selector(showMap))
        D9Text.delegate = self
        F8Text.delegate = self
        F10Text.delegate = self
        F12Text.delegate = self
        F14Text.delegate = self
        F16Text.delegate = self
        F17Text.delegate = self
        J8Text.delegate = self
        J10Text.delegate = self
        J12Text.delegate = self
        J14Text.delegate = self
        J16Text.delegate = self
        D10Text.delegate = self
        D11Text.delegate = self
        F18Text.delegate = self
        F19Text.delegate = self
        J17Text.delegate = self
        J7Text.delegate = self
        K7Text.delegate = self
        J9Text.delegate = self
        K9Text.delegate = self
        J11Text.delegate = self
        K11Text.delegate = self
        J13Text.delegate = self
        K13Text.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalculateClick(_ sender: UIButton) {
        var K16 = Float(0)
        let D9 = D9Text.text!.floatValue
        let F8 = F8Text.text!.floatValue
        let F10 = F10Text.text!.floatValue
        let F12 = F12Text.text!.floatValue
        let F14 = F14Text.text!.floatValue
        let F16 = F16Text.text!.floatValue
        let F17 = F17Text.text!.floatValue
        let J8 = J8Text.text!.floatValue
        let J10 = J10Text.text!.floatValue
        let J12 = J12Text.text!.floatValue
        let J14 = J14Text.text!.floatValue
        
        if(J16Text.text == "1"){
            K16 = F8
        }
        else if(J16Text.text == "2"){
            K16 = F10
        }
        else if(J16Text.text == "3"){
            K16 = F12
        }
        else if(J16Text.text == "4"){
            K16 = F14
        }
        let F18 = (D9*F17*1000)/(F8+F10+F12+F14)
        let F19 = (D9*F17*1000)/(F8+F10+F12+F14-K16)
        let D10 = D9+(F19/1000*K16)
        let J7 = (F8/(F8+F10+F12+F14))*D9
        let J9 = (F10/(F8+F10+F12+F14))*D9
        let J11 = (F12/(F8+F10+F12+F14))*D9
        let J13 = (F14/(F8+F10+F12+F14))*D9
        var K7 = Float(0)
        var K9 = Float(0)
        var K11 = Float(0)
        var K13 = Float(0)
        if(J16Text.text == "1"){
            K7 = F19/1000*F8
        }
        else{
            K7 = (F8/(F8+F10+F12+F14-K16))*D9
        }
        if(J16Text.text == "2"){
            K9 = F19/1000*F10
        }
        else{
            K9 = (F10/(F8+F10+F12+F14-K16))*D9
        }
        if(J16Text.text == "3"){
            K11 = F19/1000*F12
        }
        else{
            K11 = (F12/(F8+F10+F12+F14-K16))*D9
        }
        if(J16Text.text == "4"){
            K13 = F19/1000*F14
        }
        else{
            K13 = (F14/(F8+F10+F12+F14-K16))*D9
        }
        
        var K17 = Float(0)
        
        if(J8 > J14 && J8 > 1){
            K17 = J8
        }
        else if(J14 > J8 && J14 > 1){
            K17 = J14
        }
        else{
            K17 = Float(1)
        }
        
        let D11 = (((J7*J8)+(J9*J10)+(J11*J12)+(J13*J14))/D9)/F16
        
        let J17 = (F19/1000*K16)*(K17-D11)/600
        
        
        D10Text.text = String(format: "%.1f", D10)
        D11Text.text = String(format: "%.1f", D11)
        F18Text.text = String(format: "%.1f", F18)
        F19Text.text = String(format: "%.1f", F19)
        J17Text.text = String(format: "%.1f", J17)
        J7Text.text = String(format: "%.1f", J7)
        K7Text.text = String(format: "%.1f", K7)
        J9Text.text = String(format: "%.1f", J9)
        K9Text.text = String(format: "%.1f", K9)
        J11Text.text = String(format: "%.1f", J11)
        K11Text.text = String(format: "%.1f", K11)
        J13Text.text = String(format: "%.1f", J13)
        K13Text.text = String(format: "%.1f", K13)
        D9Text.resignFirstResponder()
        F8Text.resignFirstResponder()
        F10Text.resignFirstResponder()
        F12Text.resignFirstResponder()
        F14Text.resignFirstResponder()
        F16Text.resignFirstResponder()
        F17Text.resignFirstResponder()
        J8Text.resignFirstResponder()
        J10Text.resignFirstResponder()
        J12Text.resignFirstResponder()
        J14Text.resignFirstResponder()
        J16Text.resignFirstResponder()
        D10Text.resignFirstResponder()
        D11Text.resignFirstResponder()
        F18Text.resignFirstResponder()
        F19Text.resignFirstResponder()
        J17Text.resignFirstResponder()
        J7Text.resignFirstResponder()
        K7Text.resignFirstResponder()
        J9Text.resignFirstResponder()
        K9Text.resignFirstResponder()
        J11Text.resignFirstResponder()
        K11Text.resignFirstResponder()
        J13Text.resignFirstResponder()
        K13Text.resignFirstResponder()
    }

    @IBAction func ResetClick(_ sender: UIButton) {
        D9Text.text = ""
        F8Text.text = ""
        F10Text.text = ""
        F12Text.text = ""
        F14Text.text = ""
        J8Text.text = ""
        J10Text.text = ""
        J12Text.text = ""
        J14Text.text = ""
        J16Text.text = ""
        D10Text.text = ""
        D11Text.text = ""
        F18Text.text = ""
        F19Text.text = ""
        J17Text.text = ""
        J7Text.text = ""
        K7Text.text = ""
        J9Text.text = ""
        K9Text.text = ""
        J11Text.text = ""
        K11Text.text = ""
        J13Text.text = ""
        K13Text.text = ""
        F16Text.text = "0.85"
        F17Text.text = "0.97"
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

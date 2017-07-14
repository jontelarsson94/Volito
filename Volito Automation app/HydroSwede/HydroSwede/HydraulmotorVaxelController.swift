//
//  HydraulmotorVaxelController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2015-12-23.
//  Copyright © 2015 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin

class HydraulmotorVaxelController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    let pi = Float(M_PI)
    @IBOutlet weak var D32Text: UITextField!
    @IBOutlet weak var D31Text: UITextField!
    @IBOutlet weak var D30Text: UITextField!
    @IBOutlet weak var D27Text: UITextField!
    @IBOutlet weak var D26Text: UITextField!
    @IBOutlet weak var D28Text: UITextField!
    @IBOutlet weak var D21Text: UITextField!
    @IBOutlet weak var D22Text: UITextField!
    @IBOutlet weak var D24Text: UITextField!
    @IBOutlet weak var D23Text: UITextField!
    @IBOutlet weak var D25Text: UITextField!
    @IBOutlet weak var D33Text: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))
        
        D32Text.delegate = self
        D31Text.delegate = self
        D30Text.delegate = self
        D27Text.delegate = self
        D26Text.delegate = self
        D28Text.delegate = self
        D21Text.delegate = self
        D22Text.delegate = self
        D24Text.delegate = self
        D23Text.delegate = self
        D25Text.delegate = self
        D33Text.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalculateClick(_ sender: UIButton) {
        
        
        let D26 = D26Text.text!.floatValue
        let D27 = D27Text.text!.floatValue
        let D28 = D28Text.text!.floatValue
        let D29 = "1".floatValue
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D32 = D32Text.text!.floatValue
        
        let D24 = (D28*20*pi)/(D26*D32)/D29
        let D21 = (D24*D29*D27)/(1000*D31)
        let D22 = D28*D30
        let D33 = D31 * D32
        let D23 = (D26*D21*D33)/600
        let D25 = D27*D29
        
        D24Text.text = String(format: "%.2f", D24)
        D21Text.text = String(format: "%.2f", D21)
        D22Text.text = String(format: "%.2f", D22)
        D33Text.text = String(format: "%.2f", D33)
        D23Text.text = String(format: "%.2f", D23)
        D25Text.text = String(format: "%.2f", D25)
        D32Text.resignFirstResponder()
        D31Text.resignFirstResponder()
        D30Text.resignFirstResponder()
        D27Text.resignFirstResponder()
        D26Text.resignFirstResponder()
        D28Text.resignFirstResponder()
        D21Text.resignFirstResponder()
        D22Text.resignFirstResponder()
        D24Text.resignFirstResponder()
        D23Text.resignFirstResponder()
        D25Text.resignFirstResponder()
        D33Text.resignFirstResponder()
        
        
    }
    
    @IBAction func ResetClick(_ sender: UIButton) {
        
        D26Text.text = ""
        D27Text.text = ""
        D28Text.text = ""
        D30Text.text = "0.65"
        D31Text.text = "0.85"
        D32Text.text = "0.70"
        D24Text.text = ""
        D21Text.text = ""
        D22Text.text = ""
        D33Text.text = ""
        D23Text.text = ""
        D25Text.text = ""
        
        
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

//
//  RorstrypningController.swift
//  HydroSwede
//
//  Created by Linda Wiklund on 2016-08-15.
//  Copyright © 2016 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin


class RorstrypningController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var D36Text: UITextField!
    @IBOutlet weak var D37Text: UITextField!
    @IBOutlet weak var D38Text: UITextField!
    @IBOutlet weak var D39Text: UITextField!
    @IBOutlet weak var D40Text: UITextField!
    @IBOutlet weak var D41Text: UITextField!
    @IBOutlet weak var D42Text: UITextField!
    @IBOutlet weak var D43Text: UITextField!
    @IBOutlet weak var D44Text: UITextField!
    @IBOutlet weak var D45Text: UITextField!
    @IBOutlet weak var D46Text: UITextField!
    @IBOutlet weak var D47Text: UITextField!
    
    func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    
    let PI = M_PI
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func ResetClick(_ sender: UIButton) {
        
    }
    
    
    @IBAction func CalculateClick(_ sender: UIButton) {
        
        let D36 = D36Text.text!.floatValue
        let D37 = D37Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
        let D39 = D39Text.text!.floatValue
        let D40 = D40Text.text!.floatValue
        
        let D41 = D38/D37
        var D44 = 0.0
        if(D37>0){
            D44 = (Double(D36)*100.0)/(6.0*Double(D37)*Double(D37)*PI/4.0)
            D44Text.text = String(format: "%.0f", D44)
        }
        else{
            D44Text.text = ""
        }
        let D42 = (Double(D44)*Double(D37))/Double(D40)*1000.0
        let third = pow(Double(D42), 0.25)
        let second = 1.46+0.088*Double(D38)/Double(D37)+0.316/third
        let first = (pow(second*Double(D38)/Double(D37), 0.5))
        let fourth = (pow(1.46+0.115*Double(D38)/Double(D37), 0.5))
        let sixth = tanh(6.28*pow(Double(D38)/(Double(D37)*Double(D42)), 0.44))
        let seventh = 64.0*Double(D38)/(Double(D37)*Double(D42))
        let fifth = (pow(1.5+1.28*sixth+seventh, 0.5))
        
        var D43 = 0.0
        if(D42<2300){
            D43 = 1/fifth
        }
        else if(D42 > 20000){
            D43 = 1/fourth
        }
        else{
            D43 = 1/first
        }
        let D45 = pow(Double(D36)*0.00000006/(0.975*Double(D43)*PI*pow(Double(D37)/2000.0, 2)), 2)/2.0*Double(D39)
        let D46 = Double(D36)*Double(D45)/600.0
        let D47 = Double(D45)/(Double(D39)*0.0208)
        D43Text.text = String(format: "%.3f", D43)
        D41Text.text = String(format: "%.2f", D41)
        D45Text.text = String(format: "%.2f", D45)
        D46Text.text = String(format: "%.2f", D46)
        D47Text.text = String(format: "%.2f", D47)
        D42Text.text = String(format: "%.0f", D42)
        
        D36Text.resignFirstResponder()
        D37Text.resignFirstResponder()
        D38Text.resignFirstResponder()
        D39Text.resignFirstResponder()
        D40Text.resignFirstResponder()

        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))
        
        D36Text.delegate = self
        D37Text.delegate = self
        D38Text.delegate = self
        D39Text.delegate = self
        D40Text.delegate = self

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

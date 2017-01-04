//
//  EnkelCylinderController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2015-12-23.
//  Copyright © 2015 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin

extension String {
    var floatValue: Float {
        let nf = NumberFormatter()
        nf.decimalSeparator = "."
        if let result = nf.number(from: self) {
            return result.floatValue
        } else {
            nf.decimalSeparator = ","
            if let result = nf.number(from: self) {
                return result.floatValue
            }
        }
        return 0
    }
}

class EnkelCylinderController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    let pi = Float(M_PI)
    @IBOutlet weak var D30Text: UITextField!
    @IBOutlet weak var D31Text: UITextField!
    @IBOutlet weak var D32Text: UITextField!
    @IBOutlet weak var D33Text: UITextField!
    @IBOutlet weak var D34Text: UITextField!
    @IBOutlet weak var D38Text: UITextField!
    @IBOutlet weak var D39Text: UITextField!
    @IBOutlet weak var D40Text: UITextField!
    @IBOutlet weak var D41Text: UITextField!
    
    
    @IBOutlet weak var E38Text: UITextField!
    @IBOutlet weak var E39Text: UITextField!
    @IBOutlet weak var E40Text: UITextField!
    @IBOutlet weak var E41Text: UITextField!
    
    @IBOutlet weak var F38Text: UITextField!
    @IBOutlet weak var F39Text: UITextField!
    @IBOutlet weak var F40Text: UITextField!
    @IBOutlet weak var F41Text: UITextField!
    
    @IBOutlet weak var G38Text: UITextField!
    @IBOutlet weak var G39Text: UITextField!
    @IBOutlet weak var G40Text: UITextField!
    @IBOutlet weak var G41Text: UITextField!
    
    @IBOutlet weak var H38Text: UITextField!
    @IBOutlet weak var H39Text: UITextField!
    @IBOutlet weak var H40Text: UITextField!
    @IBOutlet weak var H41Text: UITextField!
    
    @IBOutlet weak var I38Text: UITextField!
    @IBOutlet weak var I39Text: UITextField!
    @IBOutlet weak var I40Text: UITextField!
    @IBOutlet weak var I41Text: UITextField!
    
    @IBOutlet weak var J38Text: UITextField!
    @IBOutlet weak var J39Text: UITextField!
    @IBOutlet weak var J40Text: UITextField!
    @IBOutlet weak var J41Text: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Find Store", style: .plain, target: self, action: #selector(showMap))
        
        D30Text.delegate = self
        D31Text.delegate = self
        D32Text.delegate = self
        D33Text.delegate = self
        D34Text.delegate = self
        D38Text.delegate = self
        D39Text.delegate = self
        D40Text.delegate = self
        D41Text.delegate = self
        
        
        E38Text.delegate = self
        E39Text.delegate = self
        E40Text.delegate = self
        E41Text.delegate = self
        
        F38Text.delegate = self
        F39Text.delegate = self
        F40Text.delegate = self
        F41Text.delegate = self
        
        G38Text.delegate = self
        G39Text.delegate = self
        G40Text.delegate = self
        G41Text.delegate = self
        
        H38Text.delegate = self
        H39Text.delegate = self
        H40Text.delegate = self
        H41Text.delegate = self
        
        I38Text.delegate = self
        I39Text.delegate = self
        I40Text.delegate = self
        I41Text.delegate = self
        J38Text.delegate = self
        J39Text.delegate = self
        J40Text.delegate = self
        J41Text.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resign(){
        D30Text.resignFirstResponder()
        D31Text.resignFirstResponder()
        D32Text.resignFirstResponder()
        D33Text.resignFirstResponder()
        D34Text.resignFirstResponder()
        D38Text.resignFirstResponder()
        D39Text.resignFirstResponder()
        D40Text.resignFirstResponder()
        D41Text.resignFirstResponder()
        
        
        E38Text.resignFirstResponder()
        E39Text.resignFirstResponder()
        E40Text.resignFirstResponder()
        E41Text.resignFirstResponder()
        
        F38Text.resignFirstResponder()
        F39Text.resignFirstResponder()
        F40Text.resignFirstResponder()
        F41Text.resignFirstResponder()
        
        G38Text.resignFirstResponder()
        G39Text.resignFirstResponder()
        G40Text.resignFirstResponder()
        G41Text.resignFirstResponder()
        
        H38Text.resignFirstResponder()
        H39Text.resignFirstResponder()
        H40Text.resignFirstResponder()
        H41Text.resignFirstResponder()
        
        I38Text.resignFirstResponder()
        I39Text.resignFirstResponder()
        I40Text.resignFirstResponder()
        I41Text.resignFirstResponder()
        J38Text.resignFirstResponder()
        J39Text.resignFirstResponder()
        J40Text.resignFirstResponder()
        J41Text.resignFirstResponder()

    }
    
    @IBAction func CalculateStepOneClick(_ sender: UIButton) {
        
        if(D38Text.text == "" || D30Text.text == "" || D31Text.text == "" || D33Text.text == "" || D34Text.text == "")
        {
            return
        }
        
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D33 = D33Text.text!.floatValue
        let D34 = D34Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
        
        let D40 = D30/1 //antal steg, ändras varje calculation
        
        if(D40 > 0)
        {
            let D39 = pow(Float(D38/20), Float(2))*pi*D33*D34*10
            D39Text.text = String(format: "%.2f", D39)
        }
        else if (D40 <= 0){
            let D39 = 0;
            D39Text.text = String(format: "%.2f", D39)
        }
        let D32 = (pow(Float(D38/200), Float(2))*pi*(D40/100))/D31*60
        
        let D41 = (D32*1000)/(pow(Float(D38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        
        D40Text.text = String(format: "%.2f", D40)
        D41Text.text = String(format: "%.2f", D41)
        D32Text.text = String(format: "%.2f", D32)
        
        E39Text.text = ""
        E40Text.text = ""
        E41Text.text = ""
        
        F39Text.text = ""
        F40Text.text = ""
        F41Text.text = ""
        
        G39Text.text = ""
        G40Text.text = ""
        G41Text.text = ""
        
        H39Text.text = ""
        H40Text.text = ""
        H41Text.text = ""
        
        I39Text.text = ""
        I40Text.text = ""
        I41Text.text = ""
        
        J39Text.text = ""
        J40Text.text = ""
        J41Text.text = ""
        resign()

        
        
        
    }
    
    @IBAction func CalculateStepTwoClick(_ sender: UIButton) {
        
        if(E38Text.text == "" || D30Text.text == "" || D31Text.text == "" || D33Text.text == "" || D34Text.text == "")
        {
            return
        }
        
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D33 = D33Text.text!.floatValue
        let D34 = D34Text.text!.floatValue
        let E38 = E38Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
        
        let E40 = D30/2 //antal steg, ändras varje calculation
        
        if(E40 > 0)
        {
            let E39 = pow(Float(E38/20), Float(2))*pi*D33*D34*10
            E39Text.text = String(format: "%.2f", E39)
        }
        else if (E40 <= 0){
            let E39 = 0;
            E39Text.text = String(format: "%.2f", E39)
        }
        let one = pow(Float(D38/200), Float(2))*pi*(E40/100)
        let two = pow(Float(E38/200), Float(2))*pi*(E40/100)
        let D32 = (one+two)/D31*60
        
        let E41 = (D32*1000)/(pow(Float(E38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let D41 = (D32*1000)/(pow(Float(D38/20), Float(2))*pi*6)
        
        E40Text.text = String(format: "%.2f", E40)
        E41Text.text = String(format: "%.2f", E41)
        D41Text.text = String(format: "%.2f", D41)
        D32Text.text = String(format: "%.2f", D32)
        D40Text.text = String(format: "%.2f", E40)
        
        F39Text.text = ""
        F40Text.text = ""
        F41Text.text = ""
        
        G39Text.text = ""
        G40Text.text = ""
        G41Text.text = ""
        
        H39Text.text = ""
        H40Text.text = ""
        H41Text.text = ""
        
        I39Text.text = ""
        I40Text.text = ""
        I41Text.text = ""
        
        J39Text.text = ""
        J40Text.text = ""
        J41Text.text = ""
        resign()
        
        
    }
    
    @IBAction func CalculateStepThreeClick(_ sender: UIButton) {
        
        if(F38Text.text == "" || D30Text.text == "" || D31Text.text == "" || D33Text.text == "" || D34Text.text == "")
        {
            return
        }
        
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D33 = D33Text.text!.floatValue
        let D34 = D34Text.text!.floatValue
        let E38 = E38Text.text!.floatValue
        let F38 = F38Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
    

        
        let F40 = D30/3 //antal steg, ändras varje calculation
        
        if(F40 > 0)
        {
            let F39 = pow(Float(F38/20), Float(2))*pi*D33*D34*10
            F39Text.text = String(format: "%.2f", F39)
        }
        else if (F40 <= 0){
            let F39 = 0;
            F39Text.text = String(format: "%.2f", F39)
        }
        let ett = pow(Float(D38/200), Float(2))*pi*(F40/100)
        let tva = pow(Float(E38/200), Float(2))*pi*(F40/100)
        let tre = pow(Float(F38/200), Float(2))*pi*(F40/100)
        
        let D32 = (ett+tva+tre)/D31*60
        
        let F41 = (D32*1000)/(pow(Float(F38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let E41 = (D32*1000)/(pow(Float(E38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let D41 = (D32*1000)/(pow(Float(D38/20), Float(2))*pi*6)
        
        F40Text.text = String(format: "%.2f", F40)
        E41Text.text = String(format: "%.2f", E41)
        D41Text.text = String(format: "%.2f", D41)
        F41Text.text = String(format: "%.2f", F41)
        D32Text.text = String(format: "%.2f", D32)
        D40Text.text = String(format: "%.2f", F40)
        E40Text.text = String(format: "%.2f", F40)
        
        G39Text.text = ""
        G40Text.text = ""
        G41Text.text = ""
        
        H39Text.text = ""
        H40Text.text = ""
        H41Text.text = ""
        
        I39Text.text = ""
        I40Text.text = ""
        I41Text.text = ""
        
        J39Text.text = ""
        J40Text.text = ""
        J41Text.text = ""
        resign()
        
    }
    
    
    @IBAction func CalculateStepFourClick(_ sender: UIButton) {
        
        if(G38Text.text == "" || D30Text.text == "" || D31Text.text == "" || D33Text.text == "" || D34Text.text == "")
        {
            return
        }
        
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D33 = D33Text.text!.floatValue
        let D34 = D34Text.text!.floatValue
        let E38 = E38Text.text!.floatValue
        let F38 = F38Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
        let G38 = G38Text.text!.floatValue

        
        
        let G40 = D30/4 //antal steg, ändras varje calculation
        
        if(G40 > 0)
        {
            let G39 = pow(Float(G38/20), Float(2))*pi*D33*D34*10
            G39Text.text = String(format: "%.2f", G39)
        }
        else if (G40 <= 0){
            let G39 = 0;
            G39Text.text = String(format: "%.2f", G39)
        }
        let ett = pow(Float(D38/200), Float(2))*pi*(G40/100)
        let tva = pow(Float(E38/200), Float(2))*pi*(G40/100)
        let tre = pow(Float(F38/200), Float(2))*pi*(G40/100)
        let fyra = pow(Float(G38/200), Float(2))*pi*(G40/100)
        
        let D32 = (ett+tva+tre+fyra)/D31*60
        
        let G41 = (D32*1000)/(pow(Float(G38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let F41 = (D32*1000)/(pow(Float(F38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let E41 = (D32*1000)/(pow(Float(E38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let D41 = (D32*1000)/(pow(Float(D38/20), Float(2))*pi*6)
        
        F40Text.text = String(format: "%.2f", G40)
        D32Text.text = String(format: "%.2f", D32)
        E41Text.text = String(format: "%.2f", E41)
        D41Text.text = String(format: "%.2f", D41)
        F41Text.text = String(format: "%.2f", F41)
        D40Text.text = String(format: "%.2f", G40)
        E40Text.text = String(format: "%.2f", G40)
        G40Text.text = String(format: "%.2f", G40)
        G41Text.text = String(format: "%.2f", G41)
        
        H39Text.text = ""
        H40Text.text = ""
        H41Text.text = ""
        
        I39Text.text = ""
        I40Text.text = ""
        I41Text.text = ""
        
        J39Text.text = ""
        J40Text.text = ""
        J41Text.text = ""
        resign()
        
    }
    
    
    @IBAction func CalculateStepFiveClick(_ sender: UIButton) {
        
        if(H38Text.text == "" || D30Text.text == "" || D31Text.text == "" || D33Text.text == "" || D34Text.text == "")
        {
            return
        }
        
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D33 = D33Text.text!.floatValue
        let D34 = D34Text.text!.floatValue
        let E38 = E38Text.text!.floatValue
        let F38 = F38Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
        let G38 = G38Text.text!.floatValue
        let H38 = H38Text.text!.floatValue
        
        
        
        let H40 = D30/5 //antal steg, ändras varje calculation
        
        if(H40 > 0)
        {
            let H39 = pow(Float(H38/20), Float(2))*pi*D33*D34*10
            H39Text.text = String(format: "%.2f", H39)
        }
        else if (H40 <= 0){
            let H39 = 0;
            H39Text.text = String(format: "%.2f", H39)
        }
        let ett = pow(Float(D38/200), Float(2))*pi*(H40/100)
        let tva = pow(Float(E38/200), Float(2))*pi*(H40/100)
        let tre = pow(Float(F38/200), Float(2))*pi*(H40/100)
        let fyra = pow(Float(G38/200), Float(2))*pi*(H40/100)
        let fem = pow(Float(H38/200), Float(2))*pi*(H40/100)
        
        let D32 = (ett+tva+tre+fyra+fem)/D31*60 //fel?
        
        let H41 = (D32*1000)/(pow(Float(H38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let G41 = (D32*1000)/(pow(Float(G38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let F41 = (D32*1000)/(pow(Float(F38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let E41 = (D32*1000)/(pow(Float(E38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let D41 = (D32*1000)/(pow(Float(D38/20), Float(2))*pi*6)
        
        F40Text.text = String(format: "%.2f", H40)
        D32Text.text = String(format: "%.2f", D32)
        D40Text.text = String(format: "%.2f", H40)
        E40Text.text = String(format: "%.2f", H40)
        G40Text.text = String(format: "%.2f", H40)
        E41Text.text = String(format: "%.2f", E41)
        D41Text.text = String(format: "%.2f", D41)
        F41Text.text = String(format: "%.2f", F41)
        H41Text.text = String(format: "%.2f", H41)
        G41Text.text = String(format: "%.2f", G41)
        H40Text.text = String(format: "%.2f", H40)
        
        I39Text.text = ""
        I40Text.text = ""
        I41Text.text = ""
        
        J39Text.text = ""
        J40Text.text = ""
        J41Text.text = ""
        resign()
        
    }
    
    
    
    @IBAction func CalculateStepSixClick(_ sender: UIButton) {
        
        if(I38Text.text == "" || D30Text.text == "" || D31Text.text == "" || D33Text.text == "" || D34Text.text == "")
        {
            return
        }
        
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D33 = D33Text.text!.floatValue
        let D34 = D34Text.text!.floatValue
        let E38 = E38Text.text!.floatValue
        let F38 = F38Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
        let G38 = G38Text.text!.floatValue
        let H38 = H38Text.text!.floatValue
        let I38 = I38Text.text!.floatValue
        
        
        
        let I40 = D30/6 //antal steg, ändras varje calculation
        
        if(I40 > 0)
        {
            let I39 = pow(Float(I38/20), Float(2))*pi*D33*D34*10
            I39Text.text = String(format: "%.2f", I39)
        }
        else if (I40 <= 0){
            let I39 = 0;
            I39Text.text = String(format: "%.2f", I39)
        }
        let ett = pow(Float(D38/200), Float(2))*pi*(I40/100)
        let tva = pow(Float(E38/200), Float(2))*pi*(I40/100)
        let tre = pow(Float(F38/200), Float(2))*pi*(I40/100)
        let fyra = pow(Float(G38/200), Float(2))*pi*(I40/100)
        let fem = pow(Float(H38/200), Float(2))*pi*(I40/100)
        let sex = pow(Float(I38/200), Float(2))*pi*(I40/100)
        
        let D32 = (ett+tva+tre+fyra+fem+sex)/D31*60
        
        let I41 = (D32*1000)/(pow(Float(I38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let H41 = (D32*1000)/(pow(Float(H38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let G41 = (D32*1000)/(pow(Float(G38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let F41 = (D32*1000)/(pow(Float(F38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let E41 = (D32*1000)/(pow(Float(E38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let D41 = (D32*1000)/(pow(Float(D38/20), Float(2))*pi*6)
        
        F40Text.text = String(format: "%.2f", I40)
        D32Text.text = String(format: "%.2f", D32)
        D40Text.text = String(format: "%.2f", I40)
        E40Text.text = String(format: "%.2f", I40)
        G40Text.text = String(format: "%.2f", I40)
        I41Text.text = String(format: "%.2f", I41)
        E41Text.text = String(format: "%.2f", E41)
        D41Text.text = String(format: "%.2f", D41)
        F41Text.text = String(format: "%.2f", F41)
        H41Text.text = String(format: "%.2f", H41)
        G41Text.text = String(format: "%.2f", G41)
        I40Text.text = String(format: "%.2f", I40)
        H40Text.text = String(format: "%.2f", I40)
        
        J39Text.text = ""
        J40Text.text = ""
        J41Text.text = ""
        resign()

        
    }
    
    @IBAction func CalculateStepSevenClick(_ sender: UIButton) {
        
        let D30 = D30Text.text!.floatValue
        let D31 = D31Text.text!.floatValue
        let D33 = D33Text.text!.floatValue
        let D34 = D34Text.text!.floatValue
        let E38 = E38Text.text!.floatValue
        let F38 = F38Text.text!.floatValue
        let D38 = D38Text.text!.floatValue
        let G38 = G38Text.text!.floatValue
        let H38 = H38Text.text!.floatValue
        let I38 = I38Text.text!.floatValue
        let J38 = J38Text.text!.floatValue
        
        
        let J40 = D30/7 //antal steg, ändras varje calculation
        
        if(J40 > 0)
        {
            let J39 = pow(Float(J38/20), Float(2))*pi*D33*D34*10
            J39Text.text = String(format: "%.2f", J39)
        }
        else if (J40 <= 0){
            let J39 = 0;
            J39Text.text = String(format: "%.2f", J39)
        }
        let ett = pow(Float(D38/200), Float(2))*pi*(J40/100)
        let tva = pow(Float(E38/200), Float(2))*pi*(J40/100)
        let tre = pow(Float(F38/200), Float(2))*pi*(J40/100)
        let fyra = pow(Float(G38/200), Float(2))*pi*(J40/100)
        let fem = pow(Float(H38/200), Float(2))*pi*(J40/100)
        let sex = pow(Float(I38/200), Float(2))*pi*(J40/100)
        let seven = pow(Float(J38/200), Float(2))*pi*(J40/100)
        
        let D32 = (ett+tva+tre+fyra+fem+sex+seven)/D31*60
        
        let J41 = (D32*1000)/(pow(Float(J38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let I41 = (D32*1000)/(pow(Float(I38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let H41 = (D32*1000)/(pow(Float(H38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let G41 = (D32*1000)/(pow(Float(G38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let F41 = (D32*1000)/(pow(Float(F38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let E41 = (D32*1000)/(pow(Float(E38/20), Float(2))*pi*6)  //fel på denna beräkning (alla)
        let D41 = (D32*1000)/(pow(Float(D38/20), Float(2))*pi*6)
        
        F40Text.text = String(format: "%.2f", J40)
        D32Text.text = String(format: "%.2f", D32)
        D40Text.text = String(format: "%.2f", J40)
        E40Text.text = String(format: "%.2f", J40)
        G40Text.text = String(format: "%.2f", J40)
        J41Text.text = String(format: "%.2f", J41)
        I41Text.text = String(format: "%.2f", I41)
        E41Text.text = String(format: "%.2f", E41)
        D41Text.text = String(format: "%.2f", D41)
        F41Text.text = String(format: "%.2f", F41)
        H41Text.text = String(format: "%.2f", H41)
        G41Text.text = String(format: "%.2f", G41)
        I40Text.text = String(format: "%.2f", J40)
        J40Text.text = String(format: "%.2f", J40)
        H40Text.text = String(format: "%.2f", J40)
        resign()
        
    }
    
    @IBAction func resetClick(_ sender: AnyObject) {
        D30Text.text = ""
        D31Text.text = ""
        D32Text.text = ""
        D33Text.text = ""
        D34Text.text = "0.85"
        D38Text.text = ""
        D39Text.text = ""
        D40Text.text = ""
        D41Text.text = ""
        
        
        E38Text.text = ""
        E39Text.text = ""
        E40Text.text = ""
        E41Text.text = ""
        
        F38Text.text = ""
        F39Text.text = ""
        F40Text.text = ""
        F41Text.text = ""
        
        G38Text.text = ""
        G39Text.text = ""
        G40Text.text = ""
        G41Text.text = ""
        
        H38Text.text = ""
        H39Text.text = ""
        H40Text.text = ""
        H41Text.text = ""
        
        I38Text.text = ""
        I39Text.text = ""
        I40Text.text = ""
        I41Text.text = ""
        
        J38Text.text = ""
        J39Text.text = ""
        J40Text.text = ""
        J41Text.text = ""
        resign()
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

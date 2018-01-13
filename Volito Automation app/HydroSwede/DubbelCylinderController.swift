//
//  DubbelCylinderController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2015-08-27.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin

class DubbelCylinderController: UIViewController, UITextFieldDelegate {

    let pi = Float(Double.pi)
    @IBOutlet weak var kolvText: UITextField!
    @IBOutlet weak var kolvstångText: UITextField!
    @IBOutlet weak var slaglängdText: UITextField!
    @IBOutlet weak var tidplusslagText: UITextField!
    @IBOutlet weak var tidminusslagText: UITextField!
    @IBOutlet weak var tryckText: UITextField!
    @IBOutlet weak var mekaniskText: UITextField!
    
    @IBOutlet weak var flödeplusText: UITextField!
    @IBOutlet weak var flödeminusText: UITextField!
    
    @IBOutlet weak var returflödeplusText: UITextField!
    @IBOutlet weak var hastighetplusText: UITextField!
    @IBOutlet weak var hastighetminusText: UITextField!
    @IBOutlet weak var areaText: UITextField!
    @IBOutlet weak var kraftregenText: UITextField!
    @IBOutlet weak var tidplusregenText: UITextField!
    @IBOutlet weak var hastighetplusregenText: UITextField!
    @IBOutlet weak var volymplusText: UITextField!
    @IBOutlet weak var volymminusText: UITextField!
    @IBOutlet weak var kraftplusText: UITextField!
    @IBOutlet weak var kraftminusText: UITextField!
    
    @IBOutlet weak var kolvSwitch: UISwitch!
    
    @objc func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))
        
        kolvText.delegate = self
        kolvstångText.delegate = self
        slaglängdText.delegate = self
        tidplusslagText.delegate = self
        tidminusslagText.delegate = self
        tryckText.delegate = self
        mekaniskText.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @IBAction func CalculateClick(_ sender: UIButton)
    {
        
        let kolv = kolvText.text!.floatValue
        let kolvstång = kolvstångText.text!.floatValue
        let slaglängd = slaglängdText.text!.floatValue
        let tidplusslag = tidplusslagText.text!.floatValue
        let tidminusslag = tidminusslagText.text!.floatValue
        let tryck = tryckText.text!.floatValue
        let mekanisk = mekaniskText.text!.floatValue
        let kolvtjugo = pow(Float(kolv/20), Float(2))
        let kolvstångtjugo = pow(Float(kolvstång/20), Float(2))
        let kolvstångtvåhundra = pow(Float(kolvstång/200), Float(2))
        let kolvtvåhundra = pow(Float(kolv/200), Float(2))
        
        let hastighetplus = slaglängd / tidplusslag
        hastighetplusText.text = String(format: "%.2f", hastighetplus)
        let hastighetminus = slaglängd / tidminusslag
        hastighetminusText.text = String(format: "%.2f", hastighetminus)
        var flödeplus : Float
        if(kolvSwitch.isOn)
        {
            flödeplus = (kolvtjugo*pi-kolvstångtjugo*pi)*hastighetplus*6/1000
            flödeplusText.text = String(format: "%.2f", flödeplus)
        }
        else
        {
            flödeplus = (pow(Float(kolv/20), Float(2)))*pi*hastighetplus*6/1000
            flödeplusText.text = String(format: "%.2f", flödeplus)
        }
        let flödeminus = (kolvtjugo*pi-kolvstångtjugo*pi)*hastighetminus * 6/1000
        flödeminusText.text = String(format: "%.2f", flödeminus)
        var tidplusregen : Float
        if(kolvSwitch.isOn)
        {
            tidplusregen = 0
            tidplusregenText.text = "XX"
        }
        else
        {
            var störst : Float
            if(flödeplus > flödeminus)
            {
                störst = flödeplus
            }
            else
            {
                störst = flödeminus
            }
            tidplusregen = slaglängd / (störst / ((kolvstångtjugo)*pi*0.006))
            tidplusregenText.text = String(format: "%.2f", tidplusregen)
        }
        
        var hastighetplusregen : Float
        if(kolvSwitch.isOn)
        {
            hastighetplusregenText.text = "XX"
        }
        else
        {
            hastighetplusregen = slaglängd / tidplusregen
            hastighetplusregenText.text = String(format: "%.2f", hastighetplusregen)
        }
        
        let volymminus = (kolvtvåhundra*pi)-((kolvstångtvåhundra)*pi*(slaglängd/100))
        volymminusText.text = String(format: "%.2f", volymminus)
        
        let kraftminus = (kolvtjugo*pi-kolvstångtjugo*pi)*tryck*mekanisk*10
        kraftminusText.text = String(format: "%.2f", kraftminus)
        
        var kraftplus : Float
        if(kolvSwitch.isOn)
        {
            kraftplus = kraftminus
            kraftplusText.text = String(format: "%.2f", kraftplus)
        }
        else
        {
            kraftplus = kolvtjugo*pi*tryck*mekanisk*10
            kraftplusText.text = String(format: "%.2f", kraftplus)
        }
        
        var returflöde : Float
        if(kolvSwitch.isOn)
        {
            returflödeplusText.text = "XX"
        }
        else
        {
            returflöde = kolvtjugo*pi*hastighetminus*6/1000
            returflödeplusText.text = String(format: "%.2f", returflöde)
        }
        
        var areaförhållande : Float
        if(kolvSwitch.isOn)
        {
            areaText.text = "1:1"
        }
        else
        {
            areaförhållande = (kolvtjugo*pi)/((kolvtjugo*pi)-(kolvstångtjugo*pi))
            var a = String(format: "%.2f", areaförhållande)
            a += ":1"
            areaText.text = a
        }
        
        var kraftregen : Float
        if(kolvSwitch.isOn)
        {
            kraftregenText.text = "XX"
        }
        else
        {
            kraftregen = kolvstångtjugo*pi*tryck*mekanisk*10
            kraftregenText.text = String(format: "%.2f", kraftregen)
        }
        
        var volymplus : Float
        if(kolvSwitch.isOn)
        {
            volymplus = volymminus
            volymplusText.text = String(format: "%.2f", volymplus)
        }
        else
        {
            volymplus = kolvtvåhundra*pi*(slaglängd/100)
            volymplusText.text = String(format: "%.2f", volymplus)
        }
        
        kolvText.resignFirstResponder()
        kolvstångText.resignFirstResponder()
        slaglängdText.resignFirstResponder()
        tidplusslagText.resignFirstResponder()
        tidminusslagText.resignFirstResponder()
        tryckText.resignFirstResponder()
        mekaniskText.resignFirstResponder()
        
        
        
    }
    
    @IBAction func ResetClick(_ sender: UIButton)
    {
        
        kolvText.text = "50"
        kolvstångText.text = "25"
        slaglängdText.text = "100"
        tidplusslagText.text = "2"
        tidminusslagText.text = "2"
        tryckText.text = "150"
        mekaniskText.text = "0.85"
        flödeplusText.text = ""
        flödeminusText.text = ""
        returflödeplusText.text = ""
        hastighetplusText.text = ""
        hastighetminusText.text = ""
        areaText.text = ""
        kraftregenText.text = ""
        tidplusregenText.text = ""
        hastighetplusregenText.text = ""
        volymplusText.text = ""
        volymminusText.text = ""
        kraftplusText.text = ""
        kraftminusText.text = ""

        
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

//
//  TransmissionController.swift
//  HydroSwede
//
//  Created by Kicki Larsson on 2015-06-23.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class TransmissionController: UIViewController, UITextFieldDelegate {

    
    @IBOutlet weak var flowText: UITextField!
    @IBOutlet weak var VarvtalText: UITextField!
    @IBOutlet weak var tryckText: UITextField!
    @IBOutlet weak var volymetriskText: UITextField!
    @IBOutlet weak var mekaniskText: UITextField!
    @IBOutlet weak var driveffektText: UITextField!
    @IBOutlet weak var deplacementText: UITextField!
    @IBOutlet weak var totalVerkningText: UITextField!
    
    @objc func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))
        
        flowText.delegate = self
        VarvtalText.delegate = self
        tryckText.delegate = self
        volymetriskText.delegate = self
        mekaniskText.delegate = self
        driveffektText.delegate = self
        deplacementText.delegate = self
        totalVerkningText.delegate = self

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    @IBAction func ResetClick(_ sender: UIButton) {
        flowText.text = ""
        VarvtalText.text = "1395"
        tryckText.text = ""
        volymetriskText.text = "0.95"
        mekaniskText.text = "0.95"
        driveffektText.text = ""
        deplacementText.text = ""
        totalVerkningText.text = ""
    }
    
    @IBAction func CalculateClick(_ sender: UIButton) {
        
            let flow = flowText.text!.floatValue
            let varvtal = VarvtalText.text!.floatValue
            let tryck = tryckText.text!.floatValue
            let volymetrisk = volymetriskText.text!.floatValue
            let mekanisk = mekaniskText.text!.floatValue
            
            let totalVerkningsgrad = (volymetrisk*mekanisk)
            let driveffekt = (tryck*flow)/(600*totalVerkningsgrad)
            
            if(varvtal*flow > 0){
                let deplacement = flow/(0.001*varvtal*volymetrisk)
                deplacementText.text = String(format: "%.2f", deplacement)
            }
            else{
                let deplacement = 0
                deplacementText.text = String(format: "%.2f", deplacement)
            }
            
            driveffektText.text = String(format: "%.2f", driveffekt)
            totalVerkningText.text = String(format: "%.2f", totalVerkningsgrad)
            
            
            
        flowText.resignFirstResponder()
        VarvtalText.resignFirstResponder()
        tryckText.resignFirstResponder()
        volymetriskText.resignFirstResponder()
        mekaniskText.resignFirstResponder()
        driveffektText.resignFirstResponder()
        deplacementText.resignFirstResponder()
        totalVerkningText.resignFirstResponder()
        
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

//
//  HydraulmotorPlusLastController.swift
//  HydroSwede
//
//  Created by Jonathan Larsson on 2015-12-23.
//  Copyright © 2015 jonathan larsson. All rights reserved.
//

import UIKit
import Darwin


class HydraulmotorPlusLastController: UIViewController, UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    
    let pi = Float(Double.pi)
    @IBOutlet weak var N19Text: UITextField!
    @IBOutlet weak var N20Text: UITextField!
    @IBOutlet weak var N21Text: UITextField!
    @IBOutlet weak var N22Text: UITextField!
    @IBOutlet weak var N23Text: UITextField!
    @IBOutlet weak var N24: UITextField!
    @IBOutlet weak var N25: UITextField!
    
    @objc func showMap(){
        let next = self.storyboard?.instantiateViewController(withIdentifier: "MapController") as? MapController
        self.show(next!, sender: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myimage = UIImage(named: "map")?.withRenderingMode(.alwaysOriginal)
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: myimage, style: .plain, target: self, action: #selector(showMap))
        
        N19Text.delegate = self
        N20Text.delegate = self
        N21Text.delegate = self
        N22Text.delegate = self
        N23Text.delegate = self
        N24.delegate = self
        N25.delegate = self
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func CalculateClick(_ sender: UIButton) {
        
        let N19 = N19Text.text!.floatValue
        let N20 = N20Text.text!.floatValue
        let N21 = N21Text.text!.floatValue
        let N22 = N22Text.text!.floatValue
        let N23 = N23Text.text!.floatValue
        
        let N24Value = (((2*pi*N23)/60)*(N22+N21))/N19
        let N25Value = N24Value*2*pi*10/N20
        
        N24.text = String(format: "%.2f", N24Value)
        N25.text = String(format: "%.2f", N25Value)
        N19Text.resignFirstResponder()
        N20Text.resignFirstResponder()
        N21Text.resignFirstResponder()
        N22Text.resignFirstResponder()
        N23Text.resignFirstResponder()
        N24.resignFirstResponder()
        N25.resignFirstResponder()
        
        
        
    }
    
    @IBAction func ResetClick(_ sender: UIButton) {
        
        N19Text.text = "5"
        N20Text.text = "200"
        N21Text.text = ""
        N22Text.text = "25"
        N23Text.text = "100"
        N24.text = ""
        N25.text = ""
        
        
        
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

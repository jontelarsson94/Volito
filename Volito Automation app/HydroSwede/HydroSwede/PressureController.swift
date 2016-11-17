//
//  PressureController.swift
//  HydroSwede
//
//  Created by Kicki Larsson on 2015-06-10.
//  Copyright (c) 2015 jonathan larsson. All rights reserved.
//

import UIKit

class PressureController: UIViewController {

    @IBOutlet weak var MpaTextField: UITextField!
    @IBOutlet weak var BarTextField: UITextField!
    @IBOutlet weak var PsiTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func FromPsi(_ sender: UIButton) {
        
        let psi = PsiTextField.text!.floatValue
        
        let bar : CGFloat = CGFloat(psi) * 0.0689475729
        let mpa : CGFloat = CGFloat(psi) * 0.006894759086775369
        BarTextField.text = String(format: "%.3f", bar)
        MpaTextField.text = String(format: "%.3f", mpa);
        
 
    }

    @IBAction func FromBar(_ sender: UIButton) {
        let bar = BarTextField.text!.floatValue;
        let psi : CGFloat = CGFloat(bar) * 14.5037738
        let mpa : CGFloat = CGFloat(bar) * 0.1
        PsiTextField.text = String(format: "%.3f", psi)
        MpaTextField.text = String(format: "%.3f", mpa);
        
    }
    
    @IBAction func FromMpa(_ sender: UIButton) {
        let mpa = MpaTextField.text!.floatValue;
        let psi : CGFloat = CGFloat(mpa) * 145.0377
        let bar : CGFloat = CGFloat(mpa) * 10
        PsiTextField.text = String(format: "%.3f", psi)
        BarTextField.text = String(format: "%.3f", bar);
        
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
